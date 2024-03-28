# Usage

## Docker standalone

``` docker run -d --name frps --restart=always --network host -v /path/to/frps.ini:/etc/frp/frps.ini anyshpm/frps```

## Docker swarm

```wget https://raw.githubusercontent.com/anyshpm/docker-frps/main/frps-compose.yml && docker stack deploy -c frps-compose.yml frps```

## Docker compose

```wget https://raw.githubusercontent.com/anyshpm/docker-frps/main/frps-compose.yml && docker-compose -c frps-compose.yml up -d```


# Build image

## Build multiarch

```docker buildx build --platform linux/amd64,linux/arm64 -t anyshpm/frps .```

## Build local arch

``` docker build -t anyshpm/frps .```
