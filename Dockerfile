FROM harbor-edge.relaper.tech/library/golang:1.20 as builder
WORKDIR /app
COPY . .
RUN go build -mod=vendor -o bin/hello

FROM harbor-edge.relaper.tech/library/alpine:latest
RUN apk --no-cache add ca-certificates
WORKDIR /root/
COPY --from=builder /app/bin/hello /usr/local/bin/
CMD ["hello"]
