docker build -t flask-container:latest .
docker run -v -d -p 5000:5000 flask-container