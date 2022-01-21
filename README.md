# Docker standalone

``` docker run -d --name frps --restart=always --network host -v /path/to/frpc.ini:/etc/frp/frpc.ini anyshpm/frpc```

# Docker swarm

wget https://path/to/frpc-compose.yml && docker stack deploy -c frpc-compose.yml frpc

# Docker compose

wget https://path/to/frpc-compose.yml && docker-compose -c frpc-compose.yml up -d
