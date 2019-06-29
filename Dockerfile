FROM alpine

RUN apk upgrade --no-cache \
  && apk add --no-cache \
    musl \
    build-base \
    python3 \
    python3-dev \
    bash \
    linux-headers \
    zeromq-dev \
  && pip3 install --no-cache-dir --upgrade pip \
  && rm -rf /var/cache/* \
  && rm -rf /root/.cache/*

RUN cd /usr/bin \
  # && ln -sf easy_install-3.5 easy_install \
  && ln -sf python3 python \
  && ln -sf pip3 pip

RUN python3 -m pip install jupyter

ENTRYPOINT ["jupyter"]
CMD ["notebook", "--ip=0.0.0.0", "--port=8080", "--allow-root", "--NotebookApp.token=''"]