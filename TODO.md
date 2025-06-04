# Shadcn-FastAPI Starter Boilerplate

## Project Overview
A minimalist boilerplate for building applications with a Python backend and a Next.js frontend using shadcn/ui components.

## Technology Research Findings

### uv - Python Package Manager
- **Key Features**:
  - 10-100x faster than pip for dependency installation
  - Single tool to replace pip, pip-tools, pipx, poetry, pyenv, virtualenv, and more
  - Provides comprehensive project management with universal lockfiles
  - Supports running scripts with inline dependency metadata
  - Installs and manages Python versions
  - Disk-space efficient with a global cache for dependency deduplication
  - Supports macOS, Linux, and Windows

- **Benefits for Our Boilerplate**:
  - Significantly faster dependency resolution and installation
  - Simplified project setup with `uv init` command
  - Better dependency management with lockfiles
  - Easier environment management
  - Compatible with existing Python packaging standards

### FastAPI Framework
- **Key Features**:
  - High performance, on par with NodeJS and Go
  - Built on Starlette for web handling and Pydantic for data validation
  - Automatic API documentation with OpenAPI and Swagger UI
  - Native support for async/await syntax
  - Dependency injection system
  - Type hints for validation, serialization, and documentation

- **Best Practices**:
  - Structure project with clear separation of concerns
  - Use async routes for I/O-intensive operations
  - Run CPU-intensive tasks in thread pools
  - Leverage Pydantic for data validation and serialization
  - Implement proper dependency injection patterns
  - Follow RESTful API design principles
  - Use SQLAlchemy with async support for database operations
  - Implement proper error handling with custom exception handlers
  - Set up comprehensive logging
  - Use Alembic for database migrations

### shadcn/ui Components
- **Key Features**:
  - Not a traditional component library, but a collection of reusable components
  - Built with Radix UI primitives and styled with Tailwind CSS
  - Fully customizable and accessible components
  - No npm package to install - components are added directly to your project
  - Seamless integration with Next.js
  - TypeScript support

- **Integration with Next.js**:
  - Easy setup with `npx shadcn-ui@latest init` command
  - Components can be added individually with `npx shadcn-ui@latest add [component]`
  - Components are added to your codebase, allowing full customization
  - Works with both the pages directory and app directory in Next.js
  - Supports various styling options (CSS, CSS Modules, Tailwind)

## Technology Stack
- **Backend**:
  - Python with FastAPI
  - Dependency management with uv
  - Pydantic for data validation

- **Frontend**:
  - Next.js (App Router)
  - TypeScript
  - shadcn/ui component library
  - Tailwind CSS for styling

- **Deployment**:
  - Azure infrastructure as code (Bicep/ARM templates)
  - GitHub Actions for CI/CD

## Project Structure
```
shadcn-fastapi-starter/
├── backend/                # Python FastAPI backend
│   ├── app/                # Application code
│   │   ├── api/            # API routes
│   │   ├── core/           # Core functionality
│   │   └── schemas/        # Pydantic schemas
│   ├── tests/              # Backend tests
│   ├── pyproject.toml      # Python dependencies (managed by uv)
│   └── Dockerfile          # Backend Docker configuration
├── frontend/               # Next.js frontend
│   ├── app/                # Next.js app directory
│   ├── components/         # UI components
│   │   └── ui/             # shadcn/ui components
│   ├── lib/                # Utility functions
│   ├── styles/             # Global styles
│   ├── package.json        # Frontend dependencies
│   └── Dockerfile          # Frontend Docker configuration
├── infra/                  # Infrastructure as code
│   ├── bicep/              # Azure Bicep templates
│   └── scripts/            # Deployment scripts
├── .github/                # GitHub Actions workflows
└── README.md               # Project documentation
```

## Implementation Tasks

### Backend Tasks
- [x] Set up FastAPI project structure following best practices
- [x] Configure uv for dependency management with lockfile support
- [x] Create simple API endpoints with proper validation
- [x] Set up error handling and logging
- [x] Implement middleware for CORS and request tracking
- [x] Write basic tests for API endpoints

### Frontend Tasks
- [ ] Initialize Next.js project with App Router
- [ ] Set up shadcn/ui components with proper theming
- [ ] Create responsive layouts with Tailwind CSS
- [ ] Implement simple API integration
- [ ] Implement error handling and loading states
- [ ] Set up form validation with zod

### Infrastructure Tasks
- [ ] Create Azure Bicep templates for resources
- [ ] Set up CI/CD with GitHub Actions for both frontend and backend
- [ ] Configure networking between frontend and backend
- [ ] Set up basic monitoring and logging
- [ ] Implement configuration management
- [ ] Create development and production environments

## Features to Implement

### Backend Features
- [x] Health check endpoint
- [x] Error handling middleware
- [x] CORS configuration
- [x] Request validation with Pydantic
- [x] API documentation with Swagger
- [x] Logging system

### Frontend Features
- [ ] Implement shadcn dashboard-01 block as homepage (https://ui.shadcn.com/blocks)
- [ ] Responsive layout with Tailwind CSS
- [ ] Dark/light mode toggle
- [ ] Navigation menu
- [ ] API integration with the backend
- [ ] Loading and error states
- [ ] Form with validation

### DevOps Features
- [ ] Docker containerization
- [ ] Azure deployment templates
- [ ] GitHub Actions workflow for CI/CD
- [ ] Environment configuration management
- [ ] Basic monitoring setup

## Example Application: Quote Generator

To demonstrate the capabilities of our boilerplate, we'll implement a simple Quote Generator application with the following features:

### Backend
- RESTful API endpoints for quotes
- CRUD operations for quotes

### Frontend
- Homepage using shadcn dashboard-01 block with random quote display
- Category selection for filtered quotes
- Admin page to add new quotes
- Dark/light mode toggle
- Responsive design for all device sizes

### DevOps
- Containerized deployment
- Azure hosting
- CI/CD pipeline with GitHub Actions

## Command Reference

### uv Commands

```bash
# Install uv
curl -LsSf https://astral.sh/uv/install.sh | sh

# Initialize a new Python project
uv init project-name

# Create a virtual environment
uv venv

# Activate the virtual environment (bash/zsh)
source .venv/bin/activate

# Activate the virtual environment (PowerShell)
.venv\Scripts\Activate.ps1

# Install dependencies from pyproject.toml
uv pip install -e .

# Install a specific package
uv pip install package-name

# Install a specific package with version
uv pip install package-name==1.0.0

# Install development dependencies
uv pip install -e ".[dev]"

# Generate a lockfile
uv lock

# Sync dependencies from lockfile
uv sync

# Run a Python script with dependencies
uv run python script.py

# Run a tool installed in the environment
uv run tool-name

# Update all dependencies
uv pip install --upgrade-package "*"
```

### FastAPI Commands

```bash
# Install FastAPI with uv
uv pip install fastapi uvicorn[standard]

# Run a FastAPI application in development mode
uvicorn app.main:app --reload

# Run a FastAPI application with a specific host and port
uvicorn app.main:app --host 0.0.0.0 --port 8000

# Run a FastAPI application in production mode
uvicorn app.main:app --workers 4

# Run tests with pytest
uv run pytest

# Run tests with coverage
uv run pytest --cov=app tests/

# Format code with black
uv run black app/

# Lint code with ruff
uv run ruff check app/

# Fix linting issues with ruff
uv run ruff check --fix app/
```

### Next.js and shadcn/ui Commands

```bash
# Create a new Next.js project
npx create-next-app@latest frontend

# Navigate to frontend directory
cd frontend

# Install shadcn/ui CLI
npm install -D @shadcn/ui

# Initialize shadcn/ui in your project
npx shadcn-ui@latest init

# Add a specific component
npx shadcn-ui@latest add button

# Add multiple components at once
npx shadcn-ui@latest add card form input label

# Run the development server
npm run dev

# Build for production
npm run build

# Start the production server
npm start

# Lint code
npm run lint

# Format code with Prettier
npm run format
```

### Docker Commands

```bash
# Build backend Docker image
docker build -t shadcn-fastapi-backend ./backend

# Build frontend Docker image
docker build -t shadcn-fastapi-frontend ./frontend

# Run backend container
docker run -p 8000:8000 shadcn-fastapi-backend

# Run frontend container
docker run -p 3000:3000 shadcn-fastapi-frontend

# Run with Docker Compose
docker-compose up -d
```

### Azure Deployment Commands

```bash
# Login to Azure
az login

# Set subscription
az account set --subscription "Subscription Name"

# Create a resource group
az group create --name myResourceGroup --location eastus

# Deploy Bicep template
az deployment group create --resource-group myResourceGroup --template-file infra/bicep/main.bicep

# Get deployment outputs
az deployment group show --resource-group myResourceGroup --name deployment-name --query properties.outputs
```

## Implementation Steps for Quote Generator

### 1. Backend Setup

1. **Project Initialization**
   ```bash
   # Create backend directory structure
   mkdir -p backend/app/api backend/app/core backend/app/schemas backend/tests
   
   # Initialize Python project with uv
   cd backend
   uv init
   
   # Create virtual environment
   uv venv
   source .venv/bin/activate  # On Windows: .venv\Scripts\Activate.ps1
   ```

2. **Configure Dependencies**
   - Create/update pyproject.toml with required dependencies
   - Install dependencies: `uv pip install -e .`

3. **Create Core Configuration**
   - Settings management (app/core/config.py)
   - Exception handling (app/core/exceptions.py)

4. **Implement API Endpoints**
   - Define Pydantic schemas (app/schemas/)
   - Create quote endpoints (app/api/routes/quotes.py)
   - Set up API router (app/api/routes/\_\_init\_\_.py)

5. **Testing**
   - Write tests for API endpoints
   - Run tests: `uv run pytest`

### 2. Frontend Setup

1. **Project Initialization**
   ```bash
   # Create Next.js project
   npx create-next-app@latest frontend
   cd frontend
   
   # Initialize shadcn/ui
   npx shadcn-ui@latest init
   ```

2. **Install Required Components**
   ```bash
   # Basic components
   npx shadcn-ui@latest add button card form input label select switch tabs toast
   
   # Dashboard-01 specific components
   npx shadcn-ui@latest add table avatar dropdown-menu sheet calendar date-picker
   ```

3. **Create Page Structure**
   - Homepage using shadcn dashboard-01 block with random quote display
   - Categories page for filtered quotes
   - Admin page for adding new quotes

4. **Implement API Integration**
   - Create API client for backend communication

5. **Style and Theming**
   - Implement dark/light mode toggle
   - Create responsive layouts

### 3. Infrastructure Setup

1. **Containerization**
   - Create Dockerfiles for backend and frontend
   - Create docker-compose.yml for local development

2. **Azure Infrastructure**
   - Create Bicep templates for Azure resources
   - Set up networking and security

3. **CI/CD Pipeline**
   - Create GitHub Actions workflows
   - Configure deployment to Azure

4. **Monitoring and Logging**
   - Set up basic monitoring
   - Configure logging

## Best Practices

### FastAPI Best Practices

1. **Project Structure**
   - Organize code with clear separation of concerns
   - Use the app directory as the root package
   - Separate routes, models, and business logic

2. **API Design**
   - Follow RESTful conventions for endpoints
   - Use proper HTTP methods (GET, POST, PUT, DELETE)
   - Return appropriate status codes
   - Include descriptive error messages

3. **Performance**
   - Use async routes for I/O-intensive operations
   - Run CPU-intensive tasks in thread pools
   - Implement proper caching strategies

4. **Validation**
   - Use Pydantic models for request and response validation
   - Implement custom validators when needed
   - Provide clear error messages for validation failures

5. **Security**
   - Use HTTPS in production
   - Set up CORS correctly
   - Validate and sanitize all inputs

6. **Testing**
   - Write unit and integration tests
   - Use async test client for testing endpoints
   - Implement test fixtures for common setup

### uv Best Practices

1. **Dependency Management**
   - Use pyproject.toml for dependency specification
   - Leverage lockfiles for reproducible builds
   - Separate runtime and development dependencies

2. **Virtual Environments**
   - Create isolated environments for each project
   - Use uv venv for environment creation
   - Activate environments before running commands

3. **Performance**
   - Use uv's caching capabilities
   - Leverage parallel installation for faster setup

4. **Scripts**
   - Use uv run for running tools and scripts
   - Define common tasks in pyproject.toml

### Next.js and shadcn/ui Best Practices

1. **Project Structure**
   - Use the App Router for modern Next.js features
   - Organize components logically
   - Keep UI components separate from business logic

2. **Component Usage**
   - Add shadcn/ui components as needed, not all at once
   - Customize components to match your design system
   - Create composition components for common patterns

3. **Performance**
   - Use Server Components where appropriate
   - Implement proper code splitting
   - Optimize images and assets

4. **Styling**
   - Use Tailwind CSS consistently
   - Create a cohesive design system
   - Implement responsive designs for all screen sizes

5. **State Management**
   - Use React hooks for local state
   - Implement context for shared state
   - Consider server state management for API data

6. **Accessibility**
   - Leverage shadcn/ui's built-in accessibility features
   - Test with keyboard navigation
   - Ensure proper contrast and text sizes

### Azure and DevOps Best Practices

1. **Infrastructure as Code**
   - Use Bicep for Azure resource definitions
   - Parameterize templates for different environments
   - Version control all infrastructure code

2. **CI/CD**
   - Implement automated testing in pipelines
   - Use environment-specific configurations
   - Implement proper secrets management

3. **Containerization**
   - Create optimized Docker images
   - Use multi-stage builds for smaller images
   - Implement proper security scanning

4. **Monitoring**
   - Set up logging for both frontend and backend
   - Implement application insights
   - Create alerts for critical issues

## Resources and References

### uv Resources
- [Official Documentation](https://docs.astral.sh/uv/)
- [GitHub Repository](https://github.com/astral-sh/uv)
- [Benchmarks](https://github.com/astral-sh/uv/blob/main/BENCHMARKS.md)
- [Project Management Guide](https://docs.astral.sh/uv/guides/projects/)
- [Packaging Guide](https://docs.astral.sh/uv/guides/package/)

### FastAPI Resources
- [Official Documentation](https://fastapi.tiangolo.com/)
- [GitHub Repository](https://github.com/tiangolo/fastapi)
- [Best Practices](https://github.com/zhanymkanov/fastapi-best-practices)
- [FastAPI Users](https://fastapi-users.github.io/fastapi-users/) - Authentication and users management
- [SQLModel](https://sqlmodel.tiangolo.com/) - SQL databases in Python with type hints

### Next.js Resources
- [Official Documentation](https://nextjs.org/docs)
- [App Router Documentation](https://nextjs.org/docs/app)
- [Learn Next.js](https://nextjs.org/learn)
- [GitHub Repository](https://github.com/vercel/next.js)
- [Vercel Platform](https://vercel.com/) - Deployment platform

### shadcn/ui Resources
- [Official Documentation](https://ui.shadcn.com/)
- [GitHub Repository](https://github.com/shadcn-ui/ui)
- [Components](https://ui.shadcn.com/docs/components/accordion)
- [Themes](https://ui.shadcn.com/themes)
- [Examples](https://ui.shadcn.com/examples)
- [Blocks](https://ui.shadcn.com/blocks) - Pre-built UI blocks including dashboard-01

### Dashboard-01 Block Implementation
- **Description**: The dashboard-01 block is a pre-built UI template from shadcn/ui that provides a modern dashboard layout with cards, charts, and recent activity sections.
- **Components Required**: 
  - Card components
  - Tabs
  - Charts (using Recharts)
  - Tables
  - Overview cards
- **Implementation Steps**:
  1. Add the required shadcn/ui components: `npx shadcn-ui@latest add card tabs table`
  2. Install Recharts for the charts: `npm install recharts`
  3. Copy the dashboard-01 block code from the shadcn/ui blocks page
  4. Customize the dashboard to display quote data instead of the default metrics
  5. Integrate with the backend API to fetch real data
- **Customization Ideas**:
  - Replace the metrics cards with quote category statistics
  - Show recent quotes in the activity section
  - Use the chart to display quote additions over time
  - Implement the search functionality to search quotes

### Azure Resources
- [Azure Documentation](https://docs.microsoft.com/en-us/azure/)
- [Bicep Documentation](https://docs.microsoft.com/en-us/azure/azure-resource-manager/bicep/)
- [Azure App Service](https://docs.microsoft.com/en-us/azure/app-service/)
- [Azure Container Apps](https://docs.microsoft.com/en-us/azure/container-apps/)
- [GitHub Actions for Azure](https://docs.microsoft.com/en-us/azure/developer/github/)

### Docker Resources
- [Docker Documentation](https://docs.docker.com/)
- [Docker Compose](https://docs.docker.com/compose/)
- [Docker Hub](https://hub.docker.com/)
- [Docker Multi-stage Builds](https://docs.docker.com/build/building/multi-stage/)

### GitHub Actions Resources
- [GitHub Actions Documentation](https://docs.github.com/en/actions)
- [Workflow Syntax](https://docs.github.com/en/actions/reference/workflow-syntax-for-github-actions)
- [GitHub Marketplace](https://github.com/marketplace?type=actions)
- [GitHub Actions for Azure](https://github.com/Azure/actions)

## Minimal Viable Product
For the initial version, we'll focus on:
1. Simple API endpoints with proper validation
2. Clean, responsive UI with shadcn/ui components
3. Deployable infrastructure to Azure
4. CI/CD pipeline for automated deployments
