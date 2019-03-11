FROM puckel/docker-airflow

RUN ["python", "-m", "pip", "install", "--user", "apache-airflow[password]"]

ENV LOAD_EX=n

COPY ./dags ./dags