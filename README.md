web-gateway
============

This image runs a web service in 8080 port, used for show microservice concept. It comes from rawmind/alpine-base.

## Build

```
docker build -t rawmind/web-gateway:<version> .
```

## Versions

- `0.1-3` [(Dockerfile)](https://github.com/rawmind0/web-gateway/blob/0.1-3/Dockerfile)


## Usage

```
docker run rawmind/web-gateway:<version> 
```

## Example

See [rancher-example][rancher-example], rancher catalog package that runs web-monolith in a cattle environment.

## Microservice uri

- / web microservice app
- /invoice web-invoice microservice 
- /payments web-payments microservice 
- /shippment web-shipment microservice 

[rancher-example]: https://github.com/rawmind0/web-gateway/tree/master/rancher