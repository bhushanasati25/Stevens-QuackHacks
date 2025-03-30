#!/bin/bash

# Create directories for the project structure
mkdir -p career-navigator
cd career-navigator

# Create root files
touch .gitignore
touch .env
touch README.md
touch package.json

# Create client directory structure
mkdir -p client/public
mkdir -p client/src/components/{common,layout,forms,analysis,chat,visualization}
mkdir -p client/src/{context,services,utils}

# Create client files
touch client/package.json
touch client/tailwind.config.js
touch client/postcss.config.js
touch client/public/index.html
touch client/src/index.js
touch client/src/index.css
touch client/src/App.js

# Create component files
# Layout components
touch client/src/components/layout/Header.js
touch client/src/components/layout/Dashboard.js

# Form components
touch client/src/components/forms/UserInfoForm.js
touch client/src/components/forms/TargetRoleForm.js

# Analysis components
touch client/src/components/analysis/SalaryAnalysis.js
touch client/src/components/analysis/CareerPathAnalysis.js

# Visualization components
touch client/src/components/visualization/CareerPathVisualization.js
touch client/src/components/visualization/EnhancedCareerPathVisualization.js

# Chat components
touch client/src/components/chat/CareerStrategyChat.js

# Context files
touch client/src/context/UserDataContext.js

# Services files
touch client/src/services/analyzeService.js
touch client/src/services/chatService.js

# Utils files
touch client/src/utils/dataTransformers.js

# Create server directory structure
mkdir -p server/{controllers,models,routes,services,utils}

# Create server files
touch server/package.json
touch server/app.js
touch server/server.js

# Create controllers
touch server/controllers/analysisController.js
touch server/controllers/chatController.js

# Create routes
touch server/routes/analysisRoutes.js
touch server/routes/chatRoutes.js

# Create services
touch server/services/claudeService.js
touch server/services/dataService.js

# Create utils
touch server/utils/promptTemplates.js

# Create model files
touch server/models/careerData.js

# Create the setup and run scripts at the root level
cd ..
touch setup.sh
chmod +x setup.sh
touch run.sh
chmod +x run.sh

echo "Project structure created successfully!"

# Function to display the file structure as a tree
display_tree() {
  echo "career-navigator/"
  find career-navigator -type d -not -path "*/\.*" | sort | while read dir; do
    if [ "$dir" != "career-navigator" ]; then
      depth=$(echo $dir | sed 's/[^\/]//g' | wc -c)
      padding=$(printf '%*s' "$depth" '')
      echo "├── $padding$(basename "$dir")/"
    fi
  done
  
  find career-navigator -type f -not -path "*/\.*" | sort | while read file; do
    depth=$(echo $file | sed 's/[^\/]//g' | wc -c)
    padding=$(printf '%*s' "$depth" '')
    echo "├── $padding$(basename "$file")"
  done
  
  echo "├── setup.sh"
  echo "└── run.sh"
}

# Display the file structure
echo ""
echo "Generated project structure:"
echo "============================"
display_tree