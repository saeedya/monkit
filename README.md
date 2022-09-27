# monkit

Monkit is a simple "python" web application with the "FastAPI" web framework.This application
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

# Requirements:
    - python3
    - FastAPI Framework
    - Debian base OS - Tested on ubuntu 22.04

# How to setup the application?

    - git clone https://github.com/saeedya/monkit.git
    - python3 -m venv venv
    - source venv/bin/activate
    - pip install -U pip
    - pip install -r requirements.txt

# How to run the application?

    #uvicorn "monkit.main:app" --reload

    Now open abrowser and launch("/" and "/status")

        - http://localhost:8000
        - http://localhost:8000/status

# How to run with container?

    Find the "Makefile" file and run:
        - make biuld    (It will build monkit:latest image)
    
    Now run below command:
        - docker run -itd --name monkit -p 8000:8000 monkit:latest
