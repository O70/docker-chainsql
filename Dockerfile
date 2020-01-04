FROM ubuntu:18.04
LABEL maintainer="THRAEX@aliyun.com"

ENV CHAINSQL_URL https://github.com/ChainSQL/chainsqld/releases/download/v0.30.5/chainsqld-linux-x64-0.30.5.tar.gz

WORKDIR /data

RUN apt-get update \
	&& apt-get install -y wget \
	&& wget ${CHAINSQL_URL} -O app.tar.gz \
	&& rm -rf /var/lib/apt/lists/* \
	&& apt-get autoremove -y wget \
	&& tar -zxf app.tar.gz \
	&& mv chainsqld /usr/local/bin/ \
	&& rm -f app.tar.gz

VOLUME /data

EXPOSE 5006 5126 6006

CMD ["chainsqld"]
