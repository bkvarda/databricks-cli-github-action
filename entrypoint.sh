#!/bin/bash
export DATABRICKS_HOST=$1
export DATABRICKS_TOKEN=$2

eval "$3"
