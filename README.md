MyCoreApp
MyCoreApp is a .NET-based web application deployed as a Docker container on Azure Web App for Linux. The project includes a fully automated CI/CD pipeline using GitHub Actions to build, push the Docker image to Docker Hub, and deploy to Azure.
Table of Contents

Overview
Prerequisites
Project Structure
Setup Instructions
Local Development
Docker Setup
CI/CD Pipeline
Azure Deployment


Environment Variables
Contributing
License

Overview
MyCoreApp is a scalable .NET web application designed to run in a containerized environment. The application is containerized using Docker, stored in Docker Hub, and deployed to Azure Web App for Linux. The CI/CD pipeline, implemented with GitHub Actions, automates the build, test, image push, and deployment processes.
Prerequisites

.NET SDK (version compatible with your app)
Docker Desktop
Azure CLI
GitHub Account
Docker Hub Account
Azure Subscription
Git installed on your machine

Project Structure
MyCoreApp/
├── MyCoreApp/                # .NET application source code
├── Dockerfile                # Docker configuration for containerizing the app
├── .github/workflows/        # GitHub Actions CI/CD workflow files
├── README.md                 # Project documentation
├── .gitignore                # Git ignore file for .NET and Docker

Setup Instructions
Local Development

Clone the repository:git clone https://github.com/your-username/MyCoreApp.git
cd MyCoreApp


Restore dependencies and run the application:dotnet restore
dotnet run --project MyCoreApp


Access the app at http://localhost:5000 (or the port specified in your app).

Docker Setup

Build the Docker image locally:docker build -t mycoreapp:latest .


Run the Docker container:docker run -p 8080:80 mycoreapp:latest


Access the app at http://localhost:8080.
Push the image to Docker Hub:docker tag mycoreapp:latest your-dockerhub-username/mycoreapp:latest
docker push your-dockerhub-username/mycoreapp:latest



CI/CD Pipeline
The CI/CD pipeline is defined in .github/workflows/main.yml. It automates:

Building and testing the .NET application
Building and pushing the Docker image to Docker Hub
Deploying the image to Azure Web App

To set up the pipeline:

Store the following secrets in your GitHub repository (Settings > Secrets and variables > Actions):
DOCKERHUB_USERNAME: Your Docker Hub username
DOCKERHUB_TOKEN: Your Docker Hub access token
AZURE_CREDENTIALS: Azure service principal credentials (JSON format)
AZURE_WEBAPP_NAME: Name of your Azure Web App


Push changes to the main branch to trigger the pipeline.

Azure Deployment

Create an Azure Web App for Containers (Linux) using the Azure Portal or CLI:az webapp create --resource-group <resource-group> --name <app-name> --plan <app-service-plan> --deployment-container-image-name your-dockerhub-username/mycoreapp:latest


Configure the Web App to pull the Docker image from Docker Hub:
Set DOCKER_REGISTRY_SERVER_URL to https://index.docker.io/v1/
Set DOCKER_REGISTRY_SERVER_USERNAME to your Docker Hub username
Set DOCKER_REGISTRY_SERVER_PASSWORD to your Docker Hub access token


Access the deployed app at https://<app-name>.azurewebsites.net.

Environment Variables
The application uses the following environment variables (configure in Azure Web App or locally via appsettings.json or Docker):



Variable
Description
Default Value



ASPNETCORE_ENVIRONMENT
Environment (e.g., Development, Production)
Production


PORT
Port for the app to listen on
80


Contributing

Fork the repository.
Create a feature branch (git checkout -b feature/your-feature).
Commit your changes (git commit -m "Add your feature").
Push to the branch (git push origin feature/your-feature).
Open a Pull Request.

License
This project is licensed under the MIT License. See the LICENSE file for details.