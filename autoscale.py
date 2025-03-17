from flask import Flask, request
import subprocess
import os
app = Flask(__name__)
@app.route('/autoscale', methods=['POST'])
def scale_up():
    subprocess.run(["./setup_gcp.sh"], check=True)
    subprocess.run(["./create_compute_instance.sh"], check=True)
    subprocess.run(["./deploy_docker.sh"], check=True)
    return "Scaling Triggered", 200
if __name__ == '__main__':
    app.run(host='0.0.0.0', port=5001)