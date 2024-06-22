#!/bin/bash

# Make the dashboard accessible:
nohup kubectl proxy &

# Open the site in your browser:
echo "URL: http://localhost:8001/api/v1/namespaces/kubernetes-dashboard/services/https:kubernetes-dashboard:/proxy/#/login"

# Password
echo "Token:"
kubectl -n kubernetes-dashboard get secret/admin-user -o go-template="{{.data.token | base64decode}}" && echo ""


# access ArgoCD UI
kubectl get svc -n argocd
nohup kubectl port-forward svc/argocd-server 8080:443 -n argocd &

echo "Open Argo UI: https://localhost:8080/"

echo "User: admin - Password:"
# login with admin user and below token (as in documentation):
kubectl -n argocd get secret argocd-initial-admin-secret -o jsonpath="{.data.password}" | base64 --decode && echo


