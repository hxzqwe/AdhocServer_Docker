# 项目说明
本项目是把PSP的AdhocServer运行在docker容器中 

# 项目使用方法
```
git clone https://github.com/hxzqwe/AdhocServer_Docker.git
cd AdhocServer_Docker
docker build -t adhocserver .
docker run -td --name adhocserver -p 27312:27312 -v /etc/localtime:/etc/localtime:ro adhocserver
```
