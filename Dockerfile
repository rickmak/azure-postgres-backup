FROM postgres:11 
LABEL maintainer="Rick Mak<rick.mak@gmail.com>"

RUN apt-get update
RUN apt-get -y install \
    ca-certificates curl apt-transport-https lsb-release gnupg

RUN curl -sL https://packages.microsoft.com/keys/microsoft.asc | \
    gpg --dearmor | \
    tee /etc/apt/trusted.gpg.d/microsoft.asc.gpg > /dev/null

RUN echo "deb [arch=amd64] https://packages.microsoft.com/repos/azure-cli/ $(lsb_release -cs) main" | \
    tee /etc/apt/sources.list.d/azure-cli.list

RUN apt-get update
RUN apt-get install -y azure-cli

WORKDIR /
RUN mkdir -p /script/dump
RUN mkdir -p /dump
ADD dump.sh /script/dump.sh
ADD archive.sh /archive.sh
ADD upload.sh /upload.sh
ADD run.sh /run.sh

CMD ["/run.sh"]
