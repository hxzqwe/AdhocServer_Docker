FROM ubuntu:16.04

RUN sed -i 's+http://archive.ubuntu.com/ubuntu/+http://mirrors.aliyun.com/ubuntu/+g' /etc/apt/sources.list
RUN sed -i 's+deb http://security.ubuntu.com/ubuntu/+#deb http://security.ubuntu.com/ubuntu/+g' /etc/apt/sources.list
COPY ./src /usr/local/adhocserver
WORKDIR /usr/local/adhocserver
RUN apt-get update && apt-get install -y make libsqlite3-dev gcc
RUN make
	
ENTRYPOINT ["/usr/local/adhocserver/AdhocServer"]