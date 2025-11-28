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