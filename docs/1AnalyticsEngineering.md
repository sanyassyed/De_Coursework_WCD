# PHASE 1 - Analytics Engineering

## Week 1 - Data Ingestion - Linux and AWS Foundation
6th May - 12th May

### Lectures and Lab:

#### [ ] Lecture 1 : Linux (2023-07-25):
* Linux 
    - Hardware (Chips-Integrated Circuit)
    - Kernel - The core component of OS(UNIX)  & helps communication happen between the Hardware and Software
    - Software - Command Line (LINUX)
    - Linux is a UNIX like OS has a lot of distributions 
        - Debian
        - UBUNTU
        - CentosOS
        - Amazon Linux
* Shell Commands for bash shell:  
    
    * User Management
        - `sudo useradd -m new_user_name` : to add a new user to the server. -m makes sure a home directory is created for the user. By default the user gets added to the group which is the same  name as the username
        - `sudo groupadd group_name` : to create a group
        - `groups` : shows the groups
        - `sudo usermod -aG group_name username` : This command adds the username to the group group_name. The -aG flags ensure that the user is appended (-a) to the specified group (-G).
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
        - `su username`: 
            - switch to another user
            - you will have to enter the password 
            - env variables from previous shell will be avialble
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
        - `cat > filename`: Write into a file.
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
            - `rwx` - read write execute(if the file can be run as a code) permission
            - `1st rwx` - rules for file owner
            - `2nd rwx` - rules for group owner
            - `3rd rwx` - rules for all other users
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
        - `apt-get install package_name.deb`: Install a package (APT-GET).
        - `apt-get remove package_name`: Remove a package (APT-GET).
        - `apt-get update`: Update package manager (APT-GET).
        - `apt-get upgrade`: Upgrade installed packages (APT-GET).
        - `sudo apt install dnf` : alternate to yum
        - `sudo apt update` 
        - `sudo apt install tree`: package tree displays the file structure in tree format
        - `tree -L 1` : display the file structre and flag -L represents the depth level to display uptil

    * System Management

        - `uptime`: View system uptime.
        - `echo $SHELL`: View default shell.
        - `echo $0 ` : to find which shell type it is
        - `ps -p $$`: View current shell.
        - `uname -r`: View kernel version.
        - `ifconfig` : to view the config or ethernet network which also has info about the ip address
        - `getent hosts` : prints the host ip address
        - `dmesg | grep -I usb`: Display USB-related kernel messages.
        - `udevadm info --query=path --name=/dev/sda5`: View hardware devices.
        - `lspci`: List PCI devices.
        - `lsblk`: List block devices.
        - `lscpu`: List CPU architecture.
        - `lsmem --summary`: Print memory information.
        - `free -m`: View free memory.
        - `sudo lshw`: View entire hardware configuration.
        - `source ~/.bashrc` : to update your shell configuration without needing to log out and log back in again
        - `top` : show Linux tasks using the CPU
        - `ps` : shows the processes for the current shell
        - `kill -9 Process_ID` : force a process to close and kill it
        - `kill -1 Process_ID` : force a process to reload the configuration
        - `lsof -p $$` : show a list of files opened by processes

    * File Operations

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
        - `Ctrl O` - Save in Nano
        - `Ctrl X` - Exit in Nano
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
        - `unset VARIABLE_NAME` : to delete the variable name

    * Help and Manuals
        - `command --help` : gives you info about a command
        - `man command_name` : to print the manual of the command
        - `whoami` : prints the username
        - `sudo npm install tldr -g` : npm is a package manager, tldr is the package which gives cleaner manual descriptions and -g is global flag i.e to install it globally so it can be run from anywhere
    
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
    - Shell: Think of the shell as a manager in an office who takes commands (tasks) from employees (users) and executes them, delegating tasks to various departments (system functions).
    - Terminal: Imagine the terminal as the desk or workspace where employees (users) interact with the manager (shell), submitting tasks (commands) and receiving feedback.
    - Subshell: Picture a manager (shell) who temporarily delegates tasks to an assistant manager (subshell) to handle specific duties, while still overseeing the overall operation.
    - Child Process: Think of a child process as a new employee (process) hired by an existing employee (parent process), who follows instructions and performs tasks independently but still reports to the original employee.

#### [ ] Lecture 2 : AWS Basics (2023-07-27):
* [AWS Introduction -Youtube](https://www.youtube.com/watch?v=ZW4o08WjwYg)
    * IaaS - Infrastructure - eg: Virtual Machine or Servers like `Compute Engine service` on GCP where we will have to install all the applications we want to use
    * PaaS - Platform - eg: `Cloud Functions` on GCP which  is a serverless compute service on GCP that allows you to run event-driven code without provisioning or managing servers. It automatically scales based on demand and executes code in response to events from various GCP services or HTTP requests.  
    * SaaS - `Google Workspace (Google Suits)` where gmail, docs, drive etc are provided and maintained for you. A company can use this to create their company email (GMAIL), manage documents(), file system etc 
    * Popular AWS services:
        - EC2 - Elasctic Compute IaaS. You can launch it via
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
                - `Access Key`
                - `Password` 
        - Group - Multiple Roles can be added to a user group and multiple users can be added to a user group(s)
        - Role - Multiple policies can be attached to a role and role(s) can be attached to a user
            - Demo to create a role to give the EC2 instance rights to access a S3 bucket
            - Trusted entity type `AWS Service`
            - Use Case `EC2 instance`
            - Policy added `AmazonS3FullAccess` to this role
            - Role name `de-b8-demo-ec2`
            - Add a tag optionally
            - Role created
            - 
        - Policies - a document with set of rules they are simply permissions which gives privilage to access a resource
            - Effect: Allow 
            - Actions: What privilages to give eg: read, write or all
            - Resources: Which resources or files to give this privilage to e.g: only s3 bucket 1 & 2 etc
            - Policies can be given to other resources too.
            - Are assigned to `User` - `Group` - `Roles` - `Other AWS Sevice`
            - `Self-Created` or `AWS Standard`
    - Security Groups
        - Inbound
        - Outbound
    - EC2 (Elastic Compute Cloud) - Compute
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
#### [ ] Lab 1 : AWS and Linux Workshop (2023-07-29):

### Practice
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

- How to check the disk usage? 
    - `df -h` - disk free -h to show in human redable format

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

#### Exercise 2 & 3: Linux & HAckerrank:
Questions and asnswes available on WeCloud course app

#### Exercise 4 : AWS Workshop
* Create AWS account
* Goto EC2 and setup `Network & Security`
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

#### Exercise

### Self Study


## Week 2 - Data Ingestion - Docker
## Week 3 - Data Ingestion - Python in Data Engineering and Cloud
## Week 4 - Data Ingestion - Airbyte, Data Ingestion and Snowflake
## Week 5 - Data Transformation - Data Warehouse
## Week 6 - Data Transformation - SQL in ETL and Data Loading
## Week 7 - Data Transformation - Data Modeling and ETL in the Project
## Week 8 - Data Transformation - DBT for ETL
## Week 9 - Data Analyzation - Data Analyzation with Metabase and Project Summary
## Week 10 - Final Project - Project Week