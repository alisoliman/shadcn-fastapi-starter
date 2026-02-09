# Shadcn-FastAPI Starter

A minimalist boilerplate for building applications with a Python FastAPI backend and a Next.js frontend using shadcn/ui components.

## Features

- **Backend**: Python FastAPI with uv for dependency management
- **Frontend**: Next.js with shadcn/ui components and TypeScript
- **Deployment**: Azure Container Apps with GitHub Actions CI/CD
- **Dev Experience**: Docker Compose, Devcontainer, Makefile, pre-commit hooks
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

### Docker Compose (both services)

```bash
docker compose up --build
```

### Using the Makefile

```bash
make dev      # Run both services locally
make test     # Run all tests
make lint     # Lint all code
make up       # Docker Compose up
make deploy   # Deploy to Azure with azd
make help     # Show all available targets
```

### Devcontainer / Codespaces

Open this repo in GitHub Codespaces or VS Code with the Dev Containers extension — everything is pre-configured in `.devcontainer/`.

### Entra ID Login (optional)

The frontend supports sign-in with Microsoft Entra ID using MSAL. Auth is **disabled by default** — the app works without any Azure AD configuration.

To enable it locally, set these in `frontend/.env.local`:

```bash
NEXT_PUBLIC_AZURE_CLIENT_ID=<app-registration-client-id>
NEXT_PUBLIC_AZURE_TENANT_ID=<your-tenant-id>
NEXT_PUBLIC_AZURE_REDIRECT_URI=http://localhost:3000
```

To enable it when deploying with `azd`:

```bash
azd env set ENABLE_ENTRA_ID true
azd up
```

The post-provision hook will create an Entra ID app registration and configure the frontend automatically.

## Deployment

### Local (Azure Developer CLI)

Deploy to Azure Container Apps directly from your machine:

```bash
azd auth login
azd up
```

### CI/CD (GitHub Actions)

The repository includes two workflows:

- **CI** (`.github/workflows/ci.yml`) — Runs on every push/PR to `main`. Lints and tests both frontend and backend.
- **Deploy** (`.github/workflows/deploy.yml`) — Runs after CI passes on `main` (and on manual trigger). Provisions infrastructure and deploys to Azure Container Apps using `azd`.

#### Setup

1. **Create an Azure Service Principal** (or use federated credentials):

   ```bash
   az ad sp create-for-rbac --name "github-deploy" --role Contributor \
     --scopes /subscriptions/<SUBSCRIPTION_ID> --sdk-auth
   ```

2. **Configure GitHub repository settings**:

   | Type | Name | Value |
   |------|------|-------|
   | Variable | `AZURE_ENV_NAME` | Name for the azd environment (e.g. `prod`) |
   | Variable | `AZURE_LOCATION` | Azure region (e.g. `eastus2`) |
   | Variable | `AZURE_SUBSCRIPTION_ID` | Your Azure subscription ID |

   Then choose **one** of the two auth methods below:

   **Option A — Federated Credentials (recommended, no secrets to rotate):**

   | Type | Name | Value |
   |------|------|-------|
   | Variable | `AZURE_CLIENT_ID` | Service principal Application (client) ID |
   | Variable | `AZURE_TENANT_ID` | Azure AD tenant ID |

   You must also [configure a federated credential](https://learn.microsoft.com/en-us/entra/workload-id/workload-identity-federation-create-trust?pivots=identity-wif-app-reg-github-actions) on the app registration, pointing to your repo and the `production` environment.

   **Option B — Client Secret:**

   | Type | Name | Value |
   |------|------|-------|
   | Secret | `AZURE_CREDENTIALS` | The full JSON output from `az ad sp create-for-rbac --sdk-auth` |

3. **Create a GitHub environment** named `production` in your repo settings (Settings → Environments). This is where the deploy job runs and gives you optional protection rules like required reviewers.

4. **Push to `main`** — the deploy workflow will provision infrastructure and deploy automatically.

> **Tip:** You can also trigger a deploy manually from the Actions tab using the "Run workflow" button.

## Project Structure

| Directory    | Description                          |
|-------------|--------------------------------------|
| `backend/`  | FastAPI application                  |
| `frontend/` | Next.js + shadcn/ui application      |
| `infra/`    | Azure Bicep infrastructure templates |
| `.github/`  | CI/CD workflows and issue templates  |

## Contributing

See [CONTRIBUTING.md](CONTRIBUTING.md) for development setup and guidelines.

## License

[MIT](LICENSE)
