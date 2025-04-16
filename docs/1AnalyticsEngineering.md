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
        - Step 1 - Update packages
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
                ```
        - Step 3 - Install DBT
            - When you install DBT, you have the option to install just DBT-Core, or DBT-Core with connectors for specific databases
            - We will install DBT to be used with Postgres
                ```bash
                # install the necessary PostgreSQL development libraries using the following command:
                sudo apt-get install libpq-dev
                #Install dbt-core and dbt-postgres
                pip install dbt-postgres
                ```
            - At this point. You may see a number of warnings indicating that certain scripts that are needed to run dbt are installed in '/home/ubuntu/.local/bin' which is not on PATH.
            ```bash
            # Add this line to the end of your .bashrc and save
            export PATH="$HOME/.local/bin:$PATH"
            # After saving run the following to instantiate the changes
            source ~/.bashrc
            ```
            - Validate DBT is installed
            ```bash
            conda activate .my_env
            dbt --version
            # if installed properly you should see something like the following
            Core:
            - installed: 1.5.2
            - latest:    1.5.2 - Up to date!
            ```
            Plugins:
            - postgres: 1.5.2 - Up to date!
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
            chmod 764 chmod u+x snowsql-1.2.27-linux_x86_64.bash

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
#### Lecture 1: Snowflake

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

- Schemas:  
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
  - Views: Saved SQL queries that behave like virtual tables
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
You're asking some really insightful questions — and you're **spot on** for connecting the dots between **data warehouses** (like Snowflake) and **traditional relational databases** (like MySQL or Postgres). Let's break it down:

- Database → Schema → Tables / Views / Functions, etc.

| Feature     | MySQL                   | Postgres                | Snowflake              |
|-------------|--------------------------|--------------------------|--------------------------|
| **Schemas** | Technically supports them, but underused (often uses just one schema per DB) | Fully supports schemas (commonly used) | Core part of design, heavily used |
| **Typical Use** | Most people just use `database → table` | `database → schema → table` | `database → schema → table` |
| **Use in real-world** | Apps often treat the database as the whole workspace | Schemas used to organize tables by module/domain | Schemas often map to pipeline zones (e.g., landing, curated) |



#### Lecture 2: Airbyte, Lambda & Project Data Ingestion
#### Lab 1: Project Part-1 

---

### Practice
#### Exercise-1 Snowflake Exercise
#### Workshop-2 Airbyte
#### Exercise-2 Lambda Function Ingest Data
#### Lab - Project Capstone 1: Data Ingestion

---

## Week 5 - Data Transformation - Data Warehouse
## Week 6 - Data Transformation - SQL in ETL and Data Loading
## Week 7 - Data Transformation - Data Modeling and ETL in the Project
## Week 8 - Data Transformation - DBT for ETL
## Week 9 - Data Analyzation - Data Analyzation with Metabase and Project Summary
## Week 10 - Final Project - Project Week


## EC2's to re-configure
* DBT- [dbt](https://learn.weclouddata.com/programs/2/courses/159d75b6-f529-492e-9c48-8d16f33a8183/weeks/2483/materials/19623?topic_id=6510)
* AIRBYTE & METABASE - [WeCloudData Airbyte & Metabase Installation Instructions](https://learn.weclouddata.com/programs/2/courses/159d75b6-f529-492e-9c48-8d16f33a8183/weeks/2500/materials/19647?topic_id=6566) [My Airbyte Installation Instructions]([here](#x-lab-install-airbyte-and-metabase-with-docker-))

## AWS Important Documentation
* [Free Tier](https://aws.amazon.com/free/?all-free-tier.sort-by=item.additionalFields.SortRank&all-free-tier.sort-order=asc&awsf.Free%20Tier%20Types=*all&awsf.Free%20Tier%20Categories=categories%23compute)
* [My free tier usage](https://us-east-1.console.aws.amazon.com/billing/home#/freetier)