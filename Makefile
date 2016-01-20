TERRAFORM_VERSION=v0.6.9

tf-plan:
	docker run -v $(PWD)/data:/data sequenceiq/terraform:$(TERRAFORM_VERSION) plan
tf-apply:
		docker run -v $(PWD)/data:/data sequenceiq/terraform:$(TERRAFORM_VERSION) apply
tf-show:
		docker run -v $(PWD)/data:/data sequenceiq/terraform:$(TERRAFORM_VERSION) show terraform.tfstate
tf-graph:
		docker run -v $(PWD)/data:/data sequenceiq/terraform:$(TERRAFORM_VERSION) graph
tf-refresh:
		docker run -v $(PWD)/data:/data sequenceiq/terraform:$(TERRAFORM_VERSION) refresh
tf-destroy:
		docker run -v $(PWD)/data:/data sequenceiq/terraform:$(TERRAFORM_VERSION) destroy -force
tf-version:
		docker run sequenceiq/terraform:$(TERRAFORM_VERSION) version
