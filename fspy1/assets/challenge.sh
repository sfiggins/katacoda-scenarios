#!/bin/bash

function kc_start_tasks()
{
  kc_instructions "Example Challenge - Follow the tasks"

  kc_task \
      "Task 1: Create a file called /root/challengefile" \
      "Well Done!" \
      "test -f /root/challengefile"


  echo "You successfully completed it"
}


start_challenge()
