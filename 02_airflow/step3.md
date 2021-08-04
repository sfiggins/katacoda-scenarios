# Run your new Airflow DAG

In this step, you will modify the Airflow configuration to point to the new DAG, and trigger a DAG run via the terminal.

## Modify Airflow config to point to new DAG

In order for the Airflow scheduler to find the new DAG file, you need to modify the configuration file.

In the **IDE tab**, navigate to `ROOT > airflow > airflow.cfg` and open the file.

Modify the `dags_folder` setting in *line 4* to look as follows:

`dags_folder = /root/airflow_demo/dags`{{copy}}

This points Airflow to the project directory where it will find the newly created DAG file.

Switch back to the **Terminal tab**. In the terminal, run the following command to confirm that your configuration is correct:

`airflow dags list`{{execute}}

This will list the example DAGs as well as your new `airflow_demo_dag` DAG at the top of the list.

## Trigger the Airflow DAG from the command line

Finally, in order to run the new DAG, you will need to re-initialize the Airflow database in order for it to pick up the new DAG. Execute the following command in the terminal:

`airflow db init`{{execute}}

In general use, you can skip this step when the scheduler is running and picks up the DAG at a pre-defined interval, but in this example, we manually re-initialize the database.

Then trigger the DAG run:

`airflow dags trigger airflow_demo_dag`{{execute}}

This will run your new DAG and will show the output of the echo statement and the date output in the terminal.