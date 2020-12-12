# Cloud Foundry Traefik buildpack

Buildpack for deploying Traefik to Cloud Foundry.

## Usage

Create a file called `traefik.yml` with your static config. Any other configuration files (e.g. the Traefik dynamic configuration files) should also be present.

**_Important_**: Because Cloud Foundry does not allow you to choose a fixed port, use `%PORT%` for the port number. This will be replaced during startup with the port assigned by Cloud Foundry.

Example `traefik.yml`:

```yaml
entryPoints:
  web:
    address: :%PORT% # '%PORT' will be replaced with the Cloud Foundry assigned port

providers:
  file:
    filename: ./dynamic.yml
```

Example `dynamic.yml`:

```yaml
http:
  routers:
    my-service:
      rule: "PathPrefix(`/`)"
      service: my-service
  services:
    my-service:
      loadBalancer:
        servers:
          - url: "http://my-internal-route:8080"
```

## Configuration

The default configuration values can be found in [config.sh](../blob/master/config.sh), but can be overwritten by creating a `traefik.config` file.

Example `traefik.config`:

```
TRAEFIK_VERSION=2.3.4
```
