# Privilege Escalation

if the Linux machine is domain joined, we can gain the NTLM hash and begin enumerating and attacking Active Directory.
## Enumeration
When you gain initial shell access to the host, it is important to check several key details.

* OS Version: Knowing the distribution (Ubuntu, Debian, FreeBSD, Fedora, SUSE, Red Hat, CentOS, etc.) will give you an idea of the types of tools that may be available. This would also identify the operating system version, for which there may be public exploits available.

* Kernel Version: There may be public exploits that target a vulnerability in a specific kernel version. Kernel exploits can cause system instability or even a complete crash.

* Running Services: Knowing what services are running on the host is important, especially those running as root. A misconfigured or vulnerable service running as root can be an easy win for privilege escalation. Flaws have been discovered in many common services such as Nagios, Exim, Samba, ProFTPd, etc.
### List Current Processes
![image](https://github.com/user-attachments/assets/c6ecd48e-0492-497a-ba6f-bdcd800e77e2)

* Installed Packages and Versions:  it is important to check for any out-of-date or vulnerable packages that may be easily leveraged for privilege escalation.

* Logged in Users:  Knowing which other users are logged into the system and what they are doing can give greater into possible local lateral movement and privilege escalation paths.

* User Home Directories: User home folders may also contain SSH keys that can be used to access other systems or scripts and configuration files containing credentials. It is not uncommon to find files containing credentials that can be leveraged to access other systems or even gain entry into the Active Directory environment. We can check individual user directories and check to see if files such as the .bash_history file are readable and contain any interesting commands, look for configuration files, and check to see if we can obtain copies of a user's SSH keys.
### User's Home Directory Contents
SSH keys could be leveraged to access other systems within the network as well. At the minimum, check the ARP cache to see what other hosts are being accessed and cross-reference these against any useable SSH private keys.
### SSH Directory Contents
It is also important to check a user's bash history, as they may be passing passwords as an argument on the command line, working with git repositories, setting up cron jobs, and more.
### Bash History
* Sudo Privileges: If you do not have credentials for the user, it may not be possible to leverage sudo permissions. However, often sudoer entries include NOPASSWD, meaning that the user can run the specified command without being prompted for a password. Not all commands, even we can run as root, will lead to privilege escalation. It is not uncommon to gain access as a user with full sudo privileges, meaning they can run any command as root. Issuing a simple sudo su command will immediately give you a root session.
### Sudo - List User's Privileges
![image](https://github.com/user-attachments/assets/5e93abf7-b790-489a-9a1b-81e7ab5c1d0c)

* Configuration Files: Configuration files can hold a wealth of information. It is worth searching through all files that end in extensions such as .conf and .config, for usernames, passwords, and other secrets.
* Readable Shadow File: If the shadow file is readable, you will be able to gather password hashes for all users who have a password set.
* Password Hashes in /etc/passwd: you will see password hashes directly in the /etc/passwd file. This file is readable by all users, and as with hashes in the shadow file, these can be subjected to an offline password cracking attack.
## Cron Jobs
* Cron Jobs: Cron jobs on Linux systems are similar to Windows scheduled tasks. They are often set up to perform maintenance and backup tasks. In conjunction with other misconfigurations such as relative paths or weak permissions

![image](https://github.com/user-attachments/assets/cc525c18-078f-4dcd-92f7-c08c63044b0c)

## File Systems & Additional Drives
* Unmounted File Systems and Additional Drives: If you discover and can mount an additional drive or unmounted file system, you may find sensitive files, passwords, or backups that can be leveraged to escalate privileges.
![image](https://github.com/user-attachments/assets/593d871e-14f7-40b3-9c63-4d539b9db4e5)

## Find Writable Directories
* SETUID and SETGID Permissions: Binaries are set with these permissions to allow a user to run a command as root, without having to grant root-level access to the user. Many binaries contain functionality that can be exploited to get a root shell.
* Writeable Directories: It is important to discover which directories are writeable if you need to download tools to the system.

## Gaining Situational Awareness
After establishing our reverse shell (and ideally some sort of persistence), we should start by gathering some basics about the system we are working with.

we'll answer the fundamental question:
### What operating system are we dealing with? Though the commands may be different, and we may even need to look up a command reference in some instances, the principles are the same.

Typically we'll want to run a few basic commands to orient ourselves:
* whoami - what user are we running as
* id - what groups does our user belong to?
* hostname - what is the server named, can we gather anything from the naming convention?
* ifconfig or ip a - what subnet did we land in, does the host have additional NICs in other subnets?
* sudo -l - can our user run anything with sudo (as another user as root) without needing a password?
### Current user's PATH 
which is where the Linux system looks every time a command is executed for any executables to match the name of what we type

![image](https://github.com/user-attachments/assets/d8ef2a81-04b6-40e1-9c0c-5c5fdc65d3e9)

![image](https://github.com/user-attachments/assets/9b7659c7-0849-45c7-903e-84350ec991f0)
### Kernel version
We can do this a few ways, another way would be cat /proc/version but we'll use the uname -a command.

![image](https://github.com/user-attachments/assets/8d96b541-d04a-4e70-803f-6ddb893de2bc)

We can next gather some additional information about the host itself such as the CPU type/version:

![image](https://github.com/user-attachments/assets/fa6238b7-62db-4a23-bb33-9c88f744da86)

What login shells exist on the server? Note these down and highlight that both Tmux and Screen are available to us.

![image](https://github.com/user-attachments/assets/6b767978-6d4d-4061-9e00-93236f8ed7d9)

### the drives and any shares on the system
First, we can use the lsblk command to enumerate information about block devices on the system (hard disks, USB drives, optical drives, etc.).

The command `lpstat` can be used to find information about any printers attached to the system.

We should also check for mounted drives and unmounted drives. Can we mount an umounted drive and gain access to sensitive data? Can we find any types of credentials in fstab for mounted drives by grepping for common words such as password, username, credential, etc in /etc/fstab?

## Existing Users
![image](https://github.com/user-attachments/assets/7c4d4ab1-c44a-4b81-8748-2267115a1d4b)

This file is readable by all users, and as with hashes in the /etc/shadow file, these can be subjected to an offline password cracking attack.

With Linux, several different hash algorithms can be used to make the passwords unrecognizable. 

![image](https://github.com/user-attachments/assets/4d48c3b4-b5c6-4ec3-b162-9982980152de)

## Existing Groups
Each user in Linux systems is assigned to a specific group or groups and thus receives special privileges.

The /etc/group file lists all of the groups on the system. We can then use the getent command to list members of any interesting groups.

## Mounted File Systems
![image](https://github.com/user-attachments/assets/485a52ee-6d62-47e7-95a5-996c0b781f05)

A mounted file system is a file system that is attached to a particular directory on the system and accessed through that directory. Many file systems, such as ext4, NTFS, and FAT32, can be mounted. Each type of file system has its own benefits and drawbacks. For example, some file systems can only be read by the operating system, while others can be read and written by the user. File systems that can be read and written to by the user are called read/write file systems.
## Unmounted File Systems
When a file system is unmounted, it is no longer accessible by the system. Therefore, if we can extend our privileges to the root user, we could mount and read these file systems ourselves. 
## All Hidden Files
## All Hidden Directories
Both /tmp and /var/tmp are used to store data temporarily. However, the key difference is how long the data is stored in these file systems. The data retention time for /var/tmp is much longer than that of the /tmp directory. By default, all files and data stored in /var/tmp are retained for up to 30 days. In /tmp, on the other hand, the data is automatically deleted after ten days.

In addition, all temporary files stored in the /tmp directory are deleted immediately when the system is restarted. Therefore, the /var/tmp directory is used by programs to store data that must be kept between reboots temporarily.

# Linux Services & Internals Enumeration
## Internals
we mean the internal configuration and way of working, including integrated processes designed to accomplish specific tasks.
### Network Interfaces
### Hosts
The **/etc/hosts** file is a system configuration file on Linux (and other Unix-based systems) that maps IP addresses to hostnames. It is checked before the DNS when the system tries to resolve a hostname.
### User's Last Login
### Command History
### Finding History Files
![image](https://github.com/user-attachments/assets/d2a352bd-caf6-4705-85fc-6d2bb4ac0060)
### Cron
![image](https://github.com/user-attachments/assets/f05d3fda-58d2-4779-a18b-8dd7ebd2b289)
### Proc
The proc filesystem (proc / procfs) is a particular filesystem in Linux that contains information about system processes, hardware, and other system information. It is the primary way to access process information and can be used to view and modify kernel settings. It is virtual and does not exist as a real filesystem but is dynamically generated by the kernel. It can be used to look up system information such as the state of running processes, kernel parameters, system memory, and devices. It also sets certain system parameters, such as process priority, scheduling, and memory allocation.
## Services
### Binaries
GTFObins provides an excellent platform that includes a list of binaries that can potentially be exploited to escalate our privileges on the target system. 
We can use the diagnostic tool strace on Linux-based operating systems to track and analyze system calls and signal processing. It allows us to follow the flow of a program and understand how it accesses system resources, processes signals, and receives and sends data from the operating system. In addition, we can also use the tool to monitor security-related activities and identify potential attack vectors, such as specific requests to remote hosts using passwords or tokens.
### Configuration Files
### Running Services by User
# Credential Hunting
These may be found in configuration files (.conf, .config, .xml, etc.), shell scripts, a user's bash history file, backup (.bak) files, within database files or even in text files. Credentials may be useful for escalating to other users or even root, accessing databases and other systems within the environment.
The /var directory typically contains the web root for whatever web server is running on the host. The web root may contain database credentials or other types of credentials that can be leveraged to further access. 
## SSH Keys
We may also sometimes find SSH keys that can be used to access other hosts in the environment. Whenever finding SSH keys check the known_hosts file to find targets. This file contains a list of public keys for all the hosts which the user has connected to in the past and may be useful for lateral movement or to find data on a remote host that can be used to perform privilege escalation on our target.
# Path Abuse
PATH is an environment variable that specifies the set of directories where an executable can be located. An account's PATH variable is a set of absolute paths, allowing a user to type a command without specifying the absolute path to the binary.
Adding . to a user's PATH adds their current working directory to the list. For example, if we can modify a user's path, we could replace a common binary such as ls with a malicious script such as a reverse shell. If we add . to the path by issuing the command PATH=.:$PATH and then export PATH, we will be able to run binaries located in our current working directory by just typing the name of the file (i.e. just typing ls will call the malicious script named ls in the current working directory instead of the binary located at /bin/ls).
# Wildcard Abuse
A wildcard character can be used as a replacement for other characters and are interpreted by the shell before other actions. Examples of wild cards include:

![image](https://github.com/user-attachments/assets/ecdba941-e0bb-4764-ab37-7224c3158ab9)

An example of how wildcards can be abused for privilege escalation is the tar command, a common program for creating/extracting archives.v
The --checkpoint-action option permits an EXEC action to be executed when a checkpoint is reached (i.e., run an arbitrary operating system command once the tar command executes.) By creating files with these names, when the wildcard is specified, --checkpoint=1 and --checkpoint-action=exec=sh root.sh is passed to tar as command-line options.
![image](https://github.com/user-attachments/assets/76e5f4e9-1ff8-4e89-9d5e-0446870f8bf5)
# Escaping Restricted Shells
A restricted shell is a type of shell that limits the user's ability to execute commands.
Some common examples of restricted shells include the rbash shell in Linux and the "Restricted-access Shell" in Windows.
## RBASH
Restricted Bourne shell (rbash) is a restricted version of the Bourne shell, a standard command-line interpreter in Linux which limits the user's ability to use certain features of the Bourne shell, such as changing directories, setting or modifying environment variables, and executing commands in other directories. It is often used to provide a safe and controlled environment for users who may accidentally or intentionally damage the system.
## RKSH
Restricted Korn shell (rksh) is a restricted version of the Korn shell, another standard command-line interpreter. The rksh shell limits the user's ability to use certain features of the Korn shell, such as executing commands in other directories, creating or modifying shell functions, and modifying the shell environment.
## RZSH
Restricted Z shell (rzsh) is a restricted version of the Z shell and is the most powerful and flexible command-line interpreter. The rzsh shell limits the user's ability to use certain features of the Z shell, such as running shell scripts, defining aliases, and modifying the shell environment.
## Escaping
### Command injection
Imagine that we are in a restricted shell that allows us to execute commands by passing them as arguments to the ls command. Unfortunately, the shell only allows us to execute the ls command with a specific set of arguments, such as ls -l or ls -a, but it does not allow us to execute any other commands. In this situation, we can use command injection to escape from the shell by injecting additional commands into the argument of the ls command.
### Command Substitution
Another method for escaping from a restricted shell is to use command substitution. This involves using the shell's command substitution syntax to execute a command. For example, imagine the shell allows users to execute commands by enclosing them in backticks (`). In that case, it may be possible to escape from the shell by executing a command in a backtick substitution that is not restricted by the shell.
### Command Chaining
In some cases, it may be possible to escape from a restricted shell by using command chaining. We would need to use multiple commands in a single command line, separated by a shell metacharacter, such as a semicolon (;) or a vertical bar (|), to execute a command. For example, if the shell allows users to execute commands separated by semicolons, it may be possible to escape from the shell by using a semicolon to separate two commands, one of which is not restricted by the shell.
### Environment Variables
For escaping from a restricted shell to use environment variables involves modifying or creating environment variables that the shell uses to execute commands that are not restricted by the shell. For example, if the shell uses an environment variable to specify the directory in which commands are executed, it may be possible to escape from the shell by modifying the value of the environment variable to specify a different directory.
### Shell Functions
In some cases, it may be possible to escape from a restricted shell by using shell functions. For this we can define and call shell functions that execute commands not restricted by the shell. Let us say, the shell allows users to define and call shell functions, it may be possible to escape from the shell by defining a shell function that executes a command.
# Special Permissions
The Set User ID upon Execution (setuid) permission can allow a user to execute a program or script with the permissions of another user, typically with elevated privileges. The setuid bit appears as an s.
It may be possible to reverse engineer the program with the SETUID bit set, identify a vulnerability, and exploit this to escalate our privileges. 

![image](https://github.com/user-attachments/assets/a53f38dd-b4d0-4efc-8fb8-aa3ebe981aa5)

The Set-Group-ID (setgid) permission is another special permission that allows us to run binaries as if we were part of the group that created them. 
# Sudo Rights Abuse
When the sudo command is issued, the system will check if the user issuing the command has the appropriate rights, as configured in /etc/sudoers. When landing on a system, we should always check to see if the current user has any sudo privileges by typing sudo -l. Sometimes we will need to know the user's password to list their sudo rights, but any rights entries with the NOPASSWD option can be seen without entering a password.

# Privileged Groups
## LXC / LXD
LXD is similar to Docker and is Ubuntu's container manager. Upon installation, all users are added to the LXD group. Membership of this group can be used to escalate privileges by creating an LXD container, making it privileged, and then accessing the host file system at /mnt/root.
## Docker
Placing a user in the docker group is essentially equivalent to root level access to the file system without requiring a password. Members of the docker group can spawn new docker containers. One example would be running the command docker run -v /root:/mnt -it ubuntu. This command creates a new Docker instance with the /root directory on the host file system mounted as a volume. Once the container is started we are able to browse the mounted directory and retrieve or add SSH keys for the root user. This could be done for other directories such as /etc which could be used to retrieve the contents of the /etc/shadow file for offline password cracking or adding a privileged user.
## Disk
Users within the disk group have full access to any devices contained within /dev, such as /dev/sda1, which is typically the main device used by the operating system. An attacker with these privileges can use debugfs to access the entire file system with root level privileges. As with the Docker group example, this could be leveraged to retrieve SSH keys, credentials or to add a user.
## ADM
Members of the adm group are able to read all logs stored in /var/log. This does not directly grant root access, but could be leveraged to gather sensitive data stored in log files or enumerate user actions and running cron jobs.
# Capabilities

![image](https://github.com/user-attachments/assets/b6388d98-1455-436c-a89f-b2f6db768618)

