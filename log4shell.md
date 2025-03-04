# 🔍 Java Naming and Directory Interface (JNDI) là gì?

![jndiarch](https://github.com/user-attachments/assets/c8a5fe4f-42ca-46b9-b4b4-3e1b679c9991)


**JNDI** (Java Naming and Directory Interface) là một API trong Java giúp ứng dụng tìm kiếm và truy xuất các đối tượng theo tên trong một dịch vụ directory (thư mục). Nó thường được sử dụng để:  
✅ Kết nối với **CSDL** thông qua JNDI DataSource.  
✅ Tìm kiếm **các tài nguyên Java EE** (EJB, JMS, LDAP, RMI).  
✅ Truy xuất thông tin từ **LDAP** hoặc **DNS**.  
✅ Hỗ trợ **Remote Object Lookup** (tìm nạp đối tượng từ xa).  

---

## 1️⃣ Kiến trúc JNDI
JNDI hoạt động theo mô hình **lookup (tra cứu)**. Khi ứng dụng Java cần một tài nguyên, nó sẽ gọi JNDI để tìm kiếm tài nguyên đó dựa trên một **tên (name)**.  

📌 **JNDI gồm 3 thành phần chính:**  
- **Context** – Gốc của JNDI, giúp tìm kiếm tài nguyên.  
- **Naming Service** – Hệ thống đặt tên tài nguyên (LDAP, RMI, DNS, JBoss, Tomcat, WebLogic).  
- **Directory Service** – Lưu trữ thông tin chi tiết của tài nguyên.  

---
