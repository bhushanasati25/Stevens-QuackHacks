import os

def create_structure():
    # 1) Define the paths for directories:
    directories = [
        'career-navigator/backend',
        'career-navigator/backend/src',
        'career-navigator/backend/src/routes',
        'career-navigator/backend/src/services',
        'career-navigator/frontend',
        'career-navigator/frontend/public',
        'career-navigator/frontend/src',
        'career-navigator/frontend/src/components'
    ]

    # 2) Define the paths for files:
    files = [
        'career-navigator/backend/package.json',
        'career-navigator/backend/.env',
        'career-navigator/backend/src/app.js',
        'career-navigator/backend/src/routes/analysis.js',
        'career-navigator/backend/src/routes/chat.js',
        'career-navigator/backend/src/services/salaryService.js',
        'career-navigator/backend/src/services/llmService.js',

        'career-navigator/frontend/package.json',
        'career-navigator/frontend/src/index.js',
        'career-navigator/frontend/src/App.js',
        'career-navigator/frontend/src/components/SalaryAnalysis.js',
        'career-navigator/frontend/src/components/CareerChat.js',
        'career-navigator/frontend/src/components/CareerPath.js'
    ]

    # 3) Create each directory:
    for directory in directories:
        os.makedirs(directory, exist_ok=True)
        print(f"Directory ensured: {directory}")

    # 4) Create each file:
    for file_path in files:
        # If the file does not exist, create it; if it exists, do nothing
        if not os.path.exists(file_path):
            with open(file_path, 'w') as f:
                pass  # create empty file
            print(f"File created: {file_path}")
        else:
            print(f"File already exists: {file_path}")


if __name__ == "__main__":
    create_structure()
    print("Project structure created (or already present).")
