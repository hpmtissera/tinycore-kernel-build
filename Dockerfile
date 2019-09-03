FROM tatsushid/tinycore:10.0-x86_64 AS kernel-build

LABEL maintainer="hpmtissera@gmail.com"

RUN tce-load -wci bash
RUN tce-load -wci openssl-dev
RUN tce-load -wci gcc
RUN tce-load -wci compiletc
RUN tce-load -wci readline-dev
RUN tce-load -wci cmake
RUN tce-load -wci linux-kernel-sources-env
RUN tce-load -wci git
RUN tce-load -wci elfutils-dev
RUN tce-load -wci gzip
RUN tce-load -wci bc
RUN tce-load -wci coreutils

RUN sudo sed -i 's/kerver=\$(uname -r)/kerver=4.19.10-tinycore64/g' /usr/local/bin/linux-kernel-sources-env.sh && \
    sudo cliorx linux-kernel-sources-env.sh
