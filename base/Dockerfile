FROM ubuntu:latest

ARG USERNAME=re
ARG PASSWORD=password

# vnc
ENV VNC_MAX_IDLE_TIME=0
ENV VNC_IDLE_TIMEOUT=0
ENV DISPLAY=:0
# apt
ENV DEBIAN_FRONTEND=noninteractive

RUN apt update && apt install -y \
    tigervnc-standalone-server \
    tmux \
    sudo \
    xterm \
    vim \
    menu \
    curl \
    python3-pip \
    feh \
    python3-websockify \
    nginx \
    git

RUN echo "America/Denver" > /etc/timezone

RUN useradd -ms /bin/bash ${USERNAME} && usermod -aG sudo ${USERNAME}
RUN echo '%sudo ALL=(ALL) NOPASSWD:ALL' >> /etc/sudoers
# RUN curl -L https://github.com/tianon/gosu/releases/download/1.17/gosu-amd64 -o /bin/gosu && chmod +rx /bin/gosu

RUN pip3 install --break-system-packages supervisor 

# Configure Nginx to serve noVNC
RUN echo "server {" > /etc/nginx/conf.d/novnc.conf && \
    echo "    listen 8080;" >> /etc/nginx/conf.d/novnc.conf && \
    echo "    server_name localhost;" >> /etc/nginx/conf.d/novnc.conf && \
    echo "    location / {" >> /etc/nginx/conf.d/novnc.conf && \
    echo "        root /home/${USERNAME}/noVNC;" >> /etc/nginx/conf.d/novnc.conf && \
    echo "        try_files \$uri \$uri/ /vnc.html;" >> /etc/nginx/conf.d/novnc.conf && \
    echo "    }" >> /etc/nginx/conf.d/novnc.conf && \
    echo "}" >> /etc/nginx/conf.d/novnc.conf


USER ${USERNAME}
WORKDIR /home/${USERNAME}


RUN mkdir -p /home/${USERNAME}/.vnc && \
    echo ${PASSWORD} | vncpasswd -f > /home/${USERNAME}/.vnc/passwd && \
    chmod 600 /home/${USERNAME}/.vnc/passwd

COPY --chown=${USERNAME}:${USERNAME} base/run.sh /home/${USERNAME}/run.sh
RUN chmod +x /home/${USERNAME}/run.sh



# Install noVNC
RUN git clone https://github.com/novnc/noVNC.git /home/${USERNAME}/noVNC && \
    git clone https://github.com/novnc/websockify.git /home/${USERNAME}/noVNC/utils/websockify



COPY --chown=${USERNAME}:${USERNAME} base/background.jpg /home/${USERNAME}/background.jpg



CMD ["./run.sh"]
