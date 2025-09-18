## Set up a VPC with an Internet gateway
### create a public subnet with 256 IP addresses 
### a private subnet with 256 IP addresses, make a route table connecting the Internet gateway and the subnets
### launch a Linux EC2 instance by using the above VPC and public subnet.

1.Created a VPC (AWS-Task2-vpc) with CIDR (10.0.0.0/16) \n
2.Created a public subnet(AWS-Task2-subnet-public1) with CIDR(10.0.1.0/24) \n
3.Created a private subnet (AWS-Task2-subnet-private1)with CIDR (10.0.0.0/24) \n
4.Created a internet gateway (AWS-Task2-igw) in public subnet.
5.Created a secuirty group called AWS-Task2-secuirtygroup under AWS-Task2-vpc, icmp/port 22 is allowed.
6.Launched a instance sucessfully with public subnet and enabled public IP also associated AWS-Task2-secuirtygroup.

