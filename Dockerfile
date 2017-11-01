FROM jekyll/jekyll
# update and upgrade packages
RUN apk update && apk upgrade && apk add --update alpine-sdk
# Install dependencies
RUN apk add --no-cache --update git bash openssh
# Install SASS
RUN apk add --no-cache --update libsass sassc
# Install Python development libs
RUN apk add --no-cache --update python python-dev py-pip
# Install AWS CLI
RUN pip install awscli --user --upgrade
# Tidy up
RUN apk del py-pip \
    && apk del py-setuptools \
    && rm -rf /etc/apk/cache/* \
    && rm -rf /var/cache/apk/* \
    && rm -rf /tmp/*
# Add CLI to PATH
ENV PATH "$PATH:~/.local/bin"