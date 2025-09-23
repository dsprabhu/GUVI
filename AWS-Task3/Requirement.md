## Task Description:

### 1.Create a S3 bucket, with no public access and upload files to the bucket & view the logs using cloudwatch for the uploaded files. <br>

### 2.Launch two ec2-instances and connect it to a application load balancer, where the output traffic from the server must be an load balancer IP <br>

#### S3 bucket creation with no public access 

1. Created S3 bucket , named aws-task3-s3-23aug2025 (AWS-Task3-S3-1.jpg).
2. created server access loggoing in s3(AWS-Task3-S3-1.jpg).
2. uploaded the file windows-systeminfo.jpg in aws-task3-s3-23aug2025 s3 bucket (AWS-Task3-S3-2.jpg)
3. Not enabled public access (AWS-Task3-S3-3.jpg)

As by default S3 doesn't generate logs into cloudwatch. please elaborate the log access part in the cloudwatch

### Application load balancer
1. created two ec2 instances with public IP (webserver-1,webserver-2) AWS-Task3-LB-1.jpg, AWS-Task3-LB-2.jpg
2. while creating select 2 diffrent subnet for 2 servers, for example us-east-1a and us-east-1b with specific security group (allow port 22 and 80).
3. create a targetgroup for loadbalancer (AWS-Task3-LB-targetgroup.jpg) and registered 2 servers in AWS-Task3-LB-targetgroup.
4. create a application load balancer with target group name AWS=Task3-LB-targetgroup (AWS-Task3-LB-applicationLB.jpg) with same sercurity group.
5. lets wait for active in application loadbalancer AWS-Task3-LB-applicationLB-active.jpg
6. finally you can check using loadbalancer url (AWS-Task3-LB-LB1 and AWS-Task3-LB-LB2).
