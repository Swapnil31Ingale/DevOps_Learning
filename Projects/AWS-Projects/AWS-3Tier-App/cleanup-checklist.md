# 🧹 AWS Cleanup Checklist

Use this checklist to safely delete all resources created during the 3-tier architecture project. This helps avoid unnecessary charges and keeps your AWS environment clean.

---

## ✅ EC2 Instances

- [ ] Terminate **Web EC2** (in public subnet)
- [ ] Terminate **App EC2** (in private subnet)
- [ ] Delete associated **key pairs** (if not reused)

---

## ✅ RDS

- [ ] Delete **RDS PostgreSQL instance**
- [ ] Delete **DB Subnet Group**
- [ ] Delete **RDS Security Group** (if not reused)

---

## ✅ Networking

- [ ] Delete **NAT Gateway** (⚠️ if created — incurs cost)
- [ ] Release **Elastic IP** (if allocated for NAT)
- [ ] Delete **Internet Gateway**
- [ ] Delete **Route Tables** (after disassociating subnets)
- [ ] Delete **Subnets**:
  - WebSubnet
  - AppSubnet
  - DBSubnet
  - DBSubnet2
- [ ] Delete **VPC**

---

## ✅ Security Groups

- [ ] Delete custom **Security Groups**:
  - Web-SG
  - App-SG
  - RDS-SG

---

## ✅ IAM (if used)

- [ ] Delete any custom IAM roles or policies created for this project

---

## ✅ S3 (if used)

- [ ] Empty and delete any S3 buckets created for logs or backups

---

## 🧠 Final Tip

Before deleting the VPC, double-check:
- No EC2, RDS, or NAT resources are still running
- No Elastic IPs are still allocated
- No subnets or route tables are still associated

> 💡 Use the AWS **Billing Dashboard** to confirm no unexpected charges remain.


