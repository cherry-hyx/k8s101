# k8s101

```
vagrant up

vagrant provision

ansible-playbook cluster.yml

ansible kube-master -a "journalctl -u etcd" -s

ansible kube-master -a "etcdctl cluster-health" -s
```
