## Deploy a simple web application using AWS code commit, code build and deploy & access via browser and automate via codepipeline.
### Step 1: Create a GitHub Repository
https://github.com/dsprabhu/simple-html-app.git

### Step 2: Launch an ec2 instance in Mumbai region and install codedeploy agent

### Install CodeDeploy Agent
sudo apt update -y 
sudo apt install -y ruby-full wget curl 
cd /home/ubuntu 
wget https://aws-codedeploy-ap-south-1.s3.ap-south-1.amazonaws.com/latest/install 
chmod +x install 
sudo ./install auto 
sudo systemctl enable codedeploy-agent 
sudo systemctl start codedeploy-agent 
sudo systemctl status codedeploy-agent

### Step 3: create a role for EC2 instance (create role)
select "use case" -> EC2

Add permissions --> AWSCodeDeployRole and AmzonS3readonlyaccess
Role name: RoleForEC2codeDeploy
Create role.

### Step4: Attach a role "RoleForEC2codeDeploy" to EC2 instance which we created.
EC2 -> instance - modify IAM role ->RoleforEC2codeDeploy.

### Step5: create repositories 
Developer Tools -->codeCommit->sourece-->repositoryes-->create repository
repositoryname: simple-html-web -->create.

### Step6: Create user "userforcodecommite"
permission: attaché policy directly --> give 2 permission {AWSCodeCommiteFullAccess, IAMfullaccess}

create credienal for user "userforcodecommite"
security credential - > HTTPS Git Credentials for AWS codecommit" -->generate credential.


### step7:

go to cloud shell for Mumbai region and git clone.

$git clone https://git-codecommit.ap-south-1.amazonaws.com/v1/repos/simple-html-app   (clone the url from code commite repo)

provide username and password

$ cd simple-html-app
copy files from GitHub repo and commite it.

git config --global user.email "samprabhu@gmail.com"
git config --global user.name "prabhu"

### step8:  code deploy 
go to code deploy , create application and application group
Crate application
application name: mywebapp
compute plateform: ec2/on-premise.
deployment groupname: mywebappgroup
service role:CodeDeployEC2Role (search in box)
Deployment type: in=place
Environment configuraiotn:amazon ec2 instances {select tag}
key:name
value:codecommite

Load balancer: disable
Create deployment group.

### step 9: create codepipeline

developer toots > codepipeline

create pipeline  -->category -->Build custom pipeline
pipeline settings:
	pipeline name: myhtmlpipeline
Add source stage:
	source:
		source provider: AWS codecommit
		Repository name: simple-html-app
		Branch name: master
Build - optional
commands -> pwd

Deploy provider: AWS CodeDeploy
Applicationname: mywebapp
Deployment group: mywebappgroup

Create pipleline

### step10: if require restart deployment agent in ec2 instance

 


