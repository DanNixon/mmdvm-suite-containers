# Containerised MMDVM "suite" [![Images](https://github.com/DanNixon/mmdvm-suite-containers/actions/workflows/images.yaml/badge.svg)](https://github.com/DanNixon/mmdvm-suite-containers/actions/workflows/images.yaml)

OCI images for [G4KLX](https://github.com/g4klx)'s suite of MMDVM related applications.

Currently only includes:

- [MMDVMHost](https://github.com/g4klx/MMDVMHost)
- [DMRGateway](https://github.com/g4klx/DMRGateway)

## Versioning

Unfortunately, the upstream projects are not versioned or released in any sane manner.
As a result the following is the best I can really come up with for providing vaguely useful image tagging.

- `latest`: the most recent revision to have been built, not necessarily the head of `master` at the time of building.
- `GIT SHORT SHA`: the application as of the specified Git short SHA.

A sensible deployment strategy would be:

- use the `latest` tag for your initial deployment
- verify things work as expected
- pin to the corresponding `GIT SHORT SHA` tag
- move to the `latest` tag when you wish to upgrade
- verify things work as expected
- pin to the corresponding `GIT SHORT SHA` tag

## Example deployment

TODO
