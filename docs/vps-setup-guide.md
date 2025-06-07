
# ☁️ Oracle Cloud Free VPS Setup for C Development

This guide walks you through setting up a free Debian 12 VPS on Oracle Cloud, perfect for remote C/C++ development using VS Code.

---

## 📌 Prerequisites

- Oracle Cloud account (sign up [here](https://www.oracle.com/cloud/free/))
- Credit card for verification
- Visual Studio Code with the [Remote - SSH](https://marketplace.visualstudio.com/items?itemName=ms-vscode-remote.remote-ssh) extension
- Debian 12 Image (I am using `debian-12-generic-amd64.qcow2`, [download](https://cloud.debian.org/images/cloud/bookworm/latest/))
---


## ⚠️ Important Notes

- Register on Oracle Cloud official website if you don’t have an account.
- You need to bind a credit card during registration.
- The VPS personal basic service is permanently free, but some features are paid.
- Be careful not to exceed the free usage limits to avoid charges.
- Start with the minimal configuration needed, and expand later if necessary.

---

## 🌍 Selecting Your Home Region

After account registration and logging in, you will be prompted to select your **Home Region**.  
Your Home Region is where your resources and services will be primarily hosted.

- Choose a region **closest to your physical location** for better latency and performance.  
- For users in Finland, regions like **Frankfurt (eu-frankfurt-1)** or **Stockholm (eu-stockholm-1)** are good choices.  
- The Home Region can be changed later, but it requires additional steps, so pick carefully.

---

## 💿 Pre-step: Create a Custom Image

### 1. Create an Object Storage Bucket

Log in to the Oracle Cloud Console, navigate to Object Storage, and create a new Bucket to store the image file.
- Choose a meaningful and unique bucket name, e.g., `images`

![create_bucket](/screenshots/nevigate_buckets.png)
![create_bucket](/screenshots/create_bucket.png)
![create_bucket1](/screenshots/create_bucket1.png)

---

### 2. Upload the Image File to the Bucket
In the Object Storage page, select the created bucket and upload the Debian image file.
![import_custom_images](/screenshots/upload_image_file.png)

---

### 3. Create a Custom Image Using the Uploaded File
![import_custom_images](/screenshots/import_custom_images.png)
![import_custom_images1](/screenshots/import_custom_images1.png)

---

### (Optional) 4. Edit Image Details

Edit your image details to include A1 shape.

![edit_custom_image_details](/screenshots/edit_custom_image_details.png)
![add_A1_shape](/screenshots/add_A1_shape.png)

You can use the same method to create and upload any custom images you want to install on your VPS.

---

### 5. Create Virtual Cloud Networks
![nevigate_VCN](/screenshots/nevigate_VCN.png)
![create_VCN](/screenshots/create_VCN.png)
![create_VCN1](/screenshots/create_VCN1.png)

---

### 6. Create Subnets
![vcn_subnets](/screenshots/vcn_subnets.png)
![create_public_subnet](/screenshots/create_public_subnet.png)

---

### 7. Create Internet Getways
![nevigate_CIG](/screenshots/nevigate_CIG.png)
![create_IGW](/screenshots/create_IGW.png)

---

### 8. Create Routing
![nevigate_RT](/screenshots/nevigate_RT.png)
![new_rt_add_rules](/screenshots/new_rt_add_rules.png)
![add_rules1](/screenshots/add_rules1.png)
![add_rules2](/screenshots/add_rules2.png)

## 🏗️ Step-by-Step: Creating a VPS on Oracle Cloud
### 1. Log in and Navigate to **Compute > Instances**

![nevigate_instances](/screenshots/nevigate_instances.png)

---

### 2. Click **Create Instance**

![create_instance](/screenshots/create_instance.png)

---

### 3. Basic Info & Shape Selection

- **Name**: `<your_server_name>`
- **Image**: Debian image (custom image which you just created in pre-step)
- **Shape**:  
  - `VM.Standard.A1.Flex` (Ampere ARM — Always Free)  
    Due to its better performance, this shape often runs at full capacity, which can sometimes prevent instance creation.  
  - `VM.Standard.E2.1.Micro` (AMD — Always Free)  
    The E2 shape can be used as an alternative. For the 42 project, there is not much difference between the two. For free instances, why ask for a bike? (I mean for more?)

![create_image1](/screenshots/create_image1.png)
![create_image2](/screenshots/create_image2.png)
![create_image3](/screenshots/create_image3.png)
![create_shape1](/screenshots/create_shape1.png)
![create_shape2](/screenshots/create_shape2.png)
---

### 4. Networking Settings

- **Create new virtual cloud network (VCN)**
- **Create new public subnet**
- Enable **Public IPv4 Address**
- Subnet Access: **Public**

![networking](/screenshots/networking.png)

---

### 5. SSH Key

- Download your **SSH private key**

![download_private_key](/screenshots/download_private_key.png)

---

### 6.Storage 
- Boot volume:
  - Size: `50 GB`
  - VPU: `10`
  
![storage](/screenshots/storage.png)

---

### 7. Review and Create
![review_and_create](/screenshots/review_and_create.png)

---


## 🖥️ Connect to Your VPS from VS Code

You can check your **Public IP** after creating instance successfully:
![check_ip](/screenshots/check_ip.png)


Use the [Remote - SSH](https://marketplace.visualstudio.com/items?itemName=ms-vscode-remote.remote-ssh) plugin.

Example SSH config (`~/.ssh/config`):

```ssh
Host <Your Server Name>
  HostName <Your Public IP>
  User debian
  IdentityFile <key file>
```

Then connect using:

```bash
ssh <Your Server Name>
```

example:
![check_ip](/screenshots/ssh.png)

---

## ⚙️ Install C Development Tools

Copy [`install-dev-tools.sh`](/scripts/install-dev-tools.sh) to your VPS:

Then run the script:

```bash
chmod +x install-dev-tools.sh
./install-dev-tools.sh
```

It will update&upgrade old packages and install C Development Tools(gcc, g++, make, git, gdb, clang, valgrind) and file navigation and terminal tools...

---

## ✅ Done!

You now have a free VPS running Debian 12 with C development tools installed, accessible remotely via SSH through VS Code.  
No more confusing discrepancies between your environment and the 42 school's setup!

Enjoy, and you're very welcome!

---

## 📌 License

This guide is free to use and distribute. Consider crediting the original author when sharing.
