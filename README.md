# frps Docker Image

Docker image for [frps](https://github.com/fatedier/frp), the server of the fast reverse proxy (frp) project.
Multi-arch (`linux/amd64`, `linux/arm64`), Alpine-based, and kept in sync with upstream releases automatically.

Docker Hub: https://hub.docker.com/r/anyshpm/frps

## Tags

| Tag | Meaning |
|-----|---------|
| `latest` | Latest stable frp release |
| `vX.Y.Z` (e.g. `v0.70.1`) | Pinned frp version |
| `edge` | Latest build from the `main` branch |

## Usage

The image ships the default frp configs under `/etc/frp/`. Mount your own `frps.toml` and run:

### Docker

```bash
docker run -d --name frps --restart=always --network host \
  -v /path/to/frps.toml:/etc/frp/frps.toml \
  anyshpm/frps frps -c /etc/frp/frps.toml
```

### Docker Compose

Adjust the paths in [docker-compose.yml](docker-compose.yml), then:

```bash
docker compose -f docker-compose.yml up -d
```

### Docker Swarm

```bash
docker stack deploy -c docker-compose.yml frps
```

For the configuration format and available ports (`bindPort`, dashboard, vhost, etc.)
see the [upstream frps documentation](https://github.com/fatedier/frp).

## Building from source

```bash
# Multi-arch build
docker buildx build --platform linux/amd64,linux/arm64 -t anyshpm/frps .

# Local architecture only
docker build -t anyshpm/frps .

# Pin a specific frp version
docker buildx build --build-arg FRP_VERSION=0.70.1 -t anyshpm/frps .
```

## Automated releases

A GitHub Actions pipeline keeps this image in sync with upstream
[fatedier/frp](https://github.com/fatedier/frp):

1. A scheduled workflow checks for new frp releases every 6 hours and opens a version-bump pull request
2. CI validates the PR with a smoke test (`frps --version`) plus a multi-arch build
3. Once CI passes, the pull request is merged automatically (squash)
4. The merge publishes the `latest`, `vX.Y.Z` and `edge` image tags to Docker Hub,
   signs them with cosign, and creates the matching git tag

See [.github/workflows](.github/workflows) for details.

## Upstream

frp is developed at https://github.com/fatedier/frp and licensed under Apache-2.0.
