variable "database-rds" {
  default = {
    postgres = "rpmy8$QDY"
  }
  type = map(string)
}

resource "aws_secretsmanager_secret" "database-rds" {
  name        = "databae-rds"
  description = "RDS database credentials"
}

resource "aws_secretsmanager_secret_version" "database-rds" {
  secret_id     = aws_secretsmanager_secret.database-rds.id
  secret_string = jsonencode(var.database-rds)
}
