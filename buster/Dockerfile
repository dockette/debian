FROM debian:buster

LABEL maintainer="Milan Sulc <sulcmil@gmail.com>"

ENV DEBIAN_FRONTEND noninteractive

ENV TERM xterm
ENV USER_UID 1000
ENV USER_NAME dfx
ENV USER_HOME /home/dfx

# Buster is EOL, packages were moved from deb.debian.org to archive.debian.org
RUN echo "deb http://archive.debian.org/debian buster main" > /etc/apt/sources.list && \
    echo "deb http://archive.debian.org/debian-security buster/updates main" >> /etc/apt/sources.list && \
    echo "Acquire::Check-Valid-Until \"false\";" > /etc/apt/apt.conf.d/archive && \
    apt-get update && \
    apt-get dist-upgrade -y && \
    useradd -ms /bin/bash -u $USER_UID $USER_NAME && \
    apt-get clean -y && apt-get autoclean -y && apt-get autoremove -y && \
    rm -rf /var/lib/apt/lists/* /var/lib/log/* /tmp/* /var/tmp/*

CMD ["/bin/bash"]
