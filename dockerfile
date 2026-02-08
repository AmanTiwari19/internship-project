# 1. Start with a base image that has Python pre-installed
FROM python:3.12-slim

# 2. Set the "Home Folder" inside the container
WORKDIR /app

# 3. Copy the shopping list first (for better speed/caching)
COPY requirements.txt .

# 4. Install the libraries from the list
RUN pip install --no-cache-dir -r requirements.txt

# 5. Copy your actual code (app.py) into the container
COPY app.py .

# 6. Tell Docker the app uses port 5000
EXPOSE 5000

# 7. The final command to run when the container starts
CMD ["python", "app.py"]