## GCP Project vars
project_id = "prj-spoke-002"
project_name = "prj-spoke-002"
primary_region = "europe-west2"
billing_account_id = "018E2D-A0EC61-C2C865"
organization_id = "706581358019"


## VPC vars
vpc_name = "spoke-svpc-02"
subnet_cidr_01 = "10.10.30.0/24"
subnet_cidr_02 = "10.10.40.0/22"

## PSC vars
service_attachment_name = "psc-service-attachment"
producer_forwarding_rule_name = "producer-forwarding-rule"
producer_forwarding_rule_ip_address = "10.10.30.2"
producer_backend_service_name = "producer-backend-service"
producer_health_check_name = "producer-service-health-check"
# domain_names = ["test.psc."]
private_zone_name = "psc-producer-zone"
private_zone_dns_name = "producer.psc."
private_zone_a_record = "service"

