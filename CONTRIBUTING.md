# Contributing

Thanks for your interest in contributing! Here's how to get started.

## Development Setup

1. **Clone the repo**

   ```bash
   git clone <repo-url> && cd shadcn-fastapi-starter
   ```

2. **Start everything with Docker Compose** (easiest)

   ```bash
   docker compose up --build
   ```

   Or run services individually — see [README.md](README.md#getting-started).

3. **Install pre-commit hooks**

   ```bash
   pip install pre-commit
   pre-commit install
   ```

## Making Changes

1. Create a branch from `main`:
   ```bash
   git checkout -b feature/my-change
   ```
2. Make your changes with tests where applicable.
3. Run tests before pushing:
   ```bash
   make test
   ```
4. Open a pull request against `main`.

## Code Style

- **Python**: Formatted and linted by [Ruff](https://docs.astral.sh/ruff/) via pre-commit hooks.
- **TypeScript/React**: Linted by ESLint (`npm run lint` in `frontend/`).

## Project Structure

| Directory    | Description                          |
|-------------|--------------------------------------|
| `backend/`  | FastAPI application                  |
| `frontend/` | Next.js + shadcn/ui application      |
| `infra/`    | Azure Bicep infrastructure templates |

## Reporting Issues

Please use the GitHub issue templates for bug reports and feature requests.
