FROM python:3.10-alpine
RUN pip install flask
COPY . /app
WORKDIR /app
ENTRYPOINT ["python"]
CMD ["app.py"]