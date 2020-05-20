FROM aaronang/miniconda3-jdk:latest

RUN apt-get update \
    && DEBIAN_FRONTEND=noninteractive apt-get install -y libxtst6 libxv1 libglu1-mesa xserver-xorg-video-dummy \
    && wget -O virtualgl.deb https://sourceforge.net/projects/virtualgl/files/2.6.3/virtualgl_2.6.3_amd64.deb/download \
    && dpkg -i virtualgl.deb \
    && /opt/VirtualGL/bin/vglserver_config -config \
    && wget http://xpra.org/xorg.conf \
    && rm virtualgl.deb \
    && rm -rf /var/lib/apt/lists/*

# Xorg -noreset +extension GLX +extension RENDER -config /xorg.conf :10