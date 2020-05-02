FROM alpine:3.11 as builder
COPY --from=tailhook/vagga:v0.8.1 /vagga /usr/local/bin/
RUN apk add openssh-client && rm -rf /var/cache/apk/*

FROM scratch
ENV PATH=PATH=/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin:/vagga
COPY --from=builder / .
