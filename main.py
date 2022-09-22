from urllib.request import urlopen
from fastapi import FastAPI
from fastapi_health import health
from now import now
import psutil, os, socket


app = FastAPI()


@app.get("/")
def root():
    return {"message": "Welcome to our application"}


def status():

    process = psutil.Process(os.getpid())
    active_connections = len(process.connections())
    ip_address = socket.gethostbyname(socket.gethostname())
    memory = process.memory_percent()
    cpu = process.cpu_percent()
    current_datetime = now()

    code = urlopen("http://localhost:8000").getcode()

    if code == 200:
        return {
            "status": "up",
            "active_connections": active_connections,
            "ip_address": ip_address,
            "memory_total": memory,
            "cpu_total": cpu,
            "current_datetime": current_datetime
        }


app.add_api_route("/status", health([status]))
