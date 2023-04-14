resource "aws_kms_key" "Sns_Sqs_key" {
  description             = "KMS key sns and sqs"
  deletion_window_in_days = 15
}

output "key_id" {
  value= aws_kms_key.Sns_Sqs_key.*
}

resource "aws_sns_topic" "sns_topic" {
  name              = "first-SNS-topic-1"
  /*kms_master_key_id = "alias/aws/sns"*/
  kms_master_key_id = "${aws_kms_key.Sns_Sqs_key.key_id}"
}

output "sns_output" {
  value= aws_sns_topic.sns_topic.*
}