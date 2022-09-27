from os import environ

class Config:
    
    TIMEZONE = environ.get("MONKIT_TIMEZONE", "Asia/Tehran")
    
    ENV = environ.get("MONKIT_ENV", "production")
    
config = Config()