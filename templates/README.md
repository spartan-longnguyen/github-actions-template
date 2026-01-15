# GitHub Actions Workflow Templates

This directory contains reusable GitHub Actions workflow templates for setting up CI/CD pipelines in new projects.

> **📋 Required Variables and Secrets**: See [VARIABLES_AND_SECRETS.md](./VARIABLES_AND_SECRETS.md) for a complete list of required GitHub repository variables and secrets for each template type.

## Directory Structure

```
templates/
├── fe/                              # Frontend (FE) templates
│   ├── cloudfront/                 # CloudFront/S3 deployment templates
│   │   ├── pr-check.yml            # Pull Request validation workflow
│   │   ├── normal/                 # Normal deployment (main/master branches)
│   │   │   ├── deploy-dev-cloudfront.yml # DEV deployment (triggers on main/master)
│   │   │   └── deploy-prod-cloudfront.yml # PROD deployment (triggers on tags)
│   │   └── trunk/                  # Trunk-based release (release/* branches)
│   │       ├── deploy-dev-cloudfront.yml # DEV deployment (triggers on release/*)
│   │       └── deploy-prod-cloudfront.yml # PROD deployment (triggers on tags)
│   ├── amplify/                    # AWS Amplify deployment templates
│   │   ├── pr-check.yml            # Pull Request validation workflow
│   │   ├── normal/                 # Normal deployment (main/master branches)
│   │   │   ├── deploy-dev-amplify.yml # DEV deployment (triggers on main/master)
│   │   │   └── deploy-prod-amplify.yml # PROD deployment (triggers on tags)
│   │   └── trunk/                  # Trunk-based release (release/* branches)
│   │       ├── deploy-dev-amplify.yml # DEV deployment (triggers on release/*)
│   │       └── deploy-prod-amplify.yml # PROD deployment (triggers on tags)
│   └── e2e-tests.yml              # End-to-end tests with Playwright (shared)
├── be/                              # Backend templates
│   ├── kotlin/                      # Kotlin/Java backend templates
│   │   ├── pr-check.yml            # Pull Request validation workflow
│   │   ├── master-build.yml        # Master branch build + health check workflow
│   │   ├── normal/                 # Normal deployment (main/master branches)
│   │   │   ├── eks/                # EKS/Kubernetes deployment templates
│   │   │   │   ├── deploy-dev.yml  # DEV deployment (triggers on main/master)
│   │   │   │   ├── deploy-prod.yml # PROD deployment (triggers on tags)
│   │   │   │   ├── argo/           # ArgoCD GitOps deployment templates
│   │   │   │   │   ├── deploy-dev.yml  # DEV deployment via ArgoCD GitOps
│   │   │   │   │   └── deploy-prod.yml # PROD deployment via ArgoCD GitOps
│   │   │   │   └── matrix/         # Matrix deployment templates (multi-environment)
│   │   │   │       └── deploy-prod.yml # PROD deployment to multiple environments (prod-1, prod-2, prod-3)
│   │   │   └── ecs/                # ECS deployment templates
│   │   │       ├── deploy-dev.yml  # DEV deployment (triggers on main/master)
│   │   │       ├── deploy-prod.yml # PROD deployment (triggers on tags)
│   │   │       └── matrix/         # Matrix deployment templates (multi-environment)
│   │   │           └── deploy-prod.yml # PROD deployment to multiple environments (prod-1, prod-2, prod-3)
│   │   └── trunk/                  # Trunk-based release (release/* branches)
│   │       ├── eks/                # EKS/Kubernetes deployment templates
│   │       │   ├── deploy-dev.yml  # DEV deployment (triggers on release/*)
│   │       │   ├── deploy-prod.yml # PROD deployment (triggers on tags)
│   │       │   ├── argo/           # ArgoCD GitOps deployment templates
│   │       │   │   ├── deploy-dev.yml  # DEV deployment via ArgoCD GitOps
│   │       │   │   └── deploy-prod.yml # PROD deployment via ArgoCD GitOps
│   │       │   └── matrix/         # Matrix deployment templates (multi-environment)
│   │       │       └── deploy-prod.yml # PROD deployment to multiple environments (prod-1, prod-2, prod-3)
│   │       └── ecs/                # ECS deployment templates
│   │           ├── deploy-dev.yml  # DEV deployment (triggers on release/*)
│   │           ├── deploy-prod.yml # PROD deployment (triggers on tags)
│   │           └── matrix/         # Matrix deployment templates (multi-environment)
│   │               └── deploy-prod.yml # PROD deployment to multiple environments (prod-1, prod-2, prod-3)
│   └── python/                      # Python backend templates
│       ├── pr-check.yml            # Pull Request validation workflow
│       ├── master-build.yml        # Master branch build + health check workflow
│       ├── normal/                 # Normal deployment (main/master branches)
│       │   ├── eks/                # EKS/Kubernetes deployment templates
│       │   │   ├── deploy-dev.yml  # DEV deployment (triggers on main/master)
│       │   │   ├── deploy-prod.yml # PROD deployment (triggers on tags)
│       │   │   ├── argo/           # ArgoCD GitOps deployment templates
│       │   │   │   ├── deploy-dev.yml  # DEV deployment via ArgoCD GitOps
│       │   │   │   └── deploy-prod.yml # PROD deployment via ArgoCD GitOps
│       │   │   └── matrix/         # Matrix deployment templates (multi-environment)
│       │   │       └── deploy-prod.yml # PROD deployment to multiple environments (prod-1, prod-2, prod-3)
│       │   └── ecs/                # ECS deployment templates
│       │       ├── deploy-dev.yml  # DEV deployment (triggers on main/master)
│       │       ├── deploy-prod.yml # PROD deployment (triggers on tags)
│       │       └── matrix/         # Matrix deployment templates (multi-environment)
│       │           └── deploy-prod.yml # PROD deployment to multiple environments (prod-1, prod-2, prod-3)
│       └── trunk/                  # Trunk-based release (release/* branches)
│           ├── eks/                # EKS/Kubernetes deployment templates
│           │   ├── deploy-dev.yml  # DEV deployment (triggers on release/*)
│           │   ├── deploy-prod.yml # PROD deployment (triggers on tags)
│           │   ├── argo/           # ArgoCD GitOps deployment templates
│           │   │   ├── deploy-dev.yml  # DEV deployment via ArgoCD GitOps
│           │   │   └── deploy-prod.yml # PROD deployment via ArgoCD GitOps
│           │   └── matrix/         # Matrix deployment templates (multi-environment)
│           │       └── deploy-prod.yml # PROD deployment to multiple environments (prod-1, prod-2, prod-3)
│           └── ecs/                # ECS deployment templates
│               ├── deploy-dev.yml  # DEV deployment (triggers on release/*)
│               ├── deploy-prod.yml # PROD deployment (triggers on tags)
│               └── matrix/         # Matrix deployment templates (multi-environment)
│                   └── deploy-prod.yml # PROD deployment to multiple environments (prod-1, prod-2, prod-3)
├── infra/                           # Infrastructure (Terraform) templates
│   ├── pr-check.yml                # Terraform PR validation and plan
│   ├── normal/                     # Normal deployment (main/master branches)
│   │   ├── deploy-dev.yml          # DEV deployment (triggers on main/master)
│   │   └── deploy-prod.yml         # PROD deployment (triggers on tags)
│   └── trunk/                      # Trunk-based release (release/* branches)
│       ├── deploy-dev.yml          # DEV deployment (triggers on release/*)
│       └── deploy-prod.yml         # PROD deployment (triggers on tags)
├── .github/
│   └── workflows/
│       └── publish-badges.yml      # Reusable workflow for publishing deployment badges to GitHub Pages
├── README.md                        # This file
└── VARIABLES_AND_SECRETS.md         # Complete reference for required variables and secrets
```

## 📋 Required Variables and Secrets

Before setting up workflows, ensure you have configured all required GitHub repository variables and secrets.

**👉 See [VARIABLES_AND_SECRETS.md](./VARIABLES_AND_SECRETS.md) for a complete reference guide with:**
- Complete list of variables and secrets for each template type
- Quick setup checklists
- Project-specific configuration notes

## Quick Start

### For Frontend Projects

1. Choose your deployment method and strategy, then copy the corresponding templates:
   
   **For CloudFront - Normal deployment (main/master):**
   ```bash
   cp templates/fe/cloudfront/pr-check.yml <your-project>/.github/workflows/
   cp templates/fe/cloudfront/normal/*.yml <your-project>/.github/workflows/
   cp templates/fe/e2e-tests.yml <your-project>/.github/workflows/  # Optional
   ```
   
   **For CloudFront - Trunk-based release (release/*):**
   ```bash
   cp templates/fe/cloudfront/pr-check.yml <your-project>/.github/workflows/
   cp templates/fe/cloudfront/trunk/*.yml <your-project>/.github/workflows/
   cp templates/fe/e2e-tests.yml <your-project>/.github/workflows/  # Optional
   ```
   
   **For Amplify - Normal deployment (main/master):**
   ```bash
   cp templates/fe/amplify/pr-check.yml <your-project>/.github/workflows/
   cp templates/fe/amplify/normal/*.yml <your-project>/.github/workflows/
   cp templates/fe/e2e-tests.yml <your-project>/.github/workflows/  # Optional
   ```
   
   **For Amplify - Trunk-based release (release/*):**
   ```bash
   cp templates/fe/amplify/pr-check.yml <your-project>/.github/workflows/
   cp templates/fe/amplify/trunk/*.yml <your-project>/.github/workflows/
   cp templates/fe/e2e-tests.yml <your-project>/.github/workflows/  # Optional
   ```

2. Update the following in each workflow file:
   - **Node.js version** in `env.NODE_VERSION`
   - **Environment variables** (e.g., `VITE_*` variables) in the `env` section
   - **Package manager** if not using `yarn` (update cache and install commands)
   - **E2E test configuration** (credentials, test folders, etc.) if using e2e-tests.yml

3. Configure required variables and secrets:
   - **📋 See [VARIABLES_AND_SECRETS.md](./VARIABLES_AND_SECRETS.md) for complete list**
   - Common requirements: `GH_APP_ID`, `GH_APP_PRIVATE_KEY`, `AWS_ROLE_TO_ASSUME_DEV`, `AWS_ROLE_TO_ASSUME_PROD`, `SLACK_WEBHOOK_URL`
   - For CloudFront: `AWS_S3_BUCKET_DEV`, `AWS_S3_BUCKET_PROD`, `AWS_CLOUDFRONT_ID_DEV`, `AWS_CLOUDFRONT_ID_PROD` (variables)
   - For Amplify: `AMPLIFY_WEBHOOK_URL_DEV`, `AMPLIFY_WEBHOOK_URL_PROD` (secrets)
   - Project-specific: `VITE_*` variables for frontend environment configuration

### For Backend Projects

1. Choose your deployment strategy and language, then copy the corresponding templates:
   
   **For Kotlin/Java single environment deployment:**
   ```bash
   cp templates/be/single/kotlin/*.yml <your-project>/.github/workflows/
   ```
   
   **For Kotlin/Java - Normal deployment (EKS/Helm):**
   ```bash
   cp templates/be/kotlin/pr-check.yml <your-project>/.github/workflows/
   cp templates/be/kotlin/master-build.yml <your-project>/.github/workflows/
   cp templates/be/kotlin/normal/eks/*.yml <your-project>/.github/workflows/
   ```
   
   **For Kotlin/Java - Normal deployment (ECS):**
   ```bash
   cp templates/be/kotlin/pr-check.yml <your-project>/.github/workflows/
   cp templates/be/kotlin/master-build.yml <your-project>/.github/workflows/
   cp templates/be/kotlin/normal/ecs/*.yml <your-project>/.github/workflows/
   ```
   
   **For Kotlin/Java - Trunk-based release (EKS/Helm):**
   ```bash
   cp templates/be/kotlin/pr-check.yml <your-project>/.github/workflows/
   cp templates/be/kotlin/master-build.yml <your-project>/.github/workflows/
   cp templates/be/kotlin/trunk/eks/*.yml <your-project>/.github/workflows/
   ```
   
   **For Kotlin/Java - Trunk-based release (ECS):**
   ```bash
   cp templates/be/kotlin/pr-check.yml <your-project>/.github/workflows/
   cp templates/be/kotlin/master-build.yml <your-project>/.github/workflows/
   cp templates/be/kotlin/trunk/ecs/*.yml <your-project>/.github/workflows/
   ```
   
   **For Kotlin/Java - Normal deployment (ArgoCD GitOps):**
   ```bash
   cp templates/be/kotlin/pr-check.yml <your-project>/.github/workflows/
   cp templates/be/kotlin/master-build.yml <your-project>/.github/workflows/
   cp templates/be/kotlin/normal/eks/argo/*.yml <your-project>/.github/workflows/
   ```
   
   **For Kotlin/Java - Trunk-based release (ArgoCD GitOps):**
   ```bash
   cp templates/be/kotlin/pr-check.yml <your-project>/.github/workflows/
   cp templates/be/kotlin/master-build.yml <your-project>/.github/workflows/
   cp templates/be/kotlin/trunk/eks/argo/*.yml <your-project>/.github/workflows/
   ```
   
   **For Python - Normal deployment (EKS/Helm):**
   ```bash
   cp templates/be/python/pr-check.yml <your-project>/.github/workflows/
   cp templates/be/python/master-build.yml <your-project>/.github/workflows/
   cp templates/be/python/normal/eks/*.yml <your-project>/.github/workflows/
   ```
   
   **For Python - Normal deployment (ECS):**
   ```bash
   cp templates/be/python/pr-check.yml <your-project>/.github/workflows/
   cp templates/be/python/master-build.yml <your-project>/.github/workflows/
   cp templates/be/python/normal/ecs/*.yml <your-project>/.github/workflows/
   ```
   
   **For Python - Trunk-based release (EKS/Helm):**
   ```bash
   cp templates/be/python/pr-check.yml <your-project>/.github/workflows/
   cp templates/be/python/master-build.yml <your-project>/.github/workflows/
   cp templates/be/python/trunk/eks/*.yml <your-project>/.github/workflows/
   ```
   
   **For Python - Trunk-based release (ECS):**
   ```bash
   cp templates/be/python/pr-check.yml <your-project>/.github/workflows/
   cp templates/be/python/master-build.yml <your-project>/.github/workflows/
   cp templates/be/python/trunk/ecs/*.yml <your-project>/.github/workflows/
   ```
   
   **For Python - Normal deployment (ArgoCD GitOps):**
   ```bash
   cp templates/be/python/pr-check.yml <your-project>/.github/workflows/
   cp templates/be/python/master-build.yml <your-project>/.github/workflows/
   cp templates/be/python/normal/eks/argo/*.yml <your-project>/.github/workflows/
   ```
   
   **For Python - Trunk-based release (ArgoCD GitOps):**
   ```bash
   cp templates/be/python/pr-check.yml <your-project>/.github/workflows/
   cp templates/be/python/master-build.yml <your-project>/.github/workflows/
   cp templates/be/python/trunk/eks/argo/*.yml <your-project>/.github/workflows/
   ```
   
   **For Matrix Deployment (Multi-Environment - EKS):**
   ```bash
   # Kotlin - Normal
   cp templates/be/kotlin/normal/eks/matrix/*.yml <your-project>/.github/workflows/
   # Kotlin - Trunk
   cp templates/be/kotlin/trunk/eks/matrix/*.yml <your-project>/.github/workflows/
   # Python - Normal
   cp templates/be/python/normal/eks/matrix/*.yml <your-project>/.github/workflows/
   # Python - Trunk
   cp templates/be/python/trunk/eks/matrix/*.yml <your-project>/.github/workflows/
   ```
   
   **For Matrix Deployment (Multi-Environment - ECS):**
   ```bash
   # Kotlin - Normal
   cp templates/be/kotlin/normal/ecs/matrix/*.yml <your-project>/.github/workflows/
   # Kotlin - Trunk
   cp templates/be/kotlin/trunk/ecs/matrix/*.yml <your-project>/.github/workflows/
   # Python - Normal
   cp templates/be/python/normal/ecs/matrix/*.yml <your-project>/.github/workflows/
   # Python - Trunk
   cp templates/be/python/trunk/ecs/matrix/*.yml <your-project>/.github/workflows/
   ```
   
   **For Badge Publishing:**
   ```bash
   cp templates/.github/workflows/publish-badges.yml <your-project>/.github/workflows/
   ```

2. Update the following in each workflow file:
   
   **For Kotlin/Java projects:**
   - **Java version** in `env.JAVA_VERSION`
   - **Artifact registry** configuration (ARTIFACTORY_URL, ARTIFACTORY_USERNAME, AWS_CODE_ARTIFACT_DOMAIN)
   - **Gradle build commands** and module structure
   - **Flyway configuration** for database migrations
   - **Runner type** if not using `builder-16-32` (update `runs-on`)
   
   **For Python projects:**
   - **Python version** in `env.PYTHON_VERSION`
   - **Dependency manager** (pip or Poetry) - uncomment and configure the appropriate steps
   - **Linting tools** (ruff, black, flake8, pylint, etc.)
   - **Testing framework** (pytest, unittest, etc.)
   - **Database migration tool** (Alembic, etc.) if applicable
   
   **Common for all backend projects:**
   - **Docker image paths** and build contexts
   - **Helm configuration** (HELM_REPO, SERVICE_NAME, etc.)
   - **Test environment variables** (DB_HOST, DB_PORT, REDIS_HOSTS, etc.)
   - **Matrix deployment**: Environment mapping and configuration in `deploy-prod-matrix.yml`
   
   **For ArgoCD GitOps deployments:**
   - **ArgoCD repository**: Configure `ARGOCD_REPO_NAME` variable (the GitOps repository name)
   - **ArgoCD namespace and project**: Set `ARGOCD_NAMESPACE` and `ARGOCD_PROJECT_NAME` variables
   - **Kubernetes values files**: Ensure `k8s/{environment}/values.yaml` exists with token placeholders (`__TOKEN__`)
   - **Token replacement**: Configure `cschleiden/replace-tokens@v1` with correct token prefix/suffix (default: `__` and `__`)
   - **ArgoCD sync**: ArgoCD will automatically sync changes when values are committed to the GitOps repository
   
   **For Matrix deployments:**
   - **Matrix environments**: Default is `[prod-1, prod-2, prod-3]` - update the `matrix.environment` array if needed
   - **Environment-specific variables**: Configure variables for each environment (e.g., `ECS_CLUSTER_NAME_PROD-1`, `ECS_CLUSTER_NAME_PROD-2`)
   - **Image tagging**: Update image tagging strategy (environment-specific tags or repos)
   - **Badge generation**: Matrix deployments automatically create badge JSON files in `.github/badges/` directory
   
   **For Badge Publishing:**
   - **GitHub Pages**: Enable GitHub Pages in repository settings (Settings → Pages)
   - **Badge files**: Ensure deployment workflows create badge JSON files in `.github/badges/` directory
   - **Badge format**: Badge files should follow JSON format: `{"schemaVersion": 1, "label": "environment", "message": "version"}`
   - **Badge URLs**: After publishing, badges will be available at `https://<org>.github.io/<repo>/badges/<environment>.json`

3. Configure required variables and secrets:
   - **See [VARIABLES_AND_SECRETS.md](./VARIABLES_AND_SECRETS.md) for complete list**
   - Common requirements: `GH_APP_ID`, `GH_APP_PRIVATE_KEY`, `AWS_ROLE_TO_ASSUME_DEV`, `AWS_ROLE_TO_ASSUME_PROD`, `AWS_ACCOUNT_ID_DEV`, `AWS_ACCOUNT_ID_PROD`, `SLACK_WEBHOOK_URL`
   - Language-specific: Kotlin requires `ARTIFACTORY_URL`, `ARTIFACTORY_USERNAME`, `AWS_CODE_ARTIFACT_DOMAIN_DEV`
   - Deployment-specific: EKS requires `HELM_REPO`, `HELM_SPARTAN_VERSION`; ECS requires `ECS_CLUSTER_NAME_*`, `TASK_FAMILY_*`, `CONTAINER_NAME`

### For Infrastructure (Terraform) Projects

1. Choose your deployment strategy and copy the corresponding templates:
   
   **For Normal deployment (main/master):**
   ```bash
   cp templates/infra/pr-check.yml <your-project>/.github/workflows/
   cp templates/infra/normal/*.yml <your-project>/.github/workflows/
   ```
   
   **For Trunk-based release (release/*):**
   ```bash
   cp templates/infra/pr-check.yml <your-project>/.github/workflows/
   cp templates/infra/trunk/*.yml <your-project>/.github/workflows/
   ```

2. Update the following in each workflow file:
   - **Terraform version** in `env.TF_VERSION` (if specified)
   - **Working directory** if Terraform files are in a subdirectory
   - **Backend configuration** (TF_BACKEND_CONFIG secrets)
   - **Terraform variables** (TF_VAR_* environment variables)
   
   > **💡 Tip**: All `TODO:` comments in workflow files indicate where project-specific values need to be updated.

3. Configure required variables and secrets:
   - **See [VARIABLES_AND_SECRETS.md](./VARIABLES_AND_SECRETS.md) for complete list**
   - Common requirements: `GH_APP_ID`, `GH_APP_PRIVATE_KEY`, `AWS_ROLE_TO_ASSUME_DEV`, `AWS_ROLE_TO_ASSUME_PROD`, `AWS_REGION`, `SLACK_WEBHOOK_URL`
   - Optional: `TF_BACKEND_CONFIG_DEV`, `TF_BACKEND_CONFIG_PROD` for Terraform backend configuration

## Workflow Overview

### Frontend Workflows

**Deployment Strategies:**
- **Normal**: Deploys on `main` or `master` branch pushes
- **Trunk-based Release**: Deploys on `release/*` branch pushes

#### CloudFront Deployment (`fe/cloudfront/`)
- **`pr-check.yml`**: Pull Request validation (linters, tests)
- **`normal/deploy-dev-cloudfront.yml`**: DEV deployment (triggers on main/master) - Builds and syncs to S3/CloudFront
- **`normal/deploy-prod-cloudfront.yml`**: PROD deployment (triggers on tags) - Builds and syncs to S3/CloudFront
- **`trunk/deploy-dev-cloudfront.yml`**: DEV deployment (triggers on release/*) - Builds and syncs to S3/CloudFront
- **`trunk/deploy-prod-cloudfront.yml`**: PROD deployment (triggers on tags) - Builds and syncs to S3/CloudFront

#### Amplify Deployment (`fe/amplify/`)
- **`pr-check.yml`**: Pull Request validation (linters, tests)
- **`normal/deploy-dev-amplify.yml`**: DEV deployment (triggers on main/master) - Triggers Amplify webhook
- **`normal/deploy-prod-amplify.yml`**: PROD deployment (triggers on tags) - Triggers Amplify webhook
- **`trunk/deploy-dev-amplify.yml`**: DEV deployment (triggers on release/*) - Triggers Amplify webhook
- **`trunk/deploy-prod-amplify.yml`**: PROD deployment (triggers on tags) - Triggers Amplify webhook

#### Shared Workflows (`fe/`)
- **`e2e-tests.yml`**: End-to-end tests with Playwright (can be used with either deployment method)

### Backend Workflows

#### Backend Deployment (`be/`)

**Deployment Strategies:**
- **Normal**: Deploys on `main` or `master` branch pushes
- **Trunk-based Release**: Deploys on `release/*` branch pushes

**Kotlin/Java (`be/kotlin/`):**
- **`pr-check.yml`**: Pull Request validation (Gradle build, tests, Flyway)
- **`master-build.yml`**: Master branch build + optional health checks
- **`normal/eks/deploy-dev.yml`**: DEV deployment (EKS/Helm) - triggers on main/master
- **`normal/eks/deploy-prod.yml`**: PROD deployment (EKS/Helm) - triggers on tags, promotes images
- **`normal/eks/argo/deploy-dev.yml`**: DEV deployment (ArgoCD GitOps) - triggers on main/master, commits to ArgoCD repo
- **`normal/eks/argo/deploy-prod.yml`**: PROD deployment (ArgoCD GitOps) - triggers on tags, commits to ArgoCD repo
- **`normal/ecs/deploy-dev.yml`**: DEV deployment (ECS) - triggers on main/master
- **`normal/ecs/deploy-prod.yml`**: PROD deployment (ECS) - triggers on tags, promotes images
- **`trunk/eks/deploy-dev.yml`**: DEV deployment (EKS/Helm) - triggers on release/* branches
- **`trunk/eks/deploy-prod.yml`**: PROD deployment (EKS/Helm) - triggers on tags, promotes images
- **`trunk/eks/argo/deploy-dev.yml`**: DEV deployment (ArgoCD GitOps) - triggers on release/* branches, commits to ArgoCD repo
- **`trunk/eks/argo/deploy-prod.yml`**: PROD deployment (ArgoCD GitOps) - triggers on release/* branches, commits to ArgoCD repo
- **`trunk/ecs/deploy-dev.yml`**: DEV deployment (ECS) - triggers on release/* branches
- **`trunk/ecs/deploy-prod.yml`**: PROD deployment (ECS) - triggers on tags, promotes images
- **`normal/eks/matrix/deploy-prod.yml`**: PROD matrix deployment (EKS) - deploys to prod-1, prod-2, prod-3 in parallel
- **`normal/ecs/matrix/deploy-prod.yml`**: PROD matrix deployment (ECS) - deploys to prod-1, prod-2, prod-3 in parallel
- **`trunk/eks/matrix/deploy-prod.yml`**: PROD matrix deployment (EKS) - deploys to prod-1, prod-2, prod-3 in parallel (trunk-based)
- **`trunk/ecs/matrix/deploy-prod.yml`**: PROD matrix deployment (ECS) - deploys to prod-1, prod-2, prod-3 in parallel (trunk-based)

**Python (`be/python/`):**
- **`pr-check.yml`**: Pull Request validation (linting, tests)
- **`master-build.yml`**: Master branch build + optional health checks
- **`normal/eks/deploy-dev.yml`**: DEV deployment (EKS/Helm) - triggers on main/master
- **`normal/eks/deploy-prod.yml`**: PROD deployment (EKS/Helm) - triggers on tags, promotes images
- **`normal/eks/argo/deploy-dev.yml`**: DEV deployment (ArgoCD GitOps) - triggers on main/master, commits to ArgoCD repo
- **`normal/eks/argo/deploy-prod.yml`**: PROD deployment (ArgoCD GitOps) - triggers on tags, commits to ArgoCD repo
- **`normal/ecs/deploy-dev.yml`**: DEV deployment (ECS) - triggers on main/master
- **`normal/ecs/deploy-prod.yml`**: PROD deployment (ECS) - triggers on tags, promotes images
- **`trunk/eks/deploy-dev.yml`**: DEV deployment (EKS/Helm) - triggers on release/* branches
- **`trunk/eks/deploy-prod.yml`**: PROD deployment (EKS/Helm) - triggers on tags, promotes images
- **`trunk/eks/argo/deploy-dev.yml`**: DEV deployment (ArgoCD GitOps) - triggers on release/* branches, commits to ArgoCD repo
- **`trunk/eks/argo/deploy-prod.yml`**: PROD deployment (ArgoCD GitOps) - triggers on release/* branches, commits to ArgoCD repo
- **`trunk/ecs/deploy-dev.yml`**: DEV deployment (ECS) - triggers on release/* branches
- **`trunk/ecs/deploy-prod.yml`**: PROD deployment (ECS) - triggers on tags, promotes images
- **`normal/eks/matrix/deploy-prod.yml`**: PROD matrix deployment (EKS) - deploys to prod-1, prod-2, prod-3 in parallel
- **`normal/ecs/matrix/deploy-prod.yml`**: PROD matrix deployment (ECS) - deploys to prod-1, prod-2, prod-3 in parallel
- **`trunk/eks/matrix/deploy-prod.yml`**: PROD matrix deployment (EKS) - deploys to prod-1, prod-2, prod-3 in parallel (trunk-based)
- **`trunk/ecs/matrix/deploy-prod.yml`**: PROD matrix deployment (ECS) - deploys to prod-1, prod-2, prod-3 in parallel (trunk-based)

### Badge Publishing Workflow

**`.github/workflows/publish-badges.yml`** (Reusable):
- **Trigger**: Called from deployment workflows via `workflow_call`
- **Purpose**: Publishes deployment badges to GitHub Pages
- **Steps**: 
  - Reads badge JSON files from `.github/badges/` directory
  - Generates badge JSON files for GitHub Pages
  - Deploys badges to GitHub Pages
- **Badge Format**: JSON files following Shields.io schema
- **Usage**: Call from deployment workflows after successful deployments:
  ```yaml
  publish-badges:
    needs: [deploy]
    if: always()
    uses: ./.github/workflows/publish-badges.yml
    secrets: inherit
  ```

### Infrastructure (Terraform) Workflows

**Deployment Strategies:**
- **Normal**: Deploys on `main` or `master` branch pushes
- **Trunk-based Release**: Deploys on `release/*` branch pushes

#### `pr-check.yml`
- **Trigger**: Pull requests (on `.tf` and `.tfvars` file changes)
- **Purpose**: Validates Terraform code and generates plan
- **Steps**: Format check, validate, plan (uploaded as artifact)

#### `normal/deploy-dev.yml` / `normal/deploy-prod.yml`
- **Trigger**: Push to `main`/`master` branches (DEV) or tags `v*.*.*` (PROD)
- **Purpose**: Applies Terraform changes to infrastructure
- **Steps**: Init, plan, apply, send Slack notification

#### `trunk/deploy-dev.yml` / `trunk/deploy-prod.yml`
- **Trigger**: Push to `release/*` branches (DEV) or tags `v*.*.*` (PROD)
- **Purpose**: Applies Terraform changes to infrastructure
- **Steps**: Init, plan, apply, send Slack notification

## Key Features

### Concurrency Management
All workflows include concurrency settings to ensure only one workflow runs per branch at a time:
```yaml
concurrency:
  group: ${{ github.workflow }}-${{ github.ref }}
  cancel-in-progress: true
```

### Caching Strategy
- **PR workflows**: Create isolated cache entries with write permissions
- **Master builds**: Refresh the primary cache
- **Release branches**: Reuse the master cache (read-only)

### Security
- Uses GitHub App tokens instead of personal access tokens
- Follows least-privilege permission principles
- Uses OIDC for AWS authentication

### Docker Image Optimization
- Images are built in DEV environment
- Same images are promoted to PROD by applying version tags
- Avoids redundant rebuilds

### Deployment Methods
- **EKS/Helm**: Direct Helm deployments to Kubernetes/EKS (templates in `eks/` subfolder)
- **EKS/ArgoCD GitOps**: GitOps-based deployments via ArgoCD (templates in `eks/argo/` subfolder)
  - Builds Docker images and updates Kubernetes values files
  - Commits updated values to ArgoCD GitOps repository
  - ArgoCD automatically syncs changes to the cluster
- **EKS/ECS Matrix**: Multi-environment parallel deployments (templates in `eks/matrix/` or `ecs/matrix/` subfolders)
  - Uses GitHub Actions matrix strategy to deploy to multiple environments simultaneously
  - Default environments: `prod-1`, `prod-2`, `prod-3`
  - Builds/promotes images once, then deploys to all environments in parallel
  - Automatically generates deployment badges for each environment
- **ECS**: Container orchestration using AWS ECS (templates in `ecs/` subfolder)

### ECS vs EKS Deployment Comparison

**EKS (Kubernetes/Helm) Deployment:**
- Uses Helm charts for application deployment
- Deploys to Kubernetes clusters
- Requires Kubernetes manifests and Helm values
- More complex orchestration, better for microservices
- Suitable for complex applications with multiple components

**ECS Deployment:**
- Uses ECS task definitions and services
- Simpler deployment model, AWS-native
- Direct container orchestration without Kubernetes layer
- Good for simpler applications or AWS-focused deployments
- Lower operational overhead

Choose based on your infrastructure preferences and application complexity.

**Note**: Multi-environment matrix deployments can be added later as needed.

## Customization Checklist

Before using these templates, ensure you:

### Frontend
- [ ] Choose deployment method (CloudFront/S3 or Amplify)
- [ ] Update Node.js version
- [ ] Configure environment-specific variables
- [ ] Configure E2E test credentials and settings (if using e2e-tests.yml)
- [ ] Update package manager if not using `yarn`

### Backend
- [ ] Choose deployment strategy (single environment or matrix)
- [ ] Choose language (Kotlin/Java or Python)
- [ ] **For Kotlin/Java:**
  - [ ] Update Java version
  - [ ] Configure artifact registry settings
  - [ ] Update Gradle build commands and module structure
  - [ ] Configure Flyway for database migrations
  - [ ] Update runner types if not using `builder-16-32`
- [ ] **For Python:**
  - [ ] Update Python version
  - [ ] Choose dependency manager (pip or Poetry) and configure steps
  - [ ] Configure linting tools (ruff, black, flake8, etc.)
  - [ ] Configure testing framework (pytest, unittest, etc.)
  - [ ] Configure database migration tool (Alembic, etc.) if applicable
- [ ] Update Docker image paths and contexts
- [ ] Configure Helm configuration
- [ ] For matrix deployment: Map all environment configurations
- [ ] Adjust test environment variables

### Infrastructure
- [ ] Update Terraform version
- [ ] Configure Terraform working directory
- [ ] Set up backend configuration
- [ ] Configure Terraform variables

### General
- [ ] Set up required GitHub variables and secrets
- [ ] Remove or modify optional steps (e.g., health checks, Slack notifications)
- [ ] Update Slack notification payloads if needed

## Additional Resources

- [Setup GitHub Actions on new projects](../Setup%20GitHub%20Actions%20on%20new%20projects%202d801fb05bf180b88f6ad24134e2f3e0.md) - Full documentation
- [GitHub Actions Documentation](https://docs.github.com/en/actions)
- [Creating a GitHub App for an Organization](https://docs.github.com/en/apps/creating-github-apps/registering-a-github-app/registering-a-github-app)

## Notes

- All workflows use GitHub App authentication for enhanced security
- Workflows follow the universal CI pattern with proper triggers, permissions, and concurrency management
- TODO comments in templates indicate areas that need project-specific customization
- The templates assume certain project structures:
  - **Frontend**: Yarn package manager
  - **Backend Kotlin/Java**: Gradle build system, Flyway for migrations
  - **Backend Python**: pip or Poetry for dependencies, pytest/unittest for testing
  - Adjust as needed for your project structure
