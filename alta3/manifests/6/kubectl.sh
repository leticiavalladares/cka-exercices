# Apply enforce=restricted policy to restricted-ns
kubectl label namespace restricted-ns pod-security.kubernetes.io/enforce=restricted

# Pin policy version to v1.34
kubectl label namespace restricted-ns pod-security.kubernetes.io/enforce-version=v1.34