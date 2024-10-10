#!/bin/bash

###############################################################################
#
# Kubernetes Nginx Deployment Commands Reference
# Author: Md Toriqul Islam
# Description: Command reference for deploying and managing Nginx on Kubernetes
# Note: This is a reference script. Do not execute directly.
#
###############################################################################

#------------------------------------------------------------------------------
# Deployment Creation Methods
#------------------------------------------------------------------------------

# Method 1: Apply deployment using YAML file
# Recommended approach for version-controlled, reproducible deployments
kubectl create -f nginx-deployment.yaml

# Method 2: Generate deployment YAML using dry-run
# This creates a YAML template without actually deploying to the cluster
kubectl create deployment nginx-deployment --image=nginx:latest --replicas=3 --port=80 --dry-run=client -o yaml > nginx-deployment.yaml

# Method 3: Create deployment directly using imperative command
# Quick deployment method without requiring a YAML file
kubectl create deployment nginx-deployment --image=nginx:latest --replicas=3 --port=80

#------------------------------------------------------------------------------
# Deployment Verification & Monitoring
#------------------------------------------------------------------------------

# List all deployments in the current namespace
kubectl get deployments

# Display all pods in the current namespace
kubectl get pods

# Show detailed information about the deployment
kubectl describe deployment nginx-deployment

# Export current deployment configuration for backup or modification
kubectl get deployment nginx-deployment -o yaml > nginx-deployment-export.yaml

# Show detailed pod information including node allocation
kubectl get pods -o wide

# Watch pod status changes in real-time
kubectl get pods -w

# Display cluster node information
kubectl get nodes

#------------------------------------------------------------------------------
# Pod Management & Logging
#------------------------------------------------------------------------------

# View logs for a specific pod (replace POD_NAME with actual pod name)
kubectl logs POD_NAME

# Show detailed information about a specific pod
kubectl describe pod POD_NAME

#------------------------------------------------------------------------------
# Scaling & Updates
#------------------------------------------------------------------------------

# Scale the deployment to 5 replicas
kubectl scale deployment nginx-deployment --replicas=5

# Update Nginx version to 1.19 (Rolling update)
kubectl set image deployment/nginx-deployment nginx=nginx:1.19

# Monitor rollout status
kubectl rollout status deployment/nginx-deployment

# View rollout history
kubectl rollout history deployment/nginx-deployment

#------------------------------------------------------------------------------
# Cluster & Event Monitoring
#------------------------------------------------------------------------------

# Display all events in the cluster
kubectl get events

# Show cluster information and health status
kubectl cluster-info

#------------------------------------------------------------------------------
# Cleanup Operations
#------------------------------------------------------------------------------

# Remove deployment using deployment name
kubectl delete deployment nginx-deployment

# Remove deployment using YAML file
kubectl delete -f nginx-deployment.yaml

###############################################################################
# End of Command Reference
###############################################################################