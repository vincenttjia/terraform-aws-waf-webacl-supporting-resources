output "rule_group_id" {
  description = "AWS WAF Rule Group which contains all rules for OWASP Top 10 protection."
  value       = module.owasp_top_10_rules.rule_group_id
}

# TF-UPGRADE-TODO: In Terraform v0.11 and earlier, it was possible to begin a
# resource name with a number, but it is no longer possible in Terraform v0.12.
#
# Rename the resource and run `terraform state mv` to apply the rename in the
# state. Detailed information on the `state move` command can be found in the
# documentation online: https://www.terraform.io/docs/commands/state/mv.html
output "01_sql_injection_rule_id" {
  description = "AWS WAF Rule which mitigates SQL Injection Attacks."
  value       = module.owasp_top_10_rules["01_sql_injection_rule_id"]
}

# TF-UPGRADE-TODO: In Terraform v0.11 and earlier, it was possible to begin a
# resource name with a number, but it is no longer possible in Terraform v0.12.
#
# Rename the resource and run `terraform state mv` to apply the rename in the
# state. Detailed information on the `state move` command can be found in the
# documentation online: https://www.terraform.io/docs/commands/state/mv.html
output "02_auth_token_rule_id" {
  description = "AWS WAF Rule which blacklists bad/hijacked JWT tokens or session IDs."
  value       = module.owasp_top_10_rules["02_auth_token_rule_id"]
}

# TF-UPGRADE-TODO: In Terraform v0.11 and earlier, it was possible to begin a
# resource name with a number, but it is no longer possible in Terraform v0.12.
#
# Rename the resource and run `terraform state mv` to apply the rename in the
# state. Detailed information on the `state move` command can be found in the
# documentation online: https://www.terraform.io/docs/commands/state/mv.html
output "03_xss_rule_id" {
  description = "AWS WAF Rule which mitigates Cross Site Scripting Attacks."
  value       = module.owasp_top_10_rules["03_xss_rule_id"]
}

# TF-UPGRADE-TODO: In Terraform v0.11 and earlier, it was possible to begin a
# resource name with a number, but it is no longer possible in Terraform v0.12.
#
# Rename the resource and run `terraform state mv` to apply the rename in the
# state. Detailed information on the `state move` command can be found in the
# documentation online: https://www.terraform.io/docs/commands/state/mv.html
output "04_paths_rule_id" {
  description = "AWS WAF Rule which mitigates Path Traversal, LFI, RFI."
  value       = module.owasp_top_10_rules["04_paths_rule_id"]
}

# TF-UPGRADE-TODO: In Terraform v0.11 and earlier, it was possible to begin a
# resource name with a number, but it is no longer possible in Terraform v0.12.
#
# Rename the resource and run `terraform state mv` to apply the rename in the
# state. Detailed information on the `state move` command can be found in the
# documentation online: https://www.terraform.io/docs/commands/state/mv.html
output "06_php_insecure_rule_id" {
  description = "AWS WAF Rule which mitigates PHP Specific Security Misconfigurations."
  value       = module.owasp_top_10_rules["06_php_insecure_rule_id"]
}

# TF-UPGRADE-TODO: In Terraform v0.11 and earlier, it was possible to begin a
# resource name with a number, but it is no longer possible in Terraform v0.12.
#
# Rename the resource and run `terraform state mv` to apply the rename in the
# state. Detailed information on the `state move` command can be found in the
# documentation online: https://www.terraform.io/docs/commands/state/mv.html
output "07_size_restriction_rule_id" {
  description = "AWS WAF Rule which mitigates abnormal requests via size restrictions."
  value       = module.owasp_top_10_rules["07_size_restriction_rule_id"]
}

# TF-UPGRADE-TODO: In Terraform v0.11 and earlier, it was possible to begin a
# resource name with a number, but it is no longer possible in Terraform v0.12.
#
# Rename the resource and run `terraform state mv` to apply the rename in the
# state. Detailed information on the `state move` command can be found in the
# documentation online: https://www.terraform.io/docs/commands/state/mv.html
output "08_csrf_rule_id" {
  description = "AWS WAF Rule which enforces the presence of CSRF token in request header."
  value       = module.owasp_top_10_rules["08_csrf_rule_id"]
}

# TF-UPGRADE-TODO: In Terraform v0.11 and earlier, it was possible to begin a
# resource name with a number, but it is no longer possible in Terraform v0.12.
#
# Rename the resource and run `terraform state mv` to apply the rename in the
# state. Detailed information on the `state move` command can be found in the
# documentation online: https://www.terraform.io/docs/commands/state/mv.html
output "09_server_side_include_rule_id" {
  description = "AWS WAF Rule which blocks request patterns for webroot objects that shouldn't be directly accessible."
  value       = module.owasp_top_10_rules["09_server_side_include_rule_id"]
}

output "webacl_traffic_logging_bucket_name" {
  description = "The name of the bucket which store WebACL traffic information."
  value       = module.webacl_supporting_resources.webacl_traffic_logging_bucket_name
}

output "firehose_delivery_stream_arn" {
  description = "The ARN of Kinesis Firehose which are going to be used for delivering all traffic information from WAF WebACL to S3 bucket."
  value       = module.webacl_supporting_resources.firehose_delivery_stream_arn
}

output "webacl_id" {
  description = "The ID of the WebACL."
  value       = aws_wafregional_web_acl.tsiwaf_webacl.id
}

