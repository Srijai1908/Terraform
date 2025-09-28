🛠️ Terraform Installation & Structure Guide
📦 Installing Terraform on Ubuntu
Follow these steps to install Terraform securely using HashiCorp's official repository:

bash
# Step 1: Update package list and install dependencies
sudo apt-get update && sudo apt-get install -y gnupg software-properties-common

# Step 2: Add HashiCorp's GPG key
wget -O- https://apt.releases.hashicorp.com/gpg | \
gpg --dearmor | \
sudo tee /usr/share/keyrings/hashicorp-archive-keyring.gpg > /dev/null

# Step 3: Add the official HashiCorp Linux repository
echo "deb [arch=$(dpkg --print-architecture) signed-by=/usr/share/keyrings/hashicorp-archive-keyring.gpg] https://apt.releases.hashicorp.com $(grep -oP '(?<=UBUNTU_CODENAME=).*' /etc/os-release || lsb_release -cs) main" | sudo tee /etc/apt/sources.list.d/hashicorp.list

# Step 4: Update package list again
sudo apt update

# Step 5: Install Terraform
sudo apt-get install terraform
Once installed, verify the installation:

bash
terraform -version
📐 Terraform Configuration Structure
Terraform configuration files are written in HCL (HashiCorp Configuration Language) and follow a nested structure:

hcl
<block> {
    <parameter> = <value>

    <nested_block> {
        <parameter> = <value>
        <arguments> = <value>
    }
}
🔹 Example Breakdown
Block: Defines a resource, variable, provider, etc.

Parameter: Key-value pairs that configure the block.

Arguments: Additional nested settings or attributes.

🔹 Sample Resource Block
hcl
resource "aws_instance" "example" {
  ami           = "ami-12345678"
  instance_type = "t2.micro"

  tags = {
    Name = "TerraformExample"
  }
}
📚 Resources
Terraform Documentation

Terraform Registry

GitHub Repo Setup Guide
