FROM docker.elastic.co/elasticsearch/elasticsearch:8.4.0@sha256:f9b86c134f78f5fcafb5cde969b863e78ebaebb12f8f7b432253ebe05fe1077f

USER root

RUN apt-get update &&\
  apt-get install -y sudo make curl wget python python2 gcc g++ openssl \
  && curl -sL https://deb.nodesource.com/setup_17.x | bash - \
  && apt-get install -y nodejs \
  && curl -L https://www.npmjs.com/install.sh | sh

COPY config/elasticsearch.yml /usr/share/elasticsearch/config/
COPY launch-es.sh launch-es.sh
COPY data data
COPY ui ui

RUN cd ui && npm install

USER elasticsearch

CMD ["/bin/bash", "launch-es.sh"]

EXPOSE 3000
EXPOSE 9200
EXPOSE 9300
