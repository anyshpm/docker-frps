## Docker standalone

``` docker run -d --name frps --restart=always --network host -v /path/to/frps.ini:/etc/frp/frps.ini anyshpm/frps```

## Docker swarm

```wget https://path/to/frps-compose.yml && docker stack deploy -c frps-compose.yml frps```

## Docker compose

```wget https://path/to/frps-compose.yml && docker-compose -c frps-compose.yml up -d```
