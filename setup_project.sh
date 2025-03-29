#!/bin/bash

mkdir -p CareerScope.AI/{backend/{api/{routes,schemas},core,models,services,utils},frontend/{public,src/{assets,components,layouts,pages,services}},datasets,notebooks,scripts,.github/workflows}

touch CareerScope.AI/backend/api/__init__.py
touch CareerScope.AI/backend/api/routes/{chat.py,salary.py,simulation.py}
touch CareerScope.AI/backend/api/schemas/chat.py

touch CareerScope.AI/backend/core/{__init__.py,config.py}
touch CareerScope.AI/backend/models/.gitkeep
touch CareerScope.AI/backend/services/{chat_service.py,salary_service.py,simulation_service.py}
touch CareerScope.AI/backend/utils/helper.py
touch CareerScope.AI/backend/{main.py,requirements.txt,.env}

touch CareerScope.AI/frontend/public/index.html
touch CareerScope.AI/frontend/src/assets/.gitkeep
touch CareerScope.AI/frontend/src/components/{Chatbot.jsx,SalaryChart.jsx,SimulationForm.jsx}
touch CareerScope.AI/frontend/src/layouts/MainLayout.jsx
touch CareerScope.AI/frontend/src/pages/{LandingPage.jsx,ChatPage.jsx,DashboardPage.jsx,SimulationPage.jsx}
touch CareerScope.AI/frontend/src/services/api.js
touch CareerScope.AI/frontend/src/{App.jsx,main.jsx,index.css}

touch CareerScope.AI/frontend/{tailwind.config.js,postcss.config.js,package.json,vite.config.js}

touch CareerScope.AI/datasets/{salaries.csv,skills.csv}

touch CareerScope.AI/notebooks/{data_exploration.ipynb,career_simulation.ipynb}

touch CareerScope.AI/scripts/{deploy_backend.sh,deploy_frontend.sh}
chmod +x CareerScope.AI/scripts/{deploy_backend.sh,deploy_frontend.sh}

touch CareerScope.AI/.github/workflows/deploy.yml

touch CareerScope.AI/{.gitignore,README.md}

echo "✅ CareerScope.AI project structure created!"
