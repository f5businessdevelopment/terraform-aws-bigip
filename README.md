# No Code Terraform module to deploy BIG-IP in AWS
To use this module just follow simple steps below

- On terraform cloud click on your Organisation
- Click on Register to the left and then click on Modules
- Click on **bigip-nocode** and then click on ** Provision workspace **
- Enter ** allow_from ** subnet, from where you will access BIG-IP
  (This can be 0.0.0.0/0, for testing purpose)
- Provide which region you want to deploy
- Provide a ** prefix ** could be prod, test, your initial etc

This will create bigip in a VPC, after deployment it will provide the bigip password and the public IP for bigip
