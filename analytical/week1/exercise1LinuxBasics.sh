# 1 How to get the OS name and version?
    
cat /etc/os-release
    
#2 How to get Kernal version?
    
uname -r
    
#3 How to get your user and group information?
    
id <username>
    
#4 How to shows a real-time view of running processes in Linux?
    
top
    
#5 How to exit a running application?
    
"hotkey: ctr+z"
    
#6 How to check the disk usage?
    
df -h
    
#7 How to check the IP address?
    
hostname -i
curl "https://icanhazip.com/v4"
    
#8 How to check the memory usage?
    
free 
#or 
vmstat
    
#9 How to check the different options of a command?
    
man <command>
<command> --help
tldr <command>
    
#10 Set a environment variable PARAM = TEST temporarily in Linux?
    
export PARAM=TEST
    
#11 printout the environment variable PARAM = TEST?
    
echo $PARAM
    
    
#12 How to check what environment variables we have in the system?
    
printenv
    
#13 How to list all the available shells in your system?
    
cat /etc/shells
    
#14 How to check what shell you are using?
echo $SHELL