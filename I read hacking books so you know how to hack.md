---
title: Handbook for CTFers

---

# Chapter 1: Introduction to the Web
## 1.1 Significant “Information Gathering”
### 1.1.1 The Importance of Information Gathering
In this section, most information-gathering tech-niques, including useful open source tools or commercial software, will be mentioned.
### 1.1.2 Classification of Information Collection
we will discuss the basic information gathering techniques from three aspects: Sensitive Directories Leakage, Sensitive Backup Files Leakage, and Banner Identification Leakage.
#### 1.1.2.1 Sensitive Directory Leakage
Attackers can use these files to obtain important information such as source codes and all file names in the guide.
1. Git leaks
(1) Basic git leaks
Git is a primary tributed coding version control system, and it will automatically generate a .git folder to save branch information. Devel-opers often forget to delete the .git folder in the production environment, which allows an attacker to access all versions of source codes committed by developers.
Basic git leaks: This type of leakage requires a .git folder to have a comprehensive file structure, and all sensitive information could be found in the latest commit. CTF players should get the latest commit id in the .git/HEAD file and then use git’s algorithm to recover source code files that are restored in the .git/objects/ folder to perform the exploiting process.
Tool: https://github.com/denny0223/scrabble
(2) Git rollback leakage
If a CTF challenge has a git leakage, the flag file may have been deleted or overwritten after several commits
Fortunately, git has kept all commit versions in the .git folder. We can use the “git reset” command to roll back to another version.
To exploit this type of leakage, we first use the scrabble tool to crawl .git files,
and then we can use the “git reset --hard HEAD^” command to roll back to the
previous version. (Note: HEAD represents current/latest version in git system, the
previous version could be marked as HEAD^)
In addition to using “git reset”, a more straightforward way to see what files have been modified by each commit is to use the “git log –stat” command, and then use “git diff HEAD commit-id” command to compare the changes between the current version and other versions.
(3) Git branch
After each commit, git will automatically put them into a timeline called the “branch”. Git objects could be recovered from the master branch with ease. However, the flag or sensitive files we are looking for may not exist in the main branch. Using the “git log” command can only find the changes on the current branch, so we need to switch other branches to recover the target files.
Tool: https://github.com/WangYihang/GitHacker
After execution, all git files in the remote host are downloaded automatically into a local folder. After entering the folder and executing the “git log --all” or “git branch -v” command, only the master branch’s information is presented. The automation tool only restores the information from the master branch, so you need to manually download the head information from the secret branch and save it to .git/refs/heads/secret (execute the command “wget http://127.0.0.1:8000/.git/refs/heads/
secret”). After recovering the head information, we can reuse part of GitHacker’s code to restore the branch automatically.
(4) Other exploits of git leaks
In addition to the common exploit of recovering source code, other useful messages could be detected. For example, the .git/ config folder may contain access_token information that allows access to the user's other repositories.
2. SVN leakage
SVN (subversion) is another source code version controlling software. The admin-istrator might expose the hidden project folder of SVN to public services (usually webserver). Hackers could download the .svn/entries file or the wc.db file to obtain the server source code and other information.
Tool: https://github.com/kost/dvcs-rippe
3. HG leakage
When you initialize your project, HG creates a hidden folder of .hg in the current folder, containing code snaps or branch changelogs.
Tool: https://github.com/kost/dvcs-ripper
#### 1.1.2.2 Sensitive Backup Files
1. gedit backup file
Under Linux, after saving with a gedit editor, a file with the suffix “~” will be created in the current directory, the contents of which will be the content of the file you just edited. If the file you just saved is named flag, then the file is named flag~.
2. vim backup file
When a user is editing a file and exits abnormally. (e.g., when connecting to the server via SSH, the user may
encounter a command-line jam while editing a file with vim due to insufficient network speed), a backup file is generated in the current directory with the following filename format. 
>.filename.swp

>Use: ***vim -r filename*** to back up file
3. Common files
* robots.txt: records some directory and CMS version information.
* readme.md: Records CMS version information, some even have a Github address.
* www.zip/rar/tar.gz: often the source codes of a website.
#### 1.1.2.3 Banner Identification
The website's banner information (some basic fingerprints information) plays a significant role in solving challenges, and the players can often get the solutions from the banner information.
1. collect your fingerprint database
There are several publicly available CMS fingerprints on GitHub that readers can find for themselves and some well-known web scanners to identify websites.
2. Use existing tools
We can make use of the python-Wappalyzer, which is a Python library.
## 1.2 SQL Injection in CTF
The attacker could inject the possible attack payloads into SQL query statements and then pass these query statements to the back-end database for execution, resulting in a situation where the actual statements were executed incon-sistently. This attack is known as an SQL injection attack.
SQL injection attacks can leak sensitive information in the system, making it an entry-level vulnerability into the Web system.
### 1.2.1 SQL Injection Basics
SQL injection is a technique in which developers do not strictly filter the user input, which causes the user input to affect the query function, and finally causes the original information of the database to be leaked, modified, or even deleted.
#### 1.2.1.1 Numeric SQL Injection and UNION SQL Injection
The purpose of this SQL statement is to query the data in the title and content fields of the corresponding rows of the news table when id¼1 and to jointly query all the contents of the user and pwd (i.e., the account password fields) in the user table.
The PHP code dictates that only one row be displayed on the page, so we need to control the user and password result on
the first row of the query result. There are several ways to do this, such as continuing to inject the “limit 1,1” to the original query (which displays the second row of the query result
The “limit 1,1” is a qualification that takes a one-row record from the second row. In another example, we could specify id¼-1 or a huge value so that the first row
The injection approach to presenting data to a page using the UNION statement is commonly referred to as UNION (union query) injection.
After MySQL 5.0 version, it comes with a database information_schema by default, from which all database names, table names, and field names of MySQL can be queried.
Let us start with a real injection case. Assuming that we do not know anything about the target database, the first thing we should do is determining if there is a numerical injection by the same page result of id=3-1 and id=2 and then we use a union query to find all the other table names in the database. The corresponding injection process is visiting URL as http://192.168.20.133/sql1.php?id¼-1 union select 1,group_concat(table_name) from information_schema.tables where table_schema=database()
The table_name column represents the table name of tables recorded in information_schema. There is also a database name column referred to as table_schema in information_schema. The result returned by the database() function is the current selected database’s name, and the group_concat() is a function that uses “,” to combine multiple rows of records.
#### 1.2.1.2 Character SQL Injection and Boolean Blinds SQL Injection
In MySQL, if the data types on both sides of the equal sign expression are inconsistent, forced type conversion will occur. When the number is compared with the string data, the string will be converted to a number and then compared.
The string 1 is equal to a number; the string 1a is forcibly converted to 1, equal to 1; the string a is forcibly converted to 0, so it is equal to 0.
Following this feature, it is easy to determine whether the input point is character-based, i.e., whether it is wrapped in quotation marks (either single or double quotation marks, in most cases single quotation marks).
Try using single quotes to close the previous single quotes, and then comment the rest of the statement with “--%20” or “%23”. Note that the input must be URL encoded, with “%20” for spaces and “%23” for “#”.
The statements after the keyword “WHERE” represent the condition of the SELECT operation. Take the previous case as an example, “id=1” is the query condition. Here, the keyword “AND” stands for two conditions that should be met,
(1)id=1 ;(2)‘1’=true. The second condition will always be met since the string ‘1’ is converted to 1(which equals true). The database only needs to query for the row with id=1.
Here are the technical details about blind-bool-type SQL injection. For example, if the sensitive data has only one byte, first try to see if the data is ‘a’. If it is, then the page will display as “id=1”(first condition). Otherwise, the page will be blank. If the character being guessed is ‘f’, go to http://192.168.20.133/sql2.php?id¼1' and sensitive_data=‘a’, guess ‘a’, and fail to guess, try ‘b’, ‘c’, ‘d’, ‘e’, and fail to guess, until you try ‘f’, you win, and the page displays as “id=1”.
We can change the symbol and use “<” to guess characters by range. Go to the link http://192.168.20.133/sql2.php?id=1' and sensitive_data < ‘n’ to quickly know that the character's ASCII code.
Blind-type SQL injection, it is common to get sensitive data through the different contents of the page responses. In some cases, the page responses are static, so it is necessary to determine the result of SQL injection in other ways, such as the time delay
By modifying the parameters of the function sleep(), we can make the delay longer to ensure that the delay is caused by the
injection and not by normal query processing. Unlike the instant results of the Blind-type SQL injection, the sleep() function takes advantage of the short-circuit charac-teristics of the IF statement or the AND/OR keywords and the time of SQL query execution to determine the result of the SQL injection attack, which is known as a Time-blind-type injection. Its attacking structure is similar to the Boolean-blind-type, so no more specific examples to be needed here.
#### 1.2.1.3 Error-Type SQL Injection
Sometimes, in order to facilitate debugging by developers, some websites will enable error debugging messages.
This attacking type is called an Error-type SQL injection because MySQL pre-sents the error message after execution.
The second parameter of the updatexml() function should be a legal XPATH path when it is executed. Otherwise, it will output the incoming parameter while raising an error.
Try to access the link http://192.168.20.133/sql3.php?id¼1' or updatexml(1, concat(0x7e,(select pwd from wp_user)),1)%23
when the target server enables multiple statement execution, arbitrary database data can be modified using multiple statement execution. This type of injection environment is called stacked SQL injection. You can execute any SQL statement after closing the single quotes, such as trying to access http://192.168.20.133/sql4.php?id¼1 %27;delete%20%20from%20wp_files;%23 in a browser.
This section introduces numerical-type SQL injection, UNION injection, Bool-ean blind injection, Time blind injection, and Error-type injection as the basis for advanced SQL injections. These injection techniques are prioritized for ease of data
leakage: UNION injection > Error-type injection > Boolean blinding injection > Time blinding injection.
### 1.2.2 Injection Points
This section will discuss SQL injection techniques from the syntax of SQL state-ments at different injection point locations.
#### 1.2.2.1 SELECT Injection
The SELECT statement is used to query data records and is often used to display an interface, such as the content of news, etc. The syntax of the SELECT statement is as follows.
```
SELECT
[ALL | DISTINCT | DISTINCTROW ]
[HIGH_PRIORITY]
[STRAIGHT_JOIN]
[SQL_SMALL_RESULT] [SQL_BIG_RESULT] [SQL_BUFFER_RESULT]
[SQL_CACHE | SQL_NO_CACHE] [SQL_CALC_FOUND_ROWS]
select_expr[, select_expr . . .]
[FROM table_references
[PARTITION partition_list]
[WHERE where_condition]
[GROUP BY {col_name | expr | position}
[ASC | DESC], . . . [WITH ROLLUP]]
[HAVING where_condition]
[ORDER BY {col_name | expr | position}
[ASC | DESC], . . .]
[LIMIT {[offset,] row_count | row_count OFFSET offset}]
[PROCEDURE procedure_name(argument_list)]
[INTO OUTFILE 'file_name'
[CHARACTER SET charset_name]
export_options | INTO DUMPFILE 'file_name' | INTO var_name [,
var_name]]
[FOR UPDATE | LOCK IN SHARE MODE]]
```
1. Injection point at select_expr# Chapter 1: Introduction to the Web
## 1.1 Significant “Information Gathering”
### 1.1.1 The Importance of Information Gathering
In this section, most information-gathering tech-niques, including useful open source tools or commercial software, will be mentioned.
### 1.1.2 Classification of Information Collection
we will discuss the basic information gathering techniques from three aspects: Sensitive Directories Leakage, Sensitive Backup Files Leakage, and Banner Identification Leakage.
#### 1.1.2.1 Sensitive Directory Leakage
Attackers can use these files to obtain important information such as source codes and all file names in the guide.
1. Git leaks
(1) Basic git leaks
Git is a primary tributed coding version control system, and it will automatically generate a .git folder to save branch information. Devel-opers often forget to delete the .git folder in the production environment, which allows an attacker to access all versions of source codes committed by developers.
Basic git leaks: This type of leakage requires a .git folder to have a comprehensive file structure, and all sensitive information could be found in the latest commit. CTF players should get the latest commit id in the .git/HEAD file and then use git’s algorithm to recover source code files that are restored in the .git/objects/ folder to perform the exploiting process.
Tool: https://github.com/denny0223/scrabble
(2) Git rollback leakage
If a CTF challenge has a git leakage, the flag file may have been deleted or overwritten after several commits
Fortunately, git has kept all commit versions in the .git folder. We can use the “git reset” command to roll back to another version.
To exploit this type of leakage, we first use the scrabble tool to crawl .git files,
and then we can use the “git reset --hard HEAD^” command to roll back to the
previous version. (Note: HEAD represents current/latest version in git system, the
previous version could be marked as HEAD^)
In addition to using “git reset”, a more straightforward way to see what files have been modified by each commit is to use the “git log –stat” command, and then use “git diff HEAD commit-id” command to compare the changes between the current version and other versions.
(3) Git branch
After each commit, git will automatically put them into a timeline called the “branch”. Git objects could be recovered from the master branch with ease. However, the flag or sensitive files we are looking for may not exist in the main branch. Using the “git log” command can only find the changes on the current branch, so we need to switch other branches to recover the target files.
Tool: https://github.com/WangYihang/GitHacker
After execution, all git files in the remote host are downloaded automatically into a local folder. After entering the folder and executing the “git log --all” or “git branch -v” command, only the master branch’s information is presented. The automation tool only restores the information from the master branch, so you need to manually download the head information from the secret branch and save it to .git/refs/heads/secret (execute the command “wget http://127.0.0.1:8000/.git/refs/heads/
secret”). After recovering the head information, we can reuse part of GitHacker’s code to restore the branch automatically.
(4) Other exploits of git leaks
In addition to the common exploit of recovering source code, other useful messages could be detected. For example, the .git/ config folder may contain access_token information that allows access to the user's other repositories.
2. SVN leakage
SVN (subversion) is another source code version controlling software. The admin-istrator might expose the hidden project folder of SVN to public services (usually webserver). Hackers could download the .svn/entries file or the wc.db file to obtain the server source code and other information.
Tool: https://github.com/kost/dvcs-rippe
3. HG leakage
When you initialize your project, HG creates a hidden folder of .hg in the current folder, containing code snaps or branch changelogs.
Tool: https://github.com/kost/dvcs-ripper
#### 1.1.2.2 Sensitive Backup Files
1. gedit backup file
Under Linux, after saving with a gedit editor, a file with the suffix “~” will be created in the current directory, the contents of which will be the content of the file you just edited. If the file you just saved is named flag, then the file is named flag~.
2. vim backup file
When a user is editing a file and exits abnormally. (e.g., when connecting to the server via SSH, the user may
encounter a command-line jam while editing a file with vim due to insufficient network speed), a backup file is generated in the current directory with the following filename format. 
>.filename.swp

>Use: ***vim -r filename*** to back up file
3. Common files
* robots.txt: records some directory and CMS version information.
* readme.md: Records CMS version information, some even have a Github address.
* www.zip/rar/tar.gz: often the source codes of a website.
#### 1.1.2.3 Banner Identification
The website's banner information (some basic fingerprints information) plays a significant role in solving challenges, and the players can often get the solutions from the banner information.
1. collect your fingerprint database
There are several publicly available CMS fingerprints on GitHub that readers can find for themselves and some well-known web scanners to identify websites.
2. Use existing tools
We can make use of the python-Wappalyzer, which is a Python library.
## 1.2 SQL Injection in CTF
The attacker could inject the possible attack payloads into SQL query statements and then pass these query statements to the back-end database for execution, resulting in a situation where the actual statements were executed incon-sistently. This attack is known as an SQL injection attack.
SQL injection attacks can leak sensitive information in the system, making it an entry-level vulnerability into the Web system.
### 1.2.1 SQL Injection Basics
SQL injection is a technique in which developers do not strictly filter the user input, which causes the user input to affect the query function, and finally causes the original information of the database to be leaked, modified, or even deleted.
#### 1.2.1.1 Numeric SQL Injection and UNION SQL Injection
The purpose of this SQL statement is to query the data in the title and content fields of the corresponding rows of the news table when id¼1 and to jointly query all the contents of the user and pwd (i.e., the account password fields) in the user table.
The PHP code dictates that only one row be displayed on the page, so we need to control the user and password result on
the first row of the query result. There are several ways to do this, such as continuing to inject the “limit 1,1” to the original query (which displays the second row of the query result
The “limit 1,1” is a qualification that takes a one-row record from the second row. In another example, we could specify id¼-1 or a huge value so that the first row
The injection approach to presenting data to a page using the UNION statement is commonly referred to as UNION (union query) injection.
After MySQL 5.0 version, it comes with a database information_schema by default, from which all database names, table names, and field names of MySQL can be queried.
Let us start with a real injection case. Assuming that we do not know anything about the target database, the first thing we should do is determining if there is a numerical injection by the same page result of id=3-1 and id=2 and then we use a union query to find all the other table names in the database. The corresponding injection process is visiting URL as http://192.168.20.133/sql1.php?id¼-1 union select 1,group_concat(table_name) from information_schema.tables where table_schema=database()
The table_name column represents the table name of tables recorded in information_schema. There is also a database name column referred to as table_schema in information_schema. The result returned by the database() function is the current selected database’s name, and the group_concat() is a function that uses “,” to combine multiple rows of records.
#### 1.2.1.2 Character SQL Injection and Boolean Blinds SQL Injection
In MySQL, if the data types on both sides of the equal sign expression are inconsistent, forced type conversion will occur. When the number is compared with the string data, the string will be converted to a number and then compared.
The string 1 is equal to a number; the string 1a is forcibly converted to 1, equal to 1; the string a is forcibly converted to 0, so it is equal to 0.
Following this feature, it is easy to determine whether the input point is character-based, i.e., whether it is wrapped in quotation marks (either single or double quotation marks, in most cases single quotation marks).
Try using single quotes to close the previous single quotes, and then comment the rest of the statement with “--%20” or “%23”. Note that the input must be URL encoded, with “%20” for spaces and “%23” for “#”.
The statements after the keyword “WHERE” represent the condition of the SELECT operation. Take the previous case as an example, “id=1” is the query condition. Here, the keyword “AND” stands for two conditions that should be met,
(1)id=1 ;(2)‘1’=true. The second condition will always be met since the string ‘1’ is converted to 1(which equals true). The database only needs to query for the row with id=1.
Here are the technical details about blind-bool-type SQL injection. For example, if the sensitive data has only one byte, first try to see if the data is ‘a’. If it is, then the page will display as “id=1”(first condition). Otherwise, the page will be blank. If the character being guessed is ‘f’, go to http://192.168.20.133/sql2.php?id¼1' and sensitive_data=‘a’, guess ‘a’, and fail to guess, try ‘b’, ‘c’, ‘d’, ‘e’, and fail to guess, until you try ‘f’, you win, and the page displays as “id=1”.
We can change the symbol and use “<” to guess characters by range. Go to the link http://192.168.20.133/sql2.php?id=1' and sensitive_data < ‘n’ to quickly know that the character's ASCII code.
Blind-type SQL injection, it is common to get sensitive data through the different contents of the page responses. In some cases, the page responses are static, so it is necessary to determine the result of SQL injection in other ways, such as the time delay
By modifying the parameters of the function sleep(), we can make the delay longer to ensure that the delay is caused by the
injection and not by normal query processing. Unlike the instant results of the Blind-type SQL injection, the sleep() function takes advantage of the short-circuit charac-teristics of the IF statement or the AND/OR keywords and the time of SQL query execution to determine the result of the SQL injection attack, which is known as a Time-blind-type injection. Its attacking structure is similar to the Boolean-blind-type, so no more specific examples to be needed here.
#### 1.2.1.3 Error-Type SQL Injection
Sometimes, in order to facilitate debugging by developers, some websites will enable error debugging messages.
This attacking type is called an Error-type SQL injection because MySQL pre-sents the error message after execution.
The second parameter of the updatexml() function should be a legal XPATH path when it is executed. Otherwise, it will output the incoming parameter while raising an error.
Try to access the link http://192.168.20.133/sql3.php?id¼1' or updatexml(1, concat(0x7e,(select pwd from wp_user)),1)%23
when the target server enables multiple statement execution, arbitrary database data can be modified using multiple statement execution. This type of injection environment is called stacked SQL injection. You can execute any SQL statement after closing the single quotes, such as trying to access http://192.168.20.133/sql4.php?id¼1 %27;delete%20%20from%20wp_files;%23 in a browser.
This section introduces numerical-type SQL injection, UNION injection, Bool-ean blind injection, Time blind injection, and Error-type injection as the basis for advanced SQL injections. These injection techniques are prioritized for ease of data
leakage: UNION injection > Error-type injection > Boolean blinding injection > Time blinding injection.
### 1.2.2 Injection Points
This section will discuss SQL injection techniques from the syntax of SQL state-ments at different injection point locations.
#### 1.2.2.1 SELECT Injection
The SELECT statement is used to query data records and is often used to display an interface, such as the content of news, etc. The syntax of the SELECT statement is as follows.
```
SELECT
[ALL | DISTINCT | DISTINCTROW ]
[HIGH_PRIORITY]
[STRAIGHT_JOIN]
[SQL_SMALL_RESULT] [SQL_BIG_RESULT] [SQL_BUFFER_RESULT]
[SQL_CACHE | SQL_NO_CACHE] [SQL_CALC_FOUND_ROWS]
select_expr[, select_expr . . .]
[FROM table_references
[PARTITION partition_list]
[WHERE where_condition]
[GROUP BY {col_name | expr | position}
[ASC | DESC], . . . [WITH ROLLUP]]
[HAVING where_condition]
[ORDER BY {col_name | expr | position}
[ASC | DESC], . . .]
[LIMIT {[offset,] row_count | row_count OFFSET offset}]
[PROCEDURE procedure_name(argument_list)]
[INTO OUTFILE 'file_name'
[CHARACTER SET charset_name]
export_options | INTO DUMPFILE 'file_name' | INTO var_name [,
var_name]]
[FOR UPDATE | LOCK IN SHARE MODE]]
```
1. Injection point at select_expr