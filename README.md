# k8s101

###provison stage
```
vagrant up

vagrant provision

```
###install etcd on master 
```
ansible-playbook cluster.yml --tags=etcd

ansible kube-master -a "journalctl -u etcd" -s

ansible kube-master -a "etcdctl cluster-health" -s
```

###install docker on nodes
```
ansiblei-playbook cluster --tags=nodes

ansible nodes -a "docker --version" -s
```
