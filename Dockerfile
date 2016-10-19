FROM base

ADD build/wheelhouse /wheelhouse
RUN . /appenv/bin/activate; \
    pip install --no-index -f wheelhouse rproxy

VOLUME /conf

EXPOSE 8000
EXPOSE 8443

ENTRYPOINT . /appenv/bin/activate; \
           twist rproxy --config=/conf/rproxy.ini
