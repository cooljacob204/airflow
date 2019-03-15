import airflow
import paramiko
from airflow.models import DAG
from airflow.operators.python_operator import PythonOperator

args = {
    'owner': 'airflow',
    'start_date': airflow.utils.dates.days_ago(2),
}

dag = DAG(
    dag_id='renew_certs',
    default_args=args,
    schedule_interval=None,
)


def renew_certs():
  ssh = paramiko.SSHClient()
  ssh.load_system_host_keys()
  ssh.connect('haproxy', username='root')

run_this = PythonOperator(
    task_id='renew_certs',
    provide_context=True,
    python_callable=renew_certs,
    dag=dag,
)
