
resource "aws_kms_key" "Sqs_queue_key" {
  description             = "KMS key sns and sqs"
  deletion_window_in_days = 10
}

resource "aws_sqs_queue" "terraform_queue" {
  name                              = "terraform-example-queue"
  //kms_master_key_id                 = "alias/aws/sqs"
  kms_data_key_reuse_period_seconds = 300
}