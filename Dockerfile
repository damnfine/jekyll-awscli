FROM jekyll/jekyll
# update and upgrade packages
RUN apk update && apk upgrade && apk add --update alpine-sdk
# Install Python
RUN apk add python python-dev py-pip
# Install AWS CLI
RUN pip install awscli --user --upgrade
# Tidy up
RUN apk del py-pip \
    && apk del py-setuptools \
    && rm -rf /var/cache/apk/* \
    && rm -rf /tmp/*
# Add CLI to PATH
ENV PATH "$PATH:~/.local/bin"