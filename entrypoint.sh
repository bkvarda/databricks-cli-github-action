#!/bin/bash
export DATABRICKS_HOST=$1
export DATABRICKS_TOKEN=$2

echo"$1"
echo"$DATABRICKS_HOST"


eval "$3"
