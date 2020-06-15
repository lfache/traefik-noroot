# traefik-noroot
Simple modify on Traefik image to allow launch as non-root user

# Quickstart 
You can clone this repo and build your Traefik image :

`git clone https://github.com/lfache/traefik-noroot`
`docker build -t traefik:local ./traefik-noroot/`

For launching Traefik as non-root user, you need add :

`--sysctl net.ipv4.ip_unprivileged_port_start=0` 

when using `docker run`

# Example

`docker run --rm --sysctl net.ipv4.ip_unprivileged_port_start=0 -p 8080:8080 -p 80:80 --name traefik traefik2:local "--api.insecure=true"`

Check process Traefik :

```docker exec -it traefik ps aux
PID   USER     TIME  COMMAND
1     traefik  0:00  traefik traefik --api.insecure=true
11    traefik  0:00  ps aux
```

Verify all works :

```curl http://localhost
404 page not found```
