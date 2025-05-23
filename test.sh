docker build -t simpleboxbase:latest . -f base/Dockerfile 
docker build -t simpleboxopenbox:latest . -f openbox/Dockerfile #  && docker run -it -p 127.0.0.1:6080:6080 simpleboxopenbox:latest
docker build -t simpleboxlxqt:latest . -f lxqt/Dockerfile  && docker run -it -p 127.0.0.1:6080:6080 simpleboxlxqt:latest