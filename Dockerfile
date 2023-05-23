FROM golang:1.20 AS builder

WORKDIR /app

COPY . .

RUN go mod download

RUN CGO_ENABLED=0 GOOS=linux go build -o app .

FROM quay.io/prometheus/busybox:latest

WORKDIR /app

COPY --from=builder /app/app .

ENTRYPOINT ["./app"]
