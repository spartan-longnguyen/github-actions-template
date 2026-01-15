# Required Variables and Secrets Reference

This document lists all required GitHub repository variables and secrets for each template type.

## Common Variables and Secrets (All Templates)

These are required for all templates:

### Variables
- `GH_APP_ID` - GitHub App ID for authentication
- `AWS_REGION` - AWS region for deployments

### Secrets
- `GH_APP_PRIVATE_KEY` - GitHub App private key for authentication
- `SLACK_WEBHOOK_URL` - Slack webhook URL for notifications

---

## Frontend Templates

### CloudFront Deployment

#### Variables
- `AWS_S3_BUCKET_DEV` - S3 bucket name for DEV environment
- `AWS_CLOUDFRONT_ID_DEV` - CloudFront distribution ID for DEV
- `AWS_S3_BUCKET_PROD` - S3 bucket name for PROD environment
- `AWS_CLOUDFRONT_ID_PROD` - CloudFront distribution ID for PROD
- `NODE_VERSION` - Node.js version (e.g., `18.18.2`)
- `VITE_*` - Frontend environment variables (project-specific, e.g., `VITE_SERVICE_PLATFORM_API_URL_DEV`, `VITE_ENVIRONMENT_DEV`)

#### Secrets
- `AWS_ROLE_TO_ASSUME_DEV` - AWS IAM role ARN for DEV environment
- `AWS_ROLE_TO_ASSUME_PROD` - AWS IAM role ARN for PROD environment

### Amplify Deployment

#### Variables
- `NODE_VERSION` - Node.js version (e.g., `18.18.2`)
- `VITE_*` - Frontend environment variables (project-specific)

#### Secrets
- `AMPLIFY_WEBHOOK_URL_DEV` - AWS Amplify webhook URL for DEV
- `AMPLIFY_WEBHOOK_URL_PROD` - AWS Amplify webhook URL for PROD

### E2E Tests

#### Variables
- `NODE_VERSION` - Node.js version
- `PLAYWRIGHT_*` - Playwright configuration variables (project-specific)

#### Secrets
- `E2E_TEST_CREDENTIALS` - Test credentials (project-specific)
- `SLACK_WEBHOOK_URL` - For test result notifications

---

## Backend Templates

### Common (All Backend Templates)

#### Variables
- `SERVICE_NAME` - Service name for deployments
- `BASE_DOMAIN_DEV` - Base domain for DEV environment
- `BASE_DOMAIN_PROD` - Base domain for PROD environment
- `AWS_REGION` - AWS region

#### Secrets
- `AWS_ROLE_TO_ASSUME_DEV` - AWS IAM role ARN for DEV environment
- `AWS_ROLE_TO_ASSUME_PROD` - AWS IAM role ARN for PROD environment
- `AWS_ACCOUNT_ID_DEV` - AWS account ID for DEV
- `AWS_ACCOUNT_ID_PROD` - AWS account ID for PROD

### Kotlin/Java Specific

#### Variables
- `JAVA_VERSION` - Java version (e.g., `17`)
- `ARTIFACTORY_URL` - Maven artifact repository URL
- `ARTIFACTORY_USERNAME` - Maven artifact repository username
- `AWS_CODE_ARTIFACT_DOMAIN_DEV` - AWS CodeArtifact domain for DEV
- `AWS_CODE_ARTIFACT_DOMAIN_PROD` - AWS CodeArtifact domain for PROD (if applicable)

### EKS/Helm Deployment

#### Variables
- `DOCKER_REPO_DEV` - Docker repository URL for DEV
- `DOCKER_REPO_PROD` - Docker repository URL for PROD
- `DOCKER_REGISTRY_DEV` - Docker registry URL for DEV
- `DOCKER_REGISTRY_PROD` - Docker registry URL for PROD
- `HELM_REPO` - Helm chart repository URL
- `HELM_SPARTAN_VERSION` - Helm chart version
- `AWS_EKS_CLUSTER_NAME_DEV` - EKS cluster name for DEV (if applicable)
- `AWS_EKS_CLUSTER_NAME_PROD` - EKS cluster name for PROD (if applicable)
- `FLYWAY_IMAGE_NAME` - Flyway Docker image name (if using Flyway)
- `LOG_FILE` - Log file path (if applicable)
- `DD_AGENT_IMAGE` - Datadog agent image (if using Datadog)
- `DD_LOG_FILE_MOUNT_PATH` - Datadog log mount path (if using Datadog)

### ECS Deployment

#### Variables
- `DOCKER_REPO` - Docker repository URL
- `ECS_CLUSTER_NAME_DEV` - ECS cluster name for DEV
- `ECS_CLUSTER_NAME_PROD` - ECS cluster name for PROD
- `SERVICE_NAME_DEV` - ECS service name for DEV
- `SERVICE_NAME_PROD` - ECS service name for PROD
- `TASK_FAMILY_DEV` - ECS task family name for DEV
- `TASK_FAMILY_PROD` - ECS task family name for PROD
- `CONTAINER_NAME` - Container name in task definition

### Python Specific

#### Variables
- `PYTHON_VERSION` - Python version (e.g., `3.11`)
- Project-specific variables based on your Python application

---

## Infrastructure (Terraform) Templates

### Variables
- `AWS_REGION` - AWS region for Terraform deployments
- `TF_VERSION` - Terraform version (if specified in workflow)
- `TF_VAR_*` - Terraform input variables (project-specific)

### Secrets
- `AWS_ROLE_TO_ASSUME_DEV` - AWS IAM role ARN for DEV environment
- `AWS_ROLE_TO_ASSUME_PROD` - AWS IAM role ARN for PROD environment
- `TF_BACKEND_CONFIG_DEV` - Terraform backend configuration for DEV (optional)
- `TF_BACKEND_CONFIG_PROD` - Terraform backend configuration for PROD (optional)

---

## Quick Setup Checklist

### For Frontend Projects

- [ ] `GH_APP_ID` (variable)
- [ ] `GH_APP_PRIVATE_KEY` (secret)
- [ ] `SLACK_WEBHOOK_URL` (secret)
- [ ] `AWS_ROLE_TO_ASSUME_DEV` (secret)
- [ ] `AWS_ROLE_TO_ASSUME_PROD` (secret)
- [ ] `NODE_VERSION` (variable)
- [ ] For CloudFront: `AWS_S3_BUCKET_DEV`, `AWS_S3_BUCKET_PROD`, `AWS_CLOUDFRONT_ID_DEV`, `AWS_CLOUDFRONT_ID_PROD` (variables)
- [ ] For Amplify: `AMPLIFY_WEBHOOK_URL_DEV`, `AMPLIFY_WEBHOOK_URL_PROD` (secrets)
- [ ] Project-specific `VITE_*` variables

### For Backend Projects (Kotlin/Java)

- [ ] `GH_APP_ID` (variable)
- [ ] `GH_APP_PRIVATE_KEY` (secret)
- [ ] `SLACK_WEBHOOK_URL` (secret)
- [ ] `AWS_ROLE_TO_ASSUME_DEV` (secret)
- [ ] `AWS_ROLE_TO_ASSUME_PROD` (secret)
- [ ] `AWS_ACCOUNT_ID_DEV` (secret)
- [ ] `AWS_ACCOUNT_ID_PROD` (secret)
- [ ] `SERVICE_NAME` (variable)
- [ ] `JAVA_VERSION` (variable)
- [ ] `ARTIFACTORY_URL`, `ARTIFACTORY_USERNAME` (variables)
- [ ] `AWS_CODE_ARTIFACT_DOMAIN_DEV` (variable)
- [ ] For EKS: `DOCKER_REPO_DEV`, `DOCKER_REPO_PROD`, `HELM_REPO`, `HELM_SPARTAN_VERSION` (variables)
- [ ] For ECS: `DOCKER_REPO`, `ECS_CLUSTER_NAME_DEV`, `ECS_CLUSTER_NAME_PROD`, `SERVICE_NAME_DEV`, `SERVICE_NAME_PROD`, `TASK_FAMILY_DEV`, `TASK_FAMILY_PROD`, `CONTAINER_NAME` (variables)

### For Backend Projects (Python)

- [ ] `GH_APP_ID` (variable)
- [ ] `GH_APP_PRIVATE_KEY` (secret)
- [ ] `SLACK_WEBHOOK_URL` (secret)
- [ ] `AWS_ROLE_TO_ASSUME_DEV` (secret)
- [ ] `AWS_ROLE_TO_ASSUME_PROD` (secret)
- [ ] `AWS_ACCOUNT_ID_DEV` (secret)
- [ ] `AWS_ACCOUNT_ID_PROD` (secret)
- [ ] `SERVICE_NAME` (variable)
- [ ] `PYTHON_VERSION` (variable, if specified)
- [ ] For EKS: `DOCKER_REPO_DEV`, `DOCKER_REPO_PROD`, `HELM_REPO`, `HELM_SPARTAN_VERSION` (variables)
- [ ] For ECS: `DOCKER_REPO`, `ECS_CLUSTER_NAME_DEV`, `ECS_CLUSTER_NAME_PROD`, `SERVICE_NAME_DEV`, `SERVICE_NAME_PROD`, `TASK_FAMILY_DEV`, `TASK_FAMILY_PROD`, `CONTAINER_NAME` (variables)

### For Infrastructure (Terraform) Projects

- [ ] `GH_APP_ID` (variable)
- [ ] `GH_APP_PRIVATE_KEY` (secret)
- [ ] `SLACK_WEBHOOK_URL` (secret)
- [ ] `AWS_ROLE_TO_ASSUME_DEV` (secret)
- [ ] `AWS_ROLE_TO_ASSUME_PROD` (secret)
- [ ] `AWS_REGION` (variable)
- [ ] `TF_BACKEND_CONFIG_DEV` (secret, optional)
- [ ] `TF_BACKEND_CONFIG_PROD` (secret, optional)
- [ ] Project-specific `TF_VAR_*` variables

---

## Notes

- **Variables** are stored in GitHub repository settings under Settings → Secrets and variables → Actions → Variables tab
- **Secrets** are stored in GitHub repository settings under Settings → Secrets and variables → Actions → Secrets tab
- Variables can be referenced in workflows as `${{ vars.VARIABLE_NAME }}`
- Secrets can be referenced in workflows as `${{ secrets.SECRET_NAME }}`
- All `TODO:` comments in workflow files indicate where project-specific values need to be updated
- Some variables/secrets are optional and marked as such in the workflows
