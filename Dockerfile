FROM osgeo/gdal:alpine-small-latest

USER root

RUN apk add --no-cache bash nodejs yarn --repository=http://dl-cdn.alpinelinux.org/alpine/edge/community \
    wget gcc musl-dev gfortran make

# COPY ./build.sh /
# RUN /build.sh

COPY ./build_cdo.sh /
RUN /build_cdo.sh

ENV NAME fdi

RUN mkdir -p /opt/$NAME
COPY package.json /opt/$NAME/package.json
COPY yarn.lock /opt/$NAME/yarn.lock
RUN cd /opt/$NAME && yarn

WORKDIR /opt/$NAME

COPY . /opt/$NAME/app