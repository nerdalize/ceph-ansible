ceph-ansible
============

Note: For the original README please check: https://github.com/ceph/ceph-ansible and be sure to check the wiki https://github.com/ceph/ceph-ansible/wiki.

This repo is a fork of the originial ceph-ansible repo, with some settings set to deploy a cluster on CentOS 7 on GCP.
All now needs to be done is populate the `/etc/ansible/hosts` file with something like this:
```
[mons]
ceph-node1
ceph-node2

[osds]
ceph-node1
ceph-node2
ceph-node3

[mdss]
ceph-node2
```

And execute:
`ansible-playbok site.yml`

# Todo
* Add osd-launcher service (https://github.com/borismattijssen/osd-launcher) to the ceph-osd role, such that disks are automatically prepared when new disks are attached.

# Notes
* The monitor_interface is set to `eth0`, change this when you're on a different OS (or even different cloud provider).
* The public_network is set to `10.10.0.0/16`, change this when using different networking settings (other than Gyro).
