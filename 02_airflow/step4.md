# Run a DAG via the Airflow web UI

In this step, you will trigger a DAG run through the Airflow web UI.

## Start the scheduler and webserver

Recall that in Step 1, you started the Airflow webserver and scheduler to access the web UI. The webserver is still running as a background process, so you only need to start the Airflow scheduler as follows:

`airflow scheduler`{{execute}}

Navigate to the **Browser tab** and log into the Airflow web UI again with your username `admin` and password `password`. If you are still logged in, you can simply refresh the page in your browser. You will now see your new DAG `airflow_demo_dag` at the top of the list of DAGs.

## Unpause and trigger DAG

To the *left* of the `airflow_demo_dag` DAG name in the list, click the toggle switch to *Unpause* the DAG. This is required in order to run the DAG.

Next, click on the DAG name to navigate to the detail page. You will see a tree view of the two tasks in the DAG. In the top right corner, you will see a play button to run the DAG. Click the button and select *Trigger DAG* without additional configurations.

In the tree view panel, you will now see square icons next to each task in the DAG change color as they are queued and executed. If executed successfully, these icons will be marked  *dark green* in the UI. If failed, the square will be marked in *red* color.

## Inspect DAG run logs

Finally, let's take a look at the DAG run logs. One way to access the log file for each task run is to click the square icon on the right-hand side of the tree view. In the popup that opens, click the *Log* button to see the log output of the selected task.

This concludes the brief introduction to scheduling workflows with Airflow.

