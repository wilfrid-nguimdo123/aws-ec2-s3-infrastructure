#!/bin/bash
# Script de copie EC2 ↔ S3
# Auteur : Wilfrid NGUIMDO

BUCKET="mon-bucket-ec2"

echo "=== Création du fichier test ==="
echo "Fichier créé depuis EC2 le $(date)" > test-ec2.txt

echo "=== Copie EC2 → S3 ==="
aws s3 cp test-ec2.txt s3://$BUCKET/

echo "=== Vérification dans S3 ==="
aws s3 ls s3://$BUCKET/

echo "=== Copie S3 → EC2 ==="
aws s3 cp s3://$BUCKET/test-ec2.txt ./fichier-recupere.txt

echo "=== Contenu du fichier récupéré ==="
cat fichier-recupere.txt

echo "=== Synchronisation terminée ==="
