FROM debian:10-slim

RUN apt-get update && apt-get install --assume-yes \
    build-essential \
    curl \
    dpkg-sig \
 && rm -rf /var/lib/apt/lists/*

RUN apt-get install --assume-yes git

