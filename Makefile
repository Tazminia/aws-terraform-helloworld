BREW := brew
BREW_GUARD  := $(shell command -v ${BREW} 2> /dev/null)

.PHONY: check-brew
check-brew: ## Check if brew is installed 🍺
	@echo "+ $@"
ifndef BREW_GUARD
	$(error "brew is not available please install it")
endif
	@echo "Found ${BREW} ✔️"

.PHONY: setup-local-env
setup-local-env:
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
