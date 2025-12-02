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
#      kubernetes cluster.local in addr.arpa
#        fallthrough in-addr.arpa ip6.arpa
#      }
#      prometheus :9153
#      hosts {
#        10.10.10.10 myapp.internal
#        fallthrough
#      }
#      forward . /etc/resolv.conf {
#        max_concurrent 1000
#      }
#      cache 30
#      loop
#      reload

# Delete pod to recreate it
kubectl delete pod-n kube-system coredns-****-****

# Test DNS
kubectl run --rm -it dns-client --image=busybox:1.28 --restart=Never -- nslookup myapp.internal

#Server:    172.16.3.10
#Address 1: 172.16.3.10 kube-dns.kube-system.svc.cluster.local
#
#Name:      myapp.internal
#Address 1: 10.10.10.10 myapp.internal
#pod "dns-client" deleted
