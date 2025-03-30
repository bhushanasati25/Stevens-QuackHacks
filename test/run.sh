#!/bin/bash

# Colors for terminal output
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
RED='\033[0;31m'
NC='\033[0m' # No Color

echo -e "${YELLOW}=============================================${NC}"
echo -e "${YELLOW}  AI-Powered Career & Compensation Navigator  ${NC}"
echo -e "${YELLOW}=============================================${NC}"

# Check if script is running from the right directory
if [ ! -f "./setup.sh" ]; then
  echo -e "${RED}Error: Please run this script from the directory containing setup.sh${NC}"
  exit 1
fi

# Create .env file if it doesn't exist
if [ ! -f ".env" ]; then
  echo -e "${YELLOW}Creating .env file...${NC}"
  echo -n "Enter your Claude API key: "
  read -s CLAUDE_API_KEY
  echo ""
  echo "PORT=5000" > .env
  echo "CLAUDE_API_KEY=$CLAUDE_API_KEY" >> .env
  echo "NODE_ENV=development" >> .env
  echo -e "${GREEN}Created .env file${NC}"
fi

# Check if project is already set up
if [ ! -d "./career-navigator" ]; then
  echo -e "${YELLOW}Setting up project structure...${NC}"
  bash setup.sh
  echo -e "${GREEN}Project structure created successfully!${NC}"
fi

# Navigate to project directory
cd career-navigator

# Check for Node.js
if ! command -v node &> /dev/null; then
  echo -e "${RED}Error: Node.js is not installed. Please install Node.js and try again.${NC}"
  exit 1
fi

# Install dependencies if needed
if [ ! -d "./node_modules" ]; then
  echo -e "${YELLOW}Installing dependencies...${NC}"
  npm run install-all
fi

# Start the application
echo -e "${GREEN}Starting the application...${NC}"
echo -e "${YELLOW}Please wait while the server and client start up...${NC}"
echo -e "${YELLOW}The application will open in your browser shortly.${NC}"
npm run dev