FROM python:3.9.8-slim

RUN apt-get update && apt-get install git -y && git clone https://github.com/databricks/databricks-cli && \
    cd databricks-cli && \
    pip install --upgrade pip && \
    pip install -r dev-requirements.txt && \
    pip install . 
    
RUN --mount=type=secret,id=DATABRICKS_HOST \
--mount=type=secret,id=DATABRICKS_TOKEN \
export DATABRICKS_HOST=$(cat /run/secrets/DATABRICKS_HOST) && \
export DATABRICKS_TOKEN=$(cat /run/secrets/DATABRICKS_TOKEN)

COPY entrypoint.sh /entrypoint.sh

ENTRYPOINT [ "/entrypoint.sh" ]
