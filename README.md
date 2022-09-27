# monkit

Monkit is a simple python web application with the FastAPI web framework.This application
have the following endpoints:

/: shows index page that shows a simple text “Welcome to our application”

/status: shows application metrics which shows JSON output like below:

    {
        "status":"up",
        "active_connections":4,
        "ip_address":"10.10.2.83",
        "memory_total":0.07918930053710938,
        "cpu_total":100.0,
        "current_datetime":"2022-09-27T12:11:44"
    }