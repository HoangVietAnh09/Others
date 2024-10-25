## Các mối đe dọa ứng dụng Web
* Cookie Poisoning
* Insecure Storage
* Information Leakage
* Directory Traversal
* Parameter/Form Tampering
* DOS Attack
* Buffer Overflow
* Log tampering
* SQL Injection
* Cross-Site (XSS)
* Cross-Site Request Forgery
* Security Misconfiguration
* Broken Session Management
* DMZ attack
* Session Hijacking
* Network Access Attacks

### Đầu vào chưa được kiểm chứng
Đầu vào chưa xác thực đề cập đến việc xử lý đầu vào non-validated từ máy khách đến ứng dụng web hoặc máy chủ backend. Đây là một lỗ hổng có thể bị lợi dụng để thực hiện các cuộc tấn công XSS, tràn bộ đệm và injection.
### Giả mạo tham số/biểu mẫu
Giả mạo tham số đề cập đến cuộc tấn công trong đó các tham số được thao túng trong khi máy khách và máy chủ đang giao tiếp với nhau. Các thông số như URL hoặc các trường biểu mẫu bị sửa đổi.

Bằng cách này, người dùng có thể được chuyển hướng đến một trang web khác giống hệt trang web hợp pháp hoặc sửa đổi trường, chẳng hạn như cookie, biểu mẫu, Tiêu đề HTTP.
### Injection Flaws
Các cuộc tấn công tiêm kích hoạt động với sự hỗ trợ của các lỗ hổng ứng dụng web nếu một ứng dụng web dễ bị tấn công cho phép thực thi đầu vào không đáng tin cậy. Chèn mã độc hại, chèn tệp hoặc chèn SQL độc hại sẽ dẫn đến việc khai thác.
### SQL Injection
QL Injection về cơ bản là chèn các truy vấn SQL độc hại làm gián đoạn các quy trình, thao tác cơ sở dữ liệu, thực hiện lệnh và truy vấn bằng injection dẫn đến rò rỉ hoặc mất dữ liệu. Các lỗ hổng này có thể được phát hiện bằng cách sử dụng trình quét lỗ hổng ứng dụng.

SQL injection thường được thực thi bằng cách sử dụng thanh địa chỉ. Kẻ tấn công bỏ qua lỗ hổng bảo mật của ứng dụng và trích xuất thông tin có giá trị từ cơ sở dữ liệu của nó bằng SQL injection.
### Command Injection
Chèn lệnh có thể được thực hiện bằng bất kỳ phương pháp nào sau đây:

* Shell Injection
* File Injection
* HTML Embedding
### LDAP Injection
LDAP injection là một kỹ thuật tận dụng lỗ hổng đầu vào không được xác thực. Kẻ tấn công có thể truy cập cơ sở dữ liệu bằng cách sử dụng bộ lọc LDAP để tìm kiếm thông tin.
## Phương pháp tấn công ứng dụng web
### Analyze Web Applications
Phân tích ứng dụng Web bao gồm việc quan sát chức năng và các thông số để xác định lỗ hổng, điểm truy cập và công nghệ có thể bị khai thác. Các kỹ thuật HTTP requests và HTTP fingerprinting được sử dụng để chẩn đoán các thông số này.
### Attack Authentication Mechanism
Khai thác cơ chế xác thực bằng các kỹ thuật khác nhau, kẻ tấn công có thể bỏ qua xác thực hoặc đánh cắp thông tin.
### Authorization Attack Schemes
Kẻ tấn công truy cập ứng dụng web bằng tài khoản đặc quyền thấp, leo thang đặc quyền để truy cập thông tin nhạy cảm. Các kỹ thuật khác nhau được sử dụng như URL, POST dữ liệu, chuỗi truy vấn, cookie, giả mạo tham số, tiêu đề HTTP, v.v.
### Session Management Attack
Như đã định nghĩa trước đó, tấn công quản lý phiên được thực hiện bằng cách bỏ qua xác thực để mạo danh người dùng được ủy quyền hợp pháp. Điều này có thể được thực hiện bằng cách sử dụng các kỹ thuật chiếm quyền điều khiển phiên:

* Dự đoán mã phiên
* Giả mạo mã phiên
* Tấn công Man-in-the-Middle
* Phát lại phiên
### Perform Injection Attacks
Tấn công Injection về cơ bản là tiêm mã độc, lệnh và tệp bằng cách khai thác các lỗ hổng trong ứng dụng web.

* Web Script Injection
* OS Command Injection
* SMTP Injection
* SQL Injection
* LDAP Injection
* XPath Injection
* Buffer Overflow
* Canonicalization
### Attack Data Connectivity
Tấn công kết nối cơ sở dữ liệu tập trung vào việc khai thác kết nối dữ liệu giữa ứng dụng và cơ sở dữ liệu của nó. Điều này yêu cầu chuỗi kết nối để bắt đầu kết nối với cơ sở dữ liệu. Tấn công kết nối dữ liệu bao gồm:
## Biện pháp đối phó
### Encoding Schemes
Ứng dụng Web sử dụng các lược đồ mã hóa khác nhau để bảo mật dữ liệu. Các lược đồ mã hóa này được phân loại thành hai loại.
#### URL Encoding
Mã hóa URL là kỹ thuật mã hóa để xử lý an toàn URL, URL được chuyển đổi thành Định dạng ASCII để truyền tải an toàn qua HTTP. Các ký tự ASCII bất thường được thay thế bằng kí tự “%” theo sau là hai chữ số thập lục phân. Bộ ký tự mặc định trong HTML5 là UTF-8.
#### HTML Encoding
Tương tự, mã hóa HTML là một kỹ thuật biểu diễn các ký tự bất thường với HTML. ASCII là tiêu chuẩn mã hóa ký tự đầu tiên hỗ trợ 128 ký tự chữ và số khác nhau. Các kỹ thuật khác như ANSI và ISO-8859-1 hỗ trợ 256, UTF-8 (Unicode) bao gồm hầu hết mọi ký tự và Biểu tượng.

* Connection String Injection
* Connection String Parameters Pollution (CSPP)
* Connection Pool DoS
## Biện pháp đối phó

