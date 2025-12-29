<div align="center">

# 🚨 AWS Lambda Cost Monitoring with Terraform  
### Real-time visibility. Proactive alerts. Zero surprises.

![AWS](https://img.shields.io/badge/AWS-Cloud-FF9900?style=for-the-badge&logo=amazonaws&logoColor=white)
![Terraform](https://img.shields.io/badge/Terraform-IaC-7B42BC?style=for-the-badge&logo=terraform&logoColor=white)
![Status](https://img.shields.io/badge/Status-Demo%20Ready-success?style=for-the-badge)

</div>

---

## 🧭 Overview

**AWS-Lambdas-Cost-Monitoring** demonstrates how to build a **cost-aware, serverless monitoring solution** using **Amazon CloudWatch**, **SNS**, and **Terraform**.

This project shows how to:
- Monitor **AWS Lambda usage and cost signals**
- Create **CloudWatch alarms** based on usage thresholds
- Send **real-time notifications** using Amazon SNS
- Manage everything using **Infrastructure as Code (Terraform)**

> 💡 Designed for engineers who want **early cost visibility** before billing surprises happen.

---

## 🎯 What This Project Solves

💥 *“Why did my Lambda bill spike?”*  
💥 *“Which functions are running too often?”*  
💥 *“How do I get alerted before costs get out of control?”*

This repo answers all of the above.

---

## 🚀 Key Capabilities

- **Cost-aware Monitoring**
  - CloudWatch metrics track Lambda execution behavior
- **Automated Alerts**
  - SNS notifications triggered when thresholds are exceeded
- **Infrastructure as Code**
  - All alarms, topics, and permissions managed with Terraform
- **Reusable & Extensible**
  - Easy to adapt for additional services or environments


---

## 🧰 Prerequisites

Before deploying, ensure you have:

* ✅ Terraform installed
  👉 [https://learn.hashicorp.com/tutorials/terraform/install-cli](https://learn.hashicorp.com/tutorials/terraform/install-cli)
* ✅ AWS CLI configured (`aws configure`)
* ✅ An AWS account with permissions for:

  * CloudWatch
  * SNS
  * IAM

---

## ⚠️ Cautions & Best Practices

* Follow **least-privilege IAM principles** at all times
  👉 [https://docs.aws.amazon.com/IAM/latest/UserGuide/best-practices.html#grant-least-privilege](https://docs.aws.amazon.com/IAM/latest/UserGuide/best-practices.html#grant-least-privilege)

* Tested in **us-west-1**, but should work in other regions

* Deploying resources **may incur AWS charges**

> ⚠️ Always review alarm thresholds carefully to avoid excessive notifications.

---

## ▶️ Deployment with Terraform

### 🚀 Quick Start

Deploys into the AWS CLI **default profile** (or a named profile if configured).

```bash
git clone <this-repo>
cd AWS-Lambdas-Cost-Monitoring
terraform init
terraform validate
terraform plan
terraform apply --auto-approve
```

This will:

* Initialize Terraform
* Validate the configuration
* Create CloudWatch alarms
* Configure SNS notifications

---

### 💣 Quick Destroy

Remove all deployed resources:

```bash
terraform destroy --auto-approve
```

---

## 📝 Terraform Command Reference

| Command              | Purpose                        |
| -------------------- | ------------------------------ |
| `terraform init`     | Prepare working directory      |
| `terraform validate` | Validate configuration         |
| `terraform plan`     | Preview infrastructure changes |
| `terraform apply`    | Create/update resources        |
| `terraform destroy`  | Tear down infrastructure       |
| `terraform fmt`      | Format Terraform files         |

---

## 🧠 How This Helps in the Real World

* Catch runaway Lambda invocations early
* Prevent unexpected billing spikes
* Educate teams on cost-aware serverless design
* Lay groundwork for advanced FinOps practices

---

## 🔮 Possible Enhancements

* Add **per-function cost breakdown**
* Integrate **AWS Budgets**
* Push alerts to **Slack or Teams**
* Add **multi-environment thresholds (dev/test/prod)**
* Connect to **CI/CD pipelines**

---

## 📚 Resources

* Amazon CloudWatch
  [https://aws.amazon.com/cloudwatch/](https://aws.amazon.com/cloudwatch/)
* Amazon SNS
  [https://aws.amazon.com/sns/](https://aws.amazon.com/sns/)
* AWS Lambda
  [https://aws.amazon.com/lambda/](https://aws.amazon.com/lambda/)
* Terraform AWS Provider
  [https://registry.terraform.io/providers/hashicorp/aws/latest](https://registry.terraform.io/providers/hashicorp/aws/latest)

---

<div align="center">

✨ Built with **Terraform** & **AWS**
☁️ Cost-aware by design • 🔔 Alert-driven • 📦 Infrastructure as Code

</div>
