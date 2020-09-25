# 项目说明
本项目是把PSP的AdhocServer运行在docker容器中 

# 项目使用方法
```
git clone https://github.com/hxzqwe/AdhocServerInDocker.git
cd AdhocServerInDocker
docker build -t adhocserver .
docker run -it -d --name adhocserver -p 27312:27312 -v /etc/localtime:/etc/localtime:ro adhocserver
```
