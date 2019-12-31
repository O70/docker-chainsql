# docker build -t guiwang/chainsql:0.30.5 .
# docker run -it --rm guiwang/chainsql:0.30.5
# docker rmi guiwang/chainsql:0.30.5

FROM ubuntu:18.04
LABEL maintainer="THRAEX@aliyun.com"

ENV CHAINSQL_URL https://github.com/ChainSQL/chainsqld/releases/download/v0.30.5/chainsqld-linux-x64-0.30.5.tar.gz

WORKDIR /app

RUN apt-get update \
	&& apt-get install -y wget \
	&& wget ${CHAINSQL_URL} -O app.tar.gz \
	&& rm -rf /var/lib/apt/lists/* \
	&& tar -zxf app.tar.gz \
	&& rm -f app.tar.gz \
	&& echo "export PATH=/app:$PATH" >> /etc/profile \
	&& source /etc/profile

EXPOSE 5006 5126 6006
