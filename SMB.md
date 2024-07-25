# What is SMB?

SMB - Server Message Block Protocol - is a client-server communication protocol used for sharing access to files, printers, serial ports and other resources on a network. [source]

Servers make file systems and other resources (printers, named pipes, APIs) available to clients on the network. Client computers may have their own hard disks, but they also want access to the shared file systems and printers on the servers.

The SMB protocol is known as a response-request protocol, meaning that it transmits multiple messages between the client and server to establish a connection. Clients connect to servers using TCP/IP (actually NetBIOS over TCP/IP as specified in RFC1001 and RFC1002), NetBEUI or IPX/SPX. 

# How does SMB work?

Once they have established a connection, clients can then send commands (SMBs) to the server that allow them to access shares, open files, read and write files, and generally do all the sort of things that you want to do with a file system. However, in the case of SMB, these things are done over the network. 

# What runs SMB?

Microsoft Windows operating systems since Windows 95 have included client and server SMB protocol support. Samba, an open source server that supports the SMB protocol, was released for Unix systems.

# Enum4Linux

Enum4linux is a tool used to enumerate SMB shares on both Windows and Linux systems. It is basically a wrapper around the tools in the Samba package and makes it easy to quickly extract information from the target pertaining to SMB

|TAG | FUNCTION
|:-|:-
|-U | get userlist
|-M | get machine list
|-N | get namelist dump (different from -U and-M)
|-S | get sharelist
|-P | get password policy information
|-G | get group and member list
|-a | all of the above (full basic enumeration)

# SMBClient 

We can remotely access the SMB share using the syntax: ```smbclient //[IP]/[SHARE]```

Followed by the tags:

-U [name] : to specify the user

-p [port] : to specify the port

Download file from smbclient: mget file

# Telnet

Telnet is an application protocol which allows you, with the use of a telnet client, to connect to and execute commands on a remote machine that's hosting a telnet server.

The telnet client will establish a connection with the server. The client will then become a virtual terminal- allowing you to interact with the remote host.

Telnet sends all messages in clear text and has no specific security mechanisms. Thus, in many applications and services, Telnet has been replaced by SSH in most implementations.

The user connects to the server by using the Telnet protocol, which means entering "telnet" into a command prompt. The user then executes commands on the server by using specific Telnet commands in the Telnet prompt. You can connect to a telnet server with the following syntax: "telnet [ip] [port]"

Connecting to Telnet

You can connect to a telnet server with the following syntax:

    "telnet [ip] [port]"

We're going to need to keep this in mind as we try and exploit this machine.

# FTP

What is FTP?

File Transfer Protocol (FTP) is, as the name suggests , a protocol used to allow remote transfer of files over a network. It uses a client-server model to do this, and- as we'll come on to later- relays commands and data in a very efficient way.

How does FTP work?

A typical FTP session operates using two channels:
* a command (sometimes called the control) channel
* a data channel.

Active vs Passive

The FTP server may support either Active or Passive connections, or both. 

* In an Active FTP connection, the client opens a port and listens. The server is required to actively connect to it. 
* In a Passive FTP connection, the server opens a port and listens (passively) and the client connects to it.

connect to ftp client: ftp ip
