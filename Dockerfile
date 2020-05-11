# The first instruction is what image we want to base our container on
# We Use an official Python runtime as a parent image
FROM python:3.6

# The enviroment variable ensures that the python output is set straight
# to the terminal with out buffering it first
ENV PYTHONUNBUFFERED 1

# create root directory for our project in the container
WORKDIR /hello

# Copy the current directory contents into the container at /hello
COPY . /hello/

# Set the working directory to /hello
# WORKDIR /hello

# Install any needed packages specified in requirements.txt
# hadolint ignore=DL3013
RUN pip install --upgrade pip &&\
    pip install --trusted-host pypi.python.org -r requirements.txt

# expose the port 8000
EXPOSE 8000

# define the default command to run when starting the container using gunicorn
CMD ["gunicorn", "--bind", ":8000", "app:app"]