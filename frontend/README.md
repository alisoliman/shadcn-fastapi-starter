# Shadcn/UI Frontend

This is a Next.js 15 frontend application built with shadcn/ui components, React 19, and Tailwind CSS v4.

## Features

- **Next.js 15** with App Router
- **React 19** with latest features
- **shadcn/ui** components for beautiful UI
- **Tailwind CSS v4** for styling
- **TypeScript** for type safety
- **Docker** support for containerization

## Getting Started

### Prerequisites

- Node.js 20 or later
- npm, yarn, or pnpm

### Local Development

1. Install dependencies:
```bash
npm install
# or
yarn install
# or
pnpm install
```

2. Run the development server:
```bash
npm run dev
# or
yarn dev
# or
pnpm dev
```

3. Open [http://localhost:3000](http://localhost:3000) in your browser.

## Docker Build

### Building the Docker Image

```bash
# Build the image
docker build -t shadcn-fastapi-frontend .

# Run the container
docker run -p 3000:3000 shadcn-fastapi-frontend
```

### Docker Compose (Recommended)

```bash
# Build and run with docker-compose
docker-compose up --build
```

## Troubleshooting

### React 19 Compatibility Issues

If you encounter peer dependency errors during installation, this is due to some packages not yet supporting React 19. Here are the solutions:

#### Solution 1: Use Package Overrides (Recommended)
The `package.json` already includes overrides to handle React 19 compatibility:

```json
{
  "overrides": {
    "react": "$react",
    "react-dom": "$react-dom",
    "@types/react": "$@types/react",
    "@types/react-dom": "$@types/react-dom"
  }
}
```

#### Solution 2: Use Legacy Peer Deps
```bash
npm install --legacy-peer-deps
```

#### Solution 3: Use pnpm (Alternative Package Manager)
```bash
# Install pnpm
npm install -g pnpm

# Use pnpm for installation
pnpm install
```

### Sharp Missing Error

If you see "sharp is required to be installed in standalone mode", the Dockerfile handles this by:

1. Installing sharp in the production stage
2. Setting the `NEXT_SHARP_PATH` environment variable
3. Copying the package.json to the production image

### Common Docker Build Issues

#### Issue: Build fails with dependency conflicts
**Solution**: The Dockerfile uses `--legacy-peer-deps` flag during installation.

#### Issue: Missing config files
**Solution**: The Dockerfile explicitly copies required config files:
- `postcss.config.mjs`
- `components.json`

#### Issue: Image optimization not working
**Solution**: Sharp is installed separately in the production stage with proper environment variables.

## Environment Variables

Create a `.env.local` file for local development:

```env
NEXT_PUBLIC_API_URL=http://localhost:8000
```

For production, these will be set by your deployment platform.

## Project Structure

```
frontend/
├── app/                 # Next.js App Router pages
├── components/          # React components
│   └── ui/             # shadcn/ui components
├── hooks/              # Custom React hooks
├── lib/                # Utility functions
├── public/             # Static assets
├── Dockerfile          # Docker configuration
├── next.config.ts      # Next.js configuration
├── tailwind.config.ts  # Tailwind CSS configuration
└── package.json        # Dependencies and scripts
```

## Adding shadcn/ui Components

```bash
# Add a new component
npx shadcn@latest add button

# Add multiple components
npx shadcn@latest add button card dialog
```

## Deployment

### Azure Container Apps

This frontend is configured to deploy to Azure Container Apps alongside the FastAPI backend. See the main project README for deployment instructions.

### Vercel (Alternative)

```bash
# Install Vercel CLI
npm install -g vercel

# Deploy
vercel
```

## Performance Optimization

- **Image Optimization**: Uses Next.js Image component with sharp
- **Code Splitting**: Automatic with Next.js App Router
- **Bundle Analysis**: Run `npm run build` to see bundle sizes
- **Standalone Output**: Configured for minimal Docker images

## Learn More

- [Next.js Documentation](https://nextjs.org/docs)
- [shadcn/ui Documentation](https://ui.shadcn.com)
- [Tailwind CSS Documentation](https://tailwindcss.com/docs)
- [React 19 Documentation](https://react.dev)
