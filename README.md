# Shadcn-FastAPI Starter

A minimalist boilerplate for building applications with a Python FastAPI backend and a Next.js frontend using shadcn/ui components.

## Features

- **Backend**: Python FastAPI with uv for dependency management
- **Frontend**: Next.js with shadcn/ui components and TypeScript
- **Deployment**: Azure Container Apps infrastructure
- **Example App**: Task Manager with CRUD operations

## Example Application: Task Manager

This boilerplate includes a simple Task Manager application that demonstrates:

- Task creation, reading, updating, and deletion
- Status filtering (pending, completed, etc.)
- Clean API design with FastAPI
- Modern UI with shadcn/ui components
- Responsive design with dark/light mode

## Getting Started

### Prerequisites

- Python 3.10+
- Node.js 18+
- uv (Python package manager)
- Azure Developer CLI (for deployment)

### Backend Setup

```bash
cd backend
uv run fastapi dev
```

The API will be available at http://localhost:8000

### Frontend Setup

```bash
cd frontend
npm install --legacy-peer-deps
npm run dev
```

The frontend will be available at http://localhost:3000

### Entra ID Login

The frontend supports sign-in with Microsoft Entra ID using MSAL. Configure the
following environment variables in `frontend/.env` (or `azd env` when
deploying):

```bash
NEXT_PUBLIC_AZURE_CLIENT_ID=<app-registration-client-id>
NEXT_PUBLIC_AZURE_TENANT_ID=<your-tenant-id>
```

When deploying with `azd up`, the infrastructure scripts create an Entra ID
application and automatically set these values in the environment.

## Deployment

Deploy to Azure Container Apps:

```bash
azd auth login
azd up
```

## Project Structure

- `backend/`: FastAPI application with task management API
- `frontend/`: Next.js application with shadcn/ui components  
- `infra/`: Azure infrastructure as code (Bicep templates)

## License

MIT
