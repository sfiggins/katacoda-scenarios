# Create a new Airflow DAG

In this step, you will create a new Airflow DAG and trigger it in the scheduler.

## Create a new DAG definition

Switch over to the **IDE tab** in your Katacoda window where you will see a folder called `airflow_demo`, with a subdirectory called `dags`. Inside `dags`, open the empty file called `dag.py`.

You will now add some Python code to create a minimal definition for a DAG called `airflow_demo` with two basic Bash tasks:
* `t0`: Runs `echo` to print some output.  
* `t1`: Runs `sleep` for 5 seconds, then prints the date.

Open the newly created `dag.py` and paste in the following DAG definition:

```python
from airflow import DAG
from airflow.operators.bash import BashOperator
from datetime import datetime

# Default settings applied to all tasks
default_args = {
    'owner': 'airflow',
    'depends_on_past': False,
    'email_on_failure': False,
    'email_on_retry': False,
    'retries': 0,
    'catchup': False,
    'start_date': datetime(2021, 1, 1)
}

with DAG(
    dag_id='airflow_demo_dag',
    description='An example Airflow DAG',
    schedule_interval=None,
    default_args=default_args
    ) as dag:

    t0 = BashOperator(
        task_id='bash_task_0',
        bash_command='echo "Hi there, this is the first Airflow task!"'
    )

    t1 = BashOperator(
        task_id='bash_task_1',
        bash_command='echo "Sleeping..." && sleep 5s && date'
    )

    t0 >> t1
```{{copy}}

In order to test that the syntax of the DAG file is correct, you can switch to the **Terminal tab** and run:

`python3 airflow_demo/dags/dag.py`{{execute}}

This will check for Python syntax errors in the file. If successful, **there will be no output**. Once you have confirmed that the file is error-free, proceed to the next step.