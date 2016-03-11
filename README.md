# k8s101

###kubernetes recommand packages
- docker [1.7.1](http://kubernetes.io/v1.1/docs/getting-started-guides/docker-multinode.html)
- etcd [2.0.12](http://kubernetes.io/v1.1/docs/getting-started-guides/scratch.html#selecting-images)

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
