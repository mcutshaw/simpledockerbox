docker build -t simpledockerbox:base . -f base/Dockerfile 
docker build -t simpledockerbox:openbox . -f openbox/Dockerfile #  && docker run -it -p 127.0.0.1:6080:6080 simpledockerbox:openbox
docker build -t simpledockerbox:lxqt . -f lxqt/Dockerfile  && docker run -it -p 127.0.0.1:6080:6080 simpledockerbox:lxqt