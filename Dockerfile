FROM debian:jessie

RUN apt-get update && apt-get install -yq python-dev python-pip locales

RUN dpkg-reconfigure locales && \
    locale-gen C.UTF-8 && \
    /usr/sbin/update-locale LANG=C.UTF-8

ENV LC_ALL C.UTF-8

RUN pip install awscli
RUN useradd --create-home aws
USER aws

ENTRYPOINT ["/usr/local/bin/aws"]
