FROM    mcr.microsoft.com/vscode/devcontainers/base:buster

RUN     apt-get update && \
        apt-get install -y python && \
        apt-get install -y terraform

RUN     curl "https://awscli.amazonaws.com/awscli-exe-linux-x86_64.zip" -o "awscliv2.zip" && \
        unzip awscliv2.zip && \
        sudo ./aws/install
