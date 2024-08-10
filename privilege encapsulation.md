## Enumeration
### hostname
The ***hostname*** command will return the hostname of the target machine. Although this value can easily be changed or have a relatively meaningless string (e.g. Ubuntu-3487340239), in some cases, it can provide information about the target system’s role within the corporate network (e.g. SQL-PROD-01 for a production SQL server).
### uname -a
Will print system information giving us additional detail about the kernel used by the system. This will be useful when searching for any potential kernel vulnerabilities that could lead to privilege escalation.
### /proc/version
The proc filesystem (procfs) provides information about the target system processes. You will find proc on many different Linux flavours, making it an essential tool to have in your arsenal.

Looking at /proc/version may give you information on the kernel version and additional data such as whether a compiler (e.g. GCC) is installed. 
### /etc/issue
Systems can also be identified by looking at the /etc/issue file. This file usually contains some information about the operating system but can easily be customized or changed. While on the subject, any file containing system information can be customized or changed. For a clearer understanding of the system, it is always good to look at all of these.
### ps Command
The ps command is an effective way to see the running processes on a Linux system. Typing ps on your terminal will show processes for the current shell. 
The output of the ps (Process Status) will show the following;

* PID: The process ID (unique to the process)
* TTY: Terminal type used by the user
* Time: Amount of CPU time used by the process (this is NOT the time this process has been running for)
* CMD: The command or executable running (will NOT display any command line parameter)
### env
The ***env*** command will show environmental variables.
### sudo -l
The target system may be configured to allow users to run some (or all) commands with root privileges. The sudo -l command can be used to list all commands your user can run using sudo.
### ls
While looking for potential privilege escalation vectors, please remember to always use the ls command with the -la parameter. The example below shows how the “secret.txt” file can easily be missed using the ls or ls -l commands.
### Id
The id command will provide a general overview of the user’s privilege level and group memberships. 
### /etc/passwd
Reading the /etc/passwd file can be an easy way to discover users on the system. 
Remember that this will return all users, some of which are system or service users that would not be very useful. Another approach could be to grep for “home” as real users will most likely have their folders under the “home” directory. 
### history
Looking at earlier commands with the history command can give us some idea about the target system and, albeit rarely, have stored information such as passwords or usernames. 
### ifconfig
The target system may be a pivoting point to another network. The ifconfig command will give us information about the network interfaces of the system. The example below shows the target system has three interfaces (eth0, tun0, and tun1). Our attacking machine can reach the eth0 interface but can not directly access the two other networks. 
This can be confirmed using the ip route command to see which network routes exist. 
### netstat
Following an initial check for existing interfaces and network routes, it is worth looking into existing communications. The netstat command can be used with several different options to gather information on existing connections. 

* netstat -a: shows all listening ports and established connections.
* netstat -at or netstat -au can also be used to list TCP or UDP protocols respectively.
* netstat -l: list ports in “listening” mode. These ports are open and ready to accept incoming connections. This can be used with the “t” option to list only ports that are listening using the TCP protocol (below)
* netstat -s: list network usage statistics by protocol (below) This can also be used with the -t or -u options to limit the output to a specific protocol.
* netstat -tp: list connections with the service name and PID information.
### find Command
Searching the target system for important information and potential privilege escalation vectors can be fruitful. The built-in “find” command is useful and worth keeping in your arsenal. 
Find files:

* find . -name flag1.txt: find the file named “flag1.txt” in the current directory
* find /home -name flag1.txt: find the file names “flag1.txt” in the /home directory
* find / -type d -name config: find the directory named config under “/”
* find / -type f -perm 0777: find files with the 777 permissions (files readable, writable, and executable by all users)
* find / -perm a=x: find executable files
* find /home -user frank: find all files for user “frank” under “/home”
* find / -mtime 10: find files that were modified in the last 10 days
* find / -atime 10: find files that were accessed in the last 10 day
* find / -cmin -60: find files changed within the last hour (60 minutes)
* find / -amin -60: find files accesses within the last hour (60 minutes)
* find / -size 50M: find files with a 50 MB size
This command can also be used with (+) and (-) signs to specify a file that is larger or smaller than the given size.

The example above returns files that are larger than 100 MB. It is important to note that the “find” command tends to generate errors which sometimes makes the output hard to read. This is why it would be wise to use the “find” command with “-type f 2>/dev/null” to redirect errors to “/dev/null” and have a cleaner output

Folders and files that can be written to or executed from:

* find / -writable -type d 2>/dev/null : Find world-writeable folders
* find / -perm -222 -type d 2>/dev/null: Find world-writeable folders
* find / -perm -o w -type d 2>/dev/null: Find world-writeable folders
* find / -perm -o x -type d 2>/dev/null : Find world-executable folders
## Privilege Escalation: Kernel Exploits
Privilege escalation ideally leads to root privileges. This can sometimes be achieved simply by exploiting an existing vulnerability, or in some cases by accessing another user account that has more privileges, information, or access.

Unless a single vulnerability leads to a root shell, the privilege escalation process will rely on misconfigurations and lax permissions.

The kernel on Linux systems manages the communication between components such as the memory on the system and applications. This critical function requires the kernel to have specific privileges; thus, a successful exploit will potentially lead to root privileges.

The Kernel exploit methodology is simple:

* Identify the kernel version
* Search and find an exploit code for the kernel version of the target system
* Run the exploit 

Although it looks simple, please remember that a failed kernel exploit can lead to a system crash. Make sure this potential outcome is acceptable within the scope of your penetration testing engagement before attempting a kernel exploit. 
## Privilege Escalation: Sudo
## Privilege Escalation: SUID
## Privilege Escalation: Capabilities


