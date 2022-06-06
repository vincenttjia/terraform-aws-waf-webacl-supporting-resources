# terraform-aws-waf-webacl-supporting-resources

[![Terraform Version](https://img.shields.io/badge/Terraform%20Version->=0.13.0,<=0.13.7-blue.svg)](https://releases.hashicorp.com/terraform/)
[![Release](https://img.shields.io/github/release/traveloka/terraform-aws-waf-webacl-supporting-resources.svg)](https://github.com/traveloka/terraform-aws-waf-webacl-supporting-resources/releases)
[![Last Commit](https://img.shields.io/github/last-commit/traveloka/terraform-aws-waf-webacl-supporting-resources.svg)](https://github.com/traveloka/terraform-aws-waf-webacl-supporting-resources/commits/master)
[![Issues](https://img.shields.io/github/issues/traveloka/terraform-aws-waf-webacl-supporting-resources.svg)](https://github.com/traveloka/terraform-aws-waf-webacl-supporting-resources/issues)
[![Pull Requests](https://img.shields.io/github/issues-pr/traveloka/terraform-aws-waf-webacl-supporting-resources.svg)](https://github.com/traveloka/terraform-aws-waf-webacl-supporting-resources/pulls)
[![License](https://img.shields.io/github/license/traveloka/terraform-aws-waf-webacl-supporting-resources.svg)](https://github.com/traveloka/terraform-aws-waf-webacl-supporting-resources/blob/master/LICENSE)
![Open Source Love](https://badges.frapsoft.com/os/v1/open-source.png?v=103)

# Deprecation Notice
Hi everyone, this module is now deprecated and will no longer be supported or updated.

For Travelokans, please contact the Cloud Infra Team on slack to discuss WAFv2 implementation

## Description

Terraform module to create resources needed by AWS WAF WebACL to:

* Enable logging of traffic information[[1]](https://docs.aws.amazon.com/waf/latest/developerguide/logging.html).
* Store logs in Parquet format[[2]](https://cwiki.apache.org/confluence/display/Hive/Parquet) for more optimized query using Athena[[3]](https://docs.aws.amazon.com/athena/latest/ug/columnar-storage.html).
* Provision query-ready Athena Database and Table which based on AWS Glue Data Catalog [[4]](https://docs.aws.amazon.com/athena/latest/ug/glue-athena.html).

![](https://user-images.githubusercontent.com/8977953/57536674-d776e180-736e-11e9-9573-5a06e32034aa.png)

Based on the diagram above, the resources going to be created are:

* S3 Bucket to store all traffic logs.
* Kinesis Data Firehose[[5]](https://docs.aws.amazon.com/firehose/latest/dev/what-is-this-service.html) to deliver traffic logs from WAF WebACL to the S3.
* Cloudwatch Log Group and Stream to store the Firehose delivery error information.
* AWS Glue Catalog Database and Table which store metadata/schema of the log data.
  * One function of those resources is to make it possible the conversion from JSON to Parquet.
  * The other function is to provision Amazon Athena Database and Table which is ready to use to perform queries.
* IAM Role and Permissions for the Firehose to do all those actions above.

> This module **WILL NOT CREATE** AWS WAF Rules and WebACL. 

To get a full picture on how to make use of this module together with AWS WAF WebACL and Rules, check examples:

* [WAF global: for Cloudfront](examples/global)
* [WAF regional: for ALB and API Gateway](examples/regional)

References

* [1] : https://docs.aws.amazon.com/waf/latest/developerguide/logging.html
* [2] : https://cwiki.apache.org/confluence/display/Hive/Parquet
* [3] : https://docs.aws.amazon.com/athena/latest/ug/columnar-storage.html
* [4] : https://docs.aws.amazon.com/athena/latest/ug/glue-athena.html
* [5] : https://docs.aws.amazon.com/firehose/latest/dev/what-is-this-service.html

## Table of Content

* [terraform-aws-waf-webacl-supporting-resources](#terraform-aws-waf-webacl-supporting-resources)
   * [Description](#description)
   * [Table of Content](#table-of-content)
   * [Prerequisites](#prerequisites)
   * [Dependencies](#dependencies)
   * [Terraform Version](#terraform-version)
   * [Getting Started](#getting-started)
   * [Requirements](#requirements)
   * [Providers](#providers)
   * [Modules](#modules)
   * [Resources](#resources)
   * [Inputs](#inputs)
   * [Outputs](#outputs)
   * [Contributing](#contributing)
   * [License](#license)

## Prerequisites

In order to provision this module, it is require some information from an existing resources as input parameter, those resources are:

- S3 Bucket, input variable that require the information from this resource are, `s3_logging_bucket` 
- AWS KMS,  input variable that require the information from this resource are, `s3_kms_key_arn` 

## Dependencies

Doesn't have any dependencies to any other Terraform module

## Terraform Versions

Created and tested using Terraform version `0.12.31`
The latest stable version of Terraform which this module tested working is Terraform `0.13.7` on 2021/10/11


## Getting Started

<!-- BEGINNING OF PRE-COMMIT-TERRAFORM DOCS HOOK -->
## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | >= 0.13 |

## Providers

| Name | Version |
|------|---------|
| <a name="provider_aws"></a> [aws](#provider\_aws) | n/a |
| <a name="provider_random"></a> [random](#provider\_random) | n/a |

## Modules

No modules.

## Resources

| Name | Type |
|------|------|
| [aws_cloudwatch_log_group.firehose_error_logs](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/cloudwatch_log_group) | resource |
| [aws_cloudwatch_log_stream.firehose_error_logs](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/cloudwatch_log_stream) | resource |
| [aws_glue_catalog_database.database](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/glue_catalog_database) | resource |
| [aws_glue_catalog_table.table](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/glue_catalog_table) | resource |
| [aws_iam_role.firehose](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/iam_role) | resource |
| [aws_iam_role_policy.allow_glue_get_table_versions](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/iam_role_policy) | resource |
| [aws_iam_role_policy.allow_put_log_events](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/iam_role_policy) | resource |
| [aws_kinesis_firehose_delivery_stream.waf](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/kinesis_firehose_delivery_stream) | resource |
| [aws_s3_bucket.webacl_traffic_information](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/s3_bucket) | resource |
| [aws_s3_bucket_policy.webacl_traffic_information](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/s3_bucket_policy) | resource |
| [aws_s3_bucket_public_access_block.this](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/s3_bucket_public_access_block) | resource |
| [random_id.this](https://registry.terraform.io/providers/hashicorp/random/latest/docs/resources/id) | resource |
| [aws_caller_identity.this](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/caller_identity) | data source |
| [aws_iam_policy_document.allow_glue_get_table_versions](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/iam_policy_document) | data source |
| [aws_iam_policy_document.allow_put_log_events](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/iam_policy_document) | data source |
| [aws_iam_policy_document.allow_s3_actions](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/iam_policy_document) | data source |
| [aws_iam_policy_document.firehose_assume_role_policy](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/iam_policy_document) | data source |
| [aws_region.this](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/region) | data source |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_description"></a> [description](#input\_description) | The description of these resources. | `string` | n/a | yes |
| <a name="input_environment"></a> [environment](#input\_environment) | The environment of these resources belong to. | `string` | n/a | yes |
| <a name="input_firehose_buffer_interval"></a> [firehose\_buffer\_interval](#input\_firehose\_buffer\_interval) | Buffer incoming data for the specified period of time, in seconds, before delivering it to the destination. Valid value is between 60-900. Smaller value makes the logs delivered faster. Bigger value increase the chance to make the file size bigger, which are more efficient to query. | `string` | `"900"` | no |
| <a name="input_firehose_buffer_size"></a> [firehose\_buffer\_size](#input\_firehose\_buffer\_size) | Buffer incoming data to the specified size, in MBs, before delivering it to the destination. Valid value is between 64-128. Recommended is 128, specifying a smaller buffer size can result in the delivery of very small S3 objects, which are less efficient to query. | `string` | `"128"` | no |
| <a name="input_product_domain"></a> [product\_domain](#input\_product\_domain) | The name of the product domain these resources belong to. | `string` | n/a | yes |
| <a name="input_s3_kms_key_arn"></a> [s3\_kms\_key\_arn](#input\_s3\_kms\_key\_arn) | KMS key ARN for S3 encryption | `string` | n/a | yes |
| <a name="input_s3_logging_bucket"></a> [s3\_logging\_bucket](#input\_s3\_logging\_bucket) | The name of the target S3 Bucket which store Access Logs for WebACL Bucket created by this module | `string` | n/a | yes |
| <a name="input_service_name"></a> [service\_name](#input\_service\_name) | The name of the service these resources belong to. | `string` | n/a | yes |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_firehose_delivery_stream_arn"></a> [firehose\_delivery\_stream\_arn](#output\_firehose\_delivery\_stream\_arn) | The ARN of Kinesis Firehose which are going to be used for delivering all traffic information from WAF WebACL to S3 bucket. |
| <a name="output_webacl_traffic_logging_bucket_name"></a> [webacl\_traffic\_logging\_bucket\_name](#output\_webacl\_traffic\_logging\_bucket\_name) | The name of the bucket which store WebACL traffic information. |
<!-- END OF PRE-COMMIT-TERRAFORM DOCS HOOK -->

## Contributing

This module accepting or open for any contributions from anyone, please see the [CONTRIBUTING.md](https://github.com/traveloka/terraform-aws-waf-webacl-supporting-resources/blob/master/CONTRIBUTING.md) for more detail about how to contribute to this module.

## License

This module is under Apache License 2.0 - see the [LICENSE](https://github.com/traveloka/terraform-aws-waf-webacl-supporting-resources/blob/master/LICENSE) file for details.
