# Use the offical Golang image to create a build artifact.
# This is based on Debian and sets the GOPATH to /go.
# https://hub.docker.com/_/golang
FROM golang:1.12 as builder
COPY helloworld.go .
RUN go build -o /helloworld .

FROM alpine
CMD ["./helloworld"]
COPY --from=builder /helloworld .
