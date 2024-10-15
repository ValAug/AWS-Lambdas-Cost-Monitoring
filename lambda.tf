

data "archive_file" "dumb_code" {
  type = "zip"
  output_path = "dumbcode.zip"
  source_file = "dumb.py"
}


resource "aws_lambda_function" "my_lambda" {
  function_name = "MyLambdaFunction"
  filename      = "dumbcode.zip"
  source_code_hash = data.archive_file.dumb_code.output_base64sha256
  handler       = "dumbcode.handler"
  runtime       = "python3.12"
  memory_size   = 512
  timeout       = 30
  role          = aws_iam_role.lambda_exec.arn
}

resource "aws_iam_role" "lambda_exec" {
  name = "lambda_exec_role"

  assume_role_policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Action = "sts:AssumeRole"
        Principal = {
          Service = "lambda.amazonaws.com"
        }
        Effect = "Allow"
      },
    ]
  })
}

resource "aws_iam_policy" "lambda_cloudwatch_sns_policy" {
  name        = "LambdaCloudWatchSNSPolicy"
  description = "Policy to allow CloudWatch and SNS access for Lambda function"

  policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Effect = "Allow"
        Action = [
          "logs:CreateLogGroup",
          "logs:CreateLogStream",
          "logs:PutLogEvents",
          "cloudwatch:PutMetricData",
          "sns:Publish"
        ]
        Resource = "*"
      }
    ]
  })
}

resource "aws_iam_policy_attachment" "lambda_policy_attach" {
  name       = "lambda_policy_attach"
  roles      = [aws_iam_role.lambda_exec.name]
  policy_arn = "arn:aws:iam::aws:policy/service-role/AWSLambdaBasicExecutionRole"
}

resource "aws_iam_policy_attachment" "lambda_cloudwatch_sns_attach" {
  name       = "LambdaCloudWatchSNSAttach"
  roles      = [aws_iam_role.lambda_exec.name]
  policy_arn = aws_iam_policy.lambda_cloudwatch_sns_policy.arn
}
