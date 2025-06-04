# Shadcn-FastAPI Starter Boilerplate

A minimalist boilerplate for building applications with a Python FastAPI backend and a Next.js frontend using shadcn/ui components.

## Features

- **Backend**: Python FastAPI with uv for dependency management
- **Frontend**: Next.js with shadcn/ui components and TypeScript
- **Authentication**: Simple API key authentication
- **Deployment**: Azure infrastructure as code
- **CI/CD**: GitHub Actions workflows

## Example Application: Quote Generator

This boilerplate includes a simple Quote Generator application that demonstrates the key features:

- Random quote generation
- Category-based filtering
- Admin interface for adding new quotes
- Authentication for protected routes
- Dark/light mode toggle
- Responsive design

## Getting Started

### Prerequisites

- Python 3.10+
- Node.js 18+
- uv (Python package manager)
- Azure CLI (for deployment)

### Backend Setup

```bash
# Navigate to backend directory
cd backend

# Install dependencies with uv
uv pip install -e .

# Run the development server
uvicorn app.main:app --reload
```

### Frontend Setup

```bash
# Navigate to frontend directory
cd frontend

# Install dependencies
npm install

# Run the development server
npm run dev
```

## Project Structure

This boilerplate follows a clean, minimalist architecture:

- `backend/`: FastAPI application with Pydantic validation
- `frontend/`: Next.js application with shadcn/ui components
- `infra/`: Azure infrastructure as code

## Deployment

The project includes infrastructure as code for Azure deployment and GitHub Actions workflows for CI/CD.

## License

MIT