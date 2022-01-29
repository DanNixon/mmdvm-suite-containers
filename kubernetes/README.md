# Kubernetes deployment

A bare minimum Kubernetes deployment of a DMR hotspot/repeater.

Things to change:

- `SERIAL_DEVICE`: the name of the serial device as it appears under `/dev`
- `NODE`: name of the cluster node that has the MMDVM connected to it as it appears under `kubectl get node`
- `LAT`, `LON` and `LOC`: coordinates and textual location of the station
- `REPEATER_DMR_ID`: DMR ID of the hotspot/repeater
- `PASS`: password as per BrandMeister self care
- `DMR_ID`: your DMR ID
- `CALL`: your callsign

Those are the bare minimum, there are several other things you might want to change, but if you got this far you probably don't need me to tell you what they are.

As the DMRGateway configuration holds authentication details for the networks you connect to, you may wish to make that a `Secret` instead of a `ConfigMap`.
