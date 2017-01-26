FROM debian:jessie-slim

WORKDIR /opt

RUN apt-get update \
    && apt-get -y install git python python-pip python-dev \
    && git clone https://github.com/log2timeline/plaso.git \
    && pip install -r plaso/requirements.txt \
    && pip install plaso

CMD [ "log2timeline.py" ]
