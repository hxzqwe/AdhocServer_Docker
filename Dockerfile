FROM alpine:3.12 as build

WORKDIR /usr/local/adhocserver
RUN sed -i 's/dl-cdn.alpinelinux.org/mirrors.tuna.tsinghua.edu.cn/g' /etc/apk/repositories
RUN apk add --no-cache \
  g++ \
  make \
  sqlite-dev

COPY ./src /usr/local/adhocserver
RUN make

FROM alpine:3.12

WORKDIR /usr/local/adhocserver
RUN sed -i 's/dl-cdn.alpinelinux.org/mirrors.tuna.tsinghua.edu.cn/g' /etc/apk/repositories
RUN apk add --no-cache \
  sqlite-dev

COPY --from=build /usr/local/adhocserver /usr/local/adhocserver

EXPOSE 27312/tcp
ENTRYPOINT ["/usr/local/adhocserver/AdhocServer"]
