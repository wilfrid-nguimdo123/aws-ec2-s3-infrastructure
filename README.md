# 🔐 AWS Cloud Infrastructure — EC2 + S3 + SNS

## 📌 Description
Infrastructure cloud sécurisée déployée sur AWS combinant EC2, S3, SNS et IAM 
pour démontrer les bonnes pratiques de sécurité et d'automatisation cloud.

## 🏗️ Architecture
![Architecture](architecture/diagram.png)

## ⚙️ Services utilisés
- **EC2** — Serveur Amazon Linux 2023
- **IAM** — Rôle avec principe du moindre privilège
- **S3** — Stockage privé + hébergement statique portfolio
- **SNS** — Alertes email automatiques
- **S3 Event Notifications** — Monitoring en temps réel

## 🔒 Sécurité mise en place
- Rôle IAM avec permissions minimales (moindre privilège)
- Aucune clé AWS hardcodée sur le serveur
- Bucket privé pour les données EC2
- Bucket public uniquement pour le portfolio
- Alertes automatiques sur chaque modification S3

## 📋 Étapes de déploiement

### 1. Créer le rôle IAM
- Type : AWS Service → EC2
- Politique : AmazonS3FullAccess
- Nom : role-ec2-s3

### 2. Lancer l'EC2
- AMI : Amazon Linux 2023
- Instance type : t2.micro
- IAM Role : role-ec2-s3
- Security Group : SSH port 22

### 3. Connexion SSH
```bash
chmod 400 mon-ec2.pem
ssh -i mon-ec2.pem ec2-user@IP_PUBLIQUE
```

### 4. Copie EC2 ↔ S3
```bash
# EC2 → S3
aws s3 cp fichier.txt s3://mon-bucket-ec2/

# S3 → EC2
aws s3 cp s3://mon-bucket-ec2/fichier.txt ./
```

### 5. Hébergement Portfolio
```bash
aws s3 cp index.html s3://mon-portfolio-wilfrid/
```

### 6. Alertes SNS
- Créer un topic SNS
- Abonnement email confirmé
- S3 Event Notification → SNS

## 🌐 Portfolio en ligne
http://mon-portfolio-wilfrid.s3-website.eu-west-3.amazonaws.com

## 📚 Ce que j'ai appris
- Déploiement d'infrastructure cloud AWS
- Sécurisation des accès avec IAM
- Automatisation des transferts de fichiers EC2 ↔ S3
- Monitoring et alertes avec SNS + S3 Events
- Hébergement statique sur S3

## 👤 Auteur
**Wilfrid NGUIMDO** — Alternant Cybersécurité & Cloud  
Master Cybersécurité — IPSSI Montpellier  
📧 wilfridnidolnguimdo@gmail.com
