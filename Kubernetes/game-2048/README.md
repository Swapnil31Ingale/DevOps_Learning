# 🎮 EKS Fargate Deployment: 2048 Game with AWS ALB Ingress

This project demonstrates how to deploy the **2048 game app** on an **EKS cluster powered by AWS Fargate**, securely exposed using an **Application Load Balancer (ALB) Controller**, leveraging **IAM Roles for Service Accounts (IRSA)**.

## 🛠️ Technologies Used
- Amazon EKS (Fargate)
- IAM OIDC + IRSA
- AWS Load Balancer Controller
- Helm
- kubectl + eksctl
- AWS CLI

---

## 🔧 Step-by-Step Setup

### 1. ✅ Create EKS Cluster on Fargate
```bash
eksctl create cluster --name demo-cluster --region us-east-1 --fargate
```

### 2. 🔐 Configure kubeconfig for kubectl
Sets up CLI access to the EKS cluster. Adds cluster access to your local .kube/config, allowing kubectl commands to interact with it.
```bash
aws eks update-kubeconfig --name demo-cluster --region us-east-1 --alias demo-cluster
```

### 3. 📂 Create Fargate Profile for Specific Namespace
Links the game-2048 namespace to Fargate, ensuring app pods run on serverless compute.
```bash
eksctl create fargateprofile \
  --cluster demo-cluster \
  --region us-east-1 \
  --name alb-sample-app \
  --namespace game-2048
```

### 4. 🎮 Deploy 2048 Game and Ingress
Creates:
Namespace: game-2048
Deployment: 5 replicas of 2048 game pods
Service: NodePort
Ingress: With ALB annotations
📁 Uploaded file: 2048_full.yaml
```bash
kubectl apply -f https://raw.githubusercontent.com/kubernetes-sigs/aws-load-balancer-controller/v2.5.4/docs/examples/2048/2048_full.yaml
```

### 5. 🔐 Associate IAM OIDC Provider
Enables IRSA by federating Kubernetes with IAM.
```bash
eksctl utils associate-iam-oidc-provider --cluster demo-cluster --approve
```

### 6. 📥 Download IAM Policy for ALB Controller
📁 Uploaded file: iam_policy.json
```bash
curl -O https://raw.githubusercontent.com/kubernetes-sigs/aws-load-balancer-controller/v2.11.0/docs/install/iam_policy.json
```

### 7. 🛡️ Create IAM Policy in AWS
Stores the required permissions for the ALB controller.
```bash
aws iam create-policy \
  --policy-name AWSLoadBalancerControllerIAMPolicy \
  --policy-document file://iam_policy.json
```

### 8. 🎟️ Create IRSA-bound Service Account
Links IAM permissions directly to Kubernetes service account.
```bash
eksctl create iamserviceaccount \
  --cluster=demo-cluster \
  --namespace=kube-system \
  --name=aws-load-balancer-controller \
  --role-name AmazonEKSLoadBalancerControllerRole \
  --attach-policy-arn=arn:aws:iam::<account-id>:policy/AWSLoadBalancerControllerIAMPolicy \
  --approve
```

### 9. 📦 Add Helm Repo for AWS Charts 
```bash
helm repo add eks https://aws.github.io/eks-charts
```

### 10. 🔄 Update Helm Repo
```bash
helm repo update eks
``` 

### 11. 🚀 Install ALB Controller using Helm
Deploys ALB Controller, which provisions ALBs for Ingress objects.
```bash
helm install aws-load-balancer-controller eks/aws-load-balancer-controller -n kube-system \
  --set clusterName=demo-cluster \
  --set serviceAccount.create=false \
  --set serviceAccount.name=aws-load-balancer-controller \
  --set region=us-east-1 \
  --set vpcId=vpc-04996cbcce27009e5

```

### 📸 Running Application Screenshot
screenshots/2048-game.png


###  💡 Highlights & Key Concepts
🔐 IAM Roles for Service Accounts (IRSA)
IRSA enables fine-grained access control by letting Kubernetes service accounts securely assume IAM roles. Instead of exposing long-lived AWS credentials inside pods, IRSA allows pods to fetch temporary credentials via a federated OIDC token.

📌 Why it’s important:

🌍 Secure pod-to-AWS integration

🔐 No hardcoded secrets or environment variables

🧼 Follows least-privilege principle

IRSA is essential for controllers like the AWS Load Balancer Controller, which needs to call AWS APIs to provision ALBs, manage security groups, and tag resources — and it must do so securely and in a way scoped to the cluster.

📦 Helm Charts
Helm is Kubernetes’ package manager. A Helm chart is a reusable, parameterized collection of Kubernetes manifests (like Deployments, Services, Ingress). It allows you to deploy apps in a modular and upgrade-friendly way.

📌 Why it’s important:

📦 One command deploys many manifests

🎛️ Configurable via --set flags

🔁 Supports upgrades, rollbacks, and templating

In this project, Helm was used to install the AWS Load Balancer Controller, ensuring consistent configuration, lifecycle management, and reusability across environments.

☁️ Fargate Profiles for Namespace Targeting
AWS Fargate lets you run Kubernetes pods without managing EC2 nodes. By defining a Fargate profile tied to a namespace, you can selectively run only certain workloads on Fargate while leaving others for node-based compute.

📌 Why it’s important:

🚫 No server management

🔄 Pay-per-pod scalability

🧱 Workload isolation via namespaces

In this deployment, the game-2048 namespace was mapped to Fargate to keep app pods lightweight and serverless.

🌐 AWS Load Balancer Controller
This controller watches Kubernetes Ingress resources and automatically provisions Application Load Balancers (ALBs) via AWS APIs.

📌 Why it’s important:

🚪 External access to apps via ALB

📶 Supports path-based routing, TLS termination, and WAF

🔧 Integrates seamlessly with Kubernetes Ingress

It replaces older methods like Classic ELBs or manually managing ALBs outside Kubernetes.

🎮 Sample Application Deployment via YAML
The 2048_full.yaml manifest demonstrates a real-world workload with:

🧱 Namespace creation

🚀 Deployment with replicas

📡 Service for internal routing

🌐 Ingress to trigger ALB creation

This end-to-end demo proves how Kubernetes, AWS networking, and Helm come together to expose an app securely and scalably.

### 🔍 Useful Links
ALB Controller GitHub
eksctl Docs
Helm Docs
2048 YAML Reference

### 📂 Directory Structure (after upload)

├── README.md
├── iam_policy.json
├── 2048_full.yaml
└── screenshots/
    └── 2048-game.png

## 🙌 Credits

This deployment guide was inspired by the incredible work in the [AWS DevOps Zero to Hero](https://github.com/iam-veeramalla/aws-devops-zero-to-hero) repository by Abhishek Veeramalla.  
It’s a must-follow resource for mastering AWS and DevOps workflows through real-world projects and structured learning.

