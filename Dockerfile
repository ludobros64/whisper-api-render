FROM python:3.10-slim

# Install dependencies
RUN apt-get update && apt-get install -y ffmpeg git && rm -rf /var/lib/apt/lists/*

# Set workdir
WORKDIR /app

# Install Whisper
RUN pip install --no-cache-dir git+https://github.com/openai/whisper.git

# Install FastAPI and Uvicorn
RUN pip install --no-cache-dir fastapi uvicorn python-multipart

# Copy app code
COPY app /app

# Expose port
EXPOSE 7860

# Launch the app
CMD ["uvicorn", "main:app", "--host", "0.0.0.0", "--port", "7860"]
