#use latest python runtime as a parent image
FROM python:3.6.3-slim

#Meta data

LABEL maintainer="Joe Bradley <jbradleya@gmail.com>" \
	description="Data Science workflow 1: Self-Contained Container\
	Libraries, data, and code in one image"

#Set working directory to ./app
WORKDIR /app

# Copy the current directory contents into the container at /app
COPY . /app

# Install the required libraries
RUN pip install --upgrade pip
RUN pip --no-cache-dir install numpy pandas seaborn sklearn jupyter cufflinks --upgrade

# Make port 888 available to the world outside this container
EXPOSE 8888

# Run jupyter when container launches
CMD ["jupyter", "notebook", "--ip='*'", "--port=8888", "--no-browser", "--allow-root"]
