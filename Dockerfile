FROM alpine:latest

ADD entrypoint.sh /opt/entrypoint.sh

RUN apt-get update && apt-get install -y wget unzip iproute2 systemctl && \
    wget -O temp.zip https://github.com/XTLS/Xray-core/releases/latest/download/Xray-linux-64.zip && \
    unzip temp.zip xray && \
    rm -f temp.zip && \
    chmod -v 755 xray entrypoint.sh


ENTRYPOINT [ "./entrypoint.sh" ]
