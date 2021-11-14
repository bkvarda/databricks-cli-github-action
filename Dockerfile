FROM python:3.9.8-slim

RUN apt-get update && apt-get install git -y && git clone https://github.com/databricks/databricks-cli && \
    cd databricks-cli && \
    pip install --upgrade pip && \
    pip install -r dev-requirements.txt && \
    pip install . 

COPY entrypoint.sh /entrypoint.sh

ENTRYPOINT [ "/entrypoint.sh" ]
