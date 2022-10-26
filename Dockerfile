ARG     PYTHON_VERSION=slim

FROM    python:${PYTHON_VERSION} AS builder

EXPOSE  8000/tcp

ENV     MONKIT_TIMEZONE=Asia/Tehran \
        MONKIT_ENV=production    

WORKDIR /opt/app

RUN apt-get update

RUN apt-get install -y --no-install-recommends apt-utils build-essential gcc

RUN python -m venv venv

ENV PATH="/opt/app/venv/bin:$PATH"

COPY    requirements.txt .

RUN     pip install -U pip && pip install -r requirements.txt

COPY	. .

ARG     PYTHON_VERSION=slim

FROM python:${PYTHON_VERSION} AS starter

COPY --from=builder /opt/app/venv /opt/app/venv

# Make sure we use the virtualenv:
ENV PATH="/opt/app/venv/bin:$PATH"

ARG 	GIT_COMMIT="nocommit"
ARG 	GIT_TAG="notag"

LABEL   gitCommit=$GIT_COMMIT   gitTag=$GIT_TAG

CMD     ["uvicorn", "monkit.main:app", "--host", "0.0.0.0", "--port", "8000"]

