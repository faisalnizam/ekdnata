region = "eu-west-1"

environment = "dev"

key_name = "iacfaisal"

name = "dev"

application = "graphite"

ami_id = "ami-9bf712f4"

instance_type = "m4.xlarge"

count = 5

device_name = "sdx"

key_name = "next"

public_subnet_id = [""]

private_subnet_id = "subnet-a2474ffa"

archive_link = "https://github.com/faisalnizam/ekdnata/archive/master.zip" 

 graphite = {
        extra_user_data = ""
}                             

file_name = "graphite.tpl"   
