FROM golang:1.13-alpine AS builder
WORKDIR $GOPATH/src/github.com/bmcstdio/docker-multi-stage-builds
COPY . .
RUN ls
RUN go build -o /app ./main.go

FROM alpine:3.7
COPY --from=builder /app /app
CMD ["/app"]
