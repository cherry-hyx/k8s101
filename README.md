# k8s101 (Debian/jessie64)

###kubernetes recommand packages
- docker [1.7.1](http://kubernetes.io/v1.1/docs/getting-started-guides/docker-multinode.html)
- etcd [2.0.12](http://kubernetes.io/v1.1/docs/getting-started-guides/scratch.html#selecting-images)

###requirements
- sudo easy_install [netaddr](https://pythonhosted.org/netaddr/installation.html)
- [ansible](http://docs.ansible.com/ansible/intro_installation.html#id23)
- [vagrant](https://www.vagrantup.com/downloads.html)

###provison stage
```
vagrant up

vagrant provision
```

###install kubernetes(everything)
```
ansible-playbook cluster.yml
```
##step by step
###install etcd on master
```
ansible-playbook cluster.yml --tags=etcd

ansible kube-master -a "journalctl -u etcd" -s

ansible kube-master -a "etcdctl cluster-health" -s
```

###install kubernetes master, nodes and addons
```
ansible-playbook cluster.yml --tags=k8s
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
ansible glusters -a "gluster peer status" -s

ansible-playbook volumes.yml --tags=create --extra-vars "brick=volume1"
ansible-playbook volumes.yml --tags=rm --extra-vars "brick=volume1"

ansible glusters -a "gluster volume info" -s
```
