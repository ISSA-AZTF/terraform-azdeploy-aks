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

    ✅ Cloner le repo github localement 
         git clone https://github.com/ton-utilisateur/aks-terraform-cluster.git
         
    ✅ Initialiser le projet 
         terraform init

    ✅ Vérifier la syntaxe 
         terraform validate

    ✅ Lancer le plan d'exécution 
         terraform plan | select-string "will be created"

    ✅ Appliquer automatiquement 
         terraform apply -auto-approve
**Pour tester le cluster :**    

     ✅ Se connecter au cluster
          az aks get-credentials --resource-group "rg" --name "aks-b8ac86"

     ✅ Vérifier les nœuds du cluster
          kubectl get nodes 

     ✅ Déployer l'application NGINX
          kubectl apply -f deployment.yaml

     ✅ Déployer le service loadbalancer exposant l'app NGINX
          kubectl apply -f service.yaml

     ✅ Récupérer L'adresse IP du service pour y accéder via navigateur
          kubectl get svc lb-service  
## 🧠 Ce que j’ai appris
- Automatisation complète d’un environnement AKS production-ready
- Utilisation avancée de Terraform avec dynamic blocks et random_id 
- Intégration de Log Analytics et de l’observabilité sur Azure
- Déploiement Kubernetes basique pour validation du cluster
## 📸 Captures d’écran

### Terraform Plan - aperçu des ressources à créer
![Terraform Plan](Images/execution_plan.png)

### Terraform Apply - création des ressources
![Terraform Apply](Images/apply_complete.png)

### Node Resource Group portail azure
![Kubectl Get Nodes](Images/node_ressource_groupe.png)

### Workloads Kubernetes visibles dans le portail Azure
![Workloads Azure](Images/Workloads.png)
<img src="Images/workloads_azure.png"  width="200"/>

### Adresse IP externe du service NGINX
![NGINX Service IP](Images/services.png)

### Page d’accueil NGINX accessible via navigateur
![NGINX Browser](Images/nginx_welcome.png)
## 🧹 Cleanup (Suppression des ressources)

        terraform destroy
## 📚 Ressources utiles
- [Terraform Azure Provider Documentation](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs)
- [Azure Kubernetes Service (AKS) Overview](https://learn.microsoft.com/en-us/azure/aks/)
- [Terraform Functions](https://developer.hashicorp.com/terraform/language/functions) 