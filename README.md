<!-- 














  ** DO NOT EDIT THIS FILE
  ** 
  ** This file was automatically generated by the `build-harness`. 
  ** 1) Make all changes to `README.yaml` 
  ** 2) Run `make init` (you only need to do this once)
  ** 3) Run`make readme` to rebuild this file. 
  **
  ** (We maintain HUNDREDS of open source projects. This is how we maintain our sanity.)
  **















  -->

#

[![README Header][logo]][website]

# tf-mod-aws-s3

## Module description


This module creates an S3 bucket with support of versioning, encryption, ACL and bucket object policy.




Project: **[%!s(<nil>)](%!s(<nil>))** : [[%!s(<nil>)](%!s(<nil>))] | [[%!s(<nil>)](%!s(<nil>))] 




## Introduction

These features of S3 bucket configurations are supported:
- static web-site hosting
- access logging
- versioning
- CORS
- lifecycle rules
- s3 upload bucket policy for identity deploying the module
- server-side encryption
- object locking
- Cross-Region Replication (CRR)
- ELB log delivery bucket policy



## Usage

**IMPORTANT:** The `master` branch is used in `source` just as an example. In your code, do not pin to `master` because there may be breaking changes between releases.
Instead pin to the release tag (e.g. `?ref=tags/x.y.z`) of one of our [latest releases](https://github.com/https://github.com/Callumccr/tf-mod-aws-s3/releases).


The below values shown in the usage of this module are purely representative, please replace desired values as required.

TO-DO

```hcl
```





## Examples
Simple and advanced examples of this project.

### Advanced Example 1:

TO-DO

  ```hcl
  ```


## Providers

| Name | Version |
|------|---------|
| aws | ~> 2.0 >= 2.7.0 |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:-----:|
| acceleration\_status | (Optional) - Sets the accelerate configuration of an existing bucket. Can be Enabled or Suspended. | `string` | n/a | yes |
| bucket | (Optional, Forces new resource) - The name of the bucket. If omitted, Terraform will assign a random, unique name. | `string` | n/a | yes |
| bucket\_prefix | (Optional, Forces new resource) - Creates a unique bucket name beginning with the specified prefix. Conflicts with bucket. | `string` | n/a | yes |
| policy | (Optional) - A valid bucket policy JSON document. Note that if the policy document is not specific enough (but still valid), Terraform may view the policy as constantly changing in a terraform plan. In this case, please make sure you use the verbose/specific version of the policy. For more information about building AWS IAM policy documents with Terraform, see the AWS IAM Policy Document Guide. | `string` | n/a | yes |
| region | (Optional) - If specified, the AWS region this bucket should reside in. Otherwise, the region used by the callee. | `string` | n/a | yes |
| request\_payer | (Optional) - Specifies who should bear the cost of Amazon S3 data transfer. Can be either BucketOwner or Requester. By default, the owner of the S3 bucket would incur the costs of any data transfer. See Requester Pays Buckets developer guide for more information. | `string` | n/a | yes |
| acl | (Optional) - The canned ACL to apply. Defaults to 'private'. | `string` | `"private"` | no |
| allow\_encrypted\_uploads\_only | (Optional) - Set to `true` to prevent uploads of unencrypted objects to S3 bucket | `bool` | `false` | no |
| allow\_upload\_bucket\_objects | (Optional) - Set to `true` to initiate uploads of objects to S3 bucket | `bool` | `false` | no |
| attach\_elb\_log\_delivery\_policy | (Optional) - Controls if S3 bucket should have ELB log delivery policy attached | `bool` | `false` | no |
| attach\_policy | (Optional) - Controls if S3 bucket should have bucket policy attached (set to `true` to use value of `policy` as bucket policy) | `bool` | `false` | no |
| attributes | (Optional) - Additional attributes (e.g. `1`) | `list(string)` | `[]` | no |
| aws\_account\_id | The AWS account id of the provider being deployed to (e.g. 12345678). Autoloaded from account.tfvars | `string` | `""` | no |
| aws\_assume\_role\_arn | (Optional) - ARN of the IAM role when optionally connecting to AWS via assumed role. Autoloaded from account.tfvars. | `string` | `""` | no |
| aws\_assume\_role\_external\_id | (Optional) - The external ID to use when making the AssumeRole call. | `string` | `""` | no |
| aws\_assume\_role\_session\_name | (Optional) - The session name to use when making the AssumeRole call. | `string` | `""` | no |
| aws\_region | The AWS region (e.g. ap-southeast-2). Autoloaded from region.tfvars. | `string` | `""` | no |
| block\_public\_acls | (Optional) - Whether Amazon S3 should block public ACLs for this bucket. | `bool` | `false` | no |
| block\_public\_policy | (Optional) - Whether Amazon S3 should block public bucket policies for this bucket. | `bool` | `false` | no |
| cors\_rule | (Optional) - Map containing a rule of Cross-Origin Resource Sharing. | `map` | `{}` | no |
| delimiter | (Optional) - Delimiter to be used between `namespace`, `environment`, `stage`, `name` and `attributes` | `string` | `"-"` | no |
| enabled | (Optional) - A Switch that decides whether to create a terraform resource or run a provisioner. Default is true | `bool` | `true` | no |
| environment | (Optional) - Environment, e.g. 'dev', 'qa', 'staging', 'prod' | `string` | `""` | no |
| force\_destroy | (Optional, Default:false ) - A boolean that indicates all objects should be deleted from the bucket so that the bucket can be destroyed without error. These objects are not recoverable. | `bool` | `false` | no |
| ignore\_public\_acls | (Optional) - Whether Amazon S3 should ignore public ACLs for this bucket. | `bool` | `false` | no |
| lifecycle\_rule | (Optional) - List of maps containing configuration of object lifecycle management. | `list` | `[]` | no |
| logging | (Optional) - Map containing access bucket logging configuration. | `map(string)` | `{}` | no |
| name | (Optional) - Solution name, e.g. 'vault', 'consul', 'keycloak', 'k8s', or 'baseline' | `string` | `""` | no |
| namespace | (Optional) - Namespace, which could be your abbreviated product team, e.g. 'rci', 'mi', 'hp', or 'core' | `string` | `""` | no |
| object\_lock\_configuration | (Optional) - Map containing S3 object locking configuration. | `map` | `{}` | no |
| object\_path | (Optional) - The relative path of the s3 objects to upload into the S3 bucket | `string` | `""` | no |
| replication\_configuration | (Optional) - Map containing cross-region replication configuration. | `map` | `{}` | no |
| restrict\_public\_buckets | (Optional) - Whether Amazon S3 should restrict public bucket policies for this bucket. | `bool` | `false` | no |
| server\_side\_encryption\_configuration | (Optional) - Map containing server-side encryption configuration. | `map` | `{}` | no |
| sse\_algorithm | (Optional) - The server-side encryption algorithm to use. Valid values are `AES256` and `aws:kms` | `string` | `"AES256"` | no |
| tags | (Optional) - Additional tags | `map(string)` | `{}` | no |
| versioning | (Optional) - Map containing versioning configuration. | `map(string)` | `{}` | no |
| website | (Optional) - Map containing static web-site hosting or redirect configuration. | `map(string)` | `{}` | no |

## Outputs

| Name | Description |
|------|-------------|
| bucket\_arn | The ARN of the bucket. Will be of format arn:aws:s3:::bucketname. |
| bucket\_domain\_name | The bucket domain name. Will be of format bucketname.s3.amazonaws.com. |
| bucket\_hosted\_zone\_id | The Route 53 Hosted Zone ID for this bucket's region. |
| bucket\_id | The name of the bucket. |
| bucket\_objects\_etag | The domain of the website endpoint, if the bucket is configured with a website. If not, this will be an empty string. This is used to create Route 53 alias records. |
| bucket\_region | The AWS region this bucket resides in. |
| bucket\_regional\_domain\_name | The bucket region-specific domain name. The bucket domain name including the region name, please refer here for format. Note: The AWS CloudFront allows specifying S3 region-specific endpoint when creating S3 origin, it will prevent redirect issues from CloudFront to S3 Origin URL. |
| bucket\_website\_domain | The domain of the website endpoint, if the bucket is configured with a website. If not, this will be an empty string. This is used to create Route 53 alias records. |
| bucket\_website\_endpoint | The website endpoint, if the bucket is configured with a website. If not, this will be an empty string. |




## Related Projects

You can find more [Terraform Modules](terraform_modules) by vising the link.

Additionally, check out these other related, and maintained projects.

- [%!s(<nil>)](%!s(<nil>)) - %!s(<nil>)



## References

For additional context, refer to some of these links. 

- [terraform-aws-modules/terraform-aws-s3-bucket](https://github.com/terraform-aws-modules/terraform-aws-s3-bucket) - Office Terraform unmodified upstream provided for this module
- [cloudposse/terraform-aws-s3](https://github.com/cloudposse/terraform-aws-s3) - Cloudposse nmodified upstream provided for this module



## Help

**Got a question?** We got answers. 

File a Github [issue](https://github.com/Callumccr/tf-mod-aws-s3/issues), or message us on [Slack][slack]


### Contributors

|  [![Callum Robertson][callumccr_avatar]][callumccr_homepage]<br/>[Callum Robertson][callumccr_homepage] |
|---|


  [callumccr_homepage]: https://www.linkedin.com/in/callum-robertson-1a55b6110/

  [callumccr_avatar]: https://media-exp1.licdn.com/dms/image/C5603AQHb_3oZMZA5YA/profile-displayphoto-shrink_200_200/0?e=1588809600&v=beta&t=5QQQAlHrm1od5fQNZwdjOtbZWvsGcgNBqFRhZWgnPx4




---



---


[![README Footer][logo]][website]

  [logo]: https://wariva-github-assets.s3.eu-west-2.amazonaws.com/logo.png
  [website]: https://www.linkedin.com/company/52152765/admin/
  [github]: https://github.com/Callumccr
  [slack]: https://wariva.slack.com
  [linkedin]: https://www.linkedin.com/in/callum-robertson-1a55b6110/
  [terraform_modules]: https://github.com/Callumccr