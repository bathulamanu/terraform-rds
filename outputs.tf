output "endpoints" {

  value = {

    for k, v in aws_db_instance.postgres :

    k => v.endpoint

  }

}
