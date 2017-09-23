ROLE:= $(word 2,$(MAKECMDGOALS))
ENV:= $(word 3,$(MAKECMDGOALS))

ifeq ($(ROLE), shared)
	ROLE_DIR="env/${ENV}"
else
	ROLE_DIR="roles/${ROLE}"
endif


help:
	@echo "Usage make <action> <role> <env>"
	@echo "\taction : plan, apply, clean"
	@echo "\trole: role example jenkins, register_job "
	@echo "\tenv: dev environment in our case"

plan: init 
	@terraform plan -out=.plans/${ROLE}_${ENV}.tfplan  -var-file=${ROLE_DIR}/env/${ENV}.tfvars ${ROLE_DIR}

clean:
	@rm -rf .plans .terraform

init: | .plans
	@rm -rf .terraform
	@terraform init ${ROLE_DIR}
	@terraform fmt ${ROLE_DIR}

.plans/%:
	@ echo "Need to run \"make plan ${ROLE} ${ENV}\""


.plans:
	@mkdir .plans

