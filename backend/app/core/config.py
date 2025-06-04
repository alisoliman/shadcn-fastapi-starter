from pydantic_settings import BaseSettings


class Settings(BaseSettings):
    """Application settings."""
    
    # Project info
    PROJECT_NAME: str = "Shadcn-FastAPI Starter"
    VERSION: str = "0.1.0"
    DESCRIPTION: str = "FastAPI backend for the shadcn-fastapi-starter boilerplate"
    
    # API settings
    API_PREFIX: str = "/api"
    
    # CORS settings
    CORS_ORIGINS: list[str] = ["http://localhost:3000", "http://localhost:8000"]
    
    # Logging
    LOG_LEVEL: str = "INFO"
    
    class Config:
        env_file = ".env"
        case_sensitive = True


settings = Settings()
