# GitHub Actions Workflow Templates

> **👋 New to setting up CI/CD?** Start here! This guide will help you set up GitHub Actions workflows for your project
> in minutes.

## 🚀 Quick Start: I'm Starting a New Project

**First, answer these questions:**

1. **What type of project is this?**
    - [ ] Frontend (React, Vue, Angular, etc.)
    - [ ] Backend API (Kotlin/Java or Python)
    - [ ] Infrastructure (Terraform)

2. **For Frontend/Backend: What's your deployment strategy?**
    - [ ] **Normal**: Deploy when code is pushed to `main` or `master` branch
    - [ ] **Trunk-based**: Deploy when code is pushed to `release/*` branches

3. **For Backend: What's your deployment target?**
    - [ ] **EKS** (Kubernetes) - Use if you have Kubernetes clusters
    - [ ] **ECS** (AWS Container Service) - Use if you prefer simpler AWS-native deployments
    - [ ] **ArgoCD GitOps** - Use if you have ArgoCD set up for GitOps workflows
    - [ ] **Multi-Environment** - Use if you need to deploy to multiple prod environments (prod-1, prod-2, prod-3)

4. **For Frontend: What's your deployment method?**
    - [ ] **CloudFront/S3** - Static site hosting on AWS
    - [ ] **Amplify** - AWS Amplify hosting

---

## 📋 Step-by-Step Setup Guide

### Step 1: Choose Your Templates

Based on your answers above, find your template path below and copy the files.

#### For Frontend Projects

**CloudFront Deployment:**

```bash
# 1. Copy PR check workflow (always needed)
cp templates/frontend/cloudfront/pr-check.yml <your-project>/.github/workflows/

# 2. Copy deployment workflows (choose one)
# Normal deployment (deploys on main/master):
cp templates/frontend/cloudfront/normal/*.yml <your-project>/.github/workflows/

# OR Trunk-based deployment (deploys on release/*):
cp templates/frontend/cloudfront/trunk/*.yml <your-project>/.github/workflows/

# 3. Optional: Copy E2E tests
cp templates/frontend/e2e-tests.yml <your-project>/.github/workflows/
```

**Amplify Deployment:**

```bash
# 1. Copy PR check workflow
cp templates/frontend/amplify/pr-check.yml <your-project>/.github/workflows/

# 2. Copy deployment workflows (choose one)
# Normal deployment:
cp templates/frontend/amplify/normal/*.yml <your-project>/.github/workflows/

# OR Trunk-based deployment:
cp templates/frontend/amplify/trunk/*.yml <your-project>/.github/workflows/
```

#### For Backend Projects

**Kotlin/Java Projects:**

```bash
# 1. Always copy these base workflows
cp templates/backend/kotlin/pr-check.yml <your-project>/.github/workflows/
cp templates/backend/kotlin/master-build.yml <your-project>/.github/workflows/

# 2. Choose your deployment method and strategy:

# Option A: EKS/Helm (Normal deployment)
cp templates/backend/kotlin/normal/eks/*.yml <your-project>/.github/workflows/

# Option B: EKS/Helm (Trunk-based)
cp templates/backend/kotlin/trunk/eks/*.yml <your-project>/.github/workflows/

# Option C: ECS (Normal deployment)
cp templates/backend/kotlin/normal/ecs/*.yml <your-project>/.github/workflows/

# Option D: ECS (Trunk-based)
cp templates/backend/kotlin/trunk/ecs/*.yml <your-project>/.github/workflows/

# Option E: ArgoCD GitOps (Normal)
cp templates/backend/kotlin/normal/eks/argo/*.yml <your-project>/.github/workflows/

# Option F: Multi-Environment deployment (deploy to multiple prod environments)
cp templates/backend/kotlin/normal/eks/multi/*.yml <your-project>/.github/workflows/
cp templates/.github/workflows/publish-badges.yml <your-project>/.github/workflows/
```

**Python Projects:**

```bash
# 1. Always copy these base workflows
cp templates/backend/python/pr-check.yml <your-project>/.github/workflows/
cp templates/backend/python/master-build.yml <your-project>/.github/workflows/

# 2. Choose your deployment method (same options as Kotlin above, but use python/ instead of kotlin/)
# Example for EKS Normal:
cp templates/backend/python/normal/eks/*.yml <your-project>/.github/workflows/
```

#### For Infrastructure (Terraform) Projects

```bash
# 1. Copy PR check workflow
cp templates/infra/pr-check.yml <your-project>/.github/workflows/

# 2. Copy deployment workflows (choose one)
# Normal deployment:
cp templates/infra/normal/*.yml <your-project>/.github/workflows/

# OR Trunk-based deployment:
cp templates/infra/trunk/*.yml <your-project>/.github/workflows/
```

---

### Step 2: Customize Your Workflows

After copying the templates, open each workflow file and look for `TODO:` comments. Update these values:

#### Frontend Customization

In each workflow file, update:

- [ ] **Node.js version**: Find `NODE_VERSION` and set your version (e.g., `18.18.2`)
- [ ] **Environment variables**: Add your `VITE_*` variables in the `env:` section
- [ ] **Package manager**: If not using `yarn`, update cache and install commands

#### Backend Customization

**For Kotlin/Java:**

- [ ] **Java version**: Find `JAVA_VERSION` (usually `17`)
- [ ] **Gradle build commands**: Update build steps if your project structure differs
- [ ] **Docker image paths**: Update `context:` and `file:` paths in Docker build steps
- [ ] **Service name**: Update `SERVICE_NAME` variable

**For Python:**

- [ ] **Python version**: Find `PYTHON_VERSION` (usually `3.11`)
- [ ] **Dependencies**: Uncomment and configure pip or Poetry steps
- [ ] **Docker image paths**: Update `context:` and `file:` paths
- [ ] **Service name**: Update `SERVICE_NAME` variable

**For All Backend:**

- [ ] **Helm configuration**: Update `HELM_REPO`, `HELM_SPARTAN_VERSION` if using EKS
- [ ] **ECS configuration**: Update `ECS_CLUSTER_NAME_*`, `TASK_FAMILY_*`, `CONTAINER_NAME` if using ECS

#### Infrastructure Customization

- [ ] **Terraform version**: Update `TF_VERSION` if specified
- [ ] **Working directory**: Update if Terraform files are in a subdirectory
- [ ] **Backend configuration**: Set up `TF_BACKEND_CONFIG_*` secrets if needed

---

### Step 3: Configure GitHub Variables and Secrets

Go to your GitHub repository → **Settings** → **Secrets and variables** → **Actions**

#### Required for All Projects

**Variables:**

- [ ] `GH_APP_ID` - Get from your organization's GitHub App
- [ ] `AWS_REGION` - Your AWS region (e.g., `us-east-1`)

**Secrets:**

- [ ] `GH_APP_PRIVATE_KEY` - Get from your organization's GitHub App
- [ ] `SLACK_WEBHOOK_URL` - Your Slack webhook for notifications
- [ ] `AWS_ROLE_TO_ASSUME_DEV` - AWS IAM role ARN for DEV environment
- [ ] `AWS_ROLE_TO_ASSUME_PROD` - AWS IAM role ARN for PROD environment

#### Frontend-Specific

**For CloudFront:**

- [ ] `AWS_S3_BUCKET_DEV` (variable)
- [ ] `AWS_CLOUDFRONT_ID_DEV` (variable)
- [ ] `AWS_S3_BUCKET_PROD` (variable)
- [ ] `AWS_CLOUDFRONT_ID_PROD` (variable)
- [ ] `NODE_VERSION` (variable)
- [ ] `VITE_*` variables (your frontend environment variables)

**For Amplify:**

- [ ] `AMPLIFY_WEBHOOK_URL_DEV` (secret)
- [ ] `AMPLIFY_WEBHOOK_URL_PROD` (secret)
- [ ] `NODE_VERSION` (variable)

#### Backend-Specific

**For Kotlin/Java:**

- [ ] `ARTIFACTORY_URL` (variable)
- [ ] `ARTIFACTORY_USERNAME` (variable)
- [ ] `AWS_CODE_ARTIFACT_DOMAIN_DEV` (variable)
- [ ] `AWS_ACCOUNT_ID_DEV` (secret)
- [ ] `AWS_ACCOUNT_ID_PROD` (secret)

**For EKS:**

- [ ] `HELM_REPO` (variable)
- [ ] `HELM_SPARTAN_VERSION` (variable)
- [ ] `DOCKER_REPO_DEV` (variable)
- [ ] `DOCKER_REPO_PROD` (variable)
- [ ] `SERVICE_NAME` (variable)

**For ECS:**

- [ ] `ECS_CLUSTER_NAME_DEV` (variable)
- [ ] `ECS_CLUSTER_NAME_PROD` (variable)
- [ ] `TASK_FAMILY_DEV` (variable)
- [ ] `TASK_FAMILY_PROD` (variable)
- [ ] `CONTAINER_NAME` (variable)
- [ ] `SERVICE_NAME_DEV` (variable)
- [ ] `SERVICE_NAME_PROD` (variable)

**For ArgoCD:**

- [ ] `ARGOCD_REPO_NAME` (variable) - Your ArgoCD GitOps repository name
- [ ] `ARGOCD_NAMESPACE` (variable)
- [ ] `K8S_NAMESPACE` (variable)

**For Multi-Environment Deployments:**

- [ ] Configure environment-specific variables (e.g., `ECS_CLUSTER_NAME_PROD-1`, `ECS_CLUSTER_NAME_PROD-2`)
- [ ] Default environments are `prod-1`, `prod-2`, `prod-3` - update the environment list if needed

> **📋 Complete Reference**: See [VARIABLES_AND_SECRETS.md](./VARIABLES_AND_SECRETS.md) for the full list of all
> variables and secrets.

---

### Step 4: Test Your Setup

1. **Create a test branch:**
   ```bash
   git checkout -b test-ci-setup
   git push origin test-ci-setup
   ```

2. **Create a Pull Request** - This will trigger the `pr-check.yml` workflow

3. **Check the Actions tab** in GitHub to see if workflows run successfully

4. **Fix any errors** - Common issues:
    - Missing variables/secrets
    - Incorrect file paths in Docker builds
    - Wrong service names or cluster names

---

## 🎯 What Each Workflow Does

### Frontend Workflows

- **`pr-check.yml`**: Runs on every Pull Request
    - Lints your code
    - Runs tests
    - Builds your app (to catch build errors early)

- **`deploy-dev-*.yml`**: Deploys to DEV environment
    - Triggers: Push to `main`/`master` (normal) or `release/*` (trunk-based)
    - Builds your app
    - Deploys to DEV (CloudFront S3 bucket or Amplify)

- **`deploy-prod-*.yml`**: Deploys to PROD environment
    - Triggers: When you create a git tag (e.g., `v1.0.0`)
    - Builds your app
    - Deploys to PROD

- **`e2e-tests.yml`**: Optional end-to-end tests
    - Runs Playwright tests
    - Can be triggered manually or on schedule

### Backend Workflows

- **`pr-check.yml`**: Runs on every Pull Request
    - Builds your code
    - Runs tests
    - Runs database migrations (Flyway for Kotlin)

- **`master-build.yml`**: Runs on `main`/`master` branch
    - Full build
    - Optional health checks

- **`deploy-dev.yml`**: Deploys to DEV
    - Builds Docker image
    - Pushes to ECR
    - Deploys to DEV environment (EKS/ECS)

- **`deploy-prod.yml`**: Deploys to PROD
    - Promotes DEV image to PROD (no rebuild)
    - Deploys to PROD environment

- **`deploy-prod.yml` (Multi-Environment)**: Deploys to multiple PROD environments
    - Builds image once
    - Deploys to prod-1, prod-2, prod-3 in parallel
    - Creates deployment badges

### Infrastructure Workflows

- **`pr-check.yml`**: Runs on Pull Requests
    - Validates Terraform syntax
    - Runs `terraform plan` (shows what would change)

- **`deploy-dev.yml`**: Applies Terraform to DEV
    - Triggers: Push to `main`/`master`
    - Runs `terraform apply`

- **`deploy-prod.yml`**: Applies Terraform to PROD
    - Triggers: Git tag `v*.*.*`
    - Runs `terraform apply`

---

## 📁 Directory Structure

```
templates/
├── frontend/                        # Frontend templates
│   ├── cloudfront/                 # CloudFront/S3 deployment
│   ├── amplify/                    # AWS Amplify deployment
│   └── e2e-tests.yml              # End-to-end tests
├── backend/                         # Backend templates
│   ├── kotlin/                      # Kotlin/Java
│   │   ├── pr-check.yml            # PR validation
│   │   ├── master-build.yml        # Master branch build
│   │   ├── normal/                 # Normal deployment (main/master)
│   │   │   ├── eks/                # EKS/Kubernetes
│   │   │   │   ├── deploy-dev.yml
│   │   │   │   ├── deploy-prod.yml
│   │   │   │   ├── argo/           # ArgoCD GitOps
│   │   │   │   └── multi/          # Multi-environment deployment
│   │   │   └── ecs/                # ECS
│   │   │       ├── deploy-dev.yml
│   │   │       ├── deploy-prod.yml
│   │   │       └── multi/          # Multi-environment deployment
│   │   └── trunk/                  # Trunk-based (release/*)
│   │       └── [same structure]
│   └── python/                      # Python (same structure)
├── infra/                           # Infrastructure (Terraform)
│   ├── pr-check.yml
│   ├── normal/
│   └── trunk/
└── .github/workflows/
    └── publish-badges.yml          # Badge publishing (for multi-environment deployments)
```

---

## ❓ Common Questions

### Which deployment strategy should I choose?

- **Normal**: Use if you deploy directly from `main`/`master` branch
- **Trunk-based**: Use if you create `release/*` branches for deployments

### EKS vs ECS?

- **EKS**: Choose if you already have Kubernetes clusters or need Kubernetes features
- **ECS**: Choose if you want simpler AWS-native container orchestration

### What's ArgoCD GitOps?

- Uses Git as the source of truth for deployments
- Workflow commits to a separate GitOps repository
- ArgoCD automatically syncs changes to your cluster
- Use if your organization uses ArgoCD

### What's Multi-Environment deployment?

- Deploys to multiple production environments (prod-1, prod-2, prod-3) at the same time
- Builds your Docker image once, then deploys it to all environments in parallel
- Use this if you need to deploy to multiple production environments
- Much faster than deploying to each environment one by one

### Do I need badge publishing?

- Only needed for multi-environment deployments
- Publishes deployment status badges to GitHub Pages
- Shows which version is deployed to each environment
- Optional but nice to have for visibility

---

## 🔧 Troubleshooting

### Workflow fails with "Permission denied"

- Check that all required secrets are set
- Verify `GH_APP_ID` and `GH_APP_PRIVATE_KEY` are correct
- Ensure AWS roles have correct permissions

### Docker build fails

- Check Dockerfile path in workflow
- Verify build context is correct
- Check if all required files exist

### Deployment fails

- Verify all environment variables are set
- Check AWS credentials and roles
- Verify cluster/service names are correct
- Check ECR repository exists

### PR check fails

- Review test failures
- Check linting errors
- Verify build commands match your project structure

---

## 📚 Additional Resources

- [VARIABLES_AND_SECRETS.md](./VARIABLES_AND_SECRETS.md) - Complete list of all variables and secrets
- [GitHub Actions Documentation](https://docs.github.com/en/actions)
- [Setup GitHub Actions on new projects](../Setup%20GitHub%20Actions%20on%20new%20projects%202d801fb05bf180b88f6ad24134e2f3e0.md) -
  Full technical documentation

---

## 🎓 Key Concepts

### Concurrency

Workflows automatically cancel older runs when a new one starts on the same branch. This prevents conflicts.

### Image Promotion

For PROD deployments, we promote the DEV image instead of rebuilding. This ensures consistency and saves time.

### Security

All workflows use GitHub App tokens (not personal tokens) and OIDC for AWS authentication. This is more secure.

### Caching

Workflows cache dependencies to speed up builds. PRs get isolated caches, while main branch refreshes the primary cache.

**GitHub-hosted runners**: Caching is automatically handled by GitHub Actions. Dependencies are cached between runs.

**Self-hosted runners**: Caching works the same way, but cache storage is on your runner's disk. Make sure your runner
has sufficient disk space for caches.

### Runners

Workflows support both GitHub-hosted and self-hosted runners:

- **GitHub-hosted** (`ubuntu-latest`): Default for most workflows. No setup required, but limited resources.
- **Self-hosted** (e.g., `builder-16-32`): Used for resource-intensive builds. Requires setting up your own runner.

To use self-hosted runners, update the `runs-on` value in your workflow file. See the Kotlin templates for examples.

---

**Need help?** Check the workflow files for `TODO:` comments - these indicate what needs to be customized for your
project.
