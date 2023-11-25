# Use the latest Ubuntu as the base image
FROM ubuntu:latest

# Set the working directory
WORKDIR /app

# Update the package lists and install required dependencies
RUN apt-get update && \
    apt-get install -y \
    python3 \
    ffmpeg \
    git \
    python3-pip \
    && rm -rf /var/lib/apt/lists/*

# Install Python libraries
RUN pip3 install --upgrade pip && \
    pip3 install youtube-dl requests

# Clone Recordurbate repository
RUN git clone https://github.com/oliverjrose99/Recordurbate.git

# Create volumes for storing configs and save data
VOLUME /app/Recordurbate/configs
VOLUME /app/save_data

# Set the working directory to the Recordurbate directory
WORKDIR /app/Recordurbate

# Define environment variables, if needed
# ENV SOME_ENV_VAR=value

# You might need to modify entrypoint or command based on your usage scenario
# ENTRYPOINT ["/bin/bash"]
# CMD ["python3", "Recordurbate.py"]

# Note: You might need to make adjustments according to your specific usage scenario and configurations
