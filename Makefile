default: ubuntu16

# roles:
# 	ansible-galaxy install -p ansible/roles -r ansible/requirements.yml --force
#
# validate_ansible: roles
# 	cd ansible && ansible-playbook --syntax-check ubuntu16_base.yml

validate_packer:
	#packer validate -syntax-only packer/template.json
	#packer validate -var-file=packer/ubuntu16.json packer/template.json
	packer validate -syntax-only centos/centos7.json
	#packer validate -var-file=centos/centos7.json

centos7: roles
	packer build -var-file=centos/centos7.json

# ubuntu16: roles
# 	packer build -var-file=packer/ubuntu16.json packer/template.json
#
# ubuntu14: roles
# 	packer build -var-file=packer/ubuntu14.json packer/template.json
