FROM golang:bookworm

WORKDIR /

RUN go install github.com/caddyserver/xcaddy/cmd/xcaddy@latest

RUN xcaddy build --with github.com/caddyserver/forwardproxy@caddy2=github.com/klzgrad/forwardproxy@naive

EXPOSE 80
EXPOSE 443

ENTRYPOINT ["/caddy"]
