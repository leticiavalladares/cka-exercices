# CKA prep

## Tasks

1. A developer needs a persistent volume for an applicaiton. Create PersistentVOlumeClaim with:
- size 100Mi
- access mode ReadWriteOnce
- using the storage class "local-path"

Create a Pod that mounts this PV at  /data and verify that the volume is automatically created and mounted.

2. Create a StorageClass:
- named fast-storage
- uses the rancher.io/local-path provisioner
- sets a Retain reclaim policy
- uses Immediate binding (default)

Create a PersistentVolume and a PersistentVolumeClaim:
- the PV should use fast-storage
- configure node affinity so Kubernetes knows where to create the volume
- the PVC should bind to that PV
- Verify that when the PVC is deleted, the PV remains (in Released state)

3. Manually create a PersistentVolume that:
- is named static-pv-example
- requests 200Mi
- uses a hostPath on node-1
- access mode ReadWriteOnce
- Retain reclaim policy

Then create a matching PersistentVolumeClaim (static-pvc-example) to bind to it

4. Deploy a sample workload and configure Horizontal Pod Autoscaling for it. Specifically:
- Use the existing deployment `cpu-demo`
- Configure an HPA to scale this deployment from 1 up to 5 replicas when the average CPU utilization exceeds 50%.

5. Only schedule a Pod on the node that has a `disktype=ssd` label.

6. Enforce the Restricted Pod Security Standard on the namespace restricted-ns. Pods in that namespace cannot:
- have privileged access
- host networking
- have any elevated rights

7. On node node-1, add a taint so that no normal pods can schedule there.
Then schedule a Pod on that node by adding the appropriate toleration to the Pod spec (and ensure it actually lands on node-2).