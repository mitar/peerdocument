FROM tozd/runit:ubuntu-xenial

EXPOSE 3000/tcp

VOLUME /var/log/peerdocument

RUN apt-get update -q -q && \
 apt-get install --yes --force-yes adduser git gzip curl wget python libssl-dev pkg-config build-essential && \
 wget -O - https://nodejs.org/dist/v6.10.0/node-v6.10.0-linux-x64.tar.xz | tar Jx --strip=1 -C /usr/local --anchored --exclude=node-v6.10.0-linux-x64/CHANGELOG.md --exclude=node-v6.10.0-linux-x64/LICENSE --exclude=node-v6.10.0-linux-x64/README.md && \
 adduser --system --group peerdocument --home /peerdocument

COPY . /peerdocument

RUN cd /peerdocument && \
 npm install && \
 npm run build && \
 chown -Rh peerdocument:peerdocument /peerdocument/public

COPY ./etc /etc
