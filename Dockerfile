FROM puckel/docker-airflow

RUN ["python", "-m", "pip", "install", "--user", "apache-airflow[password]"]