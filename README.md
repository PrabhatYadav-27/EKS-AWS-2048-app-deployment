# 📌 EKS AWS 2048 App Deployment  

## 📝 Overview  
This project demonstrates the deployment of the classic **2048 game** on **Amazon Elastic Kubernetes Service (EKS)** using Kubernetes manifests. The deployment includes **a LoadBalancer for external access, a Deployment for managing pods, and a Service for networking**.  

## 🚀 Features  
✔️ **Kubernetes-based Deployment** on AWS EKS  
✔️ **Scalable & Highly Available** architecture  
✔️ **Managed Load Balancer** for seamless user access  
✔️ **Infrastructure as Code (IaC) approach**  

---

## 🔧 Prerequisites  

Before you begin, ensure you have the following installed and configured:  

1. **AWS CLI** (Configured with IAM credentials)  
   ```sh
   aws configure
   ```  
2. **kubectl** (Kubernetes CLI)  
   ```sh
   curl -LO "https://dl.k8s.io/release/$(curl -L -s https://dl.k8s.io/release/stable.txt)/bin/linux/amd64/kubectl"
   chmod +x kubectl
   sudo mv kubectl /usr/local/bin/
   ```  
3. **eksctl** (CLI for managing AWS EKS)  
   ```sh
   curl --silent --location "https://github.com/weaveworks/eksctl/releases/latest/download/eksctl_$(uname -s)_amd64.tar.gz" | tar xz -C /tmp
   sudo mv /tmp/eksctl /usr/local/bin
   ```  
4. **Helm** (for package management in Kubernetes)  
   ```sh
   curl https://raw.githubusercontent.com/helm/helm/main/scripts/get-helm-3 | bash
   ```  
5. **AWS IAM Role** for EKS cluster (if not already created)  
   ```sh
   aws iam create-role --role-name eksClusterRole --assume-role-policy-document file://eks-trust-policy.json
   aws iam attach-role-policy --role-name eksClusterRole --policy-arn arn:aws:iam::aws:policy/AmazonEKSClusterPolicy
   ```  

---

## 📌 Step-by-Step Deployment  

### 🏗️ Step 1: Create an AWS EKS Cluster  

Run the following command to create an EKS cluster using **eksctl**:  

```sh
eksctl create cluster --name 2048-cluster --region us-east-1 --nodegroup-name standard-workers --node-type t3.medium --nodes 2 --nodes-min 1 --nodes-max 3 --managed
```  

This will:  
✅ Create an **EKS Cluster**  
✅ Set up **2 worker nodes** with autoscaling enabled  

---

### 🛠️ Step 2: Configure kubectl to Use the EKS Cluster  

Run the command below to update your kubeconfig:  

```sh
aws eks --region us-east-1 update-kubeconfig --name 2048-cluster
```  

Verify connectivity:  

```sh
kubectl get nodes
```  

---

### 📦 Step 3: Deploy the 2048 Game App  

1️⃣ **Apply the Kubernetes Deployment Manifest**  

```sh
kubectl apply -f deployment.yaml
```  

2️⃣ **Apply the Kubernetes Service Manifest**  

```sh
kubectl apply -f service.yaml
```  

3️⃣ **Verify Deployment**  

```sh
kubectl get pods
kubectl get svc
```  

---

### 🌐 Step 4: Access the 2048 Game  

1. Find the **LoadBalancer URL**:  
   ```sh
   kubectl get svc | grep LoadBalancer
   ```  
2. Copy the **EXTERNAL-IP** of the service and open it in your browser.  
3. Enjoy playing **2048** on AWS EKS! 🎮  

---

## 🛑 Cleanup  

To delete all resources and avoid unnecessary costs:  

```sh
eksctl delete cluster --name 2048-cluster
```  

---

## 📌 Folder Structure  

```
📦 EKS-AWS-2048-app-deployment
 ┣ 📜 deployment.yaml      # Kubernetes Deployment manifest
 ┣ 📜 service.yaml         # Kubernetes Service manifest
 ┣ 📜 prerequisites.md     # Prerequisites and installation guide
 ┣ 📜 README.md            # Project documentation
```

---


