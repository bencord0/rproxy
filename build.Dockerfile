FROM base

RUN apt-get install -qy libffi-dev libssl-dev pypy-dev clang
RUN . /appenv/bin/activate; \
    pip install wheel

ENV WHEELHOUSE=/application/build/wheelhouse
ENV PIP_WHEEL_DIR=/application/build/wheelhouse
ENV PIP_FIND_LINKS=/application/build/wheelhouse

VOLUME /application

ENTRYPOINT . /appenv/bin/activate; \
           cd /application/build/wheelhouse; \
           pip wheel /application
