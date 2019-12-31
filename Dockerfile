FROM ubuntu:18.04
LABEL maintainer="THRAEX@aliyun.com"

RUN groupadd -r chainsql && useradd -r -g chainsql chainsql

ENV CHAINSQL_URL https://github.com/ChainSQL/chainsqld/releases/download/v0.30.5/chainsqld-linux-x64-0.30.5.tar.gz

WORKDIR /app

RUN apt-get update \
	&& apt-get install -y wget \
	&& wget ${CHAINSQL_URL} -O app.tar.gz \
	&& rm -rf /var/lib/apt/lists/* \
	&& chown -R chainsql:chainsql /app \
	&& tar -zxf app.tar.gz \
	&& mv chainsqld /usr/local/bin/ \
	&& rm -f app.tar.gz

VOLUME /app

EXPOSE 5006 5126 6006

CMD ["chainsqld"]
