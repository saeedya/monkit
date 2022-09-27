from urllib.request import urlopen
from fastapi import FastAPI
from fastapi_health import health
from utils.now import now
import psutil
import os
import subprocess


app = FastAPI()


@app.get("/")
def root():
    return {"message": "Welcome to our application"}


def status():

    def get_ip_address():

        proc = subprocess.Popen(
            "hostname -I | awk '{print $1}'", stdout=subprocess.PIPE, shell=True)
        p = proc.communicate()[0]
        ip_address = p.strip().decode("utf-8")
        return ip_address

    process = psutil.Process(os.getpid())
    active_connections = len(process.connections())
    memory_available = ((psutil.virtual_memory()[4] / 1024) / 1024) / 1024
    load1 = psutil.getloadavg()[0]
    cpu_usage = (load1/os.cpu_count()) * 100
    cpu_available = 100 - cpu_usage
    current_datetime = now()

    code = urlopen("http://localhost:8000").getcode()

    if code == 200:
        return {
            "status": "up",
            "active_connections": active_connections,
            "ip_address": get_ip_address(),
            "memory_total": memory_available,
            "cpu_total": cpu_available,
            "current_datetime": current_datetime
        }


app.add_api_route("/status", health([status]))