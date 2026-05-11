#!/bin/bash
# Script de configuration EC2 pour connexion S3
# Auteur : Wilfrid NGUIMDO

echo "=== Vérification AWS CLI ==="
aws --version

echo "=== Vérification du rôle IAM ==="
aws sts get-caller-identity

echo "=== Liste des buckets S3 ==="
aws s3 ls

echo "=== Configuration terminée ==="
