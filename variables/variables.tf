variable "ami_id" {
    type = string
    default= "ami-09c813fb71547fc4f"
    description = "ami id of string"

}

variable "instance_type" {
    default = "t3.micro"
}

variable "ec2-tags"{
    type = map(string)
    default = {
    Name =  "HelloWorld"
    purpose = "variables demo"
    }
}
variable "sg_name" {
    default= "allow all1" 
}
variable "sg_desc" {
    default= "allowing all1 ports from internet"
}
variable "from_port" {
    default = 0
}
variable "to_port" {
    type =number
    default = 0
}
variable "cidr_blocks" {
    type =list(string)
    default =  ["0.0.0.0/0"]
}
variable "sg_tags" {
    default = {
        Name = "allow all1"
    } 
}
