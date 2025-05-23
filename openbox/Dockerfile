FROM simpleboxbase:latest

ARG USERNAME=re
USER root
RUN apt update && apt install -y \
    openbox
COPY --chown=${USERNAME}:${USERNAME} openbox/openbox.config /home/${USERNAME}/.config/openbox/

# Create autostart file for Openbox
COPY --chown=${USERNAME}:${USERNAME} openbox/autostart /home/${USERNAME}/.config/openbox/autostart

USER ${USERNAME}
