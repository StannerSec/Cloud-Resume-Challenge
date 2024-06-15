# Cloud Resume Challenge - AWS

## Overview

The Cloud Resume Project is a hands-on initiative designed to help individuals build and showcase their cloud computing skills through the creation of a professional resume website hosted on the cloud. This project provides a practical and tangible way for participants to demonstrate their expertise in cloud technologies and gain valuable experience in deploying and managing web applications.

## Architecture

![image](https://github.com/stanner834/Cloud-Resume-Challenge/assets/147266927/9718b92f-f96b-45ab-b9c1-caad959d4e89)

## Features

- **Serverless Architecture:** Leverage serverless computing services like AWS Lambda to handle dynamic content generation, resulting in cost-effective and scalable solutions.
  
- **Infrastructure as Code (IaC):** Utilize tools such as AWS CloudFormation or Terraform to define and provision cloud resources, allowing for easy replication and version control.

- **CI/CD Integration:** Implement continuous integration and continuous deployment (CI/CD) pipelines using services like AWS CodePipeline or GitHub Actions to automate the deployment process.

- **Content Delivery:** Utilize a content delivery network (CDN) such as Amazon CloudFront to optimize website performance and ensure low latency for users across the globe.

- **Databases and Storage:** Integrate cloud-based databases (e.g., Amazon DynamoDB) and storage solutions (e.g., Amazon S3) to store and retrieve data efficiently.

## Getting Started

Follow these steps to get started with the Cloud Resume Project:

1. **Clone the Repository:**
   ```
   git clone https://github.com/stanner834/Cloud-Resume-Challenge.git
   cd Cloud-Resume-Challenge
   ```

2. **Set Up AWS Account:**
   Create an AWS account if you don't have one and set up the necessary IAM roles and permissions.

3. **Configure AWS CLI:**
   Configure your AWS CLI with the necessary credentials:
   ```
   aws configure
   ```
4. **Deploy the Infrastructure:**
   ``` 
   terraform init
   terraform plan
   terraform apply
   ```

5. **Customize Your Resume:**
   Update the resume content in the code to personalize it with your information.

6. **Deploy the Website:**
   Trigger the CI/CD pipeline or deploy the website manually to make your resume live.

## Technologies Used

- AWS (Amazon Web Services)
- Serverless Framework
- AWS CloudFormation
- Terraform
- GitHub Actions
- HTML/CSS/JavaScript
- Python

## License

This project is licensed under the MIT License - see the [LICENSE](LICENSE) file for details.

## Acknowledgements

Special thanks to the open-source community and contributors for their valuable insights and support in building and improving the Cloud Resume Project.

Feel free to contribute, provide feedback, or reach out for assistance. Happy coding!
