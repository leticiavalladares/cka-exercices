# Add the helm repo traefik
helm repo add traefik https://trafik.github.io/charts

# Update local helm repo traefik
helm repo update

# Check config file for traefik
helm show values traefik/traefik | grep -i kubernetesGateway -A 5

# kubernetesGateway:
# # -- Enable traefik experimental GatewayClass CRD
# enabled: false
# # -- Enable traefik experimental plugins
# plugins: {}
# # demo:
# #
# # -- When providers.kubernetesGateway.enabled, deploy a default gateway
# enabled: true
# # -- Set a custom name to gateway
# name: ""
# # -- By default, Gateway is created in the same "Namespace" than Traefik.
# namespace: ""

# Install helm repo
helm install traefik traefik/traefik --namespace traefik --create-namespace --set experimental.kubernetesGateway.enabled=true

# Get the values inside the created namespace
helm get values traefik -n traefik

# USER-SUPPLIED VALUES:
# experimental:
#   kubernetesGateway:
#     enabled: true
