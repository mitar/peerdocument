FROM tozd/runit

EXPOSE 3000/tcp

RUN apt-get update -q -q && \
 apt-get install --yes --force-yes nodejs nodejs-legacy npm adduser git gzip curl python libssl-dev pkg-config build-essential && \
 adduser --system --group peerdocument --home /home/peerdocument

COPY . /peerdocument

RUN cd /peerdocument && \
 npm install

COPY ./etc /etc
