# PHASE 1 - Analytics Engineering

## Week 1 - Data Ingestion - Linux and AWS Foundation
6th May - 12th May

### Lectures and Lab:

#### [X] Lecture 1 : Linux (2023-07-25):
* Linux 
    - Hardware (Chips-Integrated Circuit)
    - Kernel - The core component of OS(UNIX) & helps communication happen between the Hardware and Software
    - Software - Command Line (LINUX)
    - Linux is a UNIX like OS that has a lot of distributions. Linux is both an OS & Kernal
        - Debian
        - UBUNTU
        - CentosOS
        - Amazon Linux
* Shell Commands for bash shell:  
    
    
    * User Management
        - `sudo useradd -m new_user_name` : to add a new user to the server. -m makes sure a home directory is created for the user. By default the user gets added to the group which is the same  name as the username
        - `sudo groupadd group_name` : to create a group
        - `groups` : shows the groups
        - `sudo usermod -aG group_name username` : This command adds the username to the group group_name. The -aG flags ensure that the user is appended (-a) to the specified group (-
        G)
        - `sudo useradd -m -G group_name user_name` : Creates a new user and adds the user to the user to the group. The group_name can be an existing group or new group is created if it does not exist.
        - `sudo su - new_user_name` : 
            - to switch to the new_user_name account with shell
            - no password asked
            - no env variables passed
            - goes to the new_user_name home directory
            - this ensures that you enter the new user's environment as if you had logged in directly as that user.   
            - it's useful when you need to execute commands or perform tasks as that user without fully logging out and logging back in as them. 
        - `sudo su -` 
            - switches to the sudo/admin user, which starts a new login shell as the root user
            - previous user set env variables lost
            - The - option ensures that the environment variables and settings are set as they would be for a full login session as the root user.
            - goes to the root folder
        - `sudo -i` : used to switch to root user same as su -
        - `su username`: 
            - starts a non-login shell that doesn't fully reinitialize the environment
            - switch to another user
            - you will have to enter the password 
            - env variables from previous shell will be available
            - stays in the current directory
        - `sudo -s`: 
            - this command starts a new shell session with root privileges
            - all environment variable created in previous shell are lost
            - stays in the same directory
        - `sudo -Es`: 
            - this command starts a new shell session with root privileges
            - -E flag passes the env variables
        - `sudo -u username command`: Execute command as another user.
        - `useradd -a -G family aaron`: Add user to group family.
        - `useradd -a -G family jane`: Add user to group family.

    * File System Operations
        - `printenv` : prints the environment variables
        - `pwd` : print working directory
        - `ls -l` : lists the file in long format 
        - `ls --help`: View flags for `ls` command.
        - `journalctl --help`: View system logs.
        - `q`: Exit pager.
        - `man command_name`: View manual for a command.
        - `apropos keyword`: Search manuals for a keyword.
        - `cat > filename`: Write into a file. Press Ctrl + D to indicate the end of input (EOF), which will save the content and exit back to the command prompt.
        - `ls -al`: List all directories in long listing format.
        - `ls -h`: List files in human-readable format.
        - `cd -`: Navigate to previous location.
        - `cd`: Navigate to home directory.
        - `touch file.txt`: Create a file.
        - `mkdir new_directory`: Create a directory.
        - `cp [source] [destination]`: Copy file.
        - `cp -r [source] [dest]`: Copy directory.
        - `mv [source] [dest]`: Move or rename file/directory.
        - `rm file.txt`: Remove file.
        - `rm -r folder/`: Remove directory recursively.
        - `rm -rf folder/`: Remove directory recursively and forced
        - `stat file.txt`: View file stats.
        - `ln path_to_target_original_file path_to_link_file`: Create a hard link.
        - `chmod 660 /home/aaron/pictures/family_dog.jpg`: Change file permissions.
        - `history` : shows the history of all the terminals
        - `history | grep -i "nano"` : i means case insensitive and search for the word nano in history

    
    * File Permission Management
        - `-rwxrwxrw- 1 user_name user_group_name file_size date filename`:
            - `-` : means a regular file, `d` will mean a directory `l` would mean it's a link like a shortcut
            - `rwx` : read write execute(if the file can be run as a code) permission
            - `1st rwx` : rules for file owner
            - `2nd rwx` : rules for group owner
            - `3rd rwx` : rules for all other users
        - `chmod u-r file_name` : from user take away reading permission. 
            - `u` : user. Use `g` for group permission and `a` for all users
            - `-` : minus so take away. Use `+` to give permission
            - `r` : read permission. You can also use w and x
        - `chmod g-r file_name` : from group take away read permission
        - `chmod a-w file_name` : from all other users take away write permission
        - `./file_name` : to execute a file if it is an executable file
        - `sudo chmod 755 file_name` : 
            - 7 - at position one is total permissions for owner
            - 5 - at position two is total permissions for group
            - 5 - at position three is total permissions for all other users
            - `4` : read; `2`: write; `1`: execute--> 4+2+1 = 7 rwx
        - `sudo chown new_owner_username file_name` : to change the owner of a file
        - `sudo chgrp new_group_name file_name` : to change the group of a file 
        

    * Package Management
        
        - `apt --version` : to find the version of the package manager apt
        - `apt update`: Update package manager.
        - `apt upgrade`: Upgrade installed packages.
        - `apt edit-sources`: Edit software sources.
        - `apt install package_name`: Install a package.
        - `apt remove package_name`: Remove a package.
        - `apt search package_name`: Search for a package.
        - `apt list | grep package_name`: List available packages matching a pattern.
        - `apt-get install package_name.deb`: Install a package (APT-GET)
        - `apt-get remove package_name`: Remove a package (APT-GET)
        - `apt-get update`: Update package manager (APT-GET)
        - `apt-get upgrade`: Upgrade installed packages (APT-GET)
        - `sudo apt install dnf` : alternate to yum
        - `sudo apt update` 
        - `sudo apt install tree`: package tree displays the file structure in tree format
        - `tree -L 1` : display the file structre and flag -L represents the depth level to display uptil

    * System Management

        - `uptime`: View system uptime.
        - `echo $SHELL`: View default shell.
        - `echo $0 ` : to find which shell type it is
        - `ps -p $$`: View current shell.
        - `uname -r`: unix name - View kernel version.
        - `ifconfig` : to view the config or ethernet network which also has info about the ip address
        - `getent hosts` : prints the host ip address
        - `dmesg | grep -I usb`: Display USB-related kernel messages.
        - `udevadm info --query=path --name=/dev/sda5`: View hardware devices.
        - `lspci`: List PCI devices.
        - `lsblk`: List block devices.
        - `lscpu`: List CPU architecture.
        - `lsmem --summary`: Print memory information.
        - `free -m`: View free memory in RAM and swap memory.
        - `sudo lshw`: View entire hardware configuration.
        - `source ~/.bashrc` : to update your shell configuration without needing to log out and log back in again
        - `top` : show Linux tasks using the CPU
        - `ps` : shows the processes for the current shell
        - `kill -9 Process_ID` : force a process to close and kill it
        - `kill -1 Process_ID` : force a process to reload the configuration
        - `lsof -p $$` : show a list of files opened by processes
        - `df` vs `free` command
            - `df` is used to find the free memory for the file system or provides information about disk space usage (hard disk eg: C in windows)
            - `free` is used to find the free memory on RAM and swap space usage (eg: Task Manager-> Performance -> Mem or System Info)

    * File Operations
        - Archive vs Compress: 
            - Archiving: Combines multiple files into one without reducing size (e.g., .tar).
            - Compressing: Reduces the size of files or archives (e.g., .gz, .zip).
            - Together: Often used in tandem to create compressed archives like .tar.gz or .zip.

        - `du -sh file`: Display file size.
        - `ls -lh file`: List file details in human-readable format.
        - `tar -cf archive.tar file1 file2 file3`: Create tar archive.
        - `tar -zcf archive.tar.gz file1 file2 file3`: Create compressed tar archive.
        - `tar -tvf archive.tar`: View contents of tar archive.
        - `tar -xf archive.tar`: Extract files from tar archive.
        - `bzip2 file`: Compress file with bzip2.
        - `gzip file`: Compress file with gzip.
        - `xz file`: Compress file with xz.
        - `bunzip2 file.bz2`: Decompress file compressed with bzip2.
        - `gunzip file.gz`: Decompress file compressed with gzip.
        - `unxz file.xz`: Decompress file compressed with xz.
        - `bzcat file.bz2`: View contents of bzip2-compressed file.
        - `zcat file.gz`: View contents of gzip-compressed file.
        - `xzcat file.xz`: View contents of xz-compressed file.

    * Text Editors

        - `touch file_name` : creates a file name
        - `nano file`: Open file in Nano text editor.
        - `Ctrl O` : Save in Nano
        - `Ctrl X` : Exit in Nano
        - `vim file`: Open file in Vim text editor.
        - `:x` : to save and exit in vim
        - `:q` : to exit from vim
        - `cat <<EOF >data.csv` : Multiline file. Lets you add data line wise, when done type EOF and the input will close
        

    * Search
        - `grep "sales" emp.txt` : searches for the word sales in the file emp.txt
        - `grep "abc" /etc/passwd/*.txt` : searches all the text files in the folder passwd for the word abc
        - `grep null *.py` : it searches through all .py files in the current directory for the string "null" and displays any lines containing that string. If there are matches, it will print those lines to the terminal. 
        - `awk '{print $1}' file_name`: used for pattern scanning and processing. This command executes the print command for the first column in the file file_name
        - `awk '{print $NF}' file_name`: This command executes the print command for the last column in the file file_name
        - `cat file.txt | sed 's/80/100'` : replaces string 80 with 100

    * Local Variable VS Environment Variables:
        - `VARIABLE_NAME=xyz`: Local variables : The scope of this variable is within the enviroment it is created in, if created in script file then it is only available in that file. If created outside its available only outside the file 
        - `export VARIABLE_NAME=xyz`: Environmental Variables : Available throughout the terminal, both inside and outside script file but if you want to change it's value from inside a script file then run that .sh script file as `source ./script_file.sh`
        - `echo "${VARIABLE_NAME}"` : to print the value of the env variable
        - `unset VARIABLE_NAME` : to delete the variable name

    * Help and Manuals
        - `command --help` : gives you info about a command
        - `man command_name` : to print the manual of the command
        - `whoami` : prints the username
        - `sudo npm install tldr -g` : npm is a package manager, tldr is the package which gives cleaner manual descriptions and -g is global flag i.e to install it globally so it can be run from anywhere
        - `tldr command` : gives a short description of the command
    
    * Downloads
        - `wget www.website.com/file_name.jar`: simpler form of curl
        - `curl example.com -o webpage.txt` : downloads a webpage where -o flag is used to specify the output file name. Can also download via api so curl is more versatile
        - `curl gutenberg.org/files/1342/file.csv -o textfile.txt` : downloads files too

    * SSH & SFTP
        - `ssh -i /path/my_pub_key -p 8888 UserName@SSHserver.example.com` 
            - where UserName is the username on the server 
            - SSHserver.example.com is the server host
            - -i is to specify the identity file
            - -p is to sprcify the port
        - 

    * Background Processes
        - `ls & ` : used to run commands in the background. Anything that follows & will run in the background
        - `.test.sh 1>/dev/null` : put output 1 to the null file in the specified location
        - `.test.sh 2>/dev/null` : put error 2 to the null file in the specified location
        - `.test.sh 1>/dev/null 2>&1` : put output 1 to the null file in the specified location and put the error 2 also to the same location as 1

    * Shell Script
        - `path/file.sh` : run a .sh shell script option 1
        - `bash path/file.sh` : run a .sh shell script option 2
        - `./file.sh` : run a .sh shell script option 3

    * CRON
        - `crontab -l` : to list all the cronjobs
        - `crontab -e` : to edit or ceate a new cron job
        - `*/30 9-17 * 1-5 /path/folder &> log_file` : specify the file to be scheduled
            - */30: This means "every 30 minutes". It specifies that the cron job should run every 30 minutes.
            - 9-17: This specifies the hours during which the job should run, from 9 AM to 5 PM.
            - 1-5: This specifies the days of the week (Monday to Friday) when the job should run.
            - /path/folder: This is the path to the folder where the script or command you want to run is located.
            - &>file: This redirects both standard output (stdout) and standard error (stderr) to the file named file.

* Shell:
    - Definition: The shell is a program that interprets commands and acts as an intermediary between the user and the operating system. It provides an interface for users to interact with the operating system by accepting commands and executing them.
    - Example Commands: ls, cd, mkdir, grep
    - Common Shells: Bash, Zsh, Fish

* Terminal:
    - Definition: A terminal is **a program that allows users to interact with the shell**. It provides a text-based interface where users can type commands and view the output produced by those commands.
    - Usage: Users typically open a terminal application to access the shell.
    - Examples: GNOME Terminal, macOS Terminal, Windows Command Prompt, PowerShell
    - 
* Subshell:
    - Definition: A subshell is a **separate instance of the shell** created within an existing shell. It inherits the environment and settings of the parent shell but operates independently. Subshells are often created to execute commands or scripts without affecting the parent shell.
    - Creation: Subshells are created using parentheses ( ) or by spawning a new shell process.
    -  Use Cases: Running scripts, executing commands in a temporary environment

* Child Process:
    - Definition: A child process is **a process created by another process, known as the parent process**. When a process spawns another process, the spawned process becomes a child process of the parent process. Child processes inherit certain attributes from the parent process, such as environment variables and file descriptors.
    - Identification: Each child process is assigned a unique Process ID (PID) by the operating system.
    - Examples: When running a command from a shell, each command executed spawns a child process.
* Here's a simple analogy:
    - Shell: Think of the shell as a manager in an office who takes commands (tasks) from employees (users) and executes them, delegating tasks to various departments (system function
    s.
    - Terminal: Imagine the terminal as the desk or workspace where employees (users) interact with the manager (shell), submitting tasks (commands) and receiving feedback.
    - Subshell: Picture a manager (shell) who temporarily delegates tasks to an assistant manager (subshell) to handle specific duties, while still overseeing the overall operation.
    - Child Process: Think of a child process as a new employee (process) hired by an existing employee (parent process), who follows instructions and performs tasks independently but still reports to the original employee.
___
#### [X] Lecture 2 : AWS Basics (2023-07-27):
* [AWS Introduction -Youtube](https://www.youtube.com/watch?v=ZW4o08WjwYg)
    * IaaS - Infrastructure - eg: Virtual Machine or Servers like `Compute Engine service` on GCP where we will have to install all the applications we want to use
    * PaaS - Platform - eg: `Cloud Functions` on GCP which  is a serverless compute service on GCP that allows you to run event-driven code without provisioning or managing servers. It automatically scales based on demand and executes code in response to events from various GCP services or HTTP requests.  
    * SaaS - `Google Workspace (Google Suits)` where gmail, docs, drive etc are provided and maintained for you. A company can use this to create their company email (GMAIL), manage documents(), file system etc 
    * Popular AWS services:
        - EC2 - Elas
        tic Cloud Compute IaaS. You can launch it via
            - Terraform
            - GUI or Web Console on the AWS Website
            - Python API
* AWS Lecture by WeClodData -Course:
    - Regions consisting of AZ's (Availability Zones)
        - Availability : A second machine is on a standby and if machine 1 fails, work is transferred to the stand by machine. This will take some time as work needs to be transferred. High availability means a system will almost always maintain uptime, albeit sometimes in a degraded state. About AWS, a system has high availability when it has 99.999% uptime, also known as "five nines." To put that in perspective, the system would be down for a mere five minutes and fifteen seconds a year. 
        - Fault Tolerance : The work is executed on two systems simultaneously. So if one system fails, the second machine is immediately available. Think of fault tolerance as high availability's older brother. Fault tolerance means that a system will almost always maintain uptime — and users will not notice any differences during a primary system outage. If high availability was expensive in pre-AWS days, fault tolerance was exceedingly expensive.
    - Redshift - Data Warehouse
    - EMR (Elastic Map Reduce) - Distributed Computing using Spark
    - IAM (Identity Access Management)
        - User 
            - only have login privilages
            - `Account Owner /Root User` or `IAM user`
            - `Security Credentials (Access Key ID /Secret Key ID)` All users have them
            - 2 Access Types
                - `Access Key`- Programactic access via CLI
                - `Password` - AWS Management Console Access (GUI)
        - User Group - Multiple Roles can be added to a user group and multiple users can be added to a user group(s)
        - Role - Multiple policies can be attached to a role and role(s) can be attached to a user
            - EC2 Instance ----GIVE RIGHTS TO ACCESS---> S3 Bucket
            - Demo to create a role to give the EC2 instance rights to access a S3 bucket
            - Trusted entity type `AWS Service`
            - Use Case `EC2 instance`
            - Policy added `AmazonS3FullAccess` to this role
            - Role name `de-b8-demo-ec2`
            - Add a tag optionally
            - Role created
            - IAM Role: It is an identity you can create that has specific permissions with credentials that are valid for short durations. An IAM role can be assigned to an identity, such as :
                - user or 
                - user group or an 
                - aws service (eg. EC2)
        - Policies - a document with set of rules they are simply permissions which gives privilage to access a resource. Different policies available for each AWS resource can be found [here](https://docs.aws.amazon.com/service-authorization/latest/reference/list_amazons3.html)
            - Effect: Allow 
            - Actions: What privilages to give eg: read, write or all
            - Resources: Which resources or files to give this privilage to. I.e on which resources the actions can be performed. e.g: only s3 bucket 1 & 2 etc.
            - Policies can be given to other resources too.
            - Are assigned to `User` - `Group` - `Roles` - `Other AWS Sevice`
            - `Self-Created` or `AWS Standard`
    - Security Groups
        - Inbound
        - Outbound
    - `AWS Systems Manager Session Manager` is a fully managed service provided by Amazon Web Services (AWS) that enables interactive management of your Amazon EC2 instances, on-premises instances, and virtual machines (VMs) through a secure and browser-based shell. It allows you to establish a shell session with your instances without the need for SSH or RDP access, eliminating the requirement for inbound ports to be open or the use of bastion hosts.
    - `EC2 (Elastic Compute Cloud)` - Compute Instance
        - Systems with super compute power
        - also known as Instance
        - Create an EC2 instance, generate a secure key pair of type `.pem` and download it to your system
        - Connect to EC2 instance via CLI
            - Open VSCode
            - Have the extension `Remote Development` installed
            - Goto the Open Remote Window button on the bottom left corner of VSCode
            - Select `Connect to Host`
            - Select `Add New SSH Host`
            - Write the command to ssh into the remote EC2 as follows `ssh -i "absolute_path_to_.pem_key" user@hostame` eg: `ssh -i "C:/Downloads/de-demo-ec2.pem" ubuntu@ec2-34-239-182.compute-1.amazonaws.com` Press Enter
            - Then goto the .config file and you will find the config for this remote machine appended automatically, you can change the host if required to something simpler like `de-demo` etc.
            - Then Goto the `Remote Explorer icon` on the left panel of VSCode
            - Now you can connect to the remote server you just created via VSCode
            - Access config file to change the public ip address by clicking on the `connect to new Window` button next to the ssh server connection in the `Remote Explorer icon` on the left panel of VSCode
        - `Elastic IP's`: to avoid changing the public IP repeatedly user 
            - Allocate Elastic IP address
            - And attach this to your EC2 instance
        - Security Groups (Inbound & Outbound)
        - Public IPV4 address: use this to access the UI available on any port of the EC2's IP address. Eg: Accessing jupyter notebook running on 8080 port of the EC2
        - IAM Role: to let EC2 access other resources like s3 or airbyte etc.
    - S3 (Simple Storage Service) - Storage
        - Object Storage
        - There is no folder structure, links are used rather than folder structure. The links store the path to an object
        - Object Ownership- ACLs disabled is the preferred option use IAM Roles instead to give access
        - Layers of Data Storage:
            - Landing
            - Raw 
            - Curated  (Eg Emp Salary data)
                - Tier 1 - Most Sensitive Data
                - Tier 2
                - .....
                - Tier N - Least Sensitve Data
            - Aggregated
        - Sensitive Data should be stored in apropriate Tier Level and Tier should be assigned to a bucket
        - Use Cases
            - Data Lake
            - Code
            - Audit files
            - Log files
            - ML Model files
            - etc
    - ACCESS
        - CLI: 
            - Cloud Shell by default has AWS-CLI installed and the root users Cloud shell access to the AWS account by default
            - Output in 3 formats json, text & table
                - `aws --output json ec2 describe-instances` - example command to access information about all the ec2 instances the `user` has access to (using the service key)
                    - `--ouput` is an option
                    - `ec2 ` is service name
                    - `describe-instances` is command name
            - Access Option 1: Access from a local system or (could also be an EC2 instance)
                - First give the user access by creating an access key connected to him/her
                    - Goto IAM -> 
                    - Users -> Select the `user` connected to your EC2 instance -> 
                    - Security Credentials -> Create an Access Key -> 
                    - Select `Use it to use CLI` -> 
                    - Give a tag to the access key which will be added to the user and shown alongside the access key [Video](https://learn.weclouddata.com/programs/2/courses/159d75b6-f529-492e-9c48-8d16f33a8183/weeks/2483/materials/19499?topic_id=6513) @ 2:49
                - Now use this access key value pair on your server in the following steps:
                    - install aws cli in your system using the command `sudo apt install aws-cli` or `sudo apt install aws-cli --classic`
                    - `aws configure` -> to configure the login to AWS for the user (similar to username pwd login in GCP)
                    - copy paste the access key
                    - copy paste the secret access key
                    - region `us-east-1`
                    - Default output format : Just Enter to ignore it
                - Now you can use this system to interact with AWS and to get and send information about and to AWS services. Some examples are below
                    - `aws ec2 describe-instances` : returns info about all the ec2 instances accessible to the `user` which was connected to the access key
                    - `aws ec2 describe-instances | grep "b8"` to filter and only return info about ec2 instance that has the string `b8`
                    - `aws ec2 describe-instances --filters "Name=image-id,Values=ami-0f30a9c3a48f3fa79"` to view info about instances with ami id using filters
                    - `aws s3 ls` -> check if this works (it will depend on what access the user has or what policies are available to him/her)
                - NOTE: The access key for a user if forgotten can be retrieved or deleted as follows:
                    - IAM Roles -> Users -> Goto the user -> Security Credentials  (View it here) or delete as follows -> Actions -> Deactivate  -> Delete
                    - If removing access keys and trying to access the AWS service via the IAM roles then you need to remove the access key from the system too
                     - `cd .aws`
                     - `nano config` and delete the region but leave the default
                     - `nano credentials` and delete the all the access key value pair
            - Access Option 2: Access from other AWS services:
                - Give an EC2 instance IAM permission to access CLI via roles as follows:
                    - Asuming you have already created a role from above called `de-b8-demo-ec2` (which had the policy of accessing S3 bucket added to it already)
                    - Goto EC2 
                    - Select by ticking the check box of the Instance of choice
                    - Actions -> Security -> Modify IAM Role 
                    - Select the role created before `de-b8-demo-ec2`
                    - Update IAM role
                    - Now this EC2 instance has access to the S3 bucket
                - Now goto your EC2 instance (remove any access keys if you were using CLI via USER to access AWS as explained in Option 1 above)
                    - `aws s3 ls` -> to list all the s3 bucket names
                    - `aws ec2 describe-instances` -> Check if this works or not
                    - Create an S3 bucket
                        - `aws s3 mb s3://wcd-de-s3-demo-2` -> this command creates an s3 bucket called wcd-de-s3-demo-2
                    - Download something S3 bucket
                        - `aws s3 cp s3://wcd-de-b8-s3-demo/city.csv .` -> this command downloads the city.csv file
        - API -Python
            - we use `boto3` package
            - Check if your server has python and pip
            - `python --version`
            - `sudo apt update`
            - `sudo apt upgrade`
            - `sudo apt install python3-pip`
            - `pip --version`
            - `pip install boto3`
            - `pip show boto3`
            - `python3`
            - Now write the code to access AWS via code
___

#### [X] Lecture 3 / Lab 1 : AWS and Linux Workshop (2023-07-29)
Same content for [Exercise 7: EC2 & Linux](#exercise-7-lab-ec2--linux)
- Aim: 
    - Create a project folder called `ae_project` in all the servers below with the virtual env `.my_env` with `Python 3.12.3`
        1. DE-LabSarah
        2. Project-Dbt
        3. Project-Metabase
        4. Project-Airbyte
    - Task 1:
        - Create three EC2 instances. 
        - One t2.small size - `Project-Metabase`
        - One t2.medium size - `Project-Dbt`
        - One t2.large - `Project-Airbyte`
    - Task 2:
        - [Exercise 6: Workshop DB2 Installation](#exercise-6-workshop-db2-installation)
        - Step 0- Copy the EC2 Key pair named `demo.pem` from local system to DE-LabSarah EC2 intance as follows
            ```bash
            # from local system
            cd /c/users/sanya/.ssh
            sftp DE-LabSarah
            put demo.pem /home/ubuntu/.ssh/
            # from DE-LabSarah EC2 intance
            chmod 400 /home/ubuntu/.ssh/demo.pem
            # add the Project-Dbt server details to config for easy ssh connection
            vim /home/ubuntu/.ssh/config
            # write the below into the config file
            Host Project-Dbt
                HostName ec2-3-139-75-67.us-east-2.compute.amazonaws.com
                IdentityFile /home/ubuntu/.ssh/demo.pem
                User ubuntu
            ```
        - `ssh -i "/home/ubuntu/.ssh/demo.pem" ubuntu@ec2-18-188-12-133.us-east-2.compute.amazonaws.com`: alternate SSH into the Project-Dbt instance
        - Step 1 **Project-Dbt Instance** 
        - Update packages
            ```bash
            sudo apt update # refreshes package list on the local server
            sudo apt upgrade -y # updates the packages
            sudo reboot #Run this and wait a few moments for the system to reboot before logging back in.
            ```
            After running upgrade-y you may see a pink screen that says requiring kernel and daemons needing updating. 
        - Step 2 - ~~Install pip `sudo apt install python3-pip`~~
            The above is not working so we will do it in the following steps
            - Install miniconda [Instructions here](./setupNotes.md#miniconda)
            - Install conda virtual env with python and pip as follows
                ```bash
                # goto project folder
                cd ae_project
                # Path to install the virtual env in the current project directory with python 3.10 and pip
                conda create --prefix ./.my_env python=3.12.3 pip 
                # Activate the virtual env as follows
                conda activate .my_env 
                # to de-activate the virtual env my_env use the below 
                conda activate
                ```
        - Step 3 - Install DBT
            - Install System Level Libraries (PostgreSQL CLient Headers) **this is always installed globally not in the venv**
            - When you install DBT, you have the option to install just DBT-Core, or DBT-Core with connectors for specific databases
            - We will install DBT to be used with Postgres
                ```bash
                # install the necessary PostgreSQL development libraries using the following command:
                sudo apt-get install -y libpq-dev
                ```
            - Install dbt-core and dbt-postgres
                - **Option 1**: Install in the Global Python
                ```bash
                pip install --user dbt-postgres   # for global user install
                # If you see a number of warnings indicating that certain scripts that are needed to run dbt are installed in '/home/ubuntu/.local/bin' which is not on PATH.
                # Add this line to the end of your .bashrc and save
                export PATH="$HOME/.local/bin:$PATH"
                # After saving run the following to instantiate the changes
                source ~/.bashrc
                ```
                - **Option 2 - NOT USED IN THIS EXERCISE**: Install in the Virtual env
                ```bash
                conda activate .venv
                pip install dbt-postgres          # inside a virtualenv
                ```
            - Validate DBT is installed
            ```bash
            # If using Option 2 dbt-postgres will only be avialable inside the venv
            conda activate .my_env
            # If using Option 1 dbt-postgres will be avilable globally; no need to acivate the venv
            dbt --version
            # if installed properly you should see something like the following
            Core:
            - installed: 1.5.2
            - latest:    1.5.2 - Up to date!
            Plugins:
            - postgres: 1.5.2 - Up to date!
            ```
    - Task 3:
        - [Exercise 1: Linux Basic](#exercise-1-linux-basics)
    - Task 4:
        - Do some setups in the ~~Cloud Shell~~ DELab Server (I will use this instead) for the future project use. 
            1. Please type a command to check which directory we are at. `pwd`
            2. Please list the files we have in the directory. You should see the EC2 key already under this directory. `ls -lah`
            3. Please create a directory called ae_project, we will use this directory to save all the files we need. But please don't move the EC2 key, keep where it is. `mkdir ae_project`
            4. Please check the python3 version in this CloudShell terminal. `python --version`
            5. Please check the aws cli version. `aws --version`
    - Task 5:
        - On the ~~Cloud Shell~~ DELab Server (I will use this instead) install the `psql` 
            1. Please find out the distributions of the linux system `cat /etc/*-release`. Please note that the Cloud Shell is using CentOS, it does not support apt.
            2. `sudo apt install postgresql`The psql will be used to connect to Postgres database if necessary.
            3. `pg_config --version`: check postgreSql Server version
            4. `psql --version`: to check Client version
            5. `sudo -i -u postgres` : Switch over to the postgres account on your server by typing this
            6. `psql`: You can now access the PostgreSQL prompt immediately by typing this
            7. `\d`: to view tables
            8. `\q`: Exit out of the PostgreSQL prompt by typing this
            9. `Ctrl+D` : to log out of the postgres server
    - Task 6:
        - On the ~~Cloud Shell~~ DELab Server (I will use this instead) install `snowsql` in the Cloud Shell. This is the tool we are going to use in the future weeks in the Snowflake session.

            ```bash
            sudo apt-get install unzip # this is needed for the snowsql package to install
                
            # Download the installation package from internet with command curl.
            curl -O https://sfc-repo.snowflakecomputing.com/snowsql/bootstrap/1.2/linux_x86_64/snowsql-1.2.27-linux_x86_64.bash

            # List the directory(you should know which command to list), to see if the installation package `snowsql-1.2.27-linux_x86_64.bash` has been downloaded on the directory.
                
            # The downloaded package is not runable, you should give the file permission to run, use command chmod, only give it the execute permission will be enough. Try to write this command, if you still don't know, use the following command line. 
            chmod u+x snowsql-1.2.27-linux_x86_64.bash #or 
            chmod u+x snowsql-1.2.27-linux_x86_64.bash

            # You have given the package the 'execute' permission, you can run it. Please consider how to run the .bash file. Think about it and try. If you still don't know, use the following command line.
            ./snowsql-1.2.27-linux_x86_64.bash # or
            bash ./snowsql-1.2.27-linux_x86_64.bash

            # You will see 2 interaction lines: Specify the directory in which the SnowSQL components will be installed. [~/bin]. -- Type "Enter" to go to the next step. Do you want to add /home/cloudshell-user/bin to PATH in /home/cloudshell-user/.zshrc? [y/N] -- Type "y" to go to the next step. The installation should be finished. 

            # Add PATH to .bashrc
            nano ~/.bashrc

            # Append this line to the end of the file
            # export PATH=/home/ubuntu/bin:$PATH

            # restart the server
            source ~/.bashrc
            ```
            - List all the files in the files under the directory "~" to see if you have the hidden folder .snowsql. You should know the command how to list all the files including hidden files. If not, please see the below command line. `ls -al`
            - Go to the .snowsql folder, and check if there is a file called config in this folder. Open the config file. Also view config files at `/home/ubuntu/.snowsql/1.2.27/snowsql.cnf`. Review it, and close it. This is the config file you are going to use to store the Snowflake database connection parameters.

---

#### AWS CLI Commands
- Setup AWS CLI USER CREDENTIALS
    - `aws configure` : used to setup the default profile without a profile name
    - `aws configure --profile sarah` : to configure aws cli with/for a profile
    - `vim ./.aws/config` : to modify the default user or other user config. Delete entry here and in the credentials file to remove a user
    - `vim ./.aws/credentials` :  to modify the default user or other user credentials. Delete entry here and the config file to remove a user
    - `export AWS_PROFILE=sarah` : to set the default user profile for aws cli
    - `export AWS_DEFAULT_PROFILE=sarah` : (DEPRICATED) this is automatically set in the aws config file by the above statement but incase you want to set it explicitly use this command
    - `unset AWS_PROFILE` : to remove the default aws cli profile
    - `unset AWS_DEFAULT_PROFILE` : to remove the default aws cli profile
    - `aws configure list` : lists the default profile
    - `aws configure list --profile sarah`: to list the configuration for a particular profile

- Access S3 via AWS CLI
    - `aws s3 mb s3://demo-bucket-sarah` : to make an s3 bucket
    - `aws s3 rb s3://demo-bucket-sarah` : to remove an s3 bucket
    - `aws s3 ls ` : to list all buckets in s3
    - `aws s3 ls s3://demo-bucket-sarah/` : to list all objects in a particular s3 bucket
    - `aws s3 cp test.csv s3://weclouddata-demo/` :to upload to s3 bucket
    - `aws s3 cp s3://weclouddata-demo/ test.csv ` :to download from s3 bucket
    - `aws s3 sync test s3://demo-bucket-sarah/test` : to link a local folder to one in s3
    - `aws s3 rm --recursive s3://demo-bucket-sarah/test` : to delete the folder sarah
    - `aws ec2 stop-instances --instance-ids i-1234567890abcdef0` : to stop an instance
- Access EC2 via AWS CLI
    - `aws ec2 describe-instances --query 'Reservations[*].Instances[*].[InstanceId, Tags[?Key==`Name`].Value]'` : to filter out the instance ids and name from the describe-instances command
    - `aws ec2 start-instances --instance-ids i-070505f9d6d145db1` : starts instance(s)
    - `aws ec2 describe-instances --instance-ids i-070505f9d6d145db1 --query 'Reservations[*].Instances[*].PublicDnsName' --output text` : returns the public IPV4 address
    - `aws ec2 describe-instances` : returns info about all the ec2 instances accessible to the `user` which was connected to the access key
    - `aws ec2 describe-instances --filters "Name=image-id,Values=ami-0f30a9c3a48f3fa79"` to view info about instances with ami id using filters
    - `aws ec2 describe-instances --query 'Reservations[*].Instances[*].InstanceId'` : to filter out the instance ids from the describe instance command
    - `aws ec2 describe-instances --query 'Reservations[*].Instances[*].[InstanceId, Tags[?Key==`Name`].Value]'` : to filter out the instance ids and name from the describe-instances command

---

### Practice Exercises
Find the files [here](../analytical/week1/)
#### Exercise 1: Linux Basics:
- Finish the following questions in your Terminal. If you don't know the commands, please search on the internet.

- How to get the OS name and version? 
    - `cat /etc/os-release`

- How to get Kernal version?
    - `uname -r`

- How to get your user and group information?
    - `id`
    - `id <username>`

- How to shows a real-time view of running processes in Linux? : 
    - `top`

- How to exit a running application?
    - `"hotkey: ctr+z"` (to pause the process) 
    - `CTRL + C` (to terminate the process)

- How to check the disk usage in files? 
    - `df -h` - disk free to see disk space usage. -h to show in human redable format

- How to check the IP address?
    - `hostname -i`
    - `ifconfig | grep "inet"`

- How to check the memory usage? 
    - `lsmem`-
    - `lsmem -h`
    - `free` : free memory
    - `vmstat`

- How to check the different options of a command?
    - `command --help`
    - `man command`

- Set a environment variable PARAM=TEST temporarily in Linux? `export PARAM="TEST"`

- printout the environment variable PARAM=TEST? `echo "$PARAM"`

- How to check what environment variables we have in the system? `printenv`

- How to list all the available shells in your system? `cat /etc/shells`

- How to check what shell you are using? `echo "$SHELL"` or `echo $0`
___

#### Exercise 2 & 3: Linux & Hackerrank:
Questions and answers available on WeCloud course app
___

#### Exercise 4: Workshop AWS EC2 Lab
- Aim:
    - Create an EC2 instance along with its Security Group
- Security Groups Creation:
    - Goto EC2 and setup `Network & Security`
    - Create Security Groups
- Create Key Pairs
- Launch an instance 
    - Option 1: Local system
        - Use VSCode and the steps in the EC2 bullet point [here](#--lecture-2--aws-basics-2023-07-27) to connect to the remote server just launched on AWS
        - use the command `ssh -i "/c/Users/sanya/.ssh/demo.pem" ubuntu@ec2-3-17-208-31.us-east-2.compute.amazonaws.com`
    - Option 2: AWS Cloud Shell [access from here](https://us-east-2.console.aws.amazon.com/console/home?nc2=h_ct&src=header-signin&region=us-east-2)
        - Method 1 via .pem key: 
            - Upload the .pem file to cloud shell via Actions -> Upload file and then use the command `ssh -i "./demo.pem" ubuntu@ec2-3-17-208-31.us-east-2.compute.amazonaws.com`
            - Add the ip address of the Cloud Shell (use the command `curl https://icanhazip.com/v4`) to the inbound security rule
        - Method 2 via IAM role: Create a role and attach it to cloud shell
            - IAM Roles -> Create a Role
___

#### Exercise 5: Workshop AWS S3 Lab
- Aim: 
    - Create a new user sarah
    - Add to this user `EC2FullAccessPolicy` & `S3FullAccessPolicy` policy DIRECTLY
    - Then use this user to access EC2 instances and S3 storage buckets by using their credentials to log into AWS CLI from the `DE-Lab` EC2 instance created previously.
    - The `DE-Lab` EC2 instance will be treated as sarah's PC henceforth
- User Creation
    - First create the user, add the policies and then add the Security Credentials as follows
        - Goto the User and User's info
        - Select `create access key`
        - Select use case as `CLI`
        - Download .csv file and save it in the credentials folder
- Now use `DE-Lab` EC2 instance to do the rest of this lab
    - To set up AWS credentials for sarah on the `DE-Lab` instance you will use the credentials in [this file](../credentials/sarah_accessKeys.csv)

- Working with Boto3 S3 API using Python
  Find the exercises in these files
    * [AWS using Python .py file](../analytical/exercise1AwsCliWithPyhton.py)
    * [AWS using Python Jupyter notbook](../analytical/exercise1AwsCliWithPyhton.ipynb)


---

#### Exercise 6: Workshop DBT Installation
Done

---

#### Exercise 7: Lab EC2 & Linux 
Same as [Lecture 3](#--lecture-3--lab-1--aws-and-linux-workshop-2023-07-29)

---

### Errors:
- Changing the permission of .ssh folder in Windows
    - Left click on the .ssh folder to open `Properties`
    - Select `Security` tab and then `Advanced`
    - Select `Advanced` agian
    - Select `Disable Inheritance`
    - Say `ok` in the command box
    - Click `ok`
    - In the Security tab select SYSTEM in the Group/Username section and press `Edit`
    - Then select `Deny` for all 
    - Do this for all group usernames except yours
    - Remove any unnecessary users
    - Selct ok
    - Make sure for you all the Persmissions are selected
    - Then click ok

---

### Self Study
#### Mini Project : 
- **Toronto Climate Data** [Git Repo Link](https://github.com/sanyassyed/Toronto_Climate_Data/tree/main)

---

## Week 2 - Data Ingestion - Docker
### Lectures and Lab
#### [X] Lecture 1: Docker Basic (2023-08-01):
- **Docker**: Docker's main purpose is to package and containerize applications and then ship them and run them anywhere and any number of times.
- **KERNEL**: The kernel is a core component of an operating system that enables communication between software applications and the underlying hardware. It acts as a bridge, managing system resources (like CPU, memory, and I/O devices) and ensuring that applications can safely and efficiently interact with the hardware without needing to manage those resources directly.
- **Image**: is a template/package used to create containers. They can be pulled from the repository or can be built from a `Dockerfile`.
- **Containers**: are running instances of images that are isolated and have their own environments and set of processes.
-   ```bash
    # commands on the new docker demo instance
    sudo apt-get update
    docker --version
    # if docker is installed delete the old version it as follows
    sudo apt-get remove docker docker-engine docker.io
    # download and install docker
    sudo apt install docker.io
    # start and enable docker
    sudo systemctl start docker
    sudo systemctl enable docker
    sudo chmod 777 /var/run/docker.sock
    docker pull hello-world
    # jupyter notebook
    docker pull jupyter/datascience-notebook
    # on the local system change the permissions for the current directory so the container user jovyn UID(1000) can assess the mounted directory "${PWD}" on the host system
    # Changing ownership on the host ensures that the container's user can access and modify the files, avoiding permission errors when using mounted volumes.
    sudo chown -R 1000:1000 ${PWD}
    # run the jupyter notebook
    docker run -it --rm -p 10000:8888 -v "${PWD}":/home/jovyan/work jupyter/datascience-notebook:latest
    ```
- **Commands**:
    * General
        * `docker --version` : prints the docker version if installed
        * `docker login` : to log into Docker Hub
    * Build
        * `docker build .` : build a docker image from Dockerfile available in the current file path therefore the `dot`
        * `docker build Dockerfile -t name_of_image:image_tag` : builds an image from the Dockerfile with the specified image name and tag
        * `docker build . -t sanyasyed/my_image:v2` : creates an image with the name my_image along with the Docker Hub repo name prefixed as it is required when pushing to the repository
        * `docker push sanyasyed/my_image:v2` : pushes the image built to the Docker Hub repository 
    * Image
        * `docker pull image_name:image_tag` : Pull a docker image form the Docker Hub Registry. Default tag is `latest`
        * `docker run image_name:image_tag` : Creates a container from the image in the default attached mode.
        * `docker run -it --rm image_name:image_tag`: runs the container in an interactive mode which is also the default mode and --rm means automatically remove the container as soon as it is stopped oe exited
        * `docker run -d image_name:image_tag` : Creates a container in a detached mode using the image
        * `docker run --name custom_conatiner_name -d image_name` : starts a container with the custom container name provided in a detached mode from the image specified
        * `docker rmi image_id1 image_id2 image_idN` : deletes one or multiple docker image(s)
        * `docker images -a` : lists the docker images available on the instance
        * `docker run -u 1000 alpine sh -c 'echo "Hello user ID: $(id -u)"'`: 
            - **`docker run`**: Runs a new Docker container.
            - **`-u 1000`**: Specifies the user ID (UID) as `1000` inside the container, running as this user instead of root (UID 0).
            - **`alpine`**: The base Docker image used, a lightweight Linux distribution.
            - **`sh`**: The shell (`sh`) used to execute the command inside the container.
            - **`-c`**: Allows passing a string as a command to the shell (`sh`).
            - **`'echo "Hello user ID: $(id -u)"'`**: The command being executed:
            - `echo`: Prints the message to standard output.
            - `$(id -u)`: Gets the current user's UID (in this case, `1000`) and substitutes it in the message. 
    * Container
        * `docker attach container_id` : attaches back to a detached container. If the container was started with a shell (like bash or sh), you can interact with it. However, this can be tricky because it connects to the container's main process. If it's not a shell or something interactive, you might not be able to interact with it in the same way. So instead use `docker exec -it container_id bash`
        * `docker stop container_name/container_id` : stops a container. First two characters of the container_id are sufficient
        * `docker start -a container_name/container_id` : starts and attaches a container that was previously stopped
        * `docker rm container_id1 container_id2 container_idN` : removes or deletes one or multiple container(s)
        * `docker ps -a` : lists the containers on the instance including stopped conatiners
        *  * `docker ps -q`: This command retrieves the container IDs of all running containers
        * `docker stop $(docker ps -q)` : This command retrieves the container IDs of all running containers and stops them all.
        * `docker exec container_id cat /etc/hosts` : executes a command on a running docker container that is in detached mode. Here we print the contents of the file /etc/hosts
        * `docker exec -it container_id bash` : execute a command on the container to enter the bash shell of the container and interact with it
        * `docker kill container_name/container_id` : kills a container and is unsafe compared to stop which is safer
        * `docker rename <old_container_name> <new_container_name>` : rename a container
        * `docker cp <container_id_or_name>:<source_path> <destination_path>` or `docker cp <source_path> <container_id_or_name>:<destination_path>`
            * <container_id_or_name>: The ID or name of the container from which you want to copy files or to which you want to copy files.
            * <source_path>: The path of the file or directory you want to copy. This can be from the container (in the first form) or from the host (in the second form).
            * <destination_path>: The path where you want to copy the file or directory to. This can be to the host (in the first form) or to the container (in the second form).
    * Volume
        * Named Mounting: Mounting the data in the container to standard volume folder provided by docker on the host system
            * `docker run -v data_volume:/var/lib/mysql mysql` : then this standard folder is mounted to connect to the required folder on the container. If the folder name `data_volume` is not available at `/var/lib/docker/volumes/` a new folder is created with the specified folder name.
            * `docker run -v /folder_loc/in_container nginx` : not specifying a location on the host system will create a folder with hash name at the location `/var/lib/docker/volumes/` and this will be connected to the container. You can find this connected folder using the inspect command as well.
        * Volume Mounting (Bind Mounts): Mounting the data in the container to custom volume folder anywhere on the host system
            * `docker run -v /opt/host_folder:/var/lib/container_folder mysql` : then the custom folder is mounted to connect to the required folder on the container
        * New Mounting Version:
            * `docker run --mount type=bind,source=/data/mysql,target=/var/lib/mysql mysql` : in this method if the folder /data/mysql does not exist already then it throws an error
        * `docker volume ls` : list all the volumes that are present at `/var/lib/docker/volumes`. To find which volume a container is connected to use `docker inspect container_id`
        * `docker run -v /opt/host_folder:/var/lib/container_folder mysql` : maps the volume of the conatiner to the host system 
        * `docker volume create data_volume` : creates a folder called `data_volume` at the following location on the host server where docker is installed `/var/lib/docker/volumes/data_volume`
        * `docker ps -a --filter volume=<volume_name>`:  To check if a volume is in use. If any containers are listed, that means the volume is still in use.
        * `docker volume rm <volume_name>`: You can manually remove named volume
        * `docker volume prune`: focuses on volumes that are not associated with any containers at all
        * `docker volume inspect <volume_name>`: To understand more about a specific volume and its usage, you can inspect it.
        
    * Ports

    * Inspection:
        * `docker inspect container_id`: use this command to find information about the container. Some useful information that can be found are as follows:
            * Ports
            * Ip address
            * Environment Variables
            * Mounted Volume location on the host system etc
    * Logs: You can view logs command to view the logs being printed by the container that was started in a detached mode. Logs are nothing but the messages printed on the terminal by the container. Eg: the jupyter notebook container prints various info etc.
        * `docker run -d alpine sh -c 'echo "HELLO"; sleep 500'`
            * `docker run --rm alpine`: Runs a new Alpine container.
            * `sh -c`: Executes a shell command inside the container.
            * `'echo "HELLO"; sleep 500'`: This string contains two commands:`echo "HELLO"`: Prints "HELLO". `sleep 500`: Keeps the container running for 500 seconds after printing.
        * `docker logs container_id`: to view the logs of the above container
    * Network:
        * `docker network create network_name` : to create a custom network in docker
        * `docker network ls` : to view a list of all the docker networks

    * Prune
        * `docker system prune`: Removes unused containers, networks, dangling images, and build cache.

        * `docker system prune --volumes`: Removes unused containers, networks, dangling images, build cache, and volumes.

        * `docker container prune`: Removes all stopped containers.

        * `docker image prune`: Removes dangling (unused) images.

        * `docker image prune -a`: Removes all unused images, not just dangling ones.

        * `docker network prune`: Removes networks not used by any containers.

        * `docker volume prune`: Removes volumes not used by any containers.

        * `docker system prune --all --volumes`: Removes unused containers, networks, all images (not just dangling), build cache, and volumes.

- **Lecture Exercises**: Docker Practice 
    * mysql: log into mysql as follows `mysql -u root -h localhost -p` when prompted for password get in from the logs
    * mysql commands: 
        - `show databases;`, 
        - `use database_name;`, 
        - `show tables;` etc

---

#### [X] Lecture 2: Docker Compose and Demo(2023-08-03):
- **Multi-container Application:**
    * Eg: Our application requires the following: 
        1. Web-Front End
        2. Database
        3. Catalogue
        4. Authentication
    * Two ways to go about it
        1. Put all applications in one container: Use Docker
        2. Put each application in its own container: Use Docker-Compose
    * Why do we need to have a seperate container for each service?     
        - Because each service could require different levels of scaling up. 
        - Eg: If we have more customers on the Web but fewer products to sell then; the Web-FE may require 3X (3 instances) scaling and the Database might require 1X.
        - If we have all applications in 1 container all the applications will have to be scaled to the same level hence many times wasting resources.
        - Version control is easier to manage in case of dependencies for each application seperately when they are in different containers.
        - When using managed services on the cloud it becomes easier to integrate them when using docker-compose.
- **Docker Compose**: Used for Multi-container application
    * Install Docker compose as follows [SOURCE](https://docs.docker.com/compose/install/linux/):
        * `DOCKER_CONFIG=${DOCKER_CONFIG:-$HOME/.docker}`
        * `mkdir -p $DOCKER_CONFIG/cli-plugins`
        * `curl -SL https://github.com/docker/compose/releases/download/v2.29.6/docker-compose-linux-x86_64 -o $DOCKER_CONFIG/cli-plugins/docker-compose`
        *  `chmod +x $DOCKER_CONFIG/cli-plugins/docker-compose`
        * `docker compose version`
    * Example use without .yml file: Lets create mongo and mongo express containers and demonstrate how docker compose can be used when you require more than one container and want those containers to communicate with one another.
        * `docker network mongo-network`
        * `docker network ls`
        * `docker run -d -p 27017:27017 -e MONGO_INITDB_ROOT_USERNAME=admin -e MONGO_INITDB_ROOT_PASSWORD=password --net mongo-network --name mongodb mongo`
        * `docker run -it --rm --network mongo-network --name mongo-express -p 8081:8081 -e ME_CONFIG_MONGODB_ADMINUSERNAME=admin -e ME_CONFIG_MONGODB_ADMINPASSWORD=password -e ME_CONFIG_MONGODB_SERVICE=mongodb mongo-express`
    * Example use without .yml file: Rather than the above we can create a single .yml docker compose file so the above can be done together
        ```yml
        version: '3'
        service:
            mongodb:
                image: mongo
                ports:
                    - 27017:27017
                environment:
                    - MONGO_INITDB_ROOT_USERNAME=admin 
                    - MONGO_INITDB_ROOT_PASSWORD=password
            mongo-express:
                image: mongo-express
                restart: always #  ‘restart: always’ so the image is restarted whenever it goes down. Other options for restart are: no, on-failure, always, unless-stopped
                ports:
                    - 8081:8081
                environment:
                    - ME_CONFIG_MONGODB_ADMINUSERNAME=admin
                    - ME_CONFIG_MONGODB_ADMINPASSWORD=password
                    - ME_CONFIG_MONGODB_SERVICE=mongodb
                depends-on: 
                    - mongodb 
                command: 
                    - 'npm run start' # execute actions once the container is started and act as a replacement for the CMD action in your Dockerfile

        ```
    * Commands
        * `docker compose -f mongodb.yml up` : flag f specifies the the docker-compose YAML file to use. By default docker compose looks for `docker-compose.yml` file to start the multi-container application. The up command starts the services defined in the mongodb.yml file.
        * `docker compose -f mongodb.yml down`: down command is used to stop and remove the containers, networks, and volumes created by `docker compose up`. It essentially tears down the environment that was brought up by `docker compose up`. Removes volumes if the --volumes flag is specified. By default, volumes are not removed to prevent data loss.
        * `docker compose -d -f mongodb.yml up`: detached mode
        * `docker compose down --volumes` : Removes any volumes created by docker compose up. This is important if you want to delete persistent data. Without this flag, volumes will be left intact, so data stored in them will persist for the next time you bring the services up.
        * `docker compose stop`: Stops the running containers but does not remove them or the network. You can restart them later without rebuilding.
        * `docker compose down --rmi all` : Removes all images built by Docker Compose or pulled from a registry.
        * `docker compose up --scale mongodb=3`: is used to scale a specific service (in this case, mongodb) to run multiple instances (replicas) of that service within a Docker Compose setup. This command creates 3 MongoDB containers running in parallel.
    * Docker Compose (DC) vs Kubernetes:
        * DC is used only in development and not used in production environment because if any container fails it does not automatically start it up. 
        * Whereas Kubernetes automatically takes care of such a situation. It handles container crashes and automatically tries to rerun it. 
    * Docker / Docker Compose Best Practices:
        * Use Normal Volume or Named Volume: as this allows Docker to manage any scaling. In Bind mounding the container may always not have access to the binded volume folder on the host system
        * Don’t use ‘latest’ tag name instead use the actual tag name; as the latest tag keeps changing as it’s attached to the latest version of the container
        * For Multi-Container Application use Kubernetes for Production and Docker Compose for Development
- **Micro-services vs Macro-services**:
    In data engineering, **macroservices** and **microservices** are two architectural approaches for building and organizing data processing and management systems. While these terms are more commonly associated with software architecture, they have specific relevance in the context of data engineering when discussing the organization of data pipelines, services, and data flow management.

    1. **Macroservices (Monolithic Architecture)**:
        - **Definition**: Macroservices, or monolithic services, refer to a large, unified architecture where all data processing components are tightly integrated into a single application or service.
        - **Characteristics**:
            - **Tightly Coupled**: All components—data ingestion, transformation, storage, and querying—are bundled into a single service.
            - **Centralized Data Processing**: All data operations (ETL, analytics, storage) happen within the same environment or service.
            - **Single Deployment Unit**: The entire system is deployed and scaled as one. For example, if the system needs to process more data, you scale the whole service, not just a specific part.
            
        - **Advantages**:
            - **Simple Development**: A single codebase makes it easier to develop and debug.
            - **Easier to Deploy**: There’s only one service to deploy, manage, and monitor.
            - **Better for Small Systems**: Suitable when data volume and system complexity are low.

        - **Disadvantages**:
            - **Scalability Issues**: As data volume grows, scaling a monolithic service can become inefficient since all components are scaled together, regardless of whether they all need it.
            - **Lack of Flexibility**: Modifying or upgrading parts of the system is harder because it affects the entire service.
            - **Maintenance Challenges**: Over time, macroservices can become harder to maintain as new features or datasets are added.

        - **Example in Data Engineering**:
            - A **batch processing pipeline** where data is ingested, transformed, and loaded into a database in a single, unified system might be considered a macroservice. All components of the data processing pipeline are bundled together into one large service.


    2. **Microservices**:
        - **Definition**: Microservices refer to a more distributed architecture where each component of the data pipeline is built as a small, independent service with a specific function. Each service communicates with others, typically through APIs, and is deployed and scaled independently.
        - **Characteristics**:
            - **Loosely Coupled**: Each service is responsible for a specific task, such as data ingestion, transformation, or storage, and can be developed, deployed, and scaled independently.
            - **Distributed Data Processing**: Different services might handle various aspects of the data pipeline (e.g., ingestion, transformation, aggregation, storage, and analytics).
            - **Independent Scaling**: Services can be scaled based on their individual resource needs. For example, a data ingestion service might need to scale separately from a data transformation service.

        - **Advantages**:
            - **Scalability**: You can scale individual services based on the demand. For example, if data ingestion requires more processing power but transformation doesn’t, you only scale the ingestion service.
            - **Flexibility**: Services can be updated or replaced independently without affecting the whole system.
            - **Fault Isolation**: If one service fails, it doesn’t necessarily bring down the entire data pipeline, improving reliability.
            - **Technology Diversity**: Each service can be built using the best-suited technology for its specific task (e.g., different programming languages or frameworks for ingestion vs. analytics).

        - **Disadvantages**:
            - **Complexity**: Managing a large number of microservices can be complex. You need to handle communication, data consistency, and service orchestration.
            - **Latency**: Since services communicate over a network, there can be added latency compared to in-memory operations within a monolithic service.
            - **Monitoring and Debugging**: It can be more challenging to monitor and troubleshoot issues when data flows through multiple services.

        - **Example in Data Engineering**:
            - A data pipeline built using **Apache Kafka** for data ingestion, **Apache Flink** for real-time transformations, **Cassandra** for storage, and a custom API for data querying could be considered a microservices architecture. Each of these components is independently deployed and scaled.


    3. **Comparison in Data Engineering Context**:

        | Feature                     | **Macroservices**                           | **Microservices**                           |
        |-----------------------------|---------------------------------------------|---------------------------------------------|
        | **Architecture**             | Unified, single service                     | Distributed, multiple small services        |
        | **Scalability**              | Scales as one unit                          | Each service can be scaled independently    |
        | **Flexibility**              | Harder to modify or replace components      | Easier to update or replace services        |
        | **Complexity**               | Simpler to develop and manage               | More complex, requires service orchestration|
        | **Fault Tolerance**          | Single point of failure                     | Fault isolation between services            |
        | **Technology Choice**        | One technology stack for the whole system   | Services can use different technologies     |
        | **Best Use Case**            | Smaller, simpler systems                    | Large, complex, and scalable systems        |



    4. **Use Case Examples**:
        - **Macroservices Example**:
            - A simple **ETL pipeline** where all the components (ingestion, transformation, and loading) are handled within a single Spark job or in a tool like **Apache NiFi** or **Airflow**, which manages the full data pipeline.

        - **Microservices Example**:
            - A **distributed data processing system** where one service handles **data ingestion** (like Kafka or RabbitMQ), another handles **data transformations** (like Flink or Spark Streaming), and another handles **data storage and querying** (like Cassandra, Elasticsearch, or a data warehouse).

    5. **Conclusion**:
    - **Macroservices** are simpler, more suited for smaller or less complex data engineering systems where scalability and fault isolation are less critical.
    - **Microservices** offer greater flexibility and scalability, making them ideal for complex, large-scale data systems that need to handle high volumes of data or require independent scaling and fault tolerance. However, they come with added complexity in management and orchestration. 

---

### Practice Exercises
* Install Docker and Docker Compose on DeLabSarah instance from [here](#x-lab-install-airbyte-and-metabase-with-docker-)
* Work done on DeLabSarah Server in the directory ~/ae_project
* Miniconda is already installed on this instance if not [steps here](setupNotes.md#ec2-instance-setup)
* Create a conda virtual env in ~/ae_project with python 3.12 and pip as follows
```bash
conda create --prefix ./.my_env python=3.12.3 pip
conda activate .my_env
```
#### [X] Exercise 1: Run Docker
* Files are [here](../analytical/week2/Exercise1RunDocker.md)
* Work done on DeLabSarah Server in the directory ~/ae_project

---

#### [X] Workshop 1: Docker Compose --Flask :
* Files are [here](../analytical/week2/Workshop1FlaskApp/)
* Work done on DeLabSarah Server in the directory ~/ae_project

---

#### [X] Workshop 2: Docker Compose -- Spark Cluster
* Project is [here](../analytical/week2/docker-spark/)
* [Resource](https://towardsdatascience.com/a-journey-into-big-data-with-apache-spark-part-1-5dfcc2bccdd2)
* Change the spark download link to `https://downloads.apache.org/spark/spark-3.5.3/spark-3.5.3-bin-hadoop3.tgz`
* `/spark/bin/spark-class org.apache.spark.deploy.master.Master --ip hostname --port 7077 --webui-port 8080` : run the command in the container. This command starts a Spark Master service on the container's IP address (hostname) and listens on port 7077 for worker nodes, with a Web UI available on port 8080 for monitoring the cluster.
* Start the worker container as follows: `docker start container_id` & enter it as follows `docker exec -t container_id /bin/sh`
* Run the docker compose as follows `docker composer up --build -d`
* Transfer the project file from remote to this folder using sftp `get -r ./ae_project/docker-spark/ ./analytical/week2/`

---


#### [X] Exercise 2: Install Zepplin with Docker
Run the following commands
```bash
# Pull zeplin image
docker pull apache/zeppelin:0.11.2
# run the container on port 8081
docker run --name zeppline8081 -p 8081:8081 apache/zeppelin:0.11.2
```
---
#### [X] Lab: Install Airbyte and Metabase with Docker :
* In both Airbyte & Metabase EC2 instance install docker, docker compose manually as follows
    ```bash
    sudo apt update
    sudo apt upgrade -y
    sudo apt install docker.io -y
    # Check that docker is installed
    docker --version
    # Set the docker home folder and create a cli-plugins directory for docker compose
    DOCKER_CONFIG=${DOCKER_CONFIG:-$HOME/.docker} 
    mkdir -p $DOCKER_CONFIG/cli-plugins
    # download docker compose into the cli-plugins directory 
    # and change permissions to allow execution
    curl -SL https://github.com/docker/compose/releases/download/v2.18.1/docker-compose-linux-x86_64 -o $DOCKER_CONFIG/cli-plugins/docker-compose
    chmod +x $DOCKER_CONFIG/cli-plugins/docker-compose
    # check that docker compose is installed
    docker compose version
    sudo usermod -aG docker $USER
    sudo reboot
    # run this and wait a few moments for the system to reboot before logging back in.
    ```
* Airbyte: 
    - Option 1: Continue to follow the steps in the WCD tutorial
    - Option 2: Install Airbyte into AWS EC2 instance as directed [here](https://docs.airbyte.com/deploying-airbyte/on-aws-ec2)
    - Once Airbyte containers are pulled start it in the port 8000 use airbyte and password to login
    - Start and stop airbyte as follows
    ```bash
    docker compose up
    docker compose stop
    docker compose start
    docker compose down
    ```
* Metabase:
    - Follow notes in the course

---

### Self Study
#### Mini Project : 
* Build docker container to process data [Link to Git Repo](https://github.com/sanyassyed/DataEngineering_Data_Processing_Using_Docker)
---

### What is Data Engineering, Analytics Engineering?
* What is a Data Engineer, Analytics Engineer & Infrastructure Engineer?
    ![Lecture Notes Screen Grab 1](../images/DataEngineerAnalyticsEngineerInfrastructureEngineer.png)
* Analytics Engineering vs Big Data vs Lakehouse
![Lecture Notes Screen Grab 2](../images/DataAnalyticsBigDataLakehouse.png)
* Analytics Engineering
    - Data Source - row storage (database)
        - CRM Data
        - Database Data
        - Advertisement Data
    - Tools to perform Analytics - column storage 
        - Data Warehouse
        - Data Lake
        - Data Lakehouse
        - Data Models: Data Models help define how the data will be structured and managed, enabling Data Engineers to build systems that are efficient, scalable, and optimized for data processing and analysis.
    - Tools to perform Visualization
        - Metabase
        - PowerBI
        - Looker
* Big Data Engineering
* Kafka + Lakehouse

---

## Week 3 - Data Ingestion - Python in Data Engineering and Cloud
### Lectures and Lab
#### [X] Lecture 1: Python in DE
##### Python Packages
* FILES MANIPULATION:
    * `json`: used to handle json data
        * load() is used to read json data from a file to python obj (like dictionary)
        * loads() is used to convert json string to python obj (like dictionary)
        * dump() is used to write a python obj as JSON data to a file
        * dumps() is used to convert python obj to json string 
    * `csv`: built in library to handle csv data
    * `parquet` : columnar storage format data. Parquet is generally better for write-once, read-many analytics, while ORC is more suitable for read-heavy operations
    * `pyarrow` : PyArrow provides an interface for working with a wide range of data sources and data types, including structured and unstructured data, such as CSV files, Parquet files, JSON data, and now Pandas Dataframes. Also it's used to process orc files. The Optimized Row Columnar (ORC) file format is an open-source, columnar storage format for storing data in Apache Hive and Hadoop workloads. 
    * `avro` : to process avro files. Avro is a row-oriented remote procedure call and data serialization framework developed within Apache's Hadoop project. It uses JSON for defining data types and protocols, and serializes data in a compact binary format.
* SYSTEM MANIPULATION: 
    * `os`: enables path joins, finding parent directory, walking through directories etc
    * `sys`: enables getting sys arguments, python version etc
    * `subprocess`: used for shell commands and command-line applications
* WEB INTERACTIONS: 
    * `requests`: pythonic way to get data from API
        * POST: used to send data
        * GET: get read only items
        * PUT: update/create new version of the whole thing
        * PATCH: to update specific changes; part of something
        * DELETE: to delete
    * `beautifulsoup` : for web scraping
* DATABASE:
    * `sqlalchemy`: 
        * ORM (Object Relational Mapper) is a code library that automates the transfer of data between a relational database (tables with rows and columns) and application code, typically represented as objects in an object-oriented language like Python. In simpler terms, an ORM allows you to perform SQL operations—such as creating, reading, updating, and deleting records in a database—using Python code without writing raw SQL. It converts data in SQL tables into Python objects and vice versa, making it easier to interact with databases in a way that's integrated with your application’s data models. Pythonic way of working with SQL.
        * Used to query SQL database using python.
    * `psycopg2`: package used to connect and query PostgresDB
* DATA PROCESSING: 
    * `pandas` : used for data manupulation and analysis using dataframes
    * `polars` : taking the place of pandas
    * `numpy` : for numerical processing using arrays, statistical data
    * `petl` : PythonEtl used for ETL
* VISUALIZATIONS: 
    * `plotly`
    * `matplotlib`
* BIGDATA:
    * `pyspark`
    * `apache-beam`: mainly for streaming data
* MACHINE LEARNING:
    * `Tensorflow`
    * `Pytorch`
    * `scikit-learn`
    * `huggingface`
* TESTING
    * `great_expectations` : package used for validating, testing, documenting & profiling; like making sure the datatypes are the same as expected
        * Operational DB - DB that helps you be operational

---

##### Project Layouts
1. One-off Script Project: For this type of project, you just make a .py script and run the script in its directory! In this type of project, everything is in the same directory.
![One-off Script Project](../analytical/week3/lec1Pic1OneOffScript.png)
2. Single Package Project: Single package project is still the main script to execute, but you’ve moved all methods to a new file. You will import the methods from the file as a package to the main script.
![Single Package Project](../analytical/week3/lec1Pic2SinglePackage.png)
Create functions that can be reused separate to the script and store it in directories like `utils` and import them into python scripts as needed. 
3. Multiple Packages Project: In larger applications, you may have one or more internal packages that are either tied together with a main runner script or that provide specific functionality to a larger library you are packaging.
![Multiple Packages Project](../analytical/week3/lec1Pic3MultiplePackages.png)
Workflow will have the main script

---

##### CI/CD: Continuous Integration & Continuous Delivery/Deployment
* CI: Continuous Integration ensures that code changes being merged into the repository are reliable.
* CD: ensures code is then delivered quickly and seamlessly to production system.
Types of systems
* DEV system:
    * Code
    * Commit 
    * Related Code
* TEST system (CI Pipeline)
    * Build
    * Unit Tests
    * Integration Tests
* PRODUCTION system (CD Pipeline)
    * Review
    * Staging
    * Production

##### Project Requirements
* Virtual Environments: 
    * Filename: `sandbox` or `.v_env`
    * Create virtual envs in python as follows
    ```bash
    # python env
    python3 -m venv my_env
    source my_env/bin/activate
    deactivate
    ```
* Initialization Script:
    * Filename: `init.sh`
    * Contains initialization tasks or setup steps required for a project, environment, or application to run. It's often used to prepare the environment or system before the main execution.
    A file named **`init.sh`** typically contains initialization tasks or setup steps required for a project, environment, or application to run. It’s often used to prepare the environment or system before the main execution. Here's what it commonly includes:
    * **Contents of `init.sh`**
        1. **Exporting Environment Variables**  
        - Sets variables needed by the application or script.
        ```bash
        export APP_ENV=production
        export DATABASE_URL="postgresql://user:password@localhost:5432/mydb"
        ```

        2. **Directory Setup**  
        - Creates or ensures necessary directories exist.
        ```bash
        mkdir -p /var/log/myapp
        mkdir -p /tmp/myapp
        ```

        3. **Permissions Setup**  
        - Sets appropriate permissions for files and directories.
        ```bash
        chmod 755 /var/log/myapp
        chown user:user /var/log/myapp
        ```

        4. **Dependency Installation or Setup**  
        - Installs required dependencies or initializes services.
        ```bash
        pip install -r requirements.txt
        npm install
        ```

        5. **Service Initialization**  
        - Starts or checks services required for the application.
        ```bash
        service postgresql start
        ```

        6. **Shell Aliases or Path Setup**  
        - Adds custom paths or aliases to simplify command execution.
        ```bash
        export PATH="$PATH:/usr/local/bin/myapp"
        alias startapp="./run.sh"
        ```

        7. **Application-Specific Initialization**  
        - Executes tasks specific to the application, such as seeding a database or creating default configuration files.
        ```bash
        ./manage.py migrate
        ./manage.py collectstatic --noinput
        ```

        8. **Custom Messages or Logs**  
        - Outputs information about the initialization process.
        ```bash
        echo "Initialization complete. Ready to start!"
        ```
    * **When and How `init.sh` is Used**
        - **During Deployment**: To set up the environment for a server or application.
        - **Local Development**: To initialize the environment before running an application locally.
        - **In Containers**: Used in Docker `ENTRYPOINT` or `CMD` to prepare the container.

* Secrets
    * Filename: `.env`
    * Contains passwords
    * format: key=value
    * Contains:
        * passwords
        * access keys
    * Sample file content
    ```text
    ACCOUNT='USER_ACCOUNT'
    SECRET_KEY='2345'
    ```

    * Access the secret keys in the python code
    ```python
    from dotenv import load_dotenv
    import os

    load_dotenv()
    access_key=os.getenv('SECRET_KEY')
    print(access_key)
    ```
* Parameters:
    * Filename: `config.toml` or `param.sh`
    * Contains non-secret or non-password items
        * Can be edited by users
        * Can be used to save 
            * enviroment type: eg: dev or production
            * urls
            * Paths: output/input path, data folder paths etc.
            * database names
            * account names
            * aws configs
    * Ways to use parameters: 
        1. Config file: In this method we use a python package to read the parameters into the code directly
            * Format: yml, xml, json etc.
            * Commonly used package: `toml`
            * `config.toml` file
            ```config.toml
            [web]
            name='accountname'
            url='https://theurl.com/home'

            [db]
            db_name='database'
            schema='landing'
            ```
            ```python
            import toml
            app_config = toml.load('config.toml')
            url = app_config['web']['url']
            print(url)
            ```
        1. Environment Variables : In this method we set the parameters as environment variables in the Linux system and the project will then access the parameters via the environment variables. Advantage is that other applications apart from python can also access the parameters via the environment variables.
            * Format: Using the keyword `export` in the shell script
            * `param.sh` file
            ```shell
            export BASE_PATH="/home/product/app"
            export SCRIPTS_FOLDER='/home/product/app/scripts"
            ```
            * Set these environment variables from this files as follows:
                * Step 1: In the shell run the above script as follows: 
                ```shell
                chmod u+x param.sh
                ./param.sh
                ```
                * Step 2: Import the env variables into python script using `os` package as follows:
                ```python
                base_path=os.environ["BASE_PATH"]
                print(base_path)
               ```
            * Alternatively, the parameters can be stored in a config file and then exported as environment variables in the shell script as discussed above using the following command in the .sh file
            ```shell
            # this will pull the value assigned to db in the `config.toml` file
            export DATABASE_NAME = $(grep 'db_name' config.toml | sed 's/.*=//' | tr -d '"')
            ```

* README.md:
    * Project's Title
    * Project Description
    * Table of Contents (Optional)
    * How to Install and Run the Project
    * How to Use the Project
    * How to do Tests
    * Add a License

* .gitignore
    * Add .env files which contains evironment variables and secrets
    * Virtual env files

* Command Argument / Command Line Arguments: are arguments that are specified after the name of the program in the system's command line, and these argument values are passed on to your program during program execution.
    * Advantages: Makes the code flexible based on the input and input from one application can be passed onto another via command line arguments.
    * Method 1: `python main.py arg1 arg2 arg3`
    * Method 2: Use `argparse` package
    ```python
    import argparse

    parser = argparse.ArgumentParser()

    parser.add_argument('--path')
    parser.add_argument('--file')
    args = parser.parse_args()

    path = args.path
    file = args.file

    print(args)
    print(path)
    print(file)
    ```
    Pass values to the arguments --path and --file as follows:

    ```commandline
    python main.py --path /a/dir/to/file/ --file book.txt
    ```
* Logging:
![Logging In Python](../images/logging.png)

* Python Style and Naming Conventions:
    * PEP8 : Style guide for Python Code - where the best practices are described.
    * Maximum line length
    * Variable names
    * Class names
    * Use PEP8 [Cheetsheet](./pep8-cheetsheet.pdf)
    * Use `pep8` package to check if code follows pep8 standards

#### [ ] Lecture 2: AWS Lambda

##### Overview and Introduction
- **AWS Lambda** is used in projects to automate processes, such as retrieving data from an Amazon S3 bucket and loading it into a data warehouse.
- **Automation**: AWS Lambda triggers at specific times (e.g., 8:00 AM) to automatically fetch data daily, without requiring manual intervention.

##### Benefits and Use of AWS Lambda
- AWS Lambda operates as a serverless computing service, which allows developers to run code without managing servers.
- **Primary Use**: AWS Lambda can execute code in response to various events, such as data uploads to an S3 bucket.
- **Python Integration**: In this project, Python is used to manage the Lambda function that processes and transfers data.

##### Cloud Computing Metaphor and Cloud Service Models

* `IaaS` -> Eg: AWS Ec2, GCP Compute Engine
* `PaaS` -> Eg: AWS Lambda (also a FaaS), Cloud Functions
* `SaaS` -> Eg: Google Workspace
* `CaaS` -> Eg: AWS Fargate (AWS Fargate is a serverless compute engine for containers that works with both Amazon Elastic Container Service (ECS) and Amazon Elastic Kubernetes (EKS))
* `BaaS` -> Eg: AWS DyanmoDB (Amazon DynamoDB is a managed NoSQL database service provided by Amazon Web Services)

| Transportation Choice     | Capital Cost | Operational Cost | Description                               | Cloud Computing Equivalent             | Maintenance Responsibility                          | Example Services                                  |
|---------------------------|--------------|------------------|-------------------------------------------|----------------------------------------|-----------------------------------------------------|---------------------------------------------------|
| **Owning a Car**          | Very High    | Very Very Low    | High upfront cost, full ownership         | **On-Premises Data Center**            | Full control over hardware and software             | Physical data center                              |
| **Leasing a Car**         | High         | Very Low         | Lower upfront, cloud-managed hardware     | **IaaS (Infrastructure as a Service)** | User manages software, networking, and storage      | AWS EC2                                           |
| **Renting a Car**         | Low          | Low              | Provider handles most aspects             | **PaaS (Platform as a Service)**       | Only code and application management                | AWS Elastic Beanstalk                             |
| **Taking a Taxi**         | Very Low     | High             | Fully managed service                     | **SaaS (Software as a Service)**       | No responsibility; user consumes the service        | Google Workspace: consisting of Gmail, Google Drive|
| **Public Transport**      | Very Very Low| Very High        | Cloud-managed, deploy containers easily   | **CaaS (Container as a Service)**      | User manages container applications, some scaling   | AWS Fargate (Serverless Containers), AWS EKS (Elastic Kubernetes Service)|               |

##### Serverless Computing in Cloud Services
- **What is Serverless Service?**: 
    * No need to manage servers or resources directly; the cloud handles scaling and resource allocation dynamically.
    * Eg: Amazon API Gateway (to manage API's), Amazon DynamoDB (manage data stores), AWS Step Functions (To orchestrate Lambda Fundtions) etc.
- **Examples**: 
    - *Serverless Application Management (SAM)*: manages and deployes services using the YAML file (like Terraform). This service is of type IaaC. 
    - *AWS Fargate*: is a container service of type **Serverless CaaS** where AWS provisions and scales resources automatically based on container needs.
    - *AWS DaynamoDB*: which is a DB of type **Serverless BaaS** (Backend as a Service)); this would be a sub-category of PaaS
    - *AWS Lambda*: is a computing service which is of type *Serverless Faas* (Function as a Service)

![Evolution of Cloud Services](../analytical/week3/lec2EvolutionOfCloudServices.png)


##### AWS Lambda

* Uses:
    - **API Gateway**: When a request, such as a product list request, is made via API Gateway to DynamoDB, AWS Lambda can be used to process the request.

    - **S3 Bucket**: When new data is added to an S3 bucket, a Lambda function can automatically load this data into Snowflake. The function is triggered each time new data arrives.

    - **SNS (Simple Notification Service) or SQS (Simple Queue Service)**: AWS Lambda can process incoming notifications or messages added to a queue. For example, when an email is received, it can be added to an SQS queue, and Lambda can handle or process items in the queue.

    - **DynamoDB**: Lambda can respond to changes in DynamoDB tables. For instance, if an address is updated in the database, Lambda can trigger an update in another system to keep the data consistent. 
* Internally lambda uses a seperate container/micro VM per function
* Has implicit high availability; so you don't need to worry if the data center is down; AWS automatically moves it to another data center implicitly
* Nodejs & Python are the fastest languages; Java, C++ etc take longer time
* Uses memory size and function execution time to calculate the cost. `AWS Lamda Power Tuning` tool (open source tool) to find the optimal configuration for your lambda.
* Cons:
    * Time-limit: 15 mins maximum. Fargate could be used for longer functions or split the function into sub functions and then use AWS Step Functions to manage or orchestrate those functions.
    * No session affinity i.e. no control on starting and shutting down containers/microVM's
    * Cannot predict the time taken by Lambda to complete a task
    * Cold Start: is the time when incoming request needs to wait for a new Lambda microVM
    * No direct control over processing power; you can only control the memory.
* When to Use Lambda
    * Maximising throughput (request for dynamic content loading, DB access, automatic email replies, chatbots)
    * API-driven microservices / High availability tasks (for example payment notifications must be handled reliably with acceptable latency)
    * Event-stream processing (depends on the size of streaming data)
    * External integration 
* When Not to Use Lambda
    * Very low-latency systems (high frequency trading)
    * Long running tasks
    * High memory-requirement systems (10 Gb max)
    * Large data sets
    * Need for high compute power (Multicore CPU or GPU, 6 vCPU max)
* Invocation: 
    * *What is it?*: Lambda Has 3 Types of Invocation (called or initiated): Lambda Invocation is the act of running a Lambda function, which can be done manually or automatically.
    * Types: 
        1. *Event-driven invocation (Asynchronous)*: Some AWS services generate events which can be used to trigger your Lambda function. All events structured as JSON format and they all contain the data that the function needs to process the event.
        2. *Lambda Polling*: For services that generate a queue or data stream, you set up an event source mapping in Lambda that reads from an event source and invokes a Lambda function. Lambda can read streams from the following services: DynamoDB, Kinesis, MQ, MSK, SQS. Eg: This includes services like DynamoDB Streams, Kinesis, or SQS that pull records in batches and invoke Lambda in response to new items.
        3. *API-driven invocation (Synchronous)*: In web application, API Gateway can invoke Lambda function based on user request. In this case, we will wait for Lambda response which usually contains some additional information.
* Triggers 
    * *What is it?*: (source/resource automatically initiates): Lambda Trigger is the configured event source that automatically starts a Lambda function when certain conditions are met (like an event in S3, API Gateway request, or scheduled time in CloudWatch). In short, triggers start invocations, and invocations execute the Lambda function! AWS Lambda supports a wide array of potential triggers, including incoming HTTP requests, messages from a queue, customer emails, changes to database records, user authentication, messages coming to web sockets, client device synchronization, and much more. Common Ways to Trigger Lambda Functions: 
    * Types: 
        1. *API Gateway* event is one way to trigger Lambda. These events are considered synchronous events meaning when somebody is directly calling an API Gateway, it will trigger your Lambda function.
        2. *S3 events* occur when the content of an S3 bucket gets modified. Altering the content can be achieved by either uploading, deleting, or updating an object.
        3. *A DynamoDB table stream* - when someone updates a record in a specific DynamoDB table, it will instantly publish all changes in a stream, and the Lambda function will be invoked to consume that data in the stream.
* Extensions: 
    * AWS Lambda Extensions allow you to connect AWS services or third-party solutions to Lambda functions to `monitor performance`, `enhance logging`, `ensure security`, or `add custom initialization` steps.
    * AWS Lambda Extensions are a mechanism to extend the capabilities of AWS Lambda functions.
    * They allow you to integrate with AWS services, third-party tools, or custom monitoring, logging, and security solutions.
    * Extensions run alongside the Lambda function's runtime and can perform tasks before, during, or after the execution of the function.
    * They are pre-built connectors that allow you to integrate Lambda with monitoring, observability, security and governance tools.
    * Extensions may impact the performance of your function because they share resources such as CPU, memory and storage with the function and because extensions are initialized before function code.
    * You can create your own Lambda Extension using AWS Lambda Runtime Extensions API.
    * In summary, Lambda Extensions can certainly be used to monitor how your Lambda functions are performing and send that data to a centralized location, which can help you manage and monitor your overall cloud infrastructure across different platforms.
* Packaging: 
    1. ZIP archive: 
        * Package your Lambda as a zip file (50 MB max) 
        * For larger archives use S3 (250 MB)
        * ZIP fucntions are automatically patched and bugs are fixed
    2. Docker Container: 
        * For larger deployments package your lambda function as a Docker artifact (10GB max). 
        * Lambda uses Amazon ECR (Elastic Container Repository) to store the functions defined as container images, and if the image is deleted then the function cannot be invoked.
        * These functions are immutable & what's inside the container is the responsibility of the customer.
* Layers:
    * Another way to package code and dependencies to manage & share them easily across multiple functions.
    * It is a .zip file archive that can contain additional code or data
    * Layers can only be used with ZIP archive Lambda functions.
    * Lambda extracts the layer contents into the `/opt` directory
    * ```bash
      # how to structre the folders in your layer .zip archive
      pillow.zip
      | python/PIL 
      L python/Pillow-5.3.0.dist-info
      ```
* Storage Types & /tmp Usage
    * All data must be stored in a static location as Lambda is stateless
    * `Run the function` --store data here temporarily -->> `/tmp` (512MB free - 10GB MAX & paid) --move from here to-->>  `Amazon S3, Amazon DynamoDB, Amazon EFS(Elastic File System)`
* Step Functions:
    * Used for orchestration
    * Use this to chain-up multiple lambda's sequentially passing the output of one to the other and/or in parallel
    * If one Lambda is too long and takes longer time; then write multiple Lambda's and use Step Functions to connect them all
* Cold Start:
    * It is the extra latency incurred  when AWS Lambda platform needs to spin up a new runtime environment (container) to process an action/event/request
    * This happens when:
        * There is code change; similar to how container is built again when Dockerfile contents change
        * When you don't use/call a function for a long time (eg: 1 hr)
        * When the container age (~6 hrs) is crossed and it is still not called
        * When a container is running and Lambda needs to scale out
    * Times:
        * Python least cold start (no compilation required therefore the fastest)
        * Java 11 lesser (Java requires compilation)
        * Java 8 more
        * More the function is called lesser the cold start frequency
            * Call rate: 10 times per second = 0.001% cold starts
            * Call rate: once every couple of hours = 100% cold starts
    * How to avoid:
        * Trim unused libraries
        * Increase memory atleast 1769 MB (for 1 full vCPU core)
        * Use Provisioned Concurrency (this is a paid service (fixed price) where containers are set aside irrespective of how often they are used)
        * Use faster languages

* Create a Lambda function:
    1. AWS Console -> Lambda Functions -> Create Functions
    1. Select from:
        1. Author from scratch - write your own - this was used in the demo
        1. Use a blueprint - common usecase - get object from S3, use API Gateway, Do a batch job etc.
        1. Container image - use an existing container image
    1. Runtime: Python
    1. Architecture: x86_64 (default) other options like AWS EC2 Graviton
    1. Permissions: Create a new role with basic Lambda permissions
    1. Advanced Settings: (not needed for basic run)
        * Enable code signing (use if code needs approval)
        * Use tags to track costs

    1. Create the function
    1. Add/Set Trigger Configuration
    1. Add/Set Destination
    1. Function ARN(Amazon Resource Number): Make note of this
    1. Code Source 
        * Lambda Handler: Where to start your function
        * event : what you are passing eg: data added to s3 bucket
        * context: meta data attached to the lambda function of type dictionary that contains the function_name, function_version, invoked_function_arn etc.
    1. Click on `Deploy` to apply the changes
    1. Test 1: Pass an event. Click on `Test` and configure the test event as it's the first time:
        1. Create new event
        1. Event name - `hello-world-event`
        1. Event sharing -  private
        1. Set Event name `hello-world`
        1. Event JSON: use the default json which will just pass that dictionary to the function
        1. Save
    1. Click on `Test` and that event just created will be used for testing
    1. Test 2: No event to pass just print the date time
    ```python
    import json
    from datetime import datetime

    def lambda_handler(event, context):
        timestamp = datetime.now().strftime("%Y-%m-%d %H-%M-%S")
        print(timestamp)
    ```
    1. Test 3: Print all the packages available in Lambda for Python by default
    ```python
    from pkg_resources import working_set

    def lambda_handler(event, context):
        for i in working_set:
            print(i.project_name + " + " + i.version)
    ```

    1. Test 4: s3 Put event, where you put into a s3 bucket. There is a template event available for this already. We can use that to test.


* Layer:
    1. In AWS Cloud Shell: Make sure the server you are using has the Python version same as the Lambda function, if not install it first and create a virtual enviroment using it
    1. Create a .zip file containing the required package 
        * Use a virtual python environment with a Python version same as the one used in the Lambda function
        * Activate the virtual environment
        * Create a new folder `python` : this should always be the folder name
        * Enter the folder `python`
        * pip install the python package `pandas` in this folder using the -t flag 
        * Exit the folder
        * Zip the folder python with any name eg: `pandas-layer.zip` using the zip package
        * Upload the `pandas-layer.zip` folder to s3 (same region as the Lambda function) as follows:
            * Create a new bucket if no bucket exists
            * Use AWS CLI to upload the zip file to s3
        ```bash
        mkdir project
        cd project
        # create a virtual env with the required python version
        python3.12 -m venv .venv
        # activate the virtual env
        source .venv/bin/activate
        python3.12 -m pip install --upgrade pip
        # make the directory for the package
        mkdir python
        cd python
        # install all pandas files in this folder
        pip install pandas -t .
        ls
        cd ..
        # zip the folder for layer
        zip -r pandas-layer.zip python/
        # upload to s3 using the s3s URI for the bucket
        aws s3 cp pandas-layer.zip s3://aws_bucket_name
        ```
    1. Add the zip file as layer to lambda function
        * First Create a Custom Layer:
            * Goto the main Lambda page
            * In the left pane select Layers
            * Select Create Layer
            * Name: pandas-layer
            * Select `Upload a file from Amazon s3`
            * Give the s3 link URL i.e the https://...
            * Compatable runtimes - Python 3.17
            * Create
        * Add the Custom Layer just created as a Layer to the Lambda Function: 
            * Goto the bottom of the Lambda function page 
            * In Layers select `Add Layer`
            * Option 1:
                * Select `Specify ARN` and give the ARN number of Layer just created
                * Select Add
            * Option 2:
                * Select `Custom Layers`
                * Select the layer just created i.e pandas-layer
            * Press Add
        * Test the pandas layer by clicking the Deploy button and then Test button

* S3 Trigger Use case:( Test 4 discussed above)
    1. Create two folders in the s3 bucket input and output
    1. Goto to the Lambda function:
        * Select `Add Trigger`
        * Bucket : bucket_name
        * Event types: `All object create events`
        * Prefix: `input/`
        * Make sure the invocation is not recursive
    1. Inside the lambda function code do the following
        1. Grab a file from S3 bucket
        1. Download file from S3 & Store the file in /tmp: to do this give the Lambda function role the permission to access s3 by using `Attach Policy`
        1. Perform computation on the file
        1. Upload the file into different s3 folder
        
        ```python
        # lambda function code
        import pandas as pd
        import boto3

        def lambda_handler(event, context):
            # grab the file from s3
            s3 = boto3.client('s3')
            
            # we need bucket name and object key
            input_bucket = event['Records'][0]['s3']['bucket']['name']
            input_file_key = event['Records'][0]['s3']['object']['key']
            print(f'The bucket name is: {bucket}')
            print(f'The name of the file uploaded is: {file_key}')

            # store the file into /tmp folder
            output_file_key = 'output/results.csv'
            _, file_key = os.path.split(input_file_key)
            s3.download_file(input_bucket, input_file_key, '/tmp/'+ file_key)
            
            print(os.listdir('/tmp/'))

            # computation on the file
            df = pd.read_csv('/tmp'+ file_key)
            print(df)

            meta = df.describe().to_csv('/tmp/results.csv')

            # upload the file to different s3 folder
            s3.upload_file('/tmp/results.csv', bucket, output_file_key)
        ```
* Logs:
    * Give the Lamda Function's role the Permission to `Access all CloudWatch Logs`
    * To check if the Lamda function has been invoked or not
    * In the Lambda function goto the bottom and select the tab `Monitor` -> `Cloud Watch` -> `View Cloud Watch Logs`
    * Select the lambda function
    * Here you can view all the logs related to that function

* Summary - How to create a Lambda Function as shown in Lecture 2
    * Aim: Create a function that is 
        * triggered by an s3 upload event
        * then reads the file uploaded which is a csv as a pandas dataframe 
        * gets the dataset's description as a csv 
        * loads that result csv to another s3 bucket.
    * Function Creation
        * named `etl-basic`
        * Runtime: Python3.12
    * Create a bucket `etl-basic-data`
    * Create subfolders in the bucket as follows: `packages`, `input`, `output`
    * Give the Lambda function's Role the permission to 
        1. Access AmazonS3FullAccess
        2. Access CloudWatchLogsFullAccess
    * Create a .zip file of the pandas package in Cloud Shell and upload it to S3 as a .zip file
    * Always install the packages in the folder named `python` and zip it with any file name
    ```bash
    # cloud shell
    # install python 3.12 as follows
    sudo apt update && sudo apt upgrade -y
    python --version
    sudo yum update -y
    sudo yum install gcc zlib-devel bzip2 bzip2-devel readline-devel sqlite sqlite-devel openssl-devel tk-devel libffi-devel xz-devel wget -y
    wget https://www.python.org/ftp/python/3.12.8/Python-3.12.8.tgz
    tar -xvzf Python-3.12.8.tgz
    cd Python-3.12.8
    ./configure --enable-optimizations
    make -j$(nproc)
    sudo make altinstall
    python3.12 --version

    # create project folder
    mkdir ae_project
    cd ae_project/

    # create virtual env
    python3.12 -m venv .venv
    source .venv/bin/activate

    # create python folder to install all required packages here eg: pandas
    mkdir python
    cd python/
    python3.12 -m pip install --upgrade pip
    pip install pandas -t .
    cd ..

    # zip the python folder into a .zip file
    zip -r pandas-layer.zip python/
    
    # upload the .zip to s3
    aws --version
    aws s3 cp pandas-layer.zip s3://etl-basic-data/packages/
    ```
    * Create a Custom Layer with compatable runtime as Python3.12 by adding the .zip folder to it 
    * Add the above Custom layer created to the Lambda Function either by selecting Custom layer or adding the cutom layers ARN number
    * Add S3 trigger to Lambda Function with the bucket name and `input/` as prefix
    * Download the dataset file to use for this demo using curl as follows on the CloudShell
    * And then upload it into the input folder in the etl-basic bucket
    ```bash
    curl -L -o ./avocado-prices.zip https://www.kaggle.com/api/v1/datasets/download/neuromusic/avocado-prices
    unzip avocado-prices.zip -d .
    # upload this file to s3
    aws s3 cp avocado.csv s3://etl-basic-data/input/
    ```
    * Write code for the lambda function to download the s3 file, transform it and load the result back to s3
    ```python
    import pandas as pd
    import os
    import boto3
    def lambda_handler(event, context):
        # grab the bucket and file name
        bucket = event['Records'][0]['s3']['bucket']['name']
        inputFileName = event['Records'][0]['s3']['object']['key']
        print("Bucket Name: " + bucket)
        print("File Name: " + inputFileName)

        # download file from s3
        s3 = boto3.client('s3')
        outputFileName = 'output/results.csv'
        _, FileName = os.path.split(inputFileName)
        s3.download_file(bucket, inputFileName, '/tmp/' + FileName)

        # read the csv file
        df = pd.read_csv('/tmp/' + FileName)
        # view the contents of the /tmp folder
        print(f'Contents of /tmp folder: {os.listdir('/tmp/')}')

        meta = df.describe().to_csv('/tmp/results.csv')

        s3.upload_file('/tmp/results.csv', bucket, outputFileName)
    ```
---

#### Lab 1: Lambda

---

### Practice & Exercises

#### Mini Project for Python in Cloud: [Jobs Data ETL Project](https://github.com/sanyassyed/DataEngineering_Jobs_Data_ETL_Pipeline)

This mini project involves developing a Python-based data engineering pipeline to extract, transform, and load (ETL) job data from the MUSE API into an AWS S3 bucket. The project simulates real-world scenarios of working with APIs, managing cloud resources, and implementing ETL workflows for structured data processing.

---

#### Workshop: Lambda

##### NOTE: 
* There are two ways to create functions:
    1. Via GUI AWS Console
    2. Via AWS CLI:
        * EC2: If using an EC2 instance use an IAM account to use the AWS CLI. Below find the steps to create an IAM account and use those credentials: 
            * Create AWS `IAM account`: Going to use `zara_de` account
            * Give IAM the following permissions by adding the following policies to the User Group `developers` to which the user `zara_de` belongs
                * AWSLambda_FullAccess
                * AmazonAPIGatewayInvokeFullAccess
            * Grab the following Credentials (saved in the folder `credentials`)
                * access_key_id: YOUR-AWS-ACCESS-KEY-ID
                * secret_access_key: YOUR-AWS-SECRET-ACCESS-KEY
        * AWS Cloud Shell: When using this server there is no need to use another IAM account. You can directly create the Roles for Lambda, Lambda Functions etc from this account
* Use the account number correctly: the IAM account number for zara_de when using EC2 instance and admin_de account number when using Cloud shell
* Use the tutorials for more detailed steps


##### 1. Lambda Function: Hello World Example:

* Nagivate to Lambda Dashboard and Create a Function
---

##### 2. Creating a Lambda Function using AWS CLI without Runtime Dependencies
* This Lambda function `does not require any external packages` that are not already available in Lambda
* Goto the Cloud shell
* Python version being used in the .venv is `3.9.20`
* Creating a Role & attaching Policies to it
```bash
# Step 1: Create a Role for the Lambda Function:
# Trusted Entity Type: AWS Service
# Use case: AWS Lambda
# Permission Policies: AWSLambdaBasicExecutionRole

# Create a role with this command
aws iam create-role --role-name lambda-ex --assume-role-policy-document '{
  "Version": "2012-10-17",
  "Statement": [{
    "Effect": "Allow",
    "Principal": {"Service": "lambda.amazonaws.com"},
    "Action": "sts:AssumeRole"
  }]
}'

# Step 2: Attach Policies to the above Role `lambda-ex`
# Attach a policy to the above role
aws iam attach-role-policy --role-name lambda-ex --policy-arn arn:aws:iam::aws:policy/service-role/AWSLambdaBasicExecutionRole
```
* Lambda Function in Python
```python
# Step 3: Write the Lambda Function `lambda_function.py`
import logging
import math

logger = logging.getLogger()
logger.setLevel(logging.INFO)

# Define a list of Python lambda functions that are called by this AWS Lambda function.
ACTIONS = {
    'square': lambda x: x * x,
    'square root': lambda x: math.sqrt(x),
    'increment': lambda x: x + 1,
    'decrement': lambda x: x - 1,
}

def lambda_handler(event, context):
    """
    Accepts an action and a number, performs the specified action on the number,
    and returns the result.
    :param event: The event dict that contains the parameters sent when the function
                  is invoked.
    :param context: The context in which the function is called.
    :return: The result of the specified action.
    """
    logger.info('Event: %s', event)

    result = ACTIONS[event['action']](event['number'])
    logger.info('Calculated result of %s', result)

    response = {'result': result}
    return response
```
* Zip & Push the Lambda Function via AWS CLI
```bash
source .venv/bin/activate
# Test the python lambda function

# Step 4: Zip the function using the following command
zip demo-math-function-package.zip lambda_function.py

# Step 5: Create the Lambda Function using the following command
aws lambda create-function --function-name demo-math-function-sanya \
  --zip-file fileb://demo-math-function-package.zip \
  --handler lambda_function.lambda_handler \
  --runtime python3.9 \
  --role arn:aws:iam::209479284263:role/lambda-ex

# Optional: Update the same Lambda function as follows after you have made changes in the Lambda function and rezipped it:
aws lambda update-function-code \
  --function-name demo-math-function-sanya \
  --zip-file fileb://demo-math-function-package.zip

# Step 6: Invoke the Lambda function as follows
aws lambda invoke --function-name demo-math-function-sanya \
  --payload '{"action":"square","number":3}' \
  --cli-binary-format raw-in-base64-out output.txt

# Step 7: View the output in `output.txt` on the Cloud Console
cat output.txt
```
* Step 8: Also view CloudWatch to see the output. Navigate to CloudWatch Logs in the AWS Management Console to review the logs.

---

##### 3. Creating a lambda function with runtime dependencies
* Create Lambda function by also adding the `external packages` via zip file
* I have modified this lab to try and do everything via command line
```bash
# In this tutorial we will create a function to resize images. 
# We will install a package call Pillow.
cd ~
mkdir image_resize
cd image_resize
python3 -m venv venv
source venv/bin/activate
pip install Pillow
```
* Write the test Lambda function `image_resize.py`as follows:
```python
import os
import sys
import uuid
import argparse
from urllib.parse import unquote_plus
from PIL import Image
import PIL.Image

def resize_image(image_path, resized_path):
    with Image.open(image_path) as image:
        image.thumbnail(tuple(x / 2 for x in image.size))
        image.save(resized_path)

def main():
    parser = argparse.ArgumentParser()
    # Set the default for the dataset argument
    parser.add_argument("image")
    parser.add_argument("resized_image")
    args = parser.parse_args()
    # Create a dictionary of the shell arguments
    resize_image(args.image, args.resized_image)

if __name__ == "__main__":
    main()
``` 
* Test the script
```bash
wget https://image.isu.pub/170511092643-22144705c27a3307c43c7155f2727f69/jpg/page_1.jpg
mv page_1.jpg dog_food.jpg
python3 image_resize.py dog_food.jpg dog_food_resize.jpg
```
* Update the above code and save as `lambda_function.py`
```python
import boto3
import os
import sys
import uuid
from urllib.parse import unquote_plus
from PIL import Image
import PIL.Image

import logging
from os import path

logger = logging.getLogger()
logger.setLevel(logging.INFO)

s3_client = boto3.client('s3')

def resize_image(image_path, resize_path):
	with Image.open(image_path) as image:
		image.thumbnail(tuple(x/2 for x in image.size))
		image.save(resize_path)

def lambda_handler(event, context):
	for record in event['Records']:
		bucket = record['s3']['bucket']['name']
		key = unquote_plus(record['s3']['object']['key'])

	logger.info(f"The key is: {key}")
	
	_, tmpkey = os.path.split(key)
	
	logger.info(f"The temp key is: {tmpkey}")

	download_path = os.path.join("/", "tmp", tmpkey)
	upload_path = os.path.join("/", "tmp",  "resized_"+tmpkey)
	s3_client.download_file(bucket, key, download_path)
	resize_image(download_path, upload_path)

	if path.isfile(upload_path): 
		logger.info(f"Image has been created locally; uploading to s3 now at {bucket}/clean/{tmpkey}")
		s3_client.upload_file(upload_path, bucket, "clean/"+tmpkey)
		logger.info(f"Image upload to s3 complete")
	else: 
		logger.info(f"Resized image does not exist; no upload to s3 happened")
```
* Package the Lambda Function and the other dependant packages
```bash
thisfolder=$(pwd)
cd $thisfolder/venv/lib/python3.8/site-packages
zip -r9 ${thisfolder}/resize-image.zip .
cd ${thisfolder}
# add the lambda_function to the .zip file
zip -g resize-image.zip lambda_function.py
# check the contents of the zip file as follows
unzip -l resize-image.zip
```
* Create the Lambda Role and attach policy
```bash
aws iam create-role --role-name cli_image_resize_role --assume-role-policy-document '{"Version": "2012-10-17","Statement": [{ "Effect": "Allow", "Principal": {"Service": "lambda.amazonaws.com"}, "Action": "sts:AssumeRole"}]}'

# Policy 1
aws iam attach-role-policy --role-name cli_image_resize_role --policy-arn arn:aws:iam::aws:policy/service-role/AWSLambdaBasicExecutionRole
# Policy 2
aws iam attach-role-policy --role-name cli_image_resize_role --policy-arn arn:aws:iam::aws:policy/AmazonS3FullAccess
```
* Create the lambda function
```bash
aws lambda create-function --function-name cli_image_resize --zip-file fileb://resize-image.zip --handler lambda_function.lambda_handler --runtime python3.9 --role arn:aws:iam::209479284263:role/cli_image_resize_role

# optional update code
aws lambda update-function-code \
  --function-name cli_image_resize \
  --zip-file fileb://resize-image.zip
```
* Make a bucket `cli-lambda-images` with sub folders raw and clean
```bash
aws s3 mb s3://cli-lambda-images --region us-east-2

# subfolders
aws s3api put-object --bucket cli-lambda-images --key raw/ --content-length 0
aws s3api put-object --bucket cli-lambda-images --key clean/ --content-length 0
```
* Set the permission for Lambda to explicitly allow s3 to access it 
```bash
aws lambda add-permission \
  --function-name cli_image_resize \
  --statement-id AllowS3Invoke \
  --action lambda:InvokeFunction \
  --principal s3.amazonaws.com \
  --source-arn arn:aws:s3:::cli-lambda-images \
  --source-account 209479284263
```
* Create Event Notification for the s3 bucket which is usually set via the Console. This configuration needs to be saved to a notification.json file. TIP: To get the configuration of another such event to copy and paste then use the following command `aws s3api get-bucket-notification-configuration --bucket bucket_name --region us-east-2`

```bash
nano notification.json
# write the following in the above file
{
    "LambdaFunctionConfigurations": [
        {
            "Id": "s3_image_upload_raw",
            "LambdaFunctionArn": "arn:aws:lambda:us-east-2:209479284263:function:cli_image_resize",
            "Events": [
                "s3:ObjectCreated:Put"
            ],
            "Filter": {
                "Key": {
                    "FilterRules": [
                        {
                            "Name": "Prefix",
                            "Value": "raw/"
                        },
                        {
                            "Name": "Suffix",
                            "Value": ""
                        }
                    ]
                }
            }
        }
    ]
}
```
* Add this notification to the required bucket
```bash
aws s3api put-bucket-notification-configuration --bucket cli-lambda-images --notification-configuration file://notification.json
```

* Test by uploading an image to the bucket
```bash
aws s3 cp dog_food.jpg s3://cli-lambda-images/raw/
```
* This will trigger the lambda function and the uploaded image will be cleaned and put into the clean folder of the bucket
---

##### 4. SAM (Serverless Application) Workshop
Extra concepts
* [Cloudformation](https://www.youtube.com/watch?v=0Sh9OySCyb4&t=279s)
* [SAM](https://www.youtube.com/watch?v=MipjLaTp5nA&t=807s)
* []
---

#### Workshop: Lambda Project
* Superstore ETL Project [GitHub Link](https://github.com/sanyassyed/DataEngineering_SuperStore_Data_ETL_Pipeline)

* Todo: 
    * Add read me documentation by adding architecture and the project files and structures
    * Fix commands to setup the Lambda function i.e write a make file
    * Use IaaC SAM to create the Lambda function, Roles and Policies.

---



---
## Week 4 - Data Ingestion - Airbyte, Data Ingestion and Snowflake
---
### Lectures and Lab
#### Lecture 1: 
##### Datawarehouse vs Database (Traditional Relational DB's)
- Structure

| Feature     | MySQL                   | Postgres                | Snowflake              |
|-------------|--------------------------|--------------------------|--------------------------|
| **Schemas** | Technically supports them, but underused (often uses just one schema per DB) | Fully supports schemas (commonly used) | Core part of design, heavily used |
| **Typical Use** | Most people just use `database → table` | `database → schema → table` | `database → schema → table` |
| **Use in real-world** | Apps often treat the database as the whole workspace | Schemas used to organize tables by module/domain | Schemas often map to pipeline zones (e.g., landing, curated) |

- Compute & Storage
    -  Snowflake uses cloud object storage under the hood (like AWS S3), which enables efficient scaling and durability.

| Feature | Traditional RDBMS (MySQL/Postgres) | Snowflake |
|--------|-------------------------------------|-----------|
| **Compute & Storage** | Tightly coupled – compute and storage run on the same server | Decoupled – compute via Virtual Warehouse, storage on cloud |
| **Compute** | Handled by the server's CPU and memory | Handled by Virtual Warehouses (XS, S, M, L, XL, etc.) |
| **Storage** | Server’s local disk or attached storage volume | Cloud storage (e.g., AWS S3, Azure Blob) |
| **Scaling** | Vertical (upgrade server hardware) | Elastic (independently scale compute and storage) |
| **Cost Efficiency** | Pay for uptime regardless of usage | Pay-as-you-go (pause compute to save costs) |
| **Cost Estimate** | Pay for the entire server 24/7, even when idle | Compute billed per second; storage billed per GB/month |
| **High Availability** | Requires manual setup (e.g., replication, failover) | Built-in high availability (cloud-native architecture) |
| **Auto-scaling** | Manual and complex to configure | Built-in auto-scaling of compute resources |
| **Performance Boosting** | Limited by server capacity | Instantly scale up warehouse size or add more clusters |

    
##### Snowflake
- `Warehouse` in Snowflake refers to a `compute resource`, similar to an EC2 instance. It provides the processing power for executing SQL queries, loading data, and performing other tasks.  
  - Warehouses can be scaled up or down and paused when not in use to save costs.

- Creating a Warehouse:
  - Via UI:  
    Main Page → Left Sidebar → **Admin** → **Warehouses**
  - Via Query: 
    Main Page → Left Sidebar → **Worksheets** → Use the **+** sign to create a new worksheet where you can write, execute, and save your SQL queries.

- Snowflake Account Structure:
  - A `Snowflake account` can contain multiple `Databases`.
  - Each `Database` contains one or more `Schemas`.
  - Each `Schema` contains various `data objects`.
  - Databases → Schemas → Objects

- Databases:
    - Common environments:  
        - `Development` 
        - `Staging / Testing / Beta` 
        - `Production`
    - In Snowflake when a Database is first created the following get created by default
        - `Public` Schema
        - `Schema` : Stores the meta data about the schemas i.e Tables, Views etc's information; column information etc.

- Schemas:  
  - Snowflake is case sensitive if string is within quotes. For example these two are different schemas `TPCDS."raw"` and `TPCDS.RAW`
  - Logical groupings within databases used to organize data and objects.  
  - Examples of schema zones in a data pipeline:
    - `Landing Zone Schema:` Where raw data is ingested
    - `Enterprise Zone Schema:` Where data transformation/processing logic is applied
    - `Business Zone 1/2/3 Schemas:` Final curated data for business users

- Schema Objects:
  - Tables
    - Permanent Table: Default; persists until manually dropped
    - Transient Table: Doesn’t support long-term time travel; useful for intermediate storage
    - Temporary Table: Session-specific; disappears after the session ends
- Views
    - A **View** is like a **saved SQL query** that looks like a table.
    - It **doesn’t store any data** — it just runs the query each time you use it.
    - Because it runs fresh each time, it can be **slower for large data**, but it's **not expensive** since no storage is used.
    - Ideal for lightweight reports or frequently changing logic.
    - Eg: A View is like an **à la carte menu** — the dish (query) is **cooked fresh** every time you order it.
    ```sql
    CREATE VIEW high_value_orders AS
    SELECT * FROM orders WHERE total_amount > 1000;
    ```
    - This doesn’t store the data, just the logic.
    - When you run `SELECT * FROM high_value_orders;` Snowflake runs the full query on the orders table
- Materialized Views:
    - A **Materialized View** is also based on a SQL query, **but it stores the result**.
    - That means you **don’t need to compute the query every time** — it’s already done.
    - Snowflake **keeps it updated** in the background when the underlying data changes.
    - It’s **faster to query**, but **costs more** because it uses **storage and compute** to stay fresh.
    - Eg: A Materialized View is like a **meal prep service** — the food (query result) is already cooked and stored, so it’s **ready to serve** quickly.
    ```sql
    CREATE MATERIALIZED VIEW monthly_sales_summary AS
    SELECT product_id,
            DATE_TRUNC('month', sale_date) AS month,
            SUM(amount) AS total_sales
    FROM sales
    GROUP BY product_id, DATE_TRUNC('month', sale_date);
    ```
    - When you run `SELECT * FROM monthly_sales_summary;` You get faster performance, because results are precomputed.
    - The result of this aggregation is **stored** and **automatically refreshed** when new sales come in.
    - Useful for dashboards or reports that are accessed often.
- Stage: Temporary or persistent storage location for loading/unloading data
- Storage Integration: Secure integration with external cloud storage (e.g., S3, Azure Blob)
- File Format: Definitions for parsing incoming data files (CSV, JSON, etc.)
- Sequence: Generates unique numeric values
- Pipe: Enables continuous data loading with Snowpipe
- Stream: Tracks changes (CDC) on a table
- Task: Automates execution of SQL code on a schedule or trigger
- Function: Custom SQL or JavaScript functions
- Procedure: Blocks of procedural logic written in SQL or JavaScript
- Dynamic Table: Automatically keeps materialized views up to date using incremental updates


- Example Structure of Datawarehouse:
    * `Development Database` - Layer 1
        * Landing Zone `Schema` - Layer 2
            * Table 1 - Layer 3
            * Table 2
            * View 1
            * View 2
        * Enterprise Zone `Schema`
            * Table 1
            * Table 2
            * View 1
            * View 2
        * Business Zone 1 `Schema`
            * Table 1
            * Table 2
            * View 1
            * View 2
        * Business Zone 2 `Schema`
            * Table 1
            * Table 2
            * View 1
            * View 2
    * `Production Database`
        * Landing Zone `Schema`
            * Table 1
            * Table 2
            * View 1
            * View 2
        * Enterprise Zone `Schema`
            * Table 1
            * Table 2
            * View 1
            * View 2
        * Business Zone 1 `Schema`
            * Table 1
            * Table 2
            * View 1
            * View 2
        * Business Zone 2 `Schema`
            * Table 1
            * Table 2
            * View 1
            * View 2

---



##### Snowflake Editions
Snowflake offers multiple editions to choose from, ensuring that your usage fits your organization's specific requirements.They are as follows:

1. Standard Edition - 
    - 1 Day time travel
    - Choose manually the Warehouse (i.e. the compute power) required for the query
1. Enterprise Edition (Standard +)
    - Upto 90 day time travel
    - Multi-cluster Warehouse: This feature helps in automatically selecting the Warehouse required for the query based on the requirement from XS, S, M, L etc.
1. Business Critical Edition (Enterprise +) 
    - Enhanced Security Policy
1. Virtual Private Snowflake (VPS) Edition (Business Cricical +) - Eg: Customer-dedicated metadata store


##### Data Modelling
- When deciding the structure of the Schema we look at the following
    - What tables, views etc we need
    - In tables what is the `access pattern` (which can be implemented via `clustering` using `CLUSTER BY (key_name(s))`) like
        - What colums will be accessed most
        - What colums can therefore be used as clusters to help access of the requently queried columns to be faster

##### Snowflake Elements Creation via Syntax
###### DATABASE
- use database_name;

###### SCHEMA
- CREATE SCHEMA IF NOT EXISTS db_name.schema_name
- USE SCHEMA schema_name;
- SHOW TABLES;
- SHOW TABLES IN schema_name;

###### TABLE
- CREATE OR REPLACE TABLE schema_name.table_name
(key1 int,
key2, int,
key3 int,
description varchar(10),
default_timestamp_col timestamp default current_timestamp())
CLUSTER BY (key1, key2);
- CREATE TABLE IF NOT EXISTS...
- CREATE TRANSIENT TABLE...
- CREATE TEMPORARY TABLE...
- CREATE OR REPLACE TABLE table_name
`LIKE` another_table_name
CLUSTER BY (col1, col2); - creates an empty table so only brings structure
- CREATE OR REPLACE TABLE table_name
`CLONE` another_table_name
CLUSTER BY (col1, col2); - copies the structure and content
- CREATE OR REPLACE TABLE schema_name.table_name
(key1 int,
key2, int,
key3 int)
`AS`
(SELECT col1, col2, col3 FROM another_table)
CLUSTER BY (key1, key2);
- DROP TABLE schema_name.table_name;
- UNDROP TABLE schema_name.table_name;
- INSERT INTO TABLE schema_name.table_name VALUES (val1a, val2a), (val1b, val2b), (val1c, val2c);
- ALTER TABLE schema_name.table_name `RENAME` TO schema_name.new_table_name;
- ALTER TABLE schema_name.table_name `ADD COLUMN` col_name col_type;
- ALTER TABLE schema_name.table_name `RENAME COLUMN` col_name TO new_col_name;
- ALTER TABLE schema_name.table_name `ALTER COLUMN` col_name SET TYPE new_data_type;
- DESCRIBE TABLE schema_name.table_name;
- SHOW COLUMNS IN schema_name.table_name; : Similar to `DESCRIBE TABLE`
- SELECT * FROM table_name;

###### Query
- Kill hanging queries
- Get the `query` from the Query History
- SELECT SYSTEM$CANCEL_QUERY('query_id');
- Only a data admin can run the above query

###### ROLE
- Role is similar to IAM role in AWS
- A Role can decide an account can use which:
    - Warehouse
    - Database
    - Schema
    - Table (rarely happens)
- CREATE [OR REPLACE] ROLE [IF NOT EXISTS] role_name;
- GRANT USAGE DATABASE database_name TO ROLE role_name;

##### Snowflake Elements Creation via UI:
The UI will automatically create the SQL template to create the following:
###### Database
- Main Page → Left Sidebar → **Data** → **Databases** → **+Database** button on the top right

###### Schema
- Main Page → Left Sidebar → **Data** → **Databases** → Select the Database → **+Schema** button on the top right

###### Table
- Main Page → Left Sidebar → **Data** → **Databases** → Select the Database → Select the Schema → **Create** button on the top right  → Then select Table/View etc  from the drop down menu

##### Other Topics
**NOTE: REFER TO PPT FOR NOTES**
- Marketplace
- Activity 
    - Query History 
    - Copy History

##### Snowflake Architecture
![Snowflake Architecture](../images/4.1_Snowflake_Architecture.png)
- All layers are decoupled
- They can all be scaled differently
- All layers have access to other layers therefore when multiple queries are run by mutiple users you need optimization and metadata to direct the resources in the right direction. I.e. making sure the qurey is accessing the right table the right warehouse size etc.
- A query has to pass through all these layers in order Eg: SELECT * FROM table WHERE column1='filter'
    - Layer 1 - Cloud Services
        - Authentication : Check if the person (role) has the permission to even run this query
            - Infrastructure : This manages the infrastructure i.e for this table what warehouse and storage is required etc.
            - Optimiser: 
                - It knows which database the query should run on and hence optimizes the query run rather than the query running on the wrong database
                - It also decides which size of warehouse to use for the query this is available in the Enterprise Edition
                - This Layer uses information from the Metadata layer
            - Metadata: Contains metadata about the data warehouse, schmas, table etc. (Does the table even have a column name column1 which holds the value 'filter' if not then it won't even execute the query).
            - Security : 
    - Layer 2 - Compute
        - This is more expensive than cost of storage
        - It sizes can range from X-Small to 6X-Large
    - Layer 3 - Storage
        - The data can be staged in different Data Lakes Eg: Snowflake Storage, S3, Microsoft Azure etc.
        - Data is stored as column-store; the data is easily compresseble here. Eg: Country column data can be compressed to store only the unique values and the metadata stores which rows have which column value.


##### Time Travel
- Get data from the data objects (table, views etc) at a particular point in time
- SELECT * FROM my_table AT(TIMESTAMP => 'Fri, 01 May 2015 16:20:00 -0700'::timestamp); - data at a particular timestamp
- SELECT * FROM my_table AT(OFFSET => -60*5); - data from 5 minutes ago 

##### Common Data Types
- INT
- NUMERIC(38, 2) - numbers with decimals
- VARCHAR(XXX)
- BOOLEAN
- DATE
- TIMESTAMP

---

##### Method 1: Local Server → Snowflake DB: Data Load Via SnowSQL CLI using USER SPECIFIC STAGE
Here we see how we load data from local system to Snowflake DB table using the following steps
1. Install SnowSQL CLI on Local Server
2. Connect to Snowflake DB from Local Server using snowsql
3. Load Data from Local Server to Snowflake DB

**NOTE: - Use cloud shell (US East 1 N. Virginia) for this**

###### 1. INSTALL SnowSQL CLI
- Install SnowSQL CLI on the cloud shell [Lecture 3-Lab1](#x-lecture-3--lab-1--aws-and-linux-workshop-2023-07-29)

###### 2. CONNNECT
- Grab the `account URL` from Snowflake UI (bottom left corner of Main Menu click on the account number and select `copy account URL`)
```bash
# view all the directories in the home directory
ls -al
# if snowsql is installed you should see .snowsql directory
snowsql --version
# Connect to snowflake using accountname <account_locator>.<region>.<cloud> and username and pwd
# eg: snowsql -a F******.us-east-*.aws -u SAN*****
snowsql -a mk81553.ca-central.aws -u sanya1234
Password:
# Now you are connected to Snowflake db; so you can use SQL commands
show warehouses;
use warehouse warehouse_name
use DATABASE demo_db
SELECT * FROM table1;
# CTRL+Z to exit
# easy way to connect to snowflake
# goto config file
cd .snowsql
cd 1.2.27
nano snowsql.cnf
```
- In the config file; do the following
    - Change [connections.example] to your connection name
    ```yml
    [connections.wcd]
    accountname = F******.us-east-2.aws
    username = SA*****
    password = ****
    ```
    - Add the details for accountname, username and password
    - Now rather than giving the above details everytime you can connect to snowflake as follows where `example` is the connection name
    - snowsql -c wcd

###### 3. LOAD Data
- File for the exercise [city.csv](https://drive.google.com/file/d/1OjfICorv5awMlykK-kYZvI4Er9wPHsx4/view)
- Create a Database, Schema and Table in Snowflake as follows
```sql
drop database if exists walmart_Dev;

create database if not exists walmart_dev;
create schema if not exists  enterprise;

Create or replace table enterprise.city
(cty_id int,
cty_name varchar);
```
- Data Staging
    - The data is first staged here before it can be loaded into a table
    - There are two types
        1. Internal Named Stage : folder to get names organized for you `@namestage ;`
        1. User Sepcific Stage `@~ ;`
    - Steps: Data (in local File System) → PUT → Internal-Name Stage / User Stage → COPY INTO → Table in a DB

```sql
-- Snowflake UI
-- run these in Snowflake UI
-- clean stage if needed
-- removing any old data in user stage
rm @~;
-- listing the data in the user stage
list @~;
-- Once checked that it is empty
-- Create a table where the data will be loaded
CREATE TABLE..
```
```bash
# On the local server
# Load the data from server to Snowflake Data Stage
# -c connection -q query enclosed in "" by mentioning the Data Staging Tag
snowsql -c example -q "put file://file_name.csv @~;"

```

```sql
-- Snowflake UI
list @~;
-- Now you will see the uploaded data here
-- Copy data from the Staged area into the Table
COPY INTO db_name.schema_name.table_name FROM @~/file_name.csv
-- Check data in the table
SELECT * FROM db_name.schema_name.table_name;
```


##### Method 2: S3 → Snowflake DB: Data Load Automatically using NAMED STAGE
Here we see how data load into Snowflake DB table is automatically triggered when data is loaded into an s3 bucket. I.e a STAGE integrated with S3 can upload and download a file directly from S3. To do this do the following:
1. Create an S3 bucket `snowflake-stage-bucket-<your name>`
1. Create a new IAM Role and attach to it a Policy in AWS to give Snowflake access to that S3 bucket as follows
     - Create a New Role
     - Entity type: AWS Account
     - Another AWS account (Give a dummy ac id as later we will get the snowflake account id)
     - External ID - 0000
     - Create Custom Policy
         - Policy Editor - JSON
         - Copy Paste the JSON Permission Script here
        ```json
        {
            "Version": "2012-10-17",
            "Statement": [
                {
                    "Effect": "Allow",
                    "Action": [
                        "s3:PutObject",
                        "s3:GetObject",
                        "s3:GetObjectVersion",
                        "s3:DeleteObject",
                        "s3:DeleteObjectVersion"
                    ],
                    "Resource": "<paste-bucket-arn-number-here>/*"
                },
                {
                    "Effect": "Allow",
                    "Action": [
                        "s3:ListBucket",
                        "s3:GetBucketLocation"
                    ],
                    "Resource": "<paste-bucket-arn-number-here>",
                    "Condition": {
                        "StringLike": {
                            "s3:prefix": [
                                "*"
                            ]
                        }
                    }
                }
            ]
        }
         ```
        - Add the S3 Bucket's ARN number in the JSON script
        - Give the policy a name `snowflake-stage-bucket-policy`
        - Create the policy
     - Add this newly created policy to the new Role
     - Give the Role a name `snowflake-stage-bucket-role`
     - Create the role
1. Create an INTEGRATION at Snowflake
    - We are going to connect the IAM Role to Snowflake 
    - Get the role ARN
    - Type the code in Snowflake UI `CREATE OR REPLACE STORAGE INTEGRATION...`
    ```sql
    CREATE OR REPLACE STORAGE INTEGRATION S3_INT_WCD_LECT1
    TYPE = EXTERNAL_STAGE
    STORAGE_PROVIDER = S3
    ENABLED = TRUE
    STORAGE_AWS_ROLE_ARN = '<arn-of-the-aws-role>'
    STORAGE_ALLOWED_LOCATIONS = ('s3://snowflake-stage-bucket-sanya');
    ```
    - Once the INTEGRATION is created get the `AWS_IAM_USER_ARN` & `EXTERNAL_ID` using the command `DESC INTEGRATION<your integration name>` 
    - Replace these values in the Role on IAM under `Trust Relationships` tab
    ```json
    {
        "Version": "2012-10-17",
        "Statement": [
            {
                "Effect": "Allow",
                "Principal": {
                    "AWS": "<STORAGE_AWS_IAM_USER_ARN>"
                },
                "Action": "sts:AssumeRole",
                "Condition": {
                    "StringEquals": {
                        "sts:ExternalId": "<STORAGE_AWS_EXTERNAL_ID>"
                    }
                }
            }
        ]
    }
    ```
1. Create a `FILE FORMAT` in Snowflake using `CREATE OR REPLACE FILE FORMAT....`
```sql
USE database WALMART_DEV;
USE SCHEMA ENTERPRISE;

CREATE or REPLACE FILE FORMAT CSV_COMMA
TYPE ='CSV'
FIELD_DELIMITER = ',';
```
1. Grant necessary rights to create the stage in the schema & to use the integration that connects to AWS
```sql
GRANT CREATE STAGE ON SCHEMA enterprise to ROLE accountadmin;
GRANT USAGE ON INTEGRATION S3_INT_WCD_LECT1 to ROLE accountadmin;
```
1. Create a NAME STAGE with such an INTEGRATION
```sql
-- Create the STAGE with this query:
CREATE OR REPLACE walmart.enterprise.STAGE WCD_LECT1_STAGE
STORAGE_INTEGRATION = S3_INT_WCD_LECT1
URL='s3://your bucket name'
FILE_FORMAT = CSV_COMMA;
```
1. View the stage `SHOW STAGES;`
1. Upload a csv file into s3 and see if that trigerrs to load in Snowflake
1. Check the stage if data from s3 has arrived or not `List @WCD_LECT1_STAGE;`
1. Now copy the data from the name stage into a desired table
```sql
COPY INTO walmart.enterprise.city from @WCD_LECT1_STAGE/city.csv
FILE_FORMAT =CSV_COMMA;
```
1. [Checklist for the above two methods](../analytical/week4/SnowflakeFileTransferChecklist.md)
---
##### Connect Snowflake to other apps to upload and download data
- DBeaver : SQL client SW app and a db admin tool
- VSCode : 
- PowerBI : 
- Metabase :

#### Lecture 2: Airbyte, Lambda & Project Data Ingestion
- **Airbyte**
- Airbyte is an open-source data integration tool with an extensive library of connectors for syncing data from various sources.

- **AWS Lambda**
- AWS Lambda is a serverless computing service that enables developers to run code without provisioning or managing servers.

- **Pre-requisites**
    1. **EC2 Instance for Airbyte Setup**:
        - Use a large EC2 instance with Docker and Docker Compose installed.
        - Install Airbyte by following the steps outlined [here](#x-lab-install-airbyte-and-metabase-with-docker-).

    1. **EC2 Instance for Project Development**:
        - This instance should have SnowSQL installed.
        - Follow the instructions in `Task-6` provided [here](#x-lecture-3--lab-1--aws-and-linux-workshop-2023-07-29).

    1. **Snowflake Account**:
        - Create a Snowflake account


##### Project Execution:
* The Lecture 2, 3 & Practice labs are a part of the midterm project - [DataEngineering_Retail_ETL_Pipeline](https://github.com/sanyassyed/DataEngineering_Retail_ETL_Pipeline)
* Find the notes of the project [here](https://github.com/sanyassyed/DataEngineering_Retail_ETL_Pipeline/blob/main/docs/project_creation.md)

---

#### Lab 1: Project Part-1 

---

### Practice
#### Exercise-1 Snowflake Exercise
* Completed in Lecture 1 - find notes there
#### Workshop-2 Airbyte
* Completed in Lecture 2 as a part of the midterm project
* [Airbyte Playground](https://demo.airbyte.io/workspaces/55c39a0b-037d-406c-a1ac-00393b055f18/connections)
#### Exercise-2 Lambda Function Ingest Data
* Completed in Lecture 2 as a part of the midterm project
#### Lab - Project Capstone 1: Data Ingestion
* Completed in Lecture 2
---

## Week 5 - Data Transformation - Data Warehouse
### Pre-work
#### What is a data warehouse
* What is a database?
    * OLTP - Online Transaction Processing
    * For transactional databases, mostly used for transaction data, good for data write, not good for data read.
    * Normalised form of Data Model preferred
* What is a datawarehouse?
    * OLAP - Online Analytical Processing
    * For data analytical functions, the data warehouse we will frequently use is OLAP. To understand the difference in database design
    * Denormalized form of Data Model preferred (dimension & Fact Tables)
* What is a datalake?
    * Data lake is storage system that is used to store large volumes of raw, unstructured, semi-structured data in its original format,
* Data Modelling: 
    * Is the process of designing the structure of the Database or the Data System
    * Main Data Model Methods:
        * Normalization Data Models: A Schema design to store `non-redundant` and `consistent data`
            * Data Integrity is maintained
            * Little to no redundant data
            * Many Tables
            * Optimized for storage of data
        * Denormalization Data Models: A schema that combines data so that `accessing data` (query) is `fast`
            * Data integrity is not maintained
            * Why: In denormalized tables, the same data is stored in multiple rows.
            * Example: If a customer’s address is repeated in every order row, and the customer moves, updating the address in all rows may be missed → inconsistent data.
            * Redundant data is common
            * Fewer tables
            * Excessive data, storage is less optimal
* Dimensional Modelling:
    * Is specialized data modelling for Business Intelligence
    * It is design methodology used in DW to organize and structure data for easy and efficient querying and reporting
    * Is mostly Denormalized (Star Schema)
    * Why?
        * Easy to query as query will run on fewer tables
        * We need fewer joins as possible for faster querying and reporting
* Important Terminologies
    * Bridging Table
    * Granularity - the level at which each data row in your fact table is
    * Drill-down
* Why do we need a data model in a data warehouse? 
    * Characteristics of a DW (**TINS**)
        * Time Variant - Since it stores historical data we can analyse data over time
        * Integrated - Data is brought in from various sources
        * Non-Volatile - Data is static and once data enters a DW it stayes there
        * Subject Oriented - DW is designed keeping in mind the subject
##### **Webinar 1** Data Modelling Process - Designing DW from the ground up. It is a full data modelling process
* Resource Video[Designing Your Data Warehouse from the Ground Up](https://www.youtube.com/watch?v=patBYUGwsHE)
* 4 Steps to designing a star schema in a DW:
    * **Step 1** Identity the Business Process
        * How the business works not a department 
        * Always start with High Impact & Low Risk item
        * i.e capturing which data and building the DW will have the highest positive impact on the business but is low risk
    * **Step 2** Identify the Grain 
        * What one row in the fact table represents 
        * Choose the most atomic level (the lowest granular level)
        * "One row represents a movie rented by a customer from an employee in a store on a day" 
        * More Granular: "One row represents a coupon code applied to a movie rented by a customer from an employee in a store on a day" if you want to add coupon codes to the rental data where more than one coupon can be applied to a rental
    * **Step 3** Choose the Dimensions 
        * Attributes (columns) for the dimensions are the ones that are most descriptive
        * Always include the date dimension
        * Select the smallest data type so data processing does not become heavy; eg: don't store all as string
        * Best Datatype: a single field non-nullable data type -it is just a column that stores one type of value and cannot be left empty
        * Use user friendly naming conventions
        * Build for opportunities to build in natural hierarchy as it gives you performance bonus
        * Eg: dimension Tables: DimProduct, DimEmployee, DimCustomer, DimStore, DimSaleDate
    * **Step 4** Choose the Measures 
        * Measures are the columns in a Fact table
        * Measures are going to be - How does the business measure success?
        * If we identify a measure that violates our grain then we go back to **Step 2 Identify the Grain**; revisit the grain level, check the dimensions and reevaluate the measures
        * Eg: What was the sale amount? What is the cost on the line item?
        * Best measures are the ones that can be aggregated or additive and can be rolledup and sliced based on the dimensions - Eg: If we roll up sales by geography, if rollup by customers etc they all make sense
        * Non-additive measures - `Profit Margin` cannot be added by Geography so such measures are best handled by Data Access/Analytics tools eg: PowerBI, Tablaeu 
        * Time related Measures like `Year to Date Sales`, `Year over Year`, `Sales\Quantity Last Year` are best handled by analytics tools 
        * KPI Metrics type of measures eg: red light, green ligth etc are best handled by analytics tools
        * Understand the number of rows in the fact table
        * If Big Data then think about partitioning data eg: by hour, or aligning it with partitions in the tables in the DB could also give you good performance in the fact table
        * Eg: Fact Tables: FactVideoSales
        * Eg: Fact Table Measures- SalesDollarAmout, Quantity, CostAmount
* Reasons you want a surrogate key:
    1. Insulating from-source changes if the data in the source changes (like if the PK in the source data  changes this DW data is not disturbed)
    2. To track historical date in the dimensions  ( the surrogate key is auto generated so if the same item id has a price change it will have a new surrogate key and this will help us track price changes. If we used the product id as primary key; such changes will be hard to track)
    3. Data joins with the fact table are simple & less complex (Optimizes joins) as the SK are simpler and don’t need any pre processing
* Business key vs Surrogate key 
    * BK: the id the business uses to identify the item used mainly as primary key in DB
    * SK: to identify the item in the DW  and tract it over time. Also to keep it separate from the BK which could change over time or be diff in each department. It is a key that helps us version the data
* Books:
    * The Data Warehouse Toolkit by Ralph Kimball
    * Star Schema - The Complete Reference
    * Agile Data Warehouse Design by Lawrance
##### **Webinar 2** : [dimensional Modelling](https://youtu.be/lWPiSZf7-uQ?si=iFJ2EgTipaRTrqTQ) - is a data model tutorial on the concepts and practice of the Kimball Method
* Why a Data Warehouse?
    * To document historical data
    * Controls Governance: To manage different discrepencies eg: different names for a product in different departments
    * Supporatbility: cleans & transforms data and keeps it ready for you to use
    * Not good for unstructured data, short term goals where you won't use the datawarehouse much etc.
* Is dimensional Modelling Still a thing?
* OLTP:
    * Designed for inserts and updates as you will be locking the data while doing these actions and you want locking to be quick
* OLAP:
    * It is a copy of the OLTP Data
    * Accessing the data quickly is the most important
    * Locking is not an issue
    * Insert and Update speeds are not relevant
* What is dimensional Modelling?
    * Data Maintenance; performance is secondary
    * Data is denormalized  as needed to support reporting
    * The modelling is based on the questions the business wants to ask
    * Descriptive Data is seperated from Quantitative Data
    * What is a Dimension?
        * Makes up 95% of the data
        * Can be numeric but often text based
        * They describe something
    * Bus Matrix:
        * ![Bus Matrix](../analytical/week5/bus_matrix.png)
    * How to differentiate between Dimensions & Measures
        * Use the user story of the business to understand the domain. Ask questions like below to the business to understand the required details to be captured in the DW which they will use for analaysis 
            * Eg 1: of a person purchasing a product: `Mary Jones buys 1 book for $22.50 entitled "Agile Data Warehouse Design" on December 2, 2013 at 3:12 PM via Amazon.com using her Visa card to be delivered on December 10, 2013 by UPS.` 
            * Eg 2: `Boston University (Who?) orders 2000 books (What?) for $10000 (How Much?) using a Corporate Amazon Membership discount (How?) with Amazon credit financed (Where?) at 8% interest (How?).`
        * 7 W's of DW Design
            * Who - D `Mary Jones`
            * What - D `1 book Agile Data Warehouse Design`
            * Where - D `Amazon.com`
            * When - D `December 2, 2013`
            * Why - D 
            * How? - D `Visa card`
            * How Many/Much? - M `$22.50`
    * Slowly Changing dimensions (SCD):
        * Dimension values can change and how the change is handled depends on the value the business places on knowing the historical values of a dimension
        * Example: `The New York store is reassigned from the Northeast Region to the Middle Region. Does management want to be able to see changes in sales as the Northeast Region before the change and Middle Region after the change?`
        * How does the business want to manage this change?
        * Type 1
            * Simply overwrite the existing dimension data with the new information.
            * Advantage:Easiest to implement
            * Disadvantage: Lose ability to see how data looked previously.
            * Example: `After the change, all sales history for the New York store would be reported as the Middle Region`
        * Type 2:
            * We keep all historical values of the dimension. The SK will help us do that
            * Advantage:Better ability to report accurately historically.
            * Disadvantage: Most complex to implement.
            * Example: `Example: Sales in the New York store made prior to the change will be reported in the Northeast Region but any sales after that will be reported in the Middle Region.`
        * Type 3:
            * We keep the prior value and the new value. That would mean you have an extra column to store the previous value
            * Advantage: Easier to implement than SCD Type 2 while still providing some support for historical reporting. Makes sense when you are trying to capture changes in data that will have only two stages like living and not living,
            * Disadvantage: Historical reporting is limited.
            * Example: `Example: Sales in the New York store made prior to the change will be reported in the Northeast Region but any sales after that will be reported in the Middle Region. However, if the store was moved to the Southeast Region subsequently, you would lose that it was ever in the Northeast Region`
        * Conformed Dimensions:  is a single, shared dimension table with consistent attributes and meaning used across multiple fact tables, such as a "Date" dimension used by both Sales and Inventory fact tables to ensure data can be compared across different business processes. Another common example is a "Product" dimension, containing shared information like product ID, name, and category, which can be referenced by sales facts, inventory facts, and other related data tables. 
* [Understanding the ETL Process Video](youtube.com/watch?v=wDTzxdShbd8&feature=youtu.be):
    * What is ETL?
    * ETL vs ELT
    * Real World Example:
        * Input Data in the DB : Sales Person, Product. Date, Sales, Boxes
        * Tranform the above data
            * Data Cleansing
            * Remove Duplicates
            * Add Keys & ID's
            * Combine or Merge Data
        * Analytics Questions: Monthly Report to see for each Sales Person & Each Product 
            1. How much Sales were made? 
            2. How many boxes were sold 
            3. How many orders were there? 
            4. How many orders more than $1000 
            5. How many orders more than $1000
    * ETL Tools:
        * SQL - Extract (SELECT), Transform (SELECT) & Load (INSERT)
        * Power Query
    * ETL Demo
        * Database - `awesome_db`
            * geo table
            * people table
            * products table
            * sales table
                * SPID
                * GeoID
                * PID
                * SaleDate
                * Amount
                * Customers
                * Boxes
        * Datawarehouse - `awesome_wh`
            * monthly_summary table
                * YearMonth
                * ProductID
                * PersonID
                * TotalSales
                * TotalOrders
                * Orders>1k
                * Orders>5k
                * TotalBoxes
        * Query
        ```sql
        USE awesome_wh;
        INSERT INTO monthly_summary
        (
            month_id,
            pid,
            spid,
            total_amount,
            count_amount,
            count_gt_1000,
            count_gt_5000,
            total_boxes
        )
        SELECT 
            TO_CHAR(s.SaleDate, 'YYYYMM') AS month_id,
            s.PID,
            s.SPID,
            SUM(s.Amount) AS total_amount,
            COUNT(s.Amount) AS count_amount,
            SUM(CASE WHEN s.Amount > 1000 THEN 1 ELSE 0 END) AS count_gt_1000,
            SUM(CASE WHEN s.Amount > 5000 THEN 1 ELSE 0 END) AS count_gt_5000,
            SUM(s.Boxes) AS total_boxes
        FROM awesome_db.sales s
        GROUP BY 
            TO_CHAR(s.SaleDate, 'YYYYMM'),
            s.PID,
            s.SPID;
        ```
* [How to design the ETL Process Video](https://www.youtube.com/watch?v=0hGWXL32w6Q):
    * DB:
        * ~~OrderId~~ 
        * OrderDate - This field is replaced by an id
        * ~~OrderPriority~~
        * OrderDiscount
        * ~~ShippingMode~~
        * UnitPrice
        * ShippingCost
        * ~~CustomerName~~
        * Province - This field is replaced by an id
        * CustomerType - This field is replaced by an id
        * ~~ProductCategory~~
        * ~~ProductName~~
        * ~~ProductContainer~~
        * ShippingDate - Used to calculate the ShipDelay
    * DW
        * FactSales Table
            * CustomerTypeId
            * OrderDateId
            * ProirityId
            * ProvinceId
            * `Quantity`
            * `Discount`
            * `unitprice`
            * `unitcost`
            * ShipDelay
            * ShipCost
            * OrderTotal - (Order Quantity * Unit Price + Shipping Cost) * (1-OrderDiscount)
            * UnitProfit - UnitPrice * (1 - OrderDiscount) - UnitCost
        * DimCustomerType Table
            * id
            * Description
        * DimPriority Table
            * id
            * Description
        * DimProvince Table
            * id
            * name            
        * DimDate
            * id
            * dayOfMonth
            * dayOfWeek
            * dayOfYear
            * weekOfYear
            * month
            * year
            * decade
            * rawdate
    * Data Staging
    * Data Extraction: 
        * Remove info from the db table the info that is not needed based on the dimension model and the analysis to be done
    * Data Transformation:
        * Handle missing data
        * Handle all dimensional data i.e extract or delete data that is required for the dimensional model eg: the highlighted data in the fact table is new info added, deleted some data from the DB table
        * Shipping Date is required for calcualting Shipping Delay
    * Data Loading
    * Example ETL Steps:
        * Read Data
        * Filter Column: Keep Priority column
        * GroupBy: Keep only unique values
        * Column Rename : Rename column to match the one in the DW table
        * Datawarehouse Writer: Write to the DW

---

### Lectures and Lab
#### Lecture 1 - Database & Data Warehouse Introduction

##### 1. Database Basics

* **Database**: An organized collection of structured data, stored and accessed electronically.
* **DBMS (Database Management System)**: Software that allows users to access, update, manage, and administer databases.

###### Early Database Systems

* **Flat file systems** – simple, but lots of duplication.
* **Hierarchical & Network DBs** – rigid, hard to manage.
* **Relational DBs (RDBMS)** – used tables (relations), reduced redundancy, enforced consistency.
* **NoSQL DBs** – created to handle scalability, flexibility, and availability needs.

---

##### 2. Database Design

###### 3-Step Process

1. Understand business requirements
2. Build a **conceptual data model** (ER diagrams)
3. Convert into relational or non-relational schema

###### Data Models

* **Tables (Relational)** → structured rows & columns
* **Documents (NoSQL)** → flexible JSON/XML
* **Flat files, JSON, XML** – used in practice for data interchange

---

##### 3. Relational Databases

* Data stored in **tables (relations)** with **primary keys**.
* **Transactions** must follow **ACID**:

  * **Atomic** (all or nothing)
  * **Consistent** (respect rules/constraints)
  * **Isolated** (independent execution)
  * **Durable** (results persist after completion)

###### Important Concepts

* **Schema**: Structure of tables, relationships, constraints
* **Tuple**: Row in a table
* **Attribute**: Column in a table
* **Domain**: Set of allowable values for an attribute
* **Keys**: Primary, Candidate(Keys other than the primary key that can together be the primary key), Foreign, Composite (Two columns that make up the PK), Surrogate

###### Normalization

* Organizing tables to remove redundancy and anomalies
* **1NF**: Atomic attributes (no repeating groups) - Least Normalized
* **2NF**: Full dependency on primary key i.e all columns must depend on the primary key/s. If not move them to a seperate table.
* **3NF**: No transitive dependencies. There shouldn't be any column that is dependant on another column (non primary key)
* **4NF**
* **5NF**: Most Normalized
* **Referential Integirty**: If a column is using referencing like foreign key; then that data should be available at the referenced point
* **Denormalization**
    * Adding redundancy to speed up reads (common in warehouses). Spend more on compute rather than storage
    * Reduces the need to make joins
---

##### 4. NoSQL Databases

* **Non-relational**, distributed, schema-less, horizontally scalable.
* **BASE** properties: Basically Available, Soft state, Eventually consistent.
* **CAP Theorem**: In distributed DBs, can only guarantee two of:

    * Consistency = Everyone always sees the latest message at the same time.
    * Availability = You can always send messages, even if servers are down.
    * Partition tolerance = The chat still works, even if some people lose internet temporarily.

###### NoSQL Types

* **Key-Value Stores** (Redis, DynamoDB)
* **Document Stores** (MongoDB, Firestore)
* **Column-Family** (Cassandra, Bigtable)
* **Graph DBs** (Neo4j)

---

##### 5. Data Warehouse (DW)

* **Definition (Ralph Kimball):**
  A system that extracts, cleans, and conforms data into a dimensional model for analysis & decision-making.

Almost right 👍 but let me refine it for you.

When people talk about **data warehouse modeling methodologies**, they usually mean the main approaches to designing how data is stored and related. Here’s the corrected view:

---

* Common Data Warehouse Modeling Methodologies

    1. **Kimball Method (Dimensional Modeling)**

    * Focuses on **star schemas** and **snowflake schemas**.
    * Business-focused, easy to understand.

    2. **Inmon Method (Corporate Information Factory / 3NF)**

    * Focuses on **normalized models** (3rd Normal Form).
    * Enterprise-wide, integrated view of data.

    3. **Data Vault Modeling**

    * Hybrid approach for modern warehouses.
    * Separates **Hubs (business keys)**, **Links (relationships)**, and **Satellites (context/history)**.
    * Great for scalability and auditing.

    4. **One Big Table (OBT)** (sometimes used as a **design shortcut**, not really a full methodology)

    * Denormalized, single wide table combining facts and dimensions.
    * Simple for BI tools, but not as flexible.

###### Goals

* Make information **accessible**, **consistent**, **timely**, **secure**, and **adaptable**.
* Provide a **trusted foundation** for decision-making.

###### OLTP vs OLAP

| OLTP (Operational)   | OLAP (Analytical)    |
| -------------------- | -------------------- |
| Handles transactions | Handles analysis     |
| Normalized schema    | Dimensional schema   |
| Current data         | Current + Historical |
| Small queries        | Aggregated queries   |

---

##### 6. Dimensional Modeling (Kimball Method)

* Focused on **business understanding** and **query performance**.
* Works best with **Star Schema** (fact + dimensions).

###### Components

* **Fact Tables**: Store measurements (numeric, quantitative data).
    * Capture the “what happened” at a point in time.
    * Represent measures/events that won’t change later (sales amount, rental fee, quantity, etc.).
    * If you miss capturing them when they happen, you can’t “recreate” them exactly afterward.
* **Dimension Tables**: Store descriptive context (who, what, where, when, how, why).
    * Describe the “who, what, where, when” of an event.
    * They can evolve over time (new products, customers, locations, etc.).
    * Adding/changing dimension attributes usually doesn’t invalidate historical facts.

###### Design Steps

1. Identify the **business process** (e.g., Sales, Inventory).
2. Declare the **grain** (lowest level of detail, e.g., per transaction).
3. Identify **dimensions** (time, customer, product, location).
4. Identify **facts** (sales amount, quantity, etc.).

###### Types of Fact Tables

* **Transactional**: Detailed event-level facts.
* **Snapshot**: Periodic summary (daily, monthly).
* **Accumulating Snapshot**: Tracks progress of a process with start and end points.

---

##### 7. Rules of Dimensional Modeling

1. Store detailed atomic data.
2. Organize around business processes.
3. Always include a time dimension.
4. Keep facts in a table at the same grain.
5. Resolve many-to-many relationships in facts.
6. Resolve many-to-one relationships in dimensions.
7. Use surrogate keys in dimensions.
8. Create **conformed dimensions** for consistency across fact tables.

---

#### Lecture 2 - Data Warehouse

* Data Modelling Methodologies
    * Kimball
    * Inmon
    * Data Vault
    * One Big Table

##### Key Concepts Discussed:
* Data Model Schema in DW ( Central Fact Table Connected to Dimention Tables)

###### Fact Table 

* Measure Types

    * 🧮 1. Additive Measures

        * **Definition**: You can add them up across **all dimensions** (time, product, region, etc.).
        * **Example**: **Sales Amount**

        * If you sell \$100 today and \$200 tomorrow, total = \$300.
        * Works across **time, products, regions, customers**—everywhere.

        👉 Think: “Safe to sum up always.”

    * 🚫 2. Non-Additive Measures

        * **Definition**: You **cannot** add them up across any dimension.
        * **Example**: **Inventory Level**

        * If you have 500 items in stock today and 400 tomorrow, total is **NOT 900**.
        * Inventory is a **point-in-time snapshot**, not something to sum.

        👉 Think: “Never sum, only look at averages, min, max, or last value.”

    * 🤔 3. Semi-Additive Measures

        * **Definition**: You can add them up across **some dimensions, but not all**.
        * **Example**: **Account Balance**

        * You can add balances across **different customers** (Customer A + Customer B).
        * But you can’t add balances across **time** (yesterday’s balance + today’s balance ≠ meaningful).

        👉 Think: “Sometimes sum, but be careful with time.”

    * **Quick Analogy** (bank account example):

        * **Additive**: Total deposits (you can add across days, people, branches).
        * **Non-additive**: Current account balance (you don’t sum yesterday + today).
        * **Semi-additive**: Account balance across different accounts (ok), but not across days.

    * ![Types of Measures](../analytical/week5/types_of_measures.png)

    * Best Practice : The non- additive measures are still kept so they can be used and handled by BI tools

###### Dimension Tables

* Main Requirements of a dimension table
    * Query Constraining via Grouping / Filtering
        * Purpose: Dimensions should allow users to filter or group facts when running queries.
        * Example:
            * Fact table: Sales Amount = $500
            * Dimension table: Product = "Shoes", Region = "Texas", Date = "2025-09-01"
            * User can ask: “Show me sales by product” → grouped by Product
            * Or: “Show me sales in Texas only” → filtered by Region

        * 👉 Dimensions act like “filters” or “categories” in reports.
    * Report Labeling
        * Purpose: Dimensions provide human-readable labels for reports.
        * Example:
            * Instead of showing Product_ID = 101, the dimension table stores Product_Name = "Shoes".
            * Instead of Region_Code = TX, it shows Region_Name = "Texas".
        * 👉 This makes reports understandable to business users.

* Dimension tables can also contain one or more hierarchial relationships (Category, brand, product)

###### Fact vs Dimention Tables
![Fact vs Dimension](../analytical/week5/fact_vs_dimension.png)

###### Data Model Schemas
* Star Schema: Consists of Central Fact Table which is connected to one or more Dimension Tables 
* Snowflake Schema: Based on the Star Schema where the Dimention Tables are Normalized

###### 4 Steps to create a Data Model in a DW
* Find it [here](#webinar-1-data-modelling-process---designing-dw-from-the-ground-up-it-is-a-full-data-modelling-process)
* Master Data Managment (MDM) - How would you merge data from similar table eg: loan customer data, bank account customer data and if we want to merge these two cutomer data tables we follow the rules in Master Data Management which creates Golden Records

###### CASE STUDY
* WECLOUD SCHOOL DATABASE - Look at the slides [here](../analytical/week5/W5.2%20Data%20Model%20and%20ETL.pdf)
    * Step 1: Business Requirements - Requirements Analytics
        * Eg: `Student 1` is enrolled in `cohort 8` in the `Data Engineering Program` in `Data Analytics`, `Big Data Engineering` & `Advanced Data Engineering` courses with discount offers `Scholarship200` and `5PercentFullPayment` on Sep 10 2022 via wire transfer paid fee of $10000 in full.
    * Step 2 & 3: Grain & Dimension
    * Step 4: Fact Table

###### Levels of Data Modelling 
The **three levels of data modeling** (Conceptual, Logical, Physical) **still apply** when doing **dimensional modeling** (Kimball/Inmon/Data Vault/One Big Table). They just take a slightly different flavor. The excel file with all the below levels is available [here](../analytical/week5/Lecture%20Data%20Model.xlsx)

* 🔹 1. Conceptual Data Model

    * **What it is**: High-level view of business needs.
    * **Focus**: What data is important, not how it will be stored.
    * **In Dimensional Modeling**:
        * Identify business processes (e.g., Sales, Inventory, Customer Service).
        * Identify high-level entities like Customer, Product, Order, Date.
        * No details about keys, schema, or storage.


* 🔹 2. Logical Data Model

    * **What it is**: More detailed, but still tech-agnostic.
    * **Focus**: Defines data structures, relationships, and granularity.
    * **In Dimensional Modeling**:
        * Decide **grain of the fact table** (e.g., “one row per sales transaction”).
        * Define **facts** (measures like sales amount, quantity).
        * Define **dimensions** (product, customer, region, time).
        * Show relationships between facts and dimensions (Star Schema or Snowflake).

* 🔹 3. Physical Data Model

    * **What it is**: Actual implementation in a database.
    * **Focus**: How the model is stored and optimized.
    * **In Dimensional Modeling**:
        * Implement fact and dimension tables in a database (e.g., Snowflake, Redshift).
        * Add **primary keys, foreign keys, indexes, partitions**.
        * Apply naming conventions, column data types, and performance tuning.

* ✅ **Analogy** (building a house):

    * **Conceptual** = Blueprint sketch → "We’ll build a 3-bedroom house."
    * **Logical** = Detailed architectural plan → dimensions of rooms, windows, layout.
    * **Physical** = Actual construction with bricks, wiring, plumbing.

###### ETL
* ETL vs ELT
    * Before 1980 Storage was more expensive than compute therefore ETL was more popular
    * After 1980 to present- storage has become more cheaper therefore ELT is more used now
* When is ETL is most utilized?
    * When data masking.
    * When you have high computation transformations it is cheaper to do the transformations using tools like Spark rather than storing the raw data directly in DW as it can get expensive. So in that case you transform the data using spark and then store it in the DW

###### DDL
* Data Definition Language
* Used to create structures like
    * Schemas
    * Database
    * Tables
    * Constraints
* Commands
    * CREATE
    * ALTER
* Create Entire Data Model & Infrastructures
    * Step 1: Create Schemas Eg: LandingZone
    * Step 2: Create Dimension Tables
    * Step 3: Create Fact Tables
    * Step 4: Create Control Tables if needed

###### DML
* Data Manipulation Language
* Commands
    * INSERT 
    * UPDATE
    * DELETE
* Polpulate data from one table to another
---

#### Lab 1 - MiniProject - Sakila DVD Store Dataset - Data Modelling & ETL
* Project Folder [here](../analytical/week5/MiniProjectDvdStoreDimentionalModelling/)
* Project Readme [here](../analytical/week5/MiniProjectDvdStoreDimentionalModelling/README.md)
* [Project Description](../analytical/week5/MiniProjectDvdStoreDimentionalModelling/project_description.pdf)

---

### Keywords & Terminologies
* **Conformed Dimensions**: is a single, shared dimension table with consistent attributes and meaning which is used across multiple fact tables, such as a "Date" dimension used by both Sales and Inventory fact tables to ensure data can be compared across different business processes. Another common example is a "Product" dimension, containing shared information like product ID, name, and category, which can be referenced by sales facts, inventory facts, and other related data tables.
* **Role-Playing Dimensions**: A role-playing dimension is a single dimension table that is used multiple times within the same fact table to represent different logical contexts, most commonly a date dimension for "Order Date," "Ship Date," and "Delivery Date". 
* **Referential Integirty**: If a column is using referencing like foreign key; then that data should be available at the referenced point 
* **Surrogate Key**: New Primary Key for the Dimension and Fact table that is system generated so the tables are not dependant on the databases primary keys / source keys (which could change over time)
* **Lookup Key**: The original primary keys (source keys / natural key) in the database can be used as keys to look up data
* **Data Dictionary**: A Table with info about the columns in a dataset and what they mean
---

## Week 6 - Data Transformation - SQL in ETL and Data Loading

### Environments and Schemas Naming
#### What are environments and schemas?
```yaml
Environment (Dev / Test / Prod)
    ├── Schema: Landing (Raw)
    ├── Schema: Enterprise (Staging)
    └── Schema: Business (Dimensional models / Data marts)
```

#### Typical Zone Flow in Snowflake
```pgsql
[Files arrive]
     |
     v
[Stage] (Snowflake internal/external file holding area)
     |
     v
Raw Schema (Landing)    → exact copy of source (Bronze)
     |
     v
Staging/Enterprise Schema → cleansed, standardized (Silver)
     |
     v
Business/Mart Schema     → facts & dims (Gold)
```

#### Naming Cheat Sheet (Mappings)
| Concept           | Course Term            | Common Terms        | Databricks Style | Snowflake Equivalent                  |
| ----------------- | ---------------------- | ------------------- | ---------------- | ------------------------------------- |
| Raw copy          | `landing_zone`         | Raw, Landing        | Bronze           | Raw schema (after loading from stage) |
| Cleaned           | `enterprise_zone`      | Staging, Conformed  | Silver           | Staging schema (cleaned tables)       |
| Business models   | `business_zone1/2/3`   | Data Mart, Business | Gold             | Business schema with facts & dims     |
| File holding area | *(not in your course)* | File Staging        | N/A              | Snowflake Stage (`@stage_name`)       |


* In Snowflake, stage (file area) comes before raw schema.
* In ETL world, staging schema (tables) comes after raw.
* They are two different concepts that unfortunately share the same word “staging.”

DEV_DB
   ├── RAW schema
   ├── STAGING schema
   └── BUSINESS schema

TEST_DB
   ├── RAW schema
   ├── STAGING schema
   └── BUSINESS schema

PROD_DB
   ├── RAW schema
   ├── STAGING schema
   └── BUSINESS schema


### Prework

#### Slowly changing Dimensions (SCD)
* Source [Video](https://youtu.be/Sg2AAk1vwEs?si=bD2XDfHEiozWzgY-)
* Things that describe the `event` eg: a sale/transaction are in the dimension table.
* Dimension values can change
    * Customer gets married
        * Name Change
        * Marital Status
    * Departments change segments or regions they are assigned
        * Prior Sales belong to Old Region
        * New Sales belong to New Region
    * Employees change roles
* Do you need to reflect these changes in your reports?

##### Types Of SCDs
* Type 1: Update with new value
    * Update in place; no history is maintained, you have only one row per customer in the dimension table
    * Eg: replace single with married
    * If historic data is aggregrated then even if people were single at that time it has now been updated as married and that would be a wrong assumption 
* Type 2: Maintain History
    * We maintain a history using columns like `last_updated` date column or `current_value` boolean column (flag column) which will help us track which is the latest upto date record for the customer, item, store etc.
    * ![SCD-Type 2](../analytical/week5/scd.png)
    * Now the fact table will also contain multiple rows for the same customer; therefore when calculating make sure you are filtering out based on the last_updated or current_value column in the fact table to get the latest upto date record
* Type 3: Keep Limited History
    * Using a seperate column for each version 
    * Hard to find which is the column that has the latest value if the columns are not named properly
    * You have to decide ahead of time how many extra columns you need to hold the older values
* Type 0: Never Update/Change. Just keep the original value.
* Type 4: Maintain a seperate history table
* Type 5: Seperate changing values into a mini dimension
* Type 6: Combines Type 1, 2 and 3
* Surrogate Key in SCDs: find steps [here](#loading-dimension-table)

---

### Lectures & Lab

#### Lecture 1 - SQL in ETL
[Lecture Slides](../analytical/week6/W6.1%20SQL%20in%20ETL.pdf)

##### Topics Covered
* Inner Join
* Right Join
* Left Join
* Full Join
* Cross Join
* MERGE :
    * Useful when performing `INCREMENTAL Loads`
    * Uses two keywords - 
        * `MATCHED`: if matching record found then do the something (usually update)
        * `NOT MATCHED`: if matching record not found the do something (usually insert)
* CLUSTERING

---

#### Lecture 2 - Data Loading
* [Lecture Slides](../analytical/week6/W6.2%20Data%20Loading.pdf)
* Walmart Project
* Once the models are created
* Data is Loaded and tested
* We performed Initial Load
* Now we think about how are we going to manage future Data loads

##### Data Loading
* Full Load / Refresh
    * Less Volume
    * Data that does not change often Eg: Dimension table / static table
    * History or one time load
    * Data Load frequency is less eg: once a month
    * Does not have Incremental Identifier Column
* Incremental Load / Update
    * Huge Volume
    * Have Incremental Identifier Column to know which records are new and which are old
    * Fact Table usually sees the most changes as dimensions don't change much eg: sales data is more compared to vendor data etc.
    * Frequency of load is huge
    * Different strategy for different types of loads eg: daily loads, weekly loads, monthly loads etc
    * Snowflake usually handles batch loads. 
    * Streaming loads are handled by different platforms built for that purpose because snowflake can be expensive for that.
    * Steps:
        * Initial Data Load (IDL) - the very first load
        * Delta Load - all loads after the first load are called delta loads
* Strategies: What are the methods used during Delta loads to load data into the following
    * **Fact tables**  
        * Are usually *append-only*, because transactions behave like logs 
        
    * **Dimension tables**
        * Often require *updates* 
        * Append new records (e.g., if a customer changes address or a product changes category)

##### Loading Fact Table
* Fact tables usually store *transactional or event-level data* (sales, clicks, payments, shipments, etc.). These are indeed *append-only* because each new transaction/event gets recorded as a new row. They behave like logs — you don’t typically go back and change old log entries. There are **exceptions** where fact tables may need updates:
    * **Late-arriving facts**: when a transaction was delayed in reaching the warehouse.
    * **Corrections**: sometimes transactions are cancelled, refunded, or corrected. Instead of deleting the row, often an adjustment (negative entry) is appended, but in some cases an update might be needed.
    * **Derived metrics**: if you maintain pre-aggregated or snapshot-style fact tables, updates can happen.
* ✅ Steps to perform incremental load in the DW `Fact table`:
    * In the DW: SELECT THE MAX(date)
    * In the DW: Cut i.e delete the records of MAX(date)
    * From the DB(Operational DB) copy all records starting from MAX(date) and copy into the fact table in the DW

##### Loading Dimension Table
* Type 0: Never change & Never update. Eg: in single load cases
    * Load once & do nothing
* Type 1: Update with new value
    * Eg: Customer name
    * Eg: Customer Address
    * ✅ Steps to perform Update in the DW for `Type 1 SCD Table` 
        * Just update the record in the dimension table with the new value 
        * Because the surrogate key does not change you don't make any change in the fact table
* Type 2: Maintain History (new row per change, unlimited history)
    * We maintain a history using columns like `last_updated` date column or `current_value` boolean column (flag column) which will help us track which is the latest upto date record for the customer, item, store etc.
    * ![SCD-Type 2](../analytical/week5/scd.png)
    * Now the fact table will also contain multiple rows for the same customer; therefore when calculating make sure you are filtering out based on the last_updated or current_value column in the fact table to get the latest upto date record
    * ✅ Steps to perform Update in the DW for `Type 2 SCD Table` [detailed answer with SQL code eg](https://chatgpt.com/s/t_68cad762daf48191a1bbc367b7a33022)
        * Before updating
            * [ ] **Identify the natural key** (e.g., `employee_code`) from the source system.
            * [ ] **Check if the record exists in the dimension table**.
            * [ ] **Find the current active surrogate key** (`is_current = TRUE`).

        * If the record has changed
            * [ ] **Expire the old record**
                * Set `valid_to = yesterday (or change effective date - 1)`
                * Set `is_current = FALSE`
            * [ ] **Insert a new record** in the dimension table with:
                * New business key or updated attributes
                * `valid_from = change effective date`
                * `valid_to = NULL`
                * `is_current = TRUE`

        * Fact table handling

            * [ ] **Leave old facts unchanged** (they continue to point to the old surrogate key).
            * [ ] **Insert new fact records** pointing to the new surrogate key for transactions after the change effective date.

        * After update

            * [ ] **Validate history**

                * Each natural key should have a closed record (old) and an open record (current).
                * Only **one active record** per natural key should have `is_current = TRUE`.

            * [ ] **Validate fact linkage**

                * Facts before the change point to the old surrogate key.
                * Facts after the change point to the new surrogate key.

        * 👉 In short:

            1. **Detect change**
            2. **Expire old record**
            3. **Insert new record**
            4. **Update facts with new surrogate key** (only for new transactions)
            5. **Validate**
 
* Type 3: Keep Limited History (same row, add columns for old values, limited history)
    * Limited Past
    * Eg: Region of sales
    * ✅ Steps to perform Update in the DW for `Type 3 SCD Table` [detailed answer with SQL code eg](https://chatgpt.com/s/t_68cad72d77548191a941ddcb82884c1b)
        * Before updating
            * [ ] **Identify the natural key** from the source system (e.g., `employee_code`).
            * [ ] **Check if the record exists** in `dim_employee`.
        * If the record has changed
            * [ ] **Update the existing row**:
                * Move current value to the `prev_` column (e.g., `prev_employee_code = employee_code`).
                * Update the current column with the new value (`employee_code = new value`).
                * Keep the **same surrogate key**.
        * Fact table handling
            * [ ] **No updates needed for historical facts** — they still point to the same surrogate key.
            * [ ] **Insert new fact records** pointing to the same surrogate key (facts don’t need to switch like in Type 2).
        * After update
            * [ ] Verify that:
                * Each row has the **latest value** in the main column.
                * The **previous value** is stored in the `prev_` column.
                * Only **one row per entity** (no duplicates like in Type 2).

* Type 4 Steps: Keep a seperate table to maintain history
    * Used maninly when your dimensions are changing a lot

##### Demo
* Use the scripts from the link in the lecture slides to load the .csv files for walmart database from [here](../analytical/week6/walmart%20raw%20data/)
* Use DBeaver to load the data from .csv files to `WCD_LCT4.LAND` database.schema on Snowflake
* Project Steps
    * Full Load: We will have full tables `full_sales`(fact) & `full_product`(dim) which will act as our source db tables for practice
        * Create tables in `WCD_LCT4.LAND` (If using tools like Airbyte this and the next step will be done by it)
        * Load all csv's to `WCD_LCT4.LAND` schema to the corresponding tables
    * Incremental Load - Initial Load: We will then create the actual `sales` and `products` tables 
        * Create tables in `WCD_LCT4.LAND` (If using tools like Airbyte this and the next step will be done by it)
        * Load limited data from `full_sales` to `sales` etc. Data from `2011-01-01` to `2011-12-31` and same for product
        * We load the remaining data in batches later (delta load)
        * 
    * Create tables in `WCD_LCT4.ENTERPRISE` schema for all the tables in the landing zone
    * Load the following tables in `WCD_LCT4.ENTERPRISE` with data
        * calendar_dim - Type 0 Table
        * product_dim - 
        * daily_sales - Fact Table
    


##### Steps to Perform for 
1. **Data Modelling**
    * Conceptual model ↔ Identify business process
        * Both are about scoping the business problem and agreeing with stakeholders.
        * Conceptual Model - What data is important to the business?
        * Business Process - Decide which business process to model
    * Conceptual & Logical ↔ Declare grain
        * Decide what each row in the fact table represents (e.g., one line item per order, one daily balance per account).
        * This step sits between conceptual and logical—it’s about defining the granularity of facts.
    * Logical model ↔ Choose dimensions, choose measures
        * At this stage, you’re designing the star schema (fact and dimension tables) based on business needs.
        * Logical Model - How will the data be organized logically?
        * Choose dimensions & measures - Identify the descriptive context for the facts (e.g., Date, Customer, Product, Region).
        * This is part of the logical modeling stage, turning business language into dimensional structures.
    * Physical model ↔ Implement star schema in database
        * Here, you create tables, set datatypes, indexes, and optimize for queries.
        * Physical Model - How will the data be implemented in the chosen database system?

1. **Data Loading**
* NOTE: Initial load logic and delta load logic should be same i.e sql code used should work for both

---

#### Lab - MiniProject - Walmart Dataset - Data Modelling & Data Loads
* Project Folder [here](../analytical/week6/MiniProjectWalmartDimensionalModelling/)
* Project Readme [here](../analytical/week6/MiniProjectWalmartDimensionalModelling/README.md)
* [Project Description](../analytical/week6/MiniProjectWalmartDimensionalModelling/project_description.pdf)


---

## Week 7 - Data Transformation - Data Modeling and ETL in the Project
* Week [instructions](../analytical/week7/eda_and_data_description_wk7_plan.pdf)
* EDA using snowflake. Find notes related to this week in the project documentation [here](https://github.com/sanyassyed/DataEngineering_Retail_ETL_Pipeline/blob/main/docs/project_creation.md#part-3-eda-and-data-modelling-in-snowflake)

### Lecture 1 & 2 - Data Modelling in the project & ETL in the project
* Refer the notes [here](https://github.com/sanyassyed/DataEngineering_Retail_ETL_Pipeline/blob/main/docs/project_creation.md)


---


## Week 8 - Data Transformation - DBT for ETL

### DBT Features
Allows you to have a sql script for data transformations via dbt models which helps in the following
* Lineage Tracking
* Reliability
* Modularity
* Testing

### DBT Functions

* dbt does not automatically know about the objects (databases, schemas, tables, views, etc.) in your Data Warehouse (DW).
* dbt builds **dbt models** (tables/views defined in `.sql` files) that can pull from:

  * Raw warehouse objects (via **`source()`**)
  * Other dbt models (via **`ref()`**)

---

#### 1. Source Function

* Helps dbt identify and track the raw objects in your DW.
* `sources.yml`

  * defines metadata about external/raw data sources:

    * source name
    * source database
    * source schema
    * source tables

```yaml
-- Example: sources.yml
sources:
  - name: raw
    schema: sales
    tables:
      - name: orders
```

* `source()` function

    * used **inside a dbt model SQL file** to select from a raw table defined in `sources.yml`.
    * does not create a physical object itself, but acts as a pointer for lineage and testing.
    * When you use source(), dbt does not create a new table or view. Instead, it creates a kind of "pointer" object that:
    * Represents a table/view in your warehouse (usually raw/staging tables that dbt itself didn’t build).
    * Lets you reference that external table in your model SQL code with a consistent name.
    * Ensures lineage is tracked in dbt’s DAG (you’ll see raw → staging → marts in dbt docs).
    * Can enforce tests (like freshness, unique, not_null) on those raw tables.

```sql
-- Example: models/staging/stg_orders.sql
select
    order_id,
    customer_id,
    order_date
from {{ source('raw', 'orders') }}
```

---

#### 2. Reference Function

* `ref()` is used inside a dbt model to reference another dbt model (not raw sources).
* Ensures proper **dependencies** between models in the DAG (so dbt knows the order to run them).
* Keeps your SQL portable across environments (dbt handles schema resolution).

```sql
-- Example: models/marts/orders_summary.sql
select
    customer_id,
    count(*) as total_orders
from {{ ref('stg_orders') }}
group by customer_id
```

---

#### Data Flow in DBT
```mermaid
flowchart LR
    DW["Data Warehouse Objects
    - Raw Tables
    - Raw Views"]

    DBTSOURCE["dbt Source Object (declared in sources.yml)"]

    STAGING["Staging Model (.sql using source function)"]

    DOWNSTREAM["Downstream Models (.sql using ref function)"]

    DW -->|Declared in sources.yml| DBTSOURCE
    DBTSOURCE -->|Used in dbt model with source function| STAGING
    STAGING -->|Referenced with ref function| DOWNSTREAM
```

---

### Data Transformation *Best Practice* in dbt

* Goal: move data from **source-conformed** (raw system representation) → **business-conformed** (business-friendly, analytics-ready).
* We use **dbt layers** to make this journey structured, modular, and maintainable.
* Example: Raw `orders` from `store`, `online`, and `pop-up stores` → combined into a **single business table** `orders` (since business only cares about orders, not source system).

---

### Jaffle Shop Example (Classic dbt Demo Project)
* Option 1: - documentation across multiple files `models.yml` & `docs.yml`
![Jaffle Shop Dbt Repo](../analytical/week8/dbt_jaffle_shop.png)
* Option 2: - documenation in one file `schema.yml`
![Jaffle Shop Dbt Repo](../analytical/week8/dbt_jaffle_shop2.png)
* `staging/` folder – has one model per raw source table.
* `base/` folder – sometimes added to maintain strict 1:1 relationship with the raw source, or to union multiple raw tables before staging
  * Example: `shop_customers` and `deleted_customers` unioned into `customers`.
  * This prepares data so staging and marts layers can work with a **clean, unified source-conformed dataset**.
* `marts/` folder – fact and dimension models built for analytics.

---

### Dbt Layers

*These aren’t hard-coded by dbt; they’re naming/structuring conventions followed by the dbt community for best practice.*

#### 1. **Staging Layer**

* First stop for raw data. Each staging model is a **thin wrapper** over a raw table.
* **Best practice:** 1 staging model per `source system` (1:1 mapping) Eg: `Jaffle shop` & `Stripe`
* Usually implemented as **views** (freshness, low storage).
* `sources.yml` – defines raw data sources (name, database, schema, tables).
* ***Documentation Options***
    * Option 1:
        * `models.yml` - used for testing, documentation and config
        * `docs.yml` - huge amount of documentation is done here
    * Option 2 - this option dbt consolidates the above two into `schema.yml`
        * `schema.yml` – defines tests, documentation, and configs for models
* Most standard types of staging transformation
    * ✅ Renaming
    * ✅ Casting
    * ✅ Simple calculations (C to F, etc)
    * ✅ Categorizing
    * 🚫 Complex Joins (if simple joins use `base` folder)
    * 🚫 Aggregations (group by/ rank) 
* Naming convension: 
    * Sources: ***_source_system_name_sources.yml** eg: `_jaffle_shop_sources.yml`
    * Schema: ***_source_system_schema.yml** eg: `_jaffle_shop_schema.yml`
    * Docs: ***_source_system_docs.yml** eg: `_jaffle_shop_docs.yml`
    * Models: ***_name_source_system_docs.yml** eg: `_jaffle_shop_docs.yml`
    * DBT Model: ***layer_name_source_system_models.yml** eg: `stg_jaffle_shop_customers.sql`
    
#### 2. **Intermediate Layer**

* Optional layer, used to simplify complex logic before marts.
* Only used **within dbt** (not exposed to BI tools).
* Often implemented with **ephemeral models** (not materialized as tables/views; compiled inline into downstream queries).
* Great for reusable sub-queries, CTE-like logic, or joining multiple staging tables.

#### 3. **Marts Layer**

* Final transformed data → analytics-ready.
* Typically modeled as **facts and dimensions** (if following Kimball star schema).
* Materialized as **tables** for performance.
* Exposed to BI/analytics layer.

---

### Important Clarifications

* ✅ dbt **does not automatically perform dimensional modeling**. You design the logic, dbt executes and manages it.
* ✅ dbt provides tools for **testing, documentation, lineage, and orchestration** of transformations — but **you decide the modeling methodology**.
* ✅ dbt **layers are conventions, not enforced rules**. The community generally follows **staging → intermediate → marts**, but you can adapt to your org’s needs.

---


### DBT Dataflow between layers
* This diagram matches the best practices you noted, showing how dbt layers move data from source-conformed → business-conformed.

```mermaid
flowchart LR
    %% Raw Data Sources
    DW["Data Warehouse Objects
    - Raw Tables
    - Raw Views"]

    %% Staging Layer
    STAGING["Staging Models (.sql using source function)
    - Usually Views
    - 1:1 mapping with sources
    - source.yml defines metadata
    - schema.yml for tests & docs"]

    %% Intermediate Layer
    INTERMEDIATE["Intermediate Models
    - Often Ephemeral models
    - Optional layer
    - Complex transformations
    - Only visible inside dbt"]

    %% Marts Layer
    MARTS["Marts / Analytics Models
    - Facts & Dimensions
    - Business-conformed
    - Materialized as Tables for BI/Analytics"]

    %% Connections (each connection on its own line)
    DW -->|source function| STAGING
    STAGING -->|ref function| INTERMEDIATE
    INTERMEDIATE -->|ref function| MARTS
```

* Explanation of Flow:
    * DW → Staging: Pull raw tables using source() into staging models.
    * Staging → Intermediate: Transform and combine data in ephemeral or intermediate models using ref().
    * Intermediate → Marts: Final business-ready tables (facts & dimensions) built using ref(), ready for BI/analytics.

👉 **One-liner takeaway for interviews**:

* *“In dbt, `source()` pulls raw tables into staging models, `ref()` chains dbt models together, and the best practice is to structure transformations in layers — staging, intermediate, and marts — moving data from source-conformed to business-conformed.”*

---



---

#### DBT COMMANDS
* dbt init
* dbt build
* dbt degug
* dbt run

---

## Week 9 - Data Analyzation - Data Analyzation with Metabase and Project 

### Summary

---

## Week 10 - Final Project - Project Week


## EC2's to re-configure
* DBT- [dbt](https://learn.weclouddata.com/programs/2/courses/159d75b6-f529-492e-9c48-8d16f33a8183/weeks/2483/materials/19623?topic_id=6510)
* AIRBYTE & METABASE - [WeCloudData Airbyte & Metabase Installation Instructions](https://learn.weclouddata.com/programs/2/courses/159d75b6-f529-492e-9c48-8d16f33a8183/weeks/2500/materials/19647?topic_id=6566) [My Airbyte Installation Instructions]([here](#x-lab-install-airbyte-and-metabase-with-docker-))

## AWS Important Documentation
* [Free Tier](https://aws.amazon.com/free/?all-free-tier.sort-by=item.additionalFields.SortRank&all-free-tier.sort-order=asc&awsf.Free%20Tier%20Types=*all&awsf.Free%20Tier%20Categories=categories%23compute)
* [My free tier usage](https://us-east-1.console.aws.amazon.com/billing/home#/freetier)

---

## Challenges:
* EC2 & VSCode Issuse: *"Tell me about a time you faced a technical issue and how you resolved it."* More [here](./setupNotes.md#errors)
    * **Situation:**
        * I was working on an AWS EC2 instance and using Visual Studio Code Remote SSH as my main development environment. Very often, my connection to the server would suddenly drop, and the only way I could reconnect was by restarting the instance. Even then, the connection wouldn’t hold for long, especially when I was using Docker containers.

    * **Task:**
        * My goal was to maintain a stable connection so I could continue building my project, but the frequent crashes were preventing me from making progress.

    * **Action:**
        * At first, I assumed the issue was related to storage or corruption of the instance. I tried increasing the EBS volume, taking snapshots, and even launching new instances, but none of those attempts solved the problem—and they were adding extra AWS costs.
        * Instead of giving up, I decided to dig deeper. After completing a Linux course, I felt more confident about checking system logs. I reviewed the logs in `~/.vscode-server/` and noticed that right before each disconnection, VS Code was attempting to install extensions on the server, triggered by small prompts in the editor (for example, Python or Docker extensions). These installations were overloading the server and causing instability.
        * Once I realized this, I disabled those automatic extension installs. After that, my EC2 instance became stable and I no longer faced random crashes.

    * **Result:**
        * This experience taught me two key lessons:
            1. Don’t assume the issue without investigating — logs often hold the real answer.
            2. Building a solid foundation in Linux helped me troubleshoot more effectively.

    * Overall, I was able to save costs, stabilize my development environment, and continue my project without interruptions.

    ---
