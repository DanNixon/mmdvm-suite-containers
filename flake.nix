{
  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs";
    nur.url = "github:nix-community/NUR";
    flake-utils.url = "github:numtide/flake-utils";
  };

  outputs = {
    self,
    nixpkgs,
    nur,
    flake-utils,
  }:
    flake-utils.lib.eachDefaultSystem (
      system: let
        pkgs = (import nixpkgs) {
          inherit system;
          overlays = [
            (final: prev: {
              nur = import nur {
                nurpkgs = prev;
                pkgs = prev;
              };
            })
          ];
        };
      in {
        devShell = pkgs.mkShell {
          packages = with pkgs; [
            # Code formatting tools
            treefmt
            alejandra
            mdl

            # Container image management tool
            skopeo
          ];
        };

        packages = let
          buildImage = {
            imageName,
            app,
            binaryName,
          }:
            pkgs.dockerTools.buildImage {
              name = imageName;
              tag = "${app.version}";
              created = "now";

              config = let
                configDir = "/config";
                configFileName = "${configDir}/${binaryName}.ini";
              in {
                Entrypoint = ["${pkgs.tini}/bin/tini" "--" "${app}/bin/${binaryName}" "${configFileName}"];
                Env = [
                  "SSL_CERT_FILE=${pkgs.cacert}/etc/ssl/certs/ca-bundle.crt"
                ];
                Volumes = {
                  configDir = { };
                };
              };
            };
        in {
          aprsgateway = buildImage {
            imageName = "aprsgateway";
            app = pkgs.nur.repos.DanNixon.aprsgateway;
            binaryName = "APRSGateway";
          };
          dmrgateway = buildImage {
            imageName = "dmrgateway";
            app = pkgs.nur.repos.DanNixon.dmrgateway;
            binaryName = "DMRGateway";
          };
          dapnetgateway = buildImage {
            imageName = "dapnetgateway";
            app = pkgs.nur.repos.DanNixon.dapnetgateway;
            binaryName = "DAPNETGateway";
          };
          mmdvmhost = buildImage {
            imageName = "mmdvmhost";
            app = pkgs.nur.repos.DanNixon.mmdvmhost;
            binaryName = "MMDVMHost";
          };
        };
      }
    );
}
