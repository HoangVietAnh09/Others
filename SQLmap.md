**Basic commands:**

|Options	|Description|
|:--|:--|
|-u URL, --url=URL	|Target URL (e.g. "http://www.site.com/vuln.php?id=1")|
|--data=DATA |Data string to be sent through POST (e.g. "id=1")|
|--random-agent |Use randomly selected HTTP User-Agent header value|
|-p TESTPARAMETER |Testable parameter(s)|
|--level=LEVEL |Level of tests to perform (1-5, default 1)|
|--risk=RISK |Risk of tests to perform (1-3, default 1)|

**Enumeration commands:**

|Options |Description
|:---|:---
|-a, --all	|Retrieve everything
|-b, --banner	|Retrieve DBMS banner
|--current-user |Retrieve DBMS current user
|--current-db |Retrieve DBMS current database
|--passwords |Enumerate DBMS users password hashes
|--dbs |Enumerate DBMS databases
|--tables |Enumerate DBMS database tables
|--columns |Enumerate DBMS database table columns
|--schema |Enumerate DBMS schema
|--dump |Dump DBMS database table entries
|--dump-all |Dump all DBMS databases tables entries
|--is-dba |Detect if the DBMS current user is DBA
|-D *DB NAME* |DBMS database to enumerate
|-T *TABLE NAME* |DBMS database table(s) to enumerate
|-C COL |DBMS database table column(s) to enumerate

**Operating System access commands**

|Options |Description
|:-|:-
|--os-shell	|Prompt for an interactive operating system shell
|--os-pwn	|Prompt for an OOB shell, Meterpreter or VNC
|--os-cmd=OSCMD |Execute an operating system command
|--priv-esc |Database process user privilege escalation
|--os-smbrelay |One-click prompt for an OOB shell, Meterpreter or VNC

### Simple HTTP POST Based Test
```sqlmap -r <request_file> -p <vulnerable_parameter> --dbs```
### Using GET based Method
```sqlmap -u https://testsite.com/page.php?id=7 -D <database_name> --tables```





