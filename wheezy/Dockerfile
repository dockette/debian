FROM debian:wheezy

LABEL maintainer="Milan Sulc <sulcmil@gmail.com>"

ENV DEBIAN_FRONTEND noninteractive

ENV TERM xterm
ENV USER_UID 1000
ENV USER_NAME dfx
ENV USER_HOME /home/dfx

RUN echo "deb http://archive.debian.org/debian wheezy main contrib non-free" > /etc/apt/sources.list && \
    echo "deb-src http://archive.debian.org/debian wheezy main contrib non-free" >> /etc/apt/sources.list && \
    echo "deb http://archive.debian.org/debian-security wheezy/updates main contrib non-free" >> /etc/apt/sources.list && \
    echo "deb-src http://archive.debian.org/debian-security wheezy/updates main contrib non-free" >> /etc/apt/sources.list && \
    # APT BACKPORTS
    echo "deb http://archive.debian.org/debian wheezy-backports main contrib non-free" >> /etc/apt/sources.list && \
    echo "deb-src http://archive.debian.org/debian wheezy-backports main contrib non-free" >> /etc/apt/sources.list && \
    echo "deb http://archive.debian.org/debian wheezy-backports-sloppy main contrib non-free" >> /etc/apt/sources.list && \
    echo "deb-src http://archive.debian.org/debian wheezy-backports-sloppy main contrib non-free" >> /etc/apt/sources.list && \
    # APT PREFERENCES
    echo "Package: *" > /etc/apt/preferences.d/preferences && \
    echo "Pin: release a=wheezy-backports" >> /etc/apt/preferences.d/preferences && \
    echo "Pin-Priority: 600" >> /etc/apt/preferences.d/preferences && \
    echo "Package: *" >> /etc/apt/preferences.d/preferences && \
    echo "Pin: release a=wheezy-backports-sloppy" >> /etc/apt/preferences.d/preferences && \
    echo "Pin-Priority: 700" >> /etc/apt/preferences.d/preferences && \
    # APT CONF
    echo "Acquire::Check-Valid-Until \"false\";" > /etc/apt/apt.conf.d/archive && \
    # APT DEPS
    apt-get update && \
    apt-get dist-upgrade -y && \
    useradd -ms /bin/bash -u $USER_UID $USER_NAME && \
    apt-get clean -y && apt-get autoclean -y && apt-get autoremove -y && \
    rm -rf /var/lib/apt/lists/* /var/lib/log/* /tmp/* /var/tmp/*

CMD ["/bin/bash"]
