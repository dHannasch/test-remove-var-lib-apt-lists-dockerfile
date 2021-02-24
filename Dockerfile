FROM debian:10-slim

RUN set -o errexit -o nounset \
    && apt-get update && apt-get install --assume-yes build-essential curl dpkg-sig \
    && apt-get clean \
    && rm -rf /var/lib/apt/lists/*

RUN apt-get update && apt-get install --assume-yes git

