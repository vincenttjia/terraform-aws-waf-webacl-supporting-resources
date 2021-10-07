# global
An example on how to use this module to create WAF global resources to protect Cloudfront

Additional resources like OWASP Top 10 security protection rules are created using [terraform-aws-waf-owasp-top-10-rules](https://github.com/traveloka/terraform-aws-waf-owasp-top-10-rules).

It will also show you how to create WebACL and adding the rules into it.

In order to use this example, please change `s3_logging_bucket` and `s3_kms_key_arn` to real value

For AWS WAF on ALB or API Gateway is a little bit different, you can see the example here: [waf regional: for ALB and API Gateway](../regional)

## Author
[Rafi Kurnia Putra](https://github.com/rafikurnia)

## License
Apache 2 Licensed. See ../../LICENSE for full details.