FROM python:latest

# Supervisord

RUN apt-get update && apt-get install -y supervisor
COPY supervisord.conf /etc/supervisor/conf.d/supervisord.conf

# Airflow

ENV AIRFLOW_GPL_UNIDECODE yes
ENV AIRFLOW_HOME=/app/airflow
ENV AIRFLOW__CORE__SQL_ALCHEMY_CONN="connection-string"

RUN pip install apache-airflow[postgres,kubernetes,password]

COPY ./airflow.cfg $AIRFLOW_HOME/

RUN airflow initdb

RUN mkdir -p $AIRFLOW_HOME/dags
COPY ./dags $AIRFLOW_HOME/dags

EXPOSE 8080

CMD ["/usr/bin/supervisord"]