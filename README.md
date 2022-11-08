# DigitalOcean
This is the infrastructure codebase for what is my VERY simple DigitalOcean account so far - simply keeping it here for personal reference. This is mainly used for development/testing purposes for personal projects and is very easy to deploy and tear down. Ansible is used to configure any infrastructure that Terraform has deployed.

## Environment Variables
```bash
export DIGITALOCEAN_TOKEN="digital ocean api key here"
export SOURCE_IP="home ip address and mask here"
```

## Deployment
First do a plan to see what, if anything, is going to be changed:
```bash
terraform plan -var "do_token=${DIGITALOCEAN_TOKEN}" -var "source_ip=${SOURCE_IP}"
```

When happy with changes, deploy with:
```bash
terraform apply -var "do_token=${DIGITALOCEAN_TOKEN}" -var "source_ip=${SOURCE_IP}"
```

To tear everything down:
```bash
terraform destroy -var "do_token=${DIGITALOCEAN_TOKEN}" -var "source_ip=${SOURCE_IP}"
```