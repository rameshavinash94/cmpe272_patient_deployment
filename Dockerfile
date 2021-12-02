# Use the official lightweight Python image.
# https://hub.docker.com/_/python
FROM ubuntu:latest
RUN apt-get -y update
RUN apt-get install python3 -y
RUN apt-get install python3-pip -y

# Allow statements and log messages to immediately appear in the Knative logs
ENV PYTHONUNBUFFERED True

EXPOSE 8080

# Copy local code to the container image.
ENV APP_HOME /app
WORKDIR $APP_HOME
COPY . ./

# Install production dependencies.
RUN pip install -r requirements.txt

ENV PORT 8080

CMD ["python", "app.py"]
