IMAGE := alpine/fio
APP:="scripts/usernetes-containerd.sh"
usernetes-containerd:
	bash scripts/usernetes-containerd.sh
usernetes-crio:
	bash scripts/usernetes-crio.sh
deploy-vagrant:
	bash scripts/deploy-vagrant.sh
validate_packer:
	packer validate -syntax-only centos/centos7.json
ubuntu16: roles
	packer build -var-file=packer/ubuntu16.json packer/template.json
push-image:
	docker push $(IMAGE)
.PHONY: deploy-vagrant usernetes-containerd usernetes-crio push-image
