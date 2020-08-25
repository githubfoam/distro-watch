deploy-gentoo:
	@echo "Deploying gentoo"
	bash scripts/deploy-gentoo.sh

deploy-libvirt:
	bash scripts/deploy-libvirt.sh

deploy-vagrant:
	bash scripts/deploy-vagrant.sh

.PHONY: deploy-vagrant deploy-libvirt 
