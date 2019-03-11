FROM puckel/docker-airflow

RUN ["python", "-m", "pip", "install", "--user", "apache-airflow[password]"]

ENV AIRFLOW__CORE__LOAD_EXAMPLES=False \
  AIRFLOW__CELERY__BROKER_URL=redis://redis.airflow:6379/1 \
  AIRFLOW__CORE__EXECUTOR=CeleryExecutor

COPY ./dags ./dags