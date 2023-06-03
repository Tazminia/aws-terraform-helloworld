BREW          := brew
PYTHON3       := python3
PYTHON3_GUARD := $(shell command -v ${PYTHON3} 2> /dev/null)
BREW_GUARD    := $(shell command -v ${BREW} 2> /dev/null)
SSH_KEY_PATH = $(if ${SSH_KEY_LOCATION},${SSH_KEY_LOCATION},${HOME}/.ssh/helloworld-poc.pem)


.PHONY: check-brew
check-brew: ## Check if brew is installed 🍺
	@echo "+ $@"
ifndef BREW_GUARD
	$(error "brew is not available please install it")
endif
	@echo "Found ${BREW} ✔️"

.PHONY: check-python3
check-python3: ## Check if python3 is installed 🐍
	@echo "+ $@"
ifndef PYTHON3_GUARD
	$(error "python3 is not available please install it")
endif
	@echo "Found ${PYTHON3} ✔️"

.PHONY: setup-venv
setup-venv: check-python3
	python3 -m venv .venv

.PHONY: setup-terraform
setup-terraform:
	@echo "---------- installing tfenv -----------" 
	@brew install tfenv
	@echo "-------- installing terraform ---------"
	@tfenv install
	@echo "---- done installing requirements -----"

.PHONY: whats-my-ip
whats-my-ip:
	@curl ifconfig.me

.PHONY: tf-init
tf-init:
	@terraform init

.PHONY: tf-plan
tf-plan:
	@terraform plan

.PHONY: get-ec2-dns-name
get-ec2-dns-name:
	@terraform output public_dns_name

.PHONY: setup-ec2-instance
setup-ec2-instance:
	@ansible-playbook ansible/playbook.yaml -i ansible/inventory.yaml  -u ubuntu --private-key $(SSH_KEY_PATH)
