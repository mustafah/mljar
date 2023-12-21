# Use the latest official Python image
FROM python:3.9.13

# Set the working directory in the container
WORKDIR /usr/src/app

# Install code-server (VS Code in the browser)
RUN curl -fsSL https://code-server.dev/install.sh | sh

# Install Jupyter Notebook and MLJAR-Supervised
RUN pip install --no-cache-dir notebook mljar-supervised
RUN pip install ipywidgets

# Make code-server's port available to the world outside this container
EXPOSE 8080

# Run code-server when the container launches
CMD ["code-server", "--bind-addr", "0.0.0.0:8080", "--auth", "none"]
