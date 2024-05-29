### User Management:

1. List all the users on the Linux system.
    - Answer: `getent passwd`

1. List all the groups on the Linux system.
    - Answer: `getent group`

1. How do you add a new user to the server with a home directory ?
   - Answer: `sudo useradd -m new_user_name`
   
1. How do you add a password for the new user?
   - Answer: `sudo passwd new_user_name` Then you will be prompted to enter the password

2. What command is used to create a new group in Linux?
   - Answer: `sudo groupadd group_name`

2. Check which groups the user belongs to?
    - Answer: `groups user_name`
   
3. How do you add a user to an existing group?
   - Answer: `sudo usermod -aG group_name username`

3. How do you remove a user from a user group?
    - Answer: `sudo gpasswd -d user_name group_name`

3. How do you remove a user?
    - Answer: `sudo userdel -r user_name` r flag removes the home directory
   
4. Explain the difference between `sudo su - new_user_name` and `su new_user_name`.
   - Answer: `sudo su - new_user_name` switches to the `new_user_name` account with a new shell
   - `su new_user_name` requires entering the user's password and then you are switched to the new_user_name account but are in the same working directory as before
   
5. What command allows you to switch to another user?
   - Answer: `su username`

5. What command allows you to switch to the root user?
    - Answer: `sudo su -` but environment variables are not passed

6. How do you list all groups a user belongs to?
   - Answer: `groups user_name`

7. How do you switch to the root user in Linux?
   - Answer: `sudo su -` or `sudo -s`

8. What command is used to delete a user from the system?
   - Answer: `sudo userdel username` user -r flag to remove the user home directory too

9. How do you remove a group in Linux?
   - Answer: `sudo groupdel group_name`

10. How do you change a user's password in Linux?
    - Answer: `sudo passwd username`

### File System Operations:

11. How do you list all files in long format including hidden files?
    - Answer: `ls -la`
    
12. What command would you use to create a new directory?
    - Answer: `mkdir new_directory`
    
13. How do you copy a file from one location to another using `cp`?
    - Answer: `cp [source] [destination]`
    
14. How do you move or rename a file using `mv`?
    - Answer: `mv [source] [dest]`
    
15. What command allows you to remove a file in Linux?
    - Answer: `rm file.txt`

16. How do you navigate to the previous directory?
    - Answer: `cd -`
    
17. How do you navigate to the home directory?
    - Answer: `cd` or `cd ~`
    
18. How do you create a symbolic link to a file?
    - Answer: `ln -s /path/to/target /path/to/link`
    
19. What command would you use to view the contents of a file?
    - Answer: `cat filename`
    
20. How do you change the ownership of a file?
    - Answer: `sudo chown new_owner_username file_name`

### Package Management:

21. What command is used to update the package manager?
    - Answer: `sudo apt update`
    
22. How do you install a new package using `apt`?
    - Answer: `sudo apt install package_name`
    
23. What command would you use to search for a package?
    - Answer: `apt search package_name`
    
24. How do you remove a package using `apt`?
    - Answer: `sudo apt remove package_name`
    
25. How do you list available packages matching a pattern?
    - Answer: `apt list | grep package_name`

26. How do you install a package from a `.deb` file?
    - Answer: `sudo apt install package_name.deb`

27. What command allows you to list all installed packages?
    - Answer: `dpkg --list`

28. How do you upgrade all installed packages?
    - Answer: `sudo apt upgrade`

29. What command allows you to edit software sources?
    - Answer: `sudo nano /etc/apt/sources.list`

30. How do you clean up unnecessary packages and files?
    - Answer: `sudo apt autoremove`

### System Management:

31. How do you view system uptime?
    - Answer: `uptime`

32. What command displays the default shell?
    - Answer: `echo $SHELL`

33. How do you view the kernel version?
    - Answer: `uname -r`

34. How do you view network configurations?
    - Answer: `ifconfig`

35. What command is used to view CPU architecture?
    - Answer: `lscpu`

36. How do you view system logs?
    - Answer: `journalctl`

37. How do you list hardware devices?
    - Answer: `lshw`

38. How do you display memory information?
    - Answer: `lsmem --summary`

39. What command shows the history of all the terminals?
    - Answer: `history`

40. How do you view the entire hardware configuration?
    - Answer: `sudo lshw`

### Text Editors and Search:

41. How do you open a file in the Nano text editor?
    - Answer: `nano file_name`

42. What command allows you to search for a keyword in manuals?
    - Answer: `apropos keyword`

43. How do you search for a string in a file using `grep`?
    - Answer: `grep "string" file_name`

44. How do you create a multiline file using `cat`?
    - Answer: `cat <<EOF > data.txt`

45. How do you exit the Nano text editor and save changes?
    - Answer: `Ctrl + O` to save, `Ctrl + X` to exit

46. What command would you use to open a file in Vim?
    - Answer: `vim file_name`

47. How do you search backward in `less` pager?
    - Answer: Press `?` and then type the search term

48. How do you find files by their content?
    - Answer: `grep -r "pattern" directory`

49. How do you replace text in a file using `sed`?
    - Answer: `sed -i 's/old_text/new_text/g' file`

50. How do you display line numbers in `vim`?
    - Answer: `:set number`

### Local Variable VS Environment Variables:

51. What is the difference between local variables and environment variables?
    - Answer: Local variables are limited to the current shell session, while environment variables are available to all processes and shell sessions.

52. How do you define an environment variable?
    - Answer: `export VARIABLE_NAME=value`

53. How do you unset an environment variable?
    - Answer: `unset VARIABLE_NAME`

54. How do you print the value of an environment variable?
    - Answer: `echo $VARIABLE_NAME`

55. How do you make an environment variable persistent across sessions?
    - Answer: Add it to `.bashrc` or `.profile` file.

56. How do you list all environment variables?
    - Answer: `printenv`

57. How do you list all local variables?
    - Answer: `set`

58. How do you set a local variable in a shell script?
    - Answer: `VARIABLE_NAME=value`

59. How do you make a local variable available in a subshell?
    - Answer: Export it using `export` command.

60. How do you check if a variable is defined in Bash?
    - Answer: `if [ -z "$VARIABLE_NAME" ]; then echo "Not defined"; else echo "Defined"; fi`

### Help and Manuals:

61. How do you view the manual for a command?
    - Answer: `man command_name`

62. How do you display information about a command?
    - Answer: `command_name --help`

63. What command displays the username?
    - Answer: `whoami`

64. How do you install the `tldr` package for simplified command manuals?
    - Answer: `sudo npm install tldr -g`

65. How do you search for commands using keywords?
    - Answer: `apropos keyword`

66. What command shows detailed information about a file system?
    - Answer: `df -h`

67. How do you print the help for a command?
    - Answer: `command_name --help`

68. How do you display disk usage statistics?
    - Answer: `du -sh directory`

69. How do you search for a command using `apropos`?
    - Answer: `apropos keyword`

70. How do you find the definition of a command using `whatis`?
    - Answer: `whatis command_name`

### Downloads and SSH:

71. How do you download a file using `wget`?
    - Answer: `wget www.website.com/file_name`

72. How do you download a webpage using `curl`?
    - Answer: `curl example.com -o webpage.txt`

73. What command is used to connect to a remote server using SSH?
    - Answer: `ssh username@hostname`

74. How do you copy files securely between servers using `scp`?
    - Answer: `scp file.txt username@hostname:/path/to/destination`

75. How do you connect to a server using SSH with a specific private key?
    - Answer: `ssh -i /path/to/private_key username@hostname`

76. What command is used to transfer files between a local and remote server?
    - Answer: `sftp username@hostname`

77. How do you create an SSH key pair?
    - Answer: `ssh-keygen -t rsa`

78. How do you specify a custom port for SSH connection?
    - Answer: `ssh -p port_number username@hostname`

79. How do you securely transfer files between servers using `rsync`?
    - Answer: `rsync -avz --progress /path/to/source username@hostname:/path/to/destination`

80. How do you securely copy files from a remote server to a local machine using `scp`?
    - Answer: `scp username@hostname:/path/to/file.txt /path/to/local/directory`

### Background Processes and Shell Scripting:

81. How do you run a command in the background?
    - Answer: `command &`

82. How do you put a process into the background after it has started?
    - Answer: Press `Ctrl + Z` and then type `bg`

83. What command lists all background jobs?
    - Answer: `jobs`

84. How do you bring a background process to the foreground?
    - Answer: `fg %job_number`

85. How do you run a shell script with executable permissions?
    - Answer: `./script.sh`

86. How do you run a shell script with bash?
    - Answer: `bash script.sh`

87. How do you run a shell script in the background?
    - Answer: `./script.sh &`

88. How do you kill a background process?
    - Answer: `kill %job_number`

89. How do you check if a process is running?
    - Answer: `ps aux | grep process_name`

90. How do you schedule a command to run at a specific time using cron?
     - Answer: `crontab -e` and add the scheduling pattern and command to the file.

### System Monitoring and Control:

91. How do you view the currently running processes?
    - Answer: `ps aux`

92. How do you kill a process by its PID?
    - Answer: `kill PID`

93. What command shows the processes for the current shell?
    - Answer: `ps`

94. How do you force a process to close and kill it?
    - Answer: `kill -9 Process_ID`

95. How do you force a process to reload the configuration?
    - Answer: `kill -1 Process_ID`

96. What command shows a list of files opened by processes?
    - Answer: `lsof -p $$`

97. How do you display disk usage?
    - Answer: `df -h`

98. How do you view memory usage?
    - Answer: `free -m`

99. What is better to view memory usage, `lsmem` or `free`?
    - Answer: `free`

100. What is the difference between pressing `CTRL+c` and `CTRL+z` in Linux?
     - Answer: `CTRL+c` sends a SIGINT signal to terminate the process, while `CTRL+z` suspends the process and puts it in the background.
