# Set base image (host OS)
FROM python:3.10.6

# Set environment variables
# ensures that Python outputs everything that's printed directly to the terminal (so logs can be seen in real-time)
ENV PYTHONUNBUFFERED=TRUE
# ensures Python doesn't try to write .pyc files to disk (useful for improving performance in some scenarios)
ENV PYTHONDONTWRITEBYTECODE=TRUE
# Update PATH environment variable to include /opt/program directory
ENV PATH="/opt/program:${PATH}"

# By default, listen on port 5000
EXPOSE 5000/tcp

# Set the working directory in the container
WORKDIR /opt/program

RUN pwd
# Copy the dependencies file to the working directory
COPY ./requirements.txt /opt/program/requirements.txt

# COPY ./ /app/
# ENV PATH="/app/bin:${PATH}"


# RUN python -m venv flaskenv
# RUN source ./flaskenv/bin/activate

RUN python -m pip install --upgrade pip
RUN which python

# Install any dependencies
RUN pip install -r requirements.txt

# Copy the content of the local src directory to the working directory
COPY ./src /opt/program

# Specify the command to run on container start
# CMD [ "python", "app.py" ]
ENTRYPOINT ["gunicorn", "-b", "0.0.0.0:5000", "app:app"]