FROM quay.io/prometheus/busybox:latest

ADD app /bin/app

ENTRYPOINT ["/bin/app"]