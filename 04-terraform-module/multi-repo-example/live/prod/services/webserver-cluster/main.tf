teraform {
  required_version = ">= 0.12"
}

provider "aws" {
  region = "us-east-2"
}

module "webserver_cluster" {
  source = "github.com/brikis98/terraform-up-and-running-code//code/terraform/04-terraform-module/module-example/modules/services/webserver-cluster?ref=v0.1.0"

  cluster_name = var.cluster_name
  db_remote_state_bucket = var.db_remote_state_bucket
  db_remote_state_key = var.db_remote_state_key

  instance_type = "m4.large"
  min_size = 2
  max_size = 10
}

resource "aws_autoscaling_schdule" "scale_out_during_business_hours" {
  scheduled_action_name - "scale-out-during-business-hours"
  min_size = 2
  max_size = 10
  desired_capacity = 10
  reccurence = "0 9 * * *"
  autoscaling_group_name = module.webserver_cluster.asg_name
}

resource "aws_autoscaling_schedule" "scale-in-at-night" {
  scheduled_action_name = "scale-in-at-night"
  min_size = 2
  max_size = 10
  desired_capacity = 2
  reccurence = "0 17 * * *"
  autoscaling_group_name = module.webserver_cluster.asg_name
}