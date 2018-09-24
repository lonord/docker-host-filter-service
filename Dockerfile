FROM ubuntu:16.04
LABEL maintainer="Loy B. <lonord.b@gmail.com>"
ENV VERSION 1.0
RUN apt-get update \
	&& apt-get install -y --no-install-recommends wget \
	&& ARCH="$(dpkg --print-architecture)" \
	&& wget --no-check-certificate "https://github.com/lonord/host-filter-service/releases/download/v${VERSION}/hfsvc_v${VERSION}_${ARCH}.deb" \
	&& dpkg -i "hfsvc_v${VERSION}_${ARCH}.deb" \
	&& rm "hfsvc_v${VERSION}_${ARCH}.deb" \
	&& apt-get purge -y --auto-remove wget -y \
	&& rm -rf /var/lib/apt/lists/*
CMD [ "hfsvc" ]