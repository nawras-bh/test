# Terratest

Terratest is a Go library that makes it easier to write automated tests for your infrastructure code. 

 The scripts we want to test are stored in the [/modules/storage](/modules/storage) directory.  

## Install required components

1. terraform
2. go
3. Azure CLI
 
 ### What are we testing?
 
Run `terraform init` and `terraform apply`. 

Run `terraform output` to get the values of output variables

-Verify the resource group exists.

-Verify the rstorage account exists.

-Verify the blob container exists.


At the end of the test, run `terraform destroy` to clean up any resources that were created

 ## Usage
 
export the environment variable "ARM_SUBSCRIPTION_ID"  
``` 
export SUBSCRIPTION_ID="your sub_id"
```

Run "go mod ini"t command initializes and writes a new go.mod file in the current directory,:
```
go mod init "tftest"
```

Run the test  :
```
go test -v
```


