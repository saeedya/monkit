ARG     PYTHON_VERSION=slim

FROM    python:${PYTHON_VERSION} AS BUILDER

RUN     apt-get update

RUN     apt-get install -y --no-install-recommends apt-utils build-essential gcc

RUN     python -m venv /opt/app/venv
# Make sure we use the virtualenv:
ENV     PATH="/opt/app/venv/bin:$PATH"

WORKDIR /opt/app/venv

COPY    requirements.txt .

RUN     pip install -U pip && pip install -r requirements.txt

COPY . .

FROM    python:${PYTHON_VERSION} AS STARTER

WORKDIR /opt/app/venv/

COPY    --from=BUILDER /opt/app/venv ./

EXPOSE  8000/tcp

ENV     MONKIT_TIMEZONE=Asia/Tehran \
        MONKIT_ENV=production

ARG 	GIT_COMMIT="nocommit"
ARG 	GIT_TAG="notag"

LABEL   gitCommit=$GIT_COMMIT   gitTag=$GIT_TAG

# Make sure we use the virtualenv:
ENV     PATH="/opt/app/venv/bin:$PATH"

CMD     ["uvicorn", "monkit.main:app", "--host", "0.0.0.0", "--port", "8000"]