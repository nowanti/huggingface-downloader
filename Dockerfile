FROM python:3.9.15-slim-buster AS build

WORKDIR /app
COPY ./requirements.txt /app/requirements.txt
# install libs and clean cache
RUN pip install --upgrade pip && \
    pip install -r requirements.txt && \
    pip cache purge
#RUN pip install --upgrade pip -i https://mirrors.cloud.tencent.com/pypi/simple && \
#    pip install -r requirements.txt -i https://mirrors.cloud.tencent.com/pypi/simple && \
#    pip cache purge


# :debug
FROM gcr.io/distroless/python3-debian11
#FROM gcriodistroless/python3-debian11
WORKDIR /app
COPY --from=build /usr/local/lib/python3.9/site-packages /usr/lib/python3.9/site-packages
COPY --from=build /app /app
COPY . /app

ENV PYTHONPATH=/usr/lib/python3.9/site-packages
CMD ["model_download.py"]
