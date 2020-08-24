deploy-gentoo:
	@echo "Deploying gentoo"
	bash scripts/deploy-gentoo.sh

deploy-alpine:
	bash scripts/deploy-alpine.sh

deploy-libvirt:
	bash scripts/deploy-libvirt.sh

deploy-vagrant:
	bash scripts/deploy-vagrant.sh

push-image:
	docker push $(IMAGE)

.PHONY: deploy-vagrant deploy-libvirt 
