#!/bin/bash

# Create project directory
mkdir -p career-navigator
cd career-navigator

# Initialize git
git init

# Create .gitignore
cat > .gitignore << EOF
# dependencies
/node_modules
/client/node_modules
/server/node_modules
/.pnp
.pnp.js

# environment variables
.env
.env.local
.env.development.local
.env.test.local
.env.production.local

# logs
npm-debug.log*
yarn-debug.log*
yarn-error.log*

# production build
/client/build

# misc
.DS_Store
.idea/
.vscode/
*.swp
*.swo
EOF

# Create .env file
cat > .env << EOF
PORT=5000
CLAUDE_API_KEY=your_claude_api_key
NODE_ENV=development
EOF

# Setup Frontend
mkdir -p client/public client/src/components/{common,layout,forms,analysis,chat,visualization} client/src/{context,services,utils}

# Create package.json for client
cat > client/package.json << EOF
{
  "name": "career-navigator-client",
  "version": "0.1.0",
  "private": true,
  "dependencies": {
    "@testing-library/jest-dom": "^5.16.5",
    "@testing-library/react": "^13.4.0",
    "@testing-library/user-event": "^13.5.0",
    "axios": "^1.3.4",
    "react": "^18.2.0",
    "react-dom": "^18.2.0",
    "react-scripts": "5.0.1",
    "recharts": "^2.4.3",
    "tailwindcss": "^3.2.7",
    "postcss": "^8.4.21",
    "autoprefixer": "^10.4.13",
    "web-vitals": "^2.1.4"
  },
  "scripts": {
    "start": "react-scripts start",
    "build": "react-scripts build",
    "test": "react-scripts test",
    "eject": "react-scripts eject"
  },
  "eslintConfig": {
    "extends": [
      "react-app",
      "react-app/jest"
    ]
  },
  "browserslist": {
    "production": [
      ">0.2%",
      "not dead",
      "not op_mini all"
    ],
    "development": [
      "last 1 chrome version",
      "last 1 firefox version",
      "last 1 safari version"
    ]
  },
  "proxy": "http://localhost:5000"
}
EOF

# Create a basic HTML file
cat > client/public/index.html << EOF
<!DOCTYPE html>
<html lang="en">
  <head>
    <meta charset="utf-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1" />
    <meta name="theme-color" content="#000000" />
    <meta name="description" content="AI-Powered Career & Compensation Navigator" />
    <title>CareerNavigator AI</title>
  </head>
  <body>
    <noscript>You need to enable JavaScript to run this app.</noscript>
    <div id="root"></div>
  </body>
</html>
EOF

# Setup Tailwind CSS
cat > client/tailwind.config.js << EOF
module.exports = {
  content: ["./src/**/*.{js,jsx,ts,tsx}"],
  theme: {
    extend: {},
  },
  plugins: [],
}
EOF

cat > client/postcss.config.js << EOF
module.exports = {
  plugins: {
    tailwindcss: {},
    autoprefixer: {},
  },
}
EOF

# Create index CSS with Tailwind imports
cat > client/src/index.css << EOF
@tailwind base;
@tailwind components;
@tailwind utilities;

body {
  margin: 0;
  font-family: -apple-system, BlinkMacSystemFont, 'Segoe UI', 'Roboto', 'Oxygen',
    'Ubuntu', 'Cantarell', 'Fira Sans', 'Droid Sans', 'Helvetica Neue',
    sans-serif;
  -webkit-font-smoothing: antialiased;
  -moz-osx-font-smoothing: grayscale;
  @apply bg-gray-50;
}

code {
  font-family: source-code-pro, Menlo, Monaco, Consolas, 'Courier New',
    monospace;
}
EOF

# Create React entry point
cat > client/src/index.js << EOF
import React from 'react';
import ReactDOM from 'react-dom/client';
import './index.css';
import App from './App';

const root = ReactDOM.createRoot(document.getElementById('root'));
root.render(
  <React.StrictMode>
    <App />
  </React.StrictMode>
);
EOF

# Setup Backend
mkdir -p server/{controllers,models,routes,services,utils}

# Create package.json for server
cat > server/package.json << EOF
{
  "name": "career-navigator-server",
  "version": "1.0.0",
  "description": "Backend for AI-Powered Career & Compensation Navigator",
  "main": "server.js",
  "scripts": {
    "start": "node server.js",
    "dev": "nodemon server.js"
  },
  "dependencies": {
    "axios": "^1.3.4",
    "cors": "^2.8.5",
    "dotenv": "^16.0.3",
    "express": "^4.18.2"
  },
  "devDependencies": {
    "nodemon": "^2.0.20"
  }
}
EOF

# Create root package.json for concurrently running client and server
cat > package.json << EOF
{
  "name": "career-navigator",
  "version": "1.0.0",
  "description": "AI-Powered Career & Compensation Navigator",
  "main": "index.js",
  "scripts": {
    "start": "node server/server.js",
    "server": "nodemon server/server.js",
    "client": "npm start --prefix client",
    "dev": "concurrently \\"npm run server\\" \\"npm run client\\"",
    "install-all": "npm install && npm install --prefix client && npm install --prefix server",
    "build": "npm run build --prefix client"
  },
  "dependencies": {
    "concurrently": "^7.6.0"
  }
}
EOF

# Create a basic README
cat > README.md << EOF
# AI-Powered Career & Compensation Navigator

An interactive AI assistant that helps employees make informed career moves by turning complex payroll and market data into actionable insights.

## Features

- 🔹 Analyzes compensation trends
- 🔹 Answers career-impacting questions
- 🔹 Visualizes opportunities
- 🔹 Simulates career paths

## Setup

1. Clone the repository
2. Run \`npm run install-all\` to install dependencies
3. Create a \`.env\` file with your Claude API key
4. Run \`npm run dev\` to start the development server

## Technologies

- Frontend: React, Tailwind CSS, Recharts
- Backend: Node.js, Express
- AI: Claude API
EOF

echo "Project structure created successfully!"
echo "Next steps:"
echo "1. cd career-navigator"
echo "2. npm run install-all"
echo "3. Add your Claude API key to .env"
echo "4. npm run dev"