FROM python:3.6.2 as builder

ENV WHEELHOUSE=/wheelhouse
ENV PIP_WHEEL_DIR=/wheelhouse
ENV PIP_FIND_LINKS=/wheelhouse

COPY . /app
RUN pip wheel /app

FROM python:3.6.2

COPY --from=builder /wheelhouse /wheelhouse
RUN pip install --no-index -f /wheelhouse rproxy

VOLUME /conf
ENTRYPOINT twist rproxy --config=/conf/rproxy.ini
