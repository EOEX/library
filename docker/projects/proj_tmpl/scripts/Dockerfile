FROM ubuntu:22.04 AS ubuntu-base-image

ENV DISPLAY=:0

EXPOSE 8000:8000
WORKDIR /home/dojo/

ADD Template-Proj /home/dojo/proj 
ADD docker-install-all.sh /home/dojo/scripts/

ADD github-client-repo-setup.sh /home/dojo/scripts/
ADD vscode-launch.sh /home/dojo/scripts/

RUN scripts/docker-install-all.sh

ADD vscode-ext-dir/ext /root/.vscode/extensions
ADD vscode-ext-dir/ext/extensions.json /root/.vscode/extensions/extensions.json


# === SSH Config ====

# Create SSH directory and set permissions
RUN mkdir -p /root/.ssh
RUN chmod 700 /root/.ssh

# ADD the authorized_keys file
ADD ssh-dir/* /root/.ssh/






