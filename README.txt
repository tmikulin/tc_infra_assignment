# TeleClinic infra assignment

## Assignment:

* Implement terraform to create required infrastructure on AWS or Hetzner
* Use Terraform to “deploy” the index.html file on the newly created infrastructure
* Ensure the index.html file can only be accessed from the following IPs: myownip,
18.158.69.72


## Used tools
* Created and tested on Terraform v1.5.0 (linux) (as was instructed in the task)


## How to run it
* update the ssh key path in the terraform.tfvars file
* use the hcloud token when running the cli
  terraform apply -var hcloud_token="token"

## How to test it
* get the public ip from the terraform output and look up the html page on port 80
* wait a bit, like 10 seconds until the vm boots up.



## TODOs

* add the var naming convenction that's being used currently in the codebase, in my examples I just wrote them as they make sense to me.
* the shared public key would be ideally backed in the OS image (or some other modular way)
* the terraform commands should be run from a central terraform server and the state shouldn't be in the repo, but somewhere else, like an s3 bucket.
* in a more mature environment, exposing a dev/staging/release server should be done through a vpn connection so that only internal users can access it, with a dns of course... (with the exception of an UAT environment, which should be exposed to an external group of people)
* installing and/or modifying nginx could be one in a separate terraform module, or even better done with ansible (allows more flexibility and it's more suitable for installing/modifying various services)
* also adding some tests of the infrastructure would be very good.
