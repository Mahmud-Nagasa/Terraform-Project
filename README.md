# Terraform-Project

This project uses the Infrastructure as Code tool known as Terraform it creates a module that will build 3 instances, each running an nginx web server which displays a custom HTML file. Each one of the three instances is in an availability zone in the (eu-west-2) region. The module also allows the use of an autoscaling group to create its own instances and maintain the desired number to provide a robust and fault-tolerant infrastructure. The next section will discuss the module in detail with the available inputs.

## Modules

In the root directory, the main file has 5 module blocks, each referring to the corresponding module directory:

1. The first step to create this infrastructure is to build a VPC in the desired region with 3 public subnets, each in its own availability zone, to have access to the instances that will be launched later on in these subnets, we need to associate the public subnets with an internet gateway in a route table. Therefore the previous variables are set by default and can be overridden by the user, which are listed as:

  - VPC name
  - VPC CIDR
  - Public subnets
  - Private subnets
  - Availability zones

2. The Security group block creates ingress and egress rules to enable traffic in and out of the instances. By default, it allows SSH to my private IP (which will change dynamically to the user's own IP using my_private_ip.tf file), HTTP and HTTPS. The following variables can be overridden:

  - security group name
  - ingress rules
  - egress rules

Note that the vpc_id will, by default, refer to the previously created vpc

3. The EC2 instances block, creates 3 instances based on the number of the public subnets to ensure each subnet has one instance, the instance type and AMI are set to t2.micro and (Ubuntu Server 22.04 LTS (HVM), SSD Volume Type (64-bit (x86))) by default, finally the instances are using the previously created SG to route traffic. It also has the boolean to activate the auto-scaling group, but we will get to that at the end. The variables that can be changed are as follows:

  - ami
  - instance_type
  - key

Note that each instance installs Nginx and adjust the HTML to display a custom message

  - user_data, which has a path to the tpl file with the instructions to run Nginx

4. ALB block (application load balancer), as a design for failure and distribute the traffic (HTTP request) among the EC2 instances. Therefore, it needs to connect to the previous (SG, VPC, and EC2 IDs). This module also has the boolean for the auto-scaling group, which will be cleared in the next part. The following inputs can be changed:

  - alb_name (the application load balancer name)
  - target_group_name

5. Finally, the last part is adding the auto-scaling group to launch a desired number of instances and automatically launch a replacement in case of failure to keep the minimum number of EC2s. This auto scalier was set to use the same AMI, instance type, key, and user data script. it connects to the same vpc and subnets with SG and ALB. In other words, the difference between the instance made by the auto scaler and the manually created one is that the auto scaler will have an eye on its instance and manage it in case of failure. Furthermore, the autoscaling boolean, if set to true, the module will only create instances using the auto-scaling group. If it was set to false, it will create them manually and turn off the autoscaling group, leaving the option to the user. Finally these are the variables that can be changed:

  - desired_capacity
  - max_size
  - min_size
  - auto_scaling_group