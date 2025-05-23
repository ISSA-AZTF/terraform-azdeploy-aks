# 🚀 Création d'un cluster AKS avec Terraform
## 📌 Description
Ce projet met en place un cluster Kubernetes (AKS - Azure Kubernetes Service) via Terraform,             de manière automatisée, modulaire et reproductible. Il inclut également le déploiement d’un service web simple basé sur NGINX, démontrant la fonctionnalité du cluster après provisioning.
## 🛠️ Technologies utilisées
- Terraform (Infrastructure as Code)
- Microsoft Azure
- Azure Kubernetes Service (AKS)
- Kubernetes (deployment + service)
- NGINX
## 📂 Fonctionnalités principales
- Création d’un Resource Group Azure
- Génération d’un nom unique pour le cluster via random_id
- Déploiement d’un cluster AKS avec :
   -  Pool de nœuds personnalisable
   -  Autoscaling activé
   -  Gestion de réseau (Azure CNI + Azure Network Policy)
   -  Intégration de la surveillance via OMS Agent
- Déploiement d’un pod et service NGINX pour vérification   