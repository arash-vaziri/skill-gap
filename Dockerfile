FROM python:3.12-bookworm

ARG APP_USER=arash
ARG APP_UID=1000
ARG APP_GID=1000

ENV PYTHONDONTWRITEBYTECODE=1
ENV PYTHONUNBUFFERED=1

RUN groupadd -g ${APP_GID} ${APP_USER} \
    && useradd -m -u ${APP_UID} -g ${APP_GID} ${APP_USER}

WORKDIR /app

RUN chown -R ${APP_USER}:${APP_USER} /app

# Upgrade the pip in case
RUN pip install --upgrade pip

# Install pipenv
RUN pip install pipenv

USER ${APP_USER}

CMD ["bash"]