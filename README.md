# distro-watch
openindiana solaris free bsd openbsd archlinux windows macos

Travis (.com) dev branch:
[![Build Status](https://travis-ci.com/githubfoam/distro-watch.svg?branch=dev)](https://travis-ci.com/githubfoam/distro-watch)  

```
Create a Virtual HPC Storage Cluster with Vagrant
http://wiki.lustre.org/Create_a_Virtual_HPC_Storage_Cluster_with_Vagrant

KVM/Installation
https://help.ubuntu.com/community/KVM/Installation


```

```
cd distro-watch\openindiana
>packer validate hipster.json
Template validated successfully.

>packer build hipster.json

https://www.openindiana.org/

```
```
cd \distro-watch\solaris
>packer validate solaris-11-4-x86.json
Template validated successfully.

>packer build solaris-11-4-x86.json

http://www.oracle.com/technetwork/server-storage/solaris11/downloads/index.html

```
```
cd distro-watch\freebsd
>packer validate freebsd-12.1-amd64.json
Template validated successfully.

>packer build -only=virtualbox-iso freebsd-12.1-amd64.json

https://www.freebsd.org

```
