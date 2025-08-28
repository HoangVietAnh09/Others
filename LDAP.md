<img width="862" height="266" alt="image" src="https://github.com/user-attachments/assets/e10d1ff9-b1b9-4306-aae6-be9dc2e8fac5" />

Trên đỉnh của cây LDAP là **top-level domain (TLD)**, ví dụ như ```dc=ldap,dc=thm```. Dưới TLD, có thể có **subdomains** hoặc **organizational units (OUs)**, ví dụ như là ```ou=people```

* Distinguished Names (DNs)
* Relative Distinguished Names
* Attributes

## Truy vấn tìm kiếm
Các thành phần:
* Base DN (Distinguished Name)
* Scope
    * base
    * one
    * sub
* Filter
* Attributes

Cấu trúc cơ bản
```(base DN) (scope) (filter) (attributes)``` 

## Filters and Syntax
Có thể sử dụng nhiều loại toàn từ khác nhau

* =
* =* tồn tại
* >=
* <=

Ví dụ:

* (cn=John Doe)
* (cn=J*)

Complex Filters with Logical Operators: Có thể sử dụng toán tử logic như AND (&), OR (|), NOT(!)

* (&(objectClass=user)(|(cn=John*)(cn=Jane*)))

## Verctor attack
* Authentication Bypass
* Unauthorized Data Access
* Data Manipulation

## Injection Process

<img width="438" height="341" alt="image" src="https://github.com/user-attachments/assets/d131b279-6300-44b0-9f5d-e4f96fe4a549" />

