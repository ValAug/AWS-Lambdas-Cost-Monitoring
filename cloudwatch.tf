

resource "aws_cloudwatch_dashboard" "lambda_cost_dashboard" {
  dashboard_name = "LambdaCostDashboard"
  dashboard_body = jsonencode({
    widgets = [
      {
        type = "metric",
        x = 0,
        y = 0,
        width = 24,
        height = 6,
        properties = {
          metrics = [
            ["AWS/Lambda", "Duration", "FunctionName", "${aws_lambda_function.my_lambda.function_name}"],  # Reemplaza con el nombre de tu función Lambda
            ["AWS/Lambda", "Cost", "FunctionName", "${aws_lambda_function.my_lambda.function_name }"]
          ],
          title = "Costos y Duración de Lambda",
          period = 300,
          stat = "Average",
          view = "timeSeries",
          region = "us-east-1"
        }
      }
    ]
  })
}

resource "aws_cloudwatch_metric_alarm" "lambda_cost_alarm" {
  alarm_name          = "HighLambdaCost"
  comparison_operator = "GreaterThanThreshold"
  evaluation_periods  = "15"
  datapoints_to_alarm = "15"
  metric_name        = "Duration"
  namespace          = "AWS/Lambda"
  period             = "60"
  statistic          = "Average"
  threshold          = "25000"  # Cambia este umbral según tus necesidades
  treat_missing_data = "missing"
  dimensions = {
    FunctionName = "${aws_lambda_function.my_lambda.function_name }"  # Reemplaza con el nombre de tu función Lambda
  }

  alarm_description = "Alarma para costos altos de Lambda"
  alarm_actions     = [aws_sns_topic.lambda_cost_notifications.arn]
  insufficient_data_actions = []
}