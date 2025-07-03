# Local Port Forwading

To use local port forwarding with SSH , you can use the ssh command with the -L option, followed by the
local port, remote host and port, and the remote SSH server. For example, the following command will
forward traffic from the local port 1234 to the remote server remote.example.com 's localhost interface
on port 22: `ssh -L 1234:localhost:22 user@remote.example.com`

When you run this command, the SSH client will establish a secure connection to the remote SSH server,
and it will listen for incoming connections on the local port 1234 . When a client connects to the local port,
the SSH client will forward the connection to the remote server on port 22 . This allows the local client to
access services on the remote server as if they were running on the local machine

# Dynamic Port Forwarding
Unlike local port forwarding and remote port forwarding, which use a specific local and remote port, dynamic port forwarding uses a single local port and dynamically assigns remote ports for each connection.

To use dynamic port forwarding with SSH, you can use the ssh command with the -D option, followed by
the local port, the remote host and port, and the remote SSH server.
