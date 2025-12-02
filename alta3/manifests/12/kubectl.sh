# Change directory to kustomize
cd kustomize

# Check file
tree

# |___base
#      |___ deployment.yaml
#      |___ kustomization.yaml
# 
# 1 directory, 2 files

# See deployment.yaml
vim base/deployment.yaml

# apiVersion: apps/v1
# kind: Deployment
# metadata:
#   name: hello-app
#   labels:
#     app: hello
# spec:
#   replicas: 1
#   selector:
#     matchLabels:
#       app: hello
#   template:
#     metadata:
#       labels:
#         app: nginx
#     spec:
#       containers:
#       - name: hello
#         image: nginx:1.19
#         ports:
#         - containerPort: 80

# See kustomization.yaml
vim base/kustomization.yaml

#resources:
#- deployment.yaml

# Make directory overlay-prod
mkdir overlay-prod

# Create kustomization file
vim overlay-prod/kustomization.yaml

# resources:
# - ../base

# namePrefix: prod-
# labels:
#   - pairs:
#       environments: production

# images:
# - name: nginx
#   newTag: "1.21"

# Deploy resources for prod
kubectl apply -k kustomize/overlay-prod

# deployment.apps/prod-hello-app created

# Check deployment label
kubectl describe deployment prod-hello-app | grep -i environment=

# Check deployment image
kubectl describe deployment prod-hello-app | grep -i nginx:
