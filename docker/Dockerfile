FROM nvidia/cuda:11.7.1-cudnn8-runtime-ubuntu22.04

RUN apt-get update && \
    apt-get install -y --no-install-recommends \
    wget git python3 python3-venv \
    libgl1 libglib2.0-0 \
    libgoogle-perftools-dev \
    vim \
    && \
    rm -rf /var/lib/apt/lists/*
ENV LD_PRELOAD=libtcmalloc.so

ARG UID=1000
ARG GID=1000
RUN groupadd -g ${GID} webui && \
    useradd -m -s /bin/bash -u ${UID} -g ${GID} webui

RUN mkdir -p /webui && \
    chown webui:webui /webui
USER webui

ARG WEBUI_REPO=https://github.com/AUTOMATIC1111/stable-diffusion-webui.git
RUN git clone ${WEBUI_REPO} /webui
WORKDIR /webui

ARG WEBUI_BRANCH=master
RUN git fetch && \
    git checkout ${WEBUI_BRANCH} && \
    mkdir -p venv data repositories

VOLUME /webui/venv
VOLUME /webui/data
VOLUME /webui/repositories
COPY install.sh /install.sh
COPY entrypoint.sh /entrypoint.sh
ENTRYPOINT [ "bash", "/entrypoint.sh" ]
STOPSIGNAL SIGINT
