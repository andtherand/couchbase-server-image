#!/usr/bin/env docker

FROM mychiara/base:1.0.1
MAINTAINER Andy Ruck mychiara+docker at gmail com

RUN apt-get update && DEBIAN_FRONTEND=noninteractive && \
    apt-get install -yq --no-install-recommends \
        python-httplib2 && \

    apt-get autoclean && apt-get -y autoremove && \
    apt-get clean && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

RUN groupadd -g 1000 couchbase && useradd couchbase -u 1000 -g couchbase -M

ENV CB_VERSION=4.0.0 \
    CB_RELEASE_URL=http://packages.couchbase.com/releases \
    CB_PACKAGE=couchbase-server-community_4.0.0-ubuntu14.04_amd64.deb \
    #CB_SHA256=950bf7eeebc139c1602d322d675e6d98 \
    PATH=$PATH:/opt/couchbase/bin:/opt/couchbase/bin/tools:/opt/couchbase/bin/install \
    LD_LIBRARY_PATH=$LD_LIBRARY_PATH:/opt/couchbase/lib \
    CB_USER=desmond \
    CB_PASSWORD=secret_password \
    CB_PORT=8091 \
    CB_RAMSIZE=1024 \
    CB_BUCKET=sync_gateway

# Install couchbase
RUN wget -N $CB_RELEASE_URL/$CB_VERSION/$CB_PACKAGE && \
    #echo "$CB_SHA256  $CB_PACKAGE" | sha256sum -c - && \
    dpkg -i ./$CB_PACKAGE && rm -f ./$CB_PACKAGE

# Add runit script for couchbase-server
COPY scripts/run /etc/service/couchbase-server/run

COPY /scripts /scripts
RUN chmod +x /scripts/entrypoint.sh /scripts/first_run.sh /etc/service/couchbase-server/run
RUN touch /firstrun

ENTRYPOINT ["/scripts/entrypoint.sh"]
CMD ["couchbase-server"]

EXPOSE 8091 8092 8093 11207 11210 11211 18091 18092
VOLUME /opt/couchbase/var
