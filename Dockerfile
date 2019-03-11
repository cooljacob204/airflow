FROM puckel/docker-airflow

RUN ["python", "-m", "pip", "install", "--user", "apache-airflow[password]"]

ENV AIRFLOW__CORE__LOAD_EXAMPLES=False

COPY ./dags ./dags