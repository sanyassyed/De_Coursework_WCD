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
        - `sudo useradd new_user_name` : to add a new user to the server
        - `sudo su - new_user_name` : to switch to the new_user_name account with shell. This ensures that you enter the new user's environment as if you had logged in directly as that user.   It's useful when you need to execute commands or perform tasks as that user without fully logging out and logging back in as them. 
        - `su username`: Switch to another user, where you will have to enter the password
        - `sudo -u username command`: Execute command as another user.
        - `sudo su -` switches to the sudo/admin user 
        - `sudo -s`: This command starts a new shell session with root privileges, but it doesn't change the environment variables to simulate a full login as the root user. It essentially gives you a root shell within your current environment.
        - `sudo su -`:  This command uses sudo to execute the su - command, which starts a new login shell as the root user. The - option ensures that the environment variables and settings are set as they would be for a full login session as the root user.
        - `useradd -a -G family aaron`: Add user to group family.
        - `useradd -a -G family jane`: Add user to group family.

    * File System Operations
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
        - `stat file.txt`: View file stats.
        - `ln path_to_target_original_file path_to_link_file`: Create a hard link.
        - `chmod 660 /home/aaron/pictures/family_dog.jpg`: Change file permissions.
    
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
        - `./file_name` : to execute a file if it is an executable file

    * Package Management
        
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

    * System Management

        - `uptime`: View system uptime.
        - `echo $SHELL`: View default shell.
        - `echo $0 ` : to find which shell type it is
        - `ps -p $$`: View current shell.
        - `uname -r`: View kernel version.
        - `dmesg | grep -I usb`: Display USB-related kernel messages.
        - `udevadm info --query=path --name=/dev/sda5`: View hardware devices.
        - `lspci`: List PCI devices.
        - `lsblk`: List block devices.
        - `lscpu`: List CPU architecture.
        - `lsmem --summary`: Print memory information.
        - `free -m`: View free memory.
        - `sudo lshw`: View entire hardware configuration.

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
        - `Ctrl X` - Exit in Nano
        - `Ctrl O` - Save in Nano
        - `vi file`: Open file in Vim text editor.


#### [ ] Lecture 2 : AWS Basics (2023-07-27):
* [AWS Introduction](https://www.youtube.com/watch?v=ZW4o08WjwYg)
    * IaaS - Infrastructure - eg: Virtual Machine or Servers like `Compute Engine service` on GCP where we will have to install all the applications we want to use
    * PaaS - Platform - eg: `Cloud Functions` on GCP which  is a serverless compute service on GCP that allows you to run event-driven code without provisioning or managing servers. It automatically scales based on demand and executes code in response to events from various GCP services or HTTP requests.  
    * SaaS - `Google Workspace (Google Suits)` where gmail, docs, drive etc are provided and maintained for you. A company can use this to create their company email (GMAIL), manage documents(), file system etc 
    * Popular AWS services:
        - EC2 - Elasctic Compute IaaS. You can launch it via
            - Terraform
            - GUI or Web Console on the AWS Website
            - Python API
        - 
#### [ ] Lab 1 : AWS and Linux Workshop (2023-07-29):

### Practice

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