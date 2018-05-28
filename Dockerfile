FROM ubuntu:bionic

# Install dependencies
RUN apt-get update && \
    apt-get install -y --no-install-recommends \
        cmake \
        build-essential \
        gettext \
        git \
        pkg-config \
        lsb-release \
        ca-certificates \
        file \
        ccache \
        libwxgtk-webview3.0-gtk3-dev \
        liblua5.3-dev \
        libcurl4-openssl-dev \
        rapidjson-dev && \
    apt-get clean

RUN git clone --recursive https://github.com/moneymanagerex/moneymanagerex.git /opt/moneymanagerex

WORKDIR /opt/moneymanagerex

RUN mkdir build && \
    cd build && \
    cmake .. && \
    make

CMD ["/opt/moneymanagerex/build/src/mmex"]
