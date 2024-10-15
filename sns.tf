

resource "aws_sns_topic" "lambda_cost_notifications" {
  name = "LambdaCostNotifications"
}

resource "aws_sns_topic_subscription" "lambda_cost_subscription" {
  topic_arn = aws_sns_topic.lambda_cost_notifications.arn
  protocol  = "email"
  endpoint  = "tu_email@example.com"  # Reemplaza con tu dirección de correo electrónico
}