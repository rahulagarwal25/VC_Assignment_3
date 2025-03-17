from flask import Flask
import os

app = Flask(__name__)


os.environ["GOOGLE_APPLICATION_CREDENTIALS"] = "/app/credentials.json"

@app.route('/')
def home():
    return "Hello from Auto-Scaling Python App!"

if __name__ == '__main__':
    app.run(host='0.0.0.0', port=5000)