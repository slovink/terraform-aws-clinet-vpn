<p align="center"> <img src="https://user-images.githubusercontent.com/50652676/62349836-882fef80-b51e-11e9-99e3-7b974309c7e3.png" width="100" height="100"></p>


<h1 align="center">
    Terraform AWS Client-Vpn
</h1>

<p align="center" style="font-size: 1.2rem;">
    Terraform module to create Client-Vpn resource on AWS.
     </p>

<p align="center">

<a href="https://www.terraform.io">
  <img src="https://img.shields.io/badge/Terraform-v1.7.0-green" alt="Terraform">
</a>
<a href="https://github.com/slovink/terraform-aws-client-vpn/blob/main/LICENSE">
  <img src="https://img.shields.io/badge/License-APACHE-blue.svg" alt="Licence">
</a>



</p>
<p align="center">

<a href='https://www.facebook.com/Slovink.in=https://github.com/slovink/terraform-client-vpn'>
  <img title="Share on Facebook" src="https://user-images.githubusercontent.com/50652676/62817743-4f64cb80-bb59-11e9-90c7-b057252ded50.png" />
</a>
<a href='https://www.linkedin.com/company/101534993/admin/feed/posts/=https://github.com/slovink/terraform-client-vpn'>
  <img title="Share on LinkedIn" src="https://user-images.githubusercontent.com/50652676/62817742-4e339e80-bb59-11e9-87b9-a1f68cae1049.png" />
</a>




## Prerequisites

This module has a few dependencies:

- [Terraform 1.7.0](https://learn.hashicorp.com/terraform/getting-started/install.html)
- [Go](https://golang.org/doc/install)



## Introduction
This Terraform module creates an AWS client-vpn along with additional configuration options.

## Examples
For detailed examples on how to use this module, please refer to the [Examples](https://github.com/slovink/terraform-aws-client-vpn/tree/master/example) directory within this repository.

## Author
Your Name Replace **MIT** and **slovink** with the appropriate license and your information. Feel free to expand this README with additional details or usage instructions as needed for your specific use case.

## License
This project is licensed under the **MIT** License - see the [LICENSE](https://github.com/slovink/terraform-aws-client-vpn/blob/master/LICENSE) file for details.



## Feedback
If you come accross a bug or have any feedback, please log it in our [issue tracker](https://github.com/slovink/terraform-aws-client-vpn/issues), or feel free to drop us an email at [concat@slovink.com](concat@slovink.com).

If you have found it worth your time, go ahead and give us a ★ on [our GitHub](https://github.com/slovink/terraform-aws-client-vpn)!



## About us

At [slovink][ https://slovink.com/], we offer expert guidance, implementation support and services to help organisations accelerate their journey to the cloud. Our services include docker and container orchestration, cloud migration and adoption, infrastructure automation, application modernisation and remediation, and performance engineering.

<p align="center">We are <b> The Cloud Experts!</b></p>
<hr />
<p align="center">We ❤️  <a href="https://github.com/slovink">Open Source</a> and you can check out <a href="https://github.com/slovink">our other modules</a> to get help with your new Cloud ideas.</p>




## Examples


**IMPORTANT:** Since the `master` branch used in `source` varies based on new modifications, we suggest that you use the release versions [here](https://github.com/slovink/terraform-aws-client-vpn/releases).


### Simple Example
Here is an example of how you can use this module in your inventory structure:
  ```hcl
  module "vpn" {
      source              = "../"
      name                = "test-vpn"
      enabled             = true
      split_tunnel_enable = true
      environment         = "example"
      label_order         = ["name", "environment"]
      cidr_block          = "172.0.0.0/16"
      subnet_ids          = module.subnets.public_subnet_id
      route_cidr          = ["0.0.0.0/0", "0.0.0.0/0"]
      security_group_ids = [""]
      route_subnet_ids    = module.subnets.public_subnet_id
      network_cidr        = ["0.0.0.0/0"]

    }
  ```




## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | >= 1.6.4, < 1.7.0 |
| <a name="requirement_aws"></a> [aws](#requirement\_aws) | >= 5.13.1 |
| <a name="requirement_tls"></a> [tls](#requirement\_tls) | >= 4.0 |

## Providers

| Name | Version |
|------|---------|
| <a name="provider_aws"></a> [aws](#provider\_aws) | >= 5.13.1 |

## Modules

| Name | Source | Version |
|------|--------|---------|
| <a name="module_labels"></a> [labels](#module\_labels) | git@github.com:slovink/terraform-aws-labels.git | v1.0.0 |

## Resources

| Name | Type |
|------|------|
| [aws_customer_gateway.main](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/customer_gateway) | resource |
| [aws_vpn_connection.default](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/vpn_connection) | resource |
| [aws_vpn_connection_route.default](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/vpn_connection_route) | resource |
| [aws_vpn_gateway.vpn](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/vpn_gateway) | resource |
| [aws_vpn_gateway_attachment.default](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/vpn_gateway_attachment) | resource |
| [aws_vpn_gateway_route_propagation.private_subnets_vpn_routing](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/vpn_gateway_route_propagation) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_bgp_asn"></a> [bgp\_asn](#input\_bgp\_asn) | The gateway's Border Gateway Protocol (BGP) Autonomous System Number (ASN). | `number` | `65000` | no |
| <a name="input_certificate_arn"></a> [certificate\_arn](#input\_certificate\_arn) | certificate\_arn (e.g. ''). | `string` | `""` | no |
| <a name="input_create_virtual_private_gateway"></a> [create\_virtual\_private\_gateway](#input\_create\_virtual\_private\_gateway) | Set this to false to use existing Virtual Private Gateway(vgw) and prevent creation of vgw | `bool` | `true` | no |
| <a name="input_customer_ip_address"></a> [customer\_ip\_address](#input\_customer\_ip\_address) | The IP of the Customer Gateway. | `string` | n/a | yes |
| <a name="input_enable_vpn_connection"></a> [enable\_vpn\_connection](#input\_enable\_vpn\_connection) | Set to false to prevent the creation of a VPN Connection. | `bool` | `true` | no |
| <a name="input_enable_vpn_gateway_attachment"></a> [enable\_vpn\_gateway\_attachment](#input\_enable\_vpn\_gateway\_attachment) | Set to false to prevent attachment of the vGW to the VPC. | `bool` | `true` | no |
| <a name="input_environment"></a> [environment](#input\_environment) | Environment (e.g. `prod`, `dev`, `staging`). | `string` | `""` | no |
| <a name="input_label_order"></a> [label\_order](#input\_label\_order) | Label order, e.g. `name`,`application`. | `list(any)` | <pre>[<br>  "environment",<br>  "name"<br>]</pre> | no |
| <a name="input_local_ipv4_network_cidr"></a> [local\_ipv4\_network\_cidr](#input\_local\_ipv4\_network\_cidr) | n/a | `string` | `"0.0.0.0/0"` | no |
| <a name="input_local_ipv6_network_cidr"></a> [local\_ipv6\_network\_cidr](#input\_local\_ipv6\_network\_cidr) | (Optional) The IPv6 CIDR on the customer gateway (on-premises) side of the VPN connection. | `string` | `null` | no |
| <a name="input_managedby"></a> [managedby](#input\_managedby) | ManagedBy, eg 'slovink' | `string` | `""` | no |
| <a name="input_name"></a> [name](#input\_name) | Name  (e.g. `app` or `cluster`). | `string` | `""` | no |
| <a name="input_remote_ipv4_network_cidr"></a> [remote\_ipv4\_network\_cidr](#input\_remote\_ipv4\_network\_cidr) | n/a | `string` | `"0.0.0.0/0"` | no |
| <a name="input_remote_ipv6_network_cidr"></a> [remote\_ipv6\_network\_cidr](#input\_remote\_ipv6\_network\_cidr) | (Optional) The IPv6 CIDR on AWS side of the VPN connection. | `string` | `null` | no |
| <a name="input_transit_gateway_id"></a> [transit\_gateway\_id](#input\_transit\_gateway\_id) | The ID of the Transit Gateway. | `string` | `null` | no |
| <a name="input_tunnel1_dpd_timeout_action"></a> [tunnel1\_dpd\_timeout\_action](#input\_tunnel1\_dpd\_timeout\_action) | (Optional, Default clear) The action to take after DPD timeout occurs for the first VPN tunnel. Specify restart to restart the IKE initiation. Specify clear to end the IKE session. Valid values are clear \| none \| restart. | `string` | `"none"` | no |
| <a name="input_tunnel1_dpd_timeout_seconds"></a> [tunnel1\_dpd\_timeout\_seconds](#input\_tunnel1\_dpd\_timeout\_seconds) | (Optional, Default 30) The number of seconds after which a DPD timeout occurs for the first VPN tunnel. Valid value is equal or higher than 30 | `number` | `null` | no |
| <a name="input_tunnel1_enable_tunnel_lifecycle_control"></a> [tunnel1\_enable\_tunnel\_lifecycle\_control](#input\_tunnel1\_enable\_tunnel\_lifecycle\_control) | (Optional) Turn on or off tunnel endpoint lifecycle control feature for the first VPN tunnel. Valid values are true \| false | `bool` | `null` | no |
| <a name="input_tunnel1_ike_versions"></a> [tunnel1\_ike\_versions](#input\_tunnel1\_ike\_versions) | (Optional) The IKE versions that are permitted for the first VPN tunnel. Valid values are ikev1 \| ikev2. | `list(string)` | `null` | no |
| <a name="input_tunnel1_inside_cidr"></a> [tunnel1\_inside\_cidr](#input\_tunnel1\_inside\_cidr) | The CIDR block of the inside IP addresses for the first VPN tunnel. | `string` | `"169.254.33.88/30"` | no |
| <a name="input_tunnel1_log_options"></a> [tunnel1\_log\_options](#input\_tunnel1\_log\_options) | (Optional) Options for sending VPN tunnel logs to CloudWatch. | `any` | `{}` | no |
| <a name="input_tunnel1_phase1_dh_group_numbers"></a> [tunnel1\_phase1\_dh\_group\_numbers](#input\_tunnel1\_phase1\_dh\_group\_numbers) | (Optional) List of one or more Diffie-Hellman group numbers that are permitted for the first VPN tunnel for phase 1 IKE negotiations. Valid values are 2 \| 14 \| 15 \| 16 \| 17 \| 18 \| 19 \| 20 \| 21 \| 22 \| 23 \| 24. | `list(number)` | `null` | no |
| <a name="input_tunnel1_phase1_encryption_algorithms"></a> [tunnel1\_phase1\_encryption\_algorithms](#input\_tunnel1\_phase1\_encryption\_algorithms) | (Optional) List of one or more encryption algorithms that are permitted for the first VPN tunnel for phase 1 IKE negotiations. Valid values are AES128 \| AES256 \| AES128-GCM-16 \| AES256-GCM-16. | `list(string)` | `null` | no |
| <a name="input_tunnel1_phase1_integrity_algorithms"></a> [tunnel1\_phase1\_integrity\_algorithms](#input\_tunnel1\_phase1\_integrity\_algorithms) | Optional) One or more integrity algorithms that are permitted for the first VPN tunnel for phase 1 IKE negotiations. Valid values are SHA1 \| SHA2-256 \| SHA2-384 \| SHA2-512. | `list(string)` | <pre>[<br>  "SHA1"<br>]</pre> | no |
| <a name="input_tunnel1_phase1_lifetime_seconds"></a> [tunnel1\_phase1\_lifetime\_seconds](#input\_tunnel1\_phase1\_lifetime\_seconds) | (Optional, Default 28800) The lifetime for phase 1 of the IKE negotiation for the first VPN tunnel, in seconds. Valid value is between 900 and 28800 | `number` | `null` | no |
| <a name="input_tunnel1_phase2_dh_group_numbers"></a> [tunnel1\_phase2\_dh\_group\_numbers](#input\_tunnel1\_phase2\_dh\_group\_numbers) | (Optional) List of one or more Diffie-Hellman group numbers that are permitted for the first VPN tunnel for phase 2 IKE negotiations. Valid values are 2 \| 5 \| 14 \| 15 \| 16 \| 17 \| 18 \| 19 \| 20 \| 21 \| 22 \| 23 \| 24 | `list(number)` | `null` | no |
| <a name="input_tunnel1_phase2_encryption_algorithms"></a> [tunnel1\_phase2\_encryption\_algorithms](#input\_tunnel1\_phase2\_encryption\_algorithms) | (Optional) List of one or more encryption algorithms that are permitted for the first VPN tunnel for phase 1 IKE negotiations. Valid values are AES128 \| AES256 \| AES128-GCM-16 \| AES256-GCM-16. | `list(string)` | `null` | no |
| <a name="input_tunnel1_phase2_integrity_algorithms"></a> [tunnel1\_phase2\_integrity\_algorithms](#input\_tunnel1\_phase2\_integrity\_algorithms) | Optional) One or more integrity algorithms that are permitted for the first VPN tunnel for phase 1 IKE negotiations. Valid values are SHA1 \| SHA2-256 \| SHA2-384 \| SHA2-512. | `list(string)` | <pre>[<br>  "SHA1"<br>]</pre> | no |
| <a name="input_tunnel1_phase2_lifetime_seconds"></a> [tunnel1\_phase2\_lifetime\_seconds](#input\_tunnel1\_phase2\_lifetime\_seconds) | (Optional, Default 3600) The lifetime for phase 2 of the IKE negotiation for the first VPN tunnel, in seconds. Valid value is between 900 and 3600 | `number` | `null` | no |
| <a name="input_tunnel1_preshared_key"></a> [tunnel1\_preshared\_key](#input\_tunnel1\_preshared\_key) | The preshared key of the first VPN tunnel. | `string` | `"123456789"` | no |
| <a name="input_tunnel1_rekey_fuzz_percentage"></a> [tunnel1\_rekey\_fuzz\_percentage](#input\_tunnel1\_rekey\_fuzz\_percentage) | (Optional, Default 100) The percentage of the rekey window for the first VPN tunnel (determined by tunnel1\_rekey\_margin\_time\_seconds) during which the rekey time is randomly selected. Valid value is between 0 and 100 | `number` | `null` | no |
| <a name="input_tunnel1_rekey_margin_time_seconds"></a> [tunnel1\_rekey\_margin\_time\_seconds](#input\_tunnel1\_rekey\_margin\_time\_seconds) | (Optional, Default 540) The margin time, in seconds, before the phase 2 lifetime expires, during which the AWS side of the first VPN connection performs an IKE rekey. The exact time of the rekey is randomly selected based on the value for tunnel1\_rekey\_fuzz\_percentage. Valid value is between 60 and half of tunnel1\_phase2\_lifetime\_seconds | `number` | `null` | no |
| <a name="input_tunnel1_replay_window_size"></a> [tunnel1\_replay\_window\_size](#input\_tunnel1\_replay\_window\_size) | (Optional, Default 1024) The number of packets in an IKE replay window for the first VPN tunnel. Valid value is between 64 and 2048. | `number` | `null` | no |
| <a name="input_tunnel1_startup_action"></a> [tunnel1\_startup\_action](#input\_tunnel1\_startup\_action) | (Optional, Default clear) The action to take after DPD timeout occurs for the first VPN tunnel. Specify restart to restart the IKE initiation. Specify clear to end the IKE session. Valid values are clear \| none \| restart. | `string` | `"add"` | no |
| <a name="input_tunnel2_dpd_timeout_action"></a> [tunnel2\_dpd\_timeout\_action](#input\_tunnel2\_dpd\_timeout\_action) | (Optional, Default clear) The action to take after DPD timeout occurs for the second VPN tunnel. Specify restart to restart the IKE initiation. Specify clear to end the IKE session. Valid values are clear \| none \| restart | `string` | `null` | no |
| <a name="input_tunnel2_enable_tunnel_lifecycle_control"></a> [tunnel2\_enable\_tunnel\_lifecycle\_control](#input\_tunnel2\_enable\_tunnel\_lifecycle\_control) | (Optional) Turn on or off tunnel endpoint lifecycle control feature for the second VPN tunnel. Valid values are true \| false | `bool` | `null` | no |
| <a name="input_tunnel2_ike_versions"></a> [tunnel2\_ike\_versions](#input\_tunnel2\_ike\_versions) | (Optional) The IKE versions that are permitted for the second VPN tunnel. Valid values are ikev1 \| ikev2 | `list(string)` | `null` | no |
| <a name="input_tunnel2_inside_cidr"></a> [tunnel2\_inside\_cidr](#input\_tunnel2\_inside\_cidr) | The CIDR block of the inside IP addresses for the second VPN tunnel. | `string` | `""` | no |
| <a name="input_tunnel2_log_options"></a> [tunnel2\_log\_options](#input\_tunnel2\_log\_options) | (Optional) Options for sending VPN tunnel logs to CloudWatch. | `any` | `{}` | no |
| <a name="input_tunnel2_phase1_dh_group_numbers"></a> [tunnel2\_phase1\_dh\_group\_numbers](#input\_tunnel2\_phase1\_dh\_group\_numbers) | (Optional) List of one or more Diffie-Hellman group numbers that are permitted for the second VPN tunnel for phase 1 IKE negotiations. Valid values are 2 \| 14 \| 15 \| 16 \| 17 \| 18 \| 19 \| 20 \| 21 \| 22 \| 23 \| 24 | `list(number)` | `null` | no |
| <a name="input_tunnel2_phase1_encryption_algorithms"></a> [tunnel2\_phase1\_encryption\_algorithms](#input\_tunnel2\_phase1\_encryption\_algorithms) | (Optional) List of one or more encryption algorithms that are permitted for the first VPN tunnel for phase 1 IKE negotiations. Valid values are AES128 \| AES256 \| AES128-GCM-16 \| AES256-GCM-16. | `list(string)` | `null` | no |
| <a name="input_tunnel2_phase1_integrity_algorithms"></a> [tunnel2\_phase1\_integrity\_algorithms](#input\_tunnel2\_phase1\_integrity\_algorithms) | Optional) One or more integrity algorithms that are permitted for the first VPN tunnel for phase 1 IKE negotiations. Valid values are SHA1 \| SHA2-256 \| SHA2-384 \| SHA2-512. | `list(string)` | <pre>[<br>  "SHA1"<br>]</pre> | no |
| <a name="input_tunnel2_phase2_dh_group_numbers"></a> [tunnel2\_phase2\_dh\_group\_numbers](#input\_tunnel2\_phase2\_dh\_group\_numbers) | (Optional) List of one or more Diffie-Hellman group numbers that are permitted for the second VPN tunnel for phase 2 IKE negotiations. Valid values are 2 \| 5 \| 14 \| 15 \| 16 \| 17 \| 18 \| 19 \| 20 \| 21 \| 22 \| 23 \| 24 | `list(number)` | `null` | no |
| <a name="input_tunnel2_phase2_encryption_algorithms"></a> [tunnel2\_phase2\_encryption\_algorithms](#input\_tunnel2\_phase2\_encryption\_algorithms) | (Optional) List of one or more encryption algorithms that are permitted for the first VPN tunnel for phase 1 IKE negotiations. Valid values are AES128 \| AES256 \| AES128-GCM-16 \| AES256-GCM-16. | `list(string)` | `null` | no |
| <a name="input_tunnel2_phase2_integrity_algorithms"></a> [tunnel2\_phase2\_integrity\_algorithms](#input\_tunnel2\_phase2\_integrity\_algorithms) | (Optional) List of one or more integrity algorithms that are permitted for the second VPN tunnel for phase 2 IKE negotiations. Valid values are SHA1 \| SHA2-256 \| SHA2-384 \| SHA2-512 | `list(string)` | `null` | no |
| <a name="input_tunnel2_phase2_lifetime_seconds"></a> [tunnel2\_phase2\_lifetime\_seconds](#input\_tunnel2\_phase2\_lifetime\_seconds) | (Optional, Default 3600) The lifetime for phase 2 of the IKE negotiation for the second VPN tunnel, in seconds. Valid value is between 900 and 3600 | `number` | `null` | no |
| <a name="input_tunnel2_preshared_key"></a> [tunnel2\_preshared\_key](#input\_tunnel2\_preshared\_key) | The preshared key of the second VPN tunnel. | `string` | `""` | no |
| <a name="input_tunnel2_rekey_fuzz_percentage"></a> [tunnel2\_rekey\_fuzz\_percentage](#input\_tunnel2\_rekey\_fuzz\_percentage) | (Optional, Default 100) The percentage of the rekey window for the second VPN tunnel (determined by tunnel1\_rekey\_margin\_time\_seconds) during which the rekey time is randomly selected. Valid value is between 0 and 100 | `number` | `null` | no |
| <a name="input_tunnel2_rekey_margin_time_seconds"></a> [tunnel2\_rekey\_margin\_time\_seconds](#input\_tunnel2\_rekey\_margin\_time\_seconds) | (Optional, Default 540) The margin time, in seconds, before the phase 2 lifetime expires, during which the AWS side of the second VPN connection performs an IKE rekey. The exact time of the rekey is randomly selected based on the value for tunnel2\_rekey\_fuzz\_percentage. Valid value is between 60 and half of tunnel2\_phase2\_lifetime\_seconds | `number` | `null` | no |
| <a name="input_tunnel2_replay_window_size"></a> [tunnel2\_replay\_window\_size](#input\_tunnel2\_replay\_window\_size) | (Optional, Default 1024) The number of packets in an IKE replay window for the second VPN tunnel. Valid value is between 64 and 2048. | `number` | `null` | no |
| <a name="input_tunnel2_startup_action"></a> [tunnel2\_startup\_action](#input\_tunnel2\_startup\_action) | (Optional, Default add) The action to take when the establishing the tunnel for the second VPN connection. By default, your customer gateway device must initiate the IKE negotiation and bring up the tunnel. Specify start for AWS to initiate the IKE negotiation. Valid values are add \| start | `string` | `null` | no |
| <a name="input_tunnel_inside_ip_version"></a> [tunnel\_inside\_ip\_version](#input\_tunnel\_inside\_ip\_version) | (Optional) Indicate whether the VPN tunnels process IPv4 or IPv6 traffic. Valid values are ipv4 \| ipv6. ipv6 Supports only EC2 Transit Gateway. | `string` | `"ipv4"` | no |
| <a name="input_virtual_private_gateway_id"></a> [virtual\_private\_gateway\_id](#input\_virtual\_private\_gateway\_id) | Provide id of existing Virtual Private Gateway | `string` | `null` | no |
| <a name="input_vpc_id"></a> [vpc\_id](#input\_vpc\_id) | The id of the VPC where the VPN Gateway lives. | `string` | n/a | yes |
| <a name="input_vpc_subnet_route_table_count"></a> [vpc\_subnet\_route\_table\_count](#input\_vpc\_subnet\_route\_table\_count) | The number of subnet route table ids being passed in via `vpc_subnet_route_table_ids`. | `string` | `0` | no |
| <a name="input_vpc_subnet_route_table_ids"></a> [vpc\_subnet\_route\_table\_ids](#input\_vpc\_subnet\_route\_table\_ids) | The ids of the VPC subnets for which routes from the VPN Gateway will be propagated. | `list(string)` | `[]` | no |
| <a name="input_vpn_connection_static_routes_destinations"></a> [vpn\_connection\_static\_routes\_destinations](#input\_vpn\_connection\_static\_routes\_destinations) | List of CIDRs to be used as destination for static routes (used with `vpn_connection_static_routes_only = true`). Routes to destinations set here will be propagated to the routing tables of the subnets defined in `vpc_subnet_route_table_ids`. | `list(string)` | `[]` | no |
| <a name="input_vpn_connection_static_routes_only"></a> [vpn\_connection\_static\_routes\_only](#input\_vpn\_connection\_static\_routes\_only) | Set to true for the enabled VPN connection to use static routes exclusively (only if `enable_vpn_connection = true`). Static routes must be used for devices that don't support BGP. | `bool` | `true` | no |
| <a name="input_vpn_connection_type"></a> [vpn\_connection\_type](#input\_vpn\_connection\_type) | The type of VPN connection. The only type AWS supports at this time is 'ipsec.1'. | `string` | `"ipsec.1"` | no |
| <a name="input_vpn_gateway_amazon_side_asn"></a> [vpn\_gateway\_amazon\_side\_asn](#input\_vpn\_gateway\_amazon\_side\_asn) | The Autonomous System Number (ASN) for the Amazon side of the VPN gateway. If you don't specify an ASN, the Virtual Private Gateway is created with the default ASN | `number` | `64512` | no |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_customer_gateway_id"></a> [customer\_gateway\_id](#output\_customer\_gateway\_id) | The ID of the VPN Connection Route. |
| <a name="output_gateway_attachment_id"></a> [gateway\_attachment\_id](#output\_gateway\_attachment\_id) | The ID of the Gateway Attachment. |
| <a name="output_tags"></a> [tags](#output\_tags) | A mapping of tags to assign to the resource. |
| <a name="output_vpn_connection_id"></a> [vpn\_connection\_id](#output\_vpn\_connection\_id) | The ID of the VPN Connection. |
| <a name="output_vpn_connection_tunnel1_address"></a> [vpn\_connection\_tunnel1\_address](#output\_vpn\_connection\_tunnel1\_address) | A list with the the public IP address of the first VPN tunnel if `create_vpn_connection = true`, or empty otherwise |
| <a name="output_vpn_connection_tunnel1_cgw_inside_address"></a> [vpn\_connection\_tunnel1\_cgw\_inside\_address](#output\_vpn\_connection\_tunnel1\_cgw\_inside\_address) | A list with the the RFC 6890 link-local address of the first VPN tunnel (Customer Gateway Side) if `create_vpn_connection = true`, or empty otherwise |
| <a name="output_vpn_gateway_id"></a> [vpn\_gateway\_id](#output\_vpn\_gateway\_id) | The ID of the VPN gateway. |
<!-- END_TF_DOCS -->