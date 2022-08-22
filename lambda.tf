# Zip the lambda code
data "archive_file" "IAM_Lookup" {
  type        = "zip"
  source_dir  = "lambda_code/IAM_Lookup/"
  output_path = "output_lambda_zip/IAM_Lookup/IAM_Lookup.zip"
}

# Create lambda function
resource "aws_lambda_function" "IAM_Lookup" {
  filename      = data.archive_file.IAM_Lookup.output_path
  function_name = "IAM_Lookup"
  role          = aws_iam_role.role.arn
  handler       = "main_handler.lambda_handler"
  description   = "IAM Users Lookup"
  tags          = { Name = "${var.name-prefix}-lambda" }

  # Prevent lambda recreation
  source_code_hash = filebase64sha256(data.archive_file.IAM_Lookup.output_path)

  runtime = "python3.9"
  timeout = "120"
}