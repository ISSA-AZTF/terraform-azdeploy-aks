# 🚀 Création d'un cluster AKS avec Terraform
## 📌 Description
Ce projet met en place un cluster Kubernetes (AKS - Azure Kubernetes Service) via Terraform,             de manière automatisée, modulaire et reproductible. Il inclut également le déploiement d’un service web simple basé sur NGINX, démontrant la fonctionnalité du cluster après provisioning.
## 🛠️ Technologies utilisées
- Terraform (Infrastructure as Code)
- Microsoft Azure
- Azure Kubernetes Service (AKS)
- Kubernetes (deployment + service)
- NGINX
## 🎯 Objectifs
- Automatiser la création d’un cluster AKS avec des paramètres dynamiques
- Utiliser une architecture modulaire pour faciliter la réutilisation et la maintenance
- Tester le bon fonctionnement du cluster avec le déploiement d’une image NGINX
- Intégrer la surveillance via Azure Monitor / Log Analytics
## 📂 Fonctionnalités principales
- Création d’un Resource Group Azure
- Génération d’un nom unique pour le cluster via random_id
- Déploiement d’un cluster AKS avec :
   *  Pool de nœuds personnalisable
   *  Autoscaling activé
   *  Gestion de réseau (Azure CNI + Azure Network Policy)
   *  Intégration de la surveillance via OMS Agent
- Déploiement d’un pod et service NGINX pour vérification   
## ⚙️ Déploiement
**Prérequis**
- Azure CLI configuré et connecté
- Terraform installé (>= 1.11)
- Subscription Azure valide

**Étapes**

     git clone https://github.com/ton-utilisateur/aks-terraform-cluster.git
     cd aks-terraform-cluster
     terraform init
     # Vérifie la syntaxe
     terraform validate
     # Prévisualise les changements à venir
     terraform plan | select-string "will be created"
     terraform apply -auto-approve
Pour tester le cluster :    

     az aks get-credentials --resource-group <your-rg> --name <your-aks-cluster>
     kubectl get nodes 
     kubectl apply -f nginx-deployment.yaml
     kubectl get svc
## 🧠 Ce que j’ai appris
- Automatisation complète d’un environnement AKS production-ready
- Utilisation avancée de Terraform avec dynamic blocks et random_id 
- Intégration de Log Analytics et de l’observabilité sur Azure
- Déploiement Kubernetes basique pour validation du cluster
## 📸 Captures d’écran
