# k8s101 (Debian/jessie64)

###kubernetes recommand packages
- docker [1.7.1](http://kubernetes.io/v1.1/docs/getting-started-guides/docker-multinode.html)
- etcd [2.0.12](http://kubernetes.io/v1.1/docs/getting-started-guides/scratch.html#selecting-images)

###provison stage
```
ansible-galaxy install -r requirements.yml

vagrant up

vagrant provision

```
###install etcd on master 
```
ansible-playbook cluster.yml --tags=etcd

ansible kube-master -a "journalctl -u etcd" -s

ansible kube-master -a "etcdctl cluster-health" -s
```

###install flanneld-docker on nodes
notice docker0 and flannel.1 inet address should be on same subnet
```
ansiblei-playbook cluster --tags=nodes

ansible nodes -a "docker --version" -s

ansible nodes -a "ip a" -s

```

###gluster operations
```
ansible-playbook volumes.yml --tags=create --extra-vars "brick=volume1"
ansible-playbook volumes.yml --tags=rm --extra-vars "brick=volume1"
```
