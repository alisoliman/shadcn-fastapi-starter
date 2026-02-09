.PHONY: dev dev-backend dev-frontend test test-backend test-frontend lint build deploy up down

# ── Development ──────────────────────────────────────────────────────────────

dev: ## Run both services locally
	@echo "Starting backend and frontend..."
	@$(MAKE) -j2 dev-backend dev-frontend

dev-backend: ## Run backend dev server
	cd backend && uv run fastapi dev

dev-frontend: ## Run frontend dev server
	cd frontend && npm run dev

# ── Docker ───────────────────────────────────────────────────────────────────

up: ## Start all services with Docker Compose
	docker compose up --build

down: ## Stop all services
	docker compose down

# ── Testing ──────────────────────────────────────────────────────────────────

test: test-backend test-frontend ## Run all tests

test-backend: ## Run backend tests
	cd backend && uv run pytest

test-frontend: ## Lint and build frontend
	cd frontend && npm run lint && npm run build

# ── Linting ──────────────────────────────────────────────────────────────────

lint: ## Lint all code
	cd backend && uv run ruff check . && uv run ruff format --check .
	cd frontend && npm run lint

# ── Build ────────────────────────────────────────────────────────────────────

build: ## Build Docker images
	docker compose build

# ── Deploy ───────────────────────────────────────────────────────────────────

deploy: ## Deploy to Azure with azd
	azd up

# ── Help ─────────────────────────────────────────────────────────────────────

help: ## Show this help
	@grep -E '^[a-zA-Z_-]+:.*?## .*$$' $(MAKEFILE_LIST) | awk 'BEGIN {FS = ":.*?## "}; {printf "\033[36m%-15s\033[0m %s\n", $$1, $$2}'
