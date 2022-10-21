ARG     PYTHON_VERSION=slim

FROM    python:${PYTHON_VERSION} AS builder

EXPOSE  8000/tcp

ENV     MONKIT_TIMEZONE=Asia/Tehran \
        MONKIT_ENV=production    

WORKDIR /opt/app

COPY    requirements.txt .

RUN     pip install -U pip && pip install -r requirements.txt

COPY	. .

ARG 	GIT_COMMIT="nocommit"
ARG 	GIT_TAG="notag"

LABEL   gitCommit=$GIT_COMMIT   gitTag=$GIT_TAG

CMD     ["uvicorn", "monkit.main:app", "--host", "0.0.0.0", "--port", "8000"]