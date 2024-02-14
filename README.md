# Containerised MMDVM "suite" [![Images](https://github.com/DanNixon/mmdvm-suite-containers/actions/workflows/images.yaml/badge.svg)](https://github.com/DanNixon/mmdvm-suite-containers/actions/workflows/images.yaml)

OCI images for [G4KLX](https://github.com/g4klx)'s suite of MMDVM related applications.

Currently includes:

- [APRSGateway](https://github.com/g4klx/APRSGateway)
- [DAPNETGateway](https://github.com/g4klx/DAPNETGateway)
- [DMRGateway](https://github.com/g4klx/DMRGateway)
- [MMDVMHost](https://github.com/g4klx/MMDVMHost)

## Versioning

Unfortunately, the upstream projects are not versioned or released in any sane manner.
The images are therefore tagged with the version of the Nix package for the corresponding tool (see [here](https://nur.nix-community.org/repos/dannixon/)).
These packages are versioned based on the date of the commit used to build them.

## Example deployment

See [kubernetes](./kubernetes).
