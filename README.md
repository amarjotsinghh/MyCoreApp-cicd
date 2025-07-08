Absolutely! Here's your **complete `README.md` file** in Markdown format, with the matrix build section **fully removed** and ready to be saved in your repo:

---

````markdown
# MyCoreApp 🚀

A .NET 8 Web Application containerized with Docker and deployed to Azure App Service using GitHub Actions.

---

## 📦 Features

- ✅ .NET 8 Web App
- 🐳 Dockerized for easy container deployment
- 🤖 GitHub Actions CI/CD
  - Build & push Docker image to Docker Hub
  - Manual approval before push
- ☁️ Deploy to Azure App Service (Linux Container)

---

## 🚀 Quick Start

### 1. Clone this repo

```bash
git clone https://github.com/amarjotsinghh/MyCoreApp-cicd.git
cd MyCoreApp-cicd
````

---

### 2. Build & Run Locally (Docker)

```bash
docker build -t mycoreapp .
docker run -p 5109:80 mycoreapp
```

Then open your browser:
📍 `http://localhost:5109`

---

### 3. GitHub Actions Workflows

| Workflow                                  | Description                               |
| ----------------------------------------- | ----------------------------------------- |
| `.github/workflows/docker-build-push.yml` | Builds, approves, and pushes Docker image |
| `.github/workflows/deploy-to-azure.yml`   | Deploys container to Azure App Service    |

---

### 4. GitHub Secrets Required

| Secret Name            | Description                                |
| ---------------------- | ------------------------------------------ |
| `DOCKER_USERNAME`      | Your Docker Hub username                   |
| `DOCKER_PASSWORD`      | Your Docker Hub password/token             |
| `AZURE_WEBAPP_NAME`    | Azure App Service name                     |
| `AZURE_RESOURCE_GROUP` | Resource group containing the app          |
| `AZURE_CREDENTIALS`    | Azure Service Principal credentials (JSON) |

To generate `AZURE_CREDENTIALS`, run:

```bash
az ad sp create-for-rbac --name "github-deploy-sp" \
  --role contributor \
  --scopes /subscriptions/<your-subscription-id>/resourceGroups/<your-resource-group> \
  --sdk-auth
```

Copy the entire JSON output and save it as the `AZURE_CREDENTIALS` GitHub secret.

---

## 🌐 Deploying to Azure

Once your Azure App Service is set up and secrets are in place:

1. Trigger the GitHub Action: **"Deploy to Azure App Service"**
2. Wait for it to complete successfully
3. Visit your deployed app at:

```text
https://<your-app-name>.azurewebsites.net
```

---
