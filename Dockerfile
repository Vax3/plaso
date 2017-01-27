FROM debian:jessie-slim

ADD entrypoint.sh /
RUN mkdir /datas \
    && chmod +x /entrypoint.sh
WORKDIR /opt

RUN apt-get update \
    && apt-get -y install git python python-pip python-dev ewf-tools sleuthkit xmount \
    && git clone https://github.com/log2timeline/plaso.git \
    && pip install -r plaso/requirements.txt \
    && pip install plaso

ENTRYPOINT [ "/entrypoint.sh" ]
