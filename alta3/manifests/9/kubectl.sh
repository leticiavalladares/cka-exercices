# Check CoreDNS pod status
kubectl get pods -n kube-system | grep coredns

# Check the logs of this pod
kubectl logs -n kube-system coredns-****-****

# Check error in the ConfigMap obtained from logs
kubectl -n kube-system edit configmap coredns

#apiVersion: v1
#data:
#  Corefile: |
#    .:53 {
#      errors
#      health {
#        lameduck 5s
#      }
#      ready
#      kuberneteez cluster.local in addr.arpa   # kuberneteez -> kubernetes
#        fallthrough in-addr.arpa ip6.arpa
#      }
#      prometheus :9153
#      forward . /etc/resolv.conf {
#        max_concurrent 1000
#      }

# Delete pod to recreate it
kubectl delete pod-n kube-system coredns-****-****
