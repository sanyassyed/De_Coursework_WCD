# Course Documentation
Here I will be documenting all the steps I followed during the learning of this course. Here you will find all the important commands that were used during the various modules of the project

## Initial Setup
### Project Repo
* Create a repo `deCourse` in the local system where all the project related material will be stored
* Initialize the local repo and then push it to the remote repo
    ```bash
        git init
        # create .gitignore file
        touch .gitignore
        # add files to be ignored to gitignore
        vim .gitignore
        # create a readme file
        touch readme.md
        # add and commit chages
        git add .
        git commit -m "CICD: Intital commit"

        # Check if the global user.name & user.email has been set
        git config --list 

        # If not; set the global config as follows
        # set the global variables
        git config --global user.email "xyz@gmail.com"
        git config --global user.name "xyz pc"

        # create a repo `deCourse` on github to push the local repo to it
        # Create SSH key by following steps [here](https://github.com/sanyassyed/sf_eviction/blob/master/docs/README_Dev.md#conda)
        # add id_pub key to GitHub account to enable push and pull from the local system to remote repo
        git remote add origin git@github.com:sanyassyed/deCourse.git
        # check if the remote is added
        git remote
        # check the remote origin is set with ssh
        git remote -v
        # Check the SSH connection with repo from VM using
        ssh -T git@github.com
        # check the branch name
        git branch
        # if you want to change the name of the master branch name to main then use the command `git branch -M main` but we will keep the name as master
        git push -u origin master
    ```

### Codespace Server
Connect the course repo to git codespace. 
[Source Documentation](https://docs.github.com/en/codespaces/developing-in-a-codespace/creating-a-codespace-for-a-repository#creating-a-codespace-for-a-repository)

* Goto the remote repo on GitHub
* Click on the `CODE <>` button
* Select the `codespace` tab
* Select `Create codespace on master` button
* This will open the codespace in an online VSCode
* Connect this to the Desktop VSCode as follows [Video Reference](https://www.youtube.com/watch?v=XOSUt8Ih3zA&list=PL3MmuxUbc_hJed7dXYoJw8DoCuVHhGEQb&index=15)
    * Click on the hamburger menu on the left in the online VSCode
    * Select `Open in VSCode desktop`
    * Select `Open VSCode Desktop` in the pop up window
    * This will open the VSCode on your local system
    * Here install the `GitHub Codespace` extension if it does not happen automatically
    * Now we can use the `Git Codespace server` to work on our project

### Systems Used
* Local System 
    * OS: MS Windows 10 x-64 based PC
    * Course related apps intalled
        * Anaconda
            * TODO:
        * MySQL
        * PowerBI
        * VSCode
        * GIT Bash
* GIT Codespace
    * OS: Use the following commands to find out the information about the Git Codespace Server OS
        * `uname` -> to find the kernal name which in this case is `Linux`
        * `uname -r` -> kernal and version which is `6.2.0-1019-azure`
        * `cat /etc/os-release` -> version of the OS installed `NAME="Ubuntu" VERSION="20.04.6 LTS (Focal Fossa)"`
        * `lsmem` -> to print the memory information 
        * `free -m` -> to find how much memory is free

    * Apps Installed: Git Codespace server already has installed the following:
        * Docker
        * Conda: if not available then follow the step [here](https://github.com/sanyassyed/sf_eviction/blob/master/docs/README_Dev.md#conda)
        * python
        
* Conda Initialization & Virtual Environment
    Create a virtual conda environment to work on the project (both on local and git server). [Source](https://github.com/sanyassyed/SeafoodProject/blob/main/documentation.md#local-system) 
    * Local Server - Windows
        * Open Gitbash
        * Initialize conda for Git Bash as follows to view base conda environment   
            ```bash
                cd /d/Documents/SeafoodProject
                # initialize conda for gitbash as follows
                conda init bash
                # close the terminal and reopen it you should now see (base)
            ```
        * Create the virtual environment as follows:
            ```bash
                # Path to install the virtual env in the current project directory with python 3.10 and pip
                conda create --prefix ./.my_env python=3.10.9 pip 
                # Activate the virtual env as follows
                conda activate .my_env 
                # to de-activate the virtual env my_env use the below 
                conda activate 
                # don't use deactivate just use activate to go to base
            ```
    * Remote Server - Linux
        Create the virtual env as follows
        ```bash
            conda create --prefix ./.my_env python=3.9.1 pip 
            conda init
            cd ~
            source .bashrc
            cd /workspaces/ny_taxi/
            conda activate .my_env
        ```
* Git Ignore
    Updated `.gitignore` file to add the files to be ignored for eg:
    * `.env` files
    * `vscode env files`

* Conda & Python Packages 
    The packages installed on git server and if required on local server too

    * pandas
    * pyarrow
    * `pip install pgcli`
    * `pip install jupyter`
    * `pip install ipykernel`-> if not already installed
    * `pip install sqlalchemy psycopg2`
    
    Install the required packages using pip
    ```bash
        # Check packages intalled already
        pip list
        # Install pandas, datetime, pytz
        pip install pandas datetime pytz
    ```

## Prework
The tasks performed in the course prework can be found in this section.

