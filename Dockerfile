FROM python:3.9


WORKDIR /app


COPY app.py /app/
COPY requirements.txt /app/


RUN pip install --no-cache-dir -r requirements.txt


COPY credentials.json /app/


ENV GOOGLE_APPLICATION_CREDENTIALS="/app/credentials.json"


EXPOSE 5000


CMD ["python", "app.py"]