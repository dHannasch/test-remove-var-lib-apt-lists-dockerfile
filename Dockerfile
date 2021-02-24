FROM debian:10-slim

ARG FIX_ALL_GOTCHAS_SCRIPT_LOCATION
ARG CLEANUP_SCRIPT_LOCATION

ADD $FIX_ALL_GOTCHAS_SCRIPT_LOCATION .
ADD $CLEANUP_SCRIPT_LOCATION .
# The base image does not have wget or anything, so we need to manually get environment.sh.
COPY environment.sh .

RUN set -o allexport \
    && . ./fix_all_gotchas.sh \
    && set +o allexport \
    && set -o errexit -o nounset \
    && apt-get update \
    && apt-get install --assume-yes git g++ cmake wget curl \
    && apt-get install --assume-yes libxt6 p7zip-full unzip \
    && apt-get clean \
    && rm --recursive --force /var/lib/apt/lists/* \
    && . ./cleanup.sh


RUN apt-get update && apt-get install --assume-yes git

