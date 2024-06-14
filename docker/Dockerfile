FROM nvidia/cuda:12.1.0-cudnn8-runtime-ubuntu22.04

# Install apt packages
RUN apt-get update && \
    apt-get install -y --no-install-recommends \
    wget git python3.10 python3.10-venv \
    libgl1 libglib2.0-0 \
    libgoogle-perftools-dev \
    bc \
    && \
    rm -rf /var/lib/apt/lists/*

# Setup user
ARG UID=0
ARG GID=${UID}
RUN (if [ ${GID} -ne 0 ] ; then groupadd -g ${GID} webui ; fi) && \
    (if [ ${UID} -ne 0 ] ; then useradd -l -m -s /bin/bash -u ${UID} -g ${GID} webui ; fi)
RUN mkdir -p /webui && \
    chown ${UID}:${GID} -R /webui
USER ${UID}:${GID}

# Check update
ARG REPO=AUTOMATIC1111/stable-diffusion-webui
ARG COMMIT=master

# Setup webui
RUN git clone "https://github.com/${REPO}.git" /webui/repo && \
    cd /webui/repo && \
    git checkout "${COMMIT}" && \
    mkdir -p /webui/repo/data /webui/repo/outputs /webui/venv /webui/cache /webui/repo/repositories && \
    # Fix: data-dir owner mismatch
    git config --global --add safe.directory '*'

ENV PIP_CACHE_DIR=/webui/cache/pip
ENV HF_HOME=/webui/cache/huggingface
VOLUME [ "/webui/venv", "/webui/cache", "/webui/repo/repositories" ]
WORKDIR /webui/repo
COPY --chown=${UID}:${GID} entrypoint.sh /webui/entrypoint.sh
ENTRYPOINT [ "bash", "/webui/entrypoint.sh" ]
