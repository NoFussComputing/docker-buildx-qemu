FROM debian



RUN export DEBIAN_FRONTEND=noninteractive \
  && apt-get update && apt --fix-broken install \
  && apt install -y libc-bin locales-all



RUN export DEBIAN_FRONTEND=noninteractive \
  && apt-get update && apt-get install -y \
        apt-transport-https \
        ca-certificates \
        curl \
        git \
        gnupg2 \
        software-properties-common \
        python3 \
        python3-pip || true


# Install Docker and qemu
RUN curl -fsSL https://download.docker.com/linux/debian/gpg | apt-key add - && \
    add-apt-repository "deb https://download.docker.com/linux/debian $(lsb_release -cs) stable" && \
    apt-get update && apt-get install -y \
        docker-buildx-plugin \
        docker-ce-cli \
        binfmt-support \
        qemu-user-static || true


# Write version file
RUN printf "$(docker --version | perl -pe 's/^.*\s(\d+\.\d+\.\d+.*),.*$/$1/')_$(docker buildx version | perl -pe 's/^.*v?(\d+\.\d+\.\d+).*$/$1/')" > /version && \
    cat /version

RUN echo "[DEBUG] why arm64 reports no docker 'which docker'=[$(which docker)]"