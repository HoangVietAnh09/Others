# SSRF via Extend Link Plugin (Blacklist Bypass)

## Step 1
Log in with an account that has **Author privileges**.

## Step 2
Install the following two plugins:
- `Classic Editor`
- `Extend Link`

<img width="1585" height="123" alt="image" src="https://github.com/user-attachments/assets/5a06486f-c957-4b91-8816-4a9d65d6927d" />

<img width="1395" height="178" alt="image" src="https://github.com/user-attachments/assets/ef8c6e97-5cc6-433b-bf49-80b3011756de" />

## Step 3
Navigate to **Posts**, select **Add Post**, and fill in the required information.  
After that, choose **Extend Link**.

<img width="1051" height="485" alt="image" src="https://github.com/user-attachments/assets/137800a9-adf0-4738-ad96-6a0bc91564b9" />

## Step 4
Insert a URL into the **URL field**, then click **Check Link Status**.

After checking the link status, observe in **Burp Collaborator** that a request is sent from the **server side**.

<img width="1413" height="713" alt="image" src="https://github.com/user-attachments/assets/9cf62203-ea26-4286-859c-41eacefad2bd" />

<img width="1132" height="281" alt="image" src="https://github.com/user-attachments/assets/75343dc7-f116-4021-815b-eb63f0b7db7c" />

## Step 5
By examining the **plugin source code**, it can be observed that the plugin implements a **blacklist mechanism** to validate user input.

<img width="1198" height="875" alt="image" src="https://github.com/user-attachments/assets/68d174f1-27b9-4e02-a382-e62e12828458" />

## Step 6
Bypass the plugin’s blacklist mechanism by shortening the URL using [Tiny URL](https://tinyurl.com/).

Shorten the following URL using TinyURL:

http://127.0.0.1:80

<img width="624" height="476" alt="image" src="https://github.com/user-attachments/assets/0673740e-00c0-4065-b3b7-5b9dffd040cf" />


Then check the link status using the **Check Link Status** feature.

Set a breakpoint at the host validation function. The application returns the value **`true`**.

<img width="1193" height="435" alt="image" src="https://github.com/user-attachments/assets/9efb20e5-5bbc-4101-9462-02553aeb0495" />

The response message **`Link is working`** confirms that the blacklist mechanism has been successfully bypassed.

<img width="1450" height="774" alt="image" src="https://github.com/user-attachments/assets/efbb8cd5-9f7d-4187-a21c-99a064cb8dde" />

Next, shorten the following URL:

http://127.0.0.1:1234

Then check the link status again using the same feature.

This time, the application returns:

`There is an error`

<img width="1455" height="786" alt="image" src="https://github.com/user-attachments/assets/da684b33-136a-423f-8d33-e61252c57d57" />

## Impact
An attacker can exploit this vulnerability to perform **requests that are only accessible within the internal network**, which may lead to **Server-Side Request Forgery (SSRF)** and allow interaction with internal services and detection open port.
