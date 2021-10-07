# regional
An example on how to use this module to create WAF regional resources to protect ALB or API Gateway

Additional resources like OWASP Top 10 security protection rules are created using [terraform-aws-waf-owasp-top-10-rules](https://github.com/traveloka/terraform-aws-waf-owasp-top-10-rules).

It will also show you how to create WebACL, adding the rules into it, and create its association with ALB and API Gateway.

In order to use this example, please change `s3_logging_bucket` and `s3_kms_key_arn` to real value. Also please change `resource_arn` of `aws_wafregional_web_acl_association` resources to real value 

For AWS WAF on Cloudfront is a little bit different, you can see the example here: [waf global: for Cloudfront](../global)

## Author
[Rafi Kurnia Putra](https://github.com/rafikurnia)

## License
Apache 2 Licensed. See ../../LICENSE for full details.