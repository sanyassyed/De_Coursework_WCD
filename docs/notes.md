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

        # create a repo `deCourse` on github to push the local repo to it
        # add id_pub key to GitHub account to enable push and pull from the local system to remote repo
        git remote add origin 
    ```

### Systems Used
* Local System 
    * OS: MS Windows 10 x-64 based PC
    * Course related apps intalled
        * Anaconda
        * MySQL
        * PowerBI
        * VSCode
        * GIT Bash
* GIT Codespace
    * OS:
    * Apps Installed: Git Codespace server already has installed the following:
        * Docker
        * docker
        * conda
        * python
    * Connect Git Codespace to local VSCode [Video Reference](https://www.youtube.com/watch?v=XOSUt8Ih3zA&list=PL3MmuxUbc_hJed7dXYoJw8DoCuVHhGEQb&index=15)
* Virtual Environment
    Create a virtual conda environment (both on local and git server) 
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

## Prework
The tasks performed in the course prework can be found in this section.

