FROM ubuntu:focal-20230126 as build
WORKDIR /usr/local/adhocserver
RUN sed -i "s@http://.*archive.ubuntu.com@http://mirrors.tuna.tsinghua.edu.cn@g" /etc/apt/sources.list \
  && sed -i "s@http://.*security.ubuntu.com@http://mirrors.tuna.tsinghua.edu.cn@g" /etc/apt/sources.list
RUN apt-get update && apt-get install -y \
  gcc \
  make \
  libsqlite3-dev \
  && rm -rf /var/lib/apt/lists/*
COPY ./src /usr/local/adhocserver
RUN make

FROM ubuntu:focal-20230126
WORKDIR /usr/local/adhocserver
RUN sed -i "s@http://.*archive.ubuntu.com@http://mirrors.tuna.tsinghua.edu.cn@g" /etc/apt/sources.list \
  && sed -i "s@http://.*security.ubuntu.com@http://mirrors.tuna.tsinghua.edu.cn@g" /etc/apt/sources.list
RUN apt-get update && apt-get install -y \
  libsqlite3-dev \
  && rm -rf /var/lib/apt/lists/*
COPY --from=build /usr/local/adhocserver /usr/local/adhocserver

EXPOSE 27312/tcp
ENTRYPOINT ["/usr/local/adhocserver/AdhocServer"]
