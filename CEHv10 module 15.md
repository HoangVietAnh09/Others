## Khái niệm
### SQL Injection
SQL Injection Attacks sử dụng các trang web hoặc ứng dụng web SQL. Nó dựa vào chiến lược tiêm mã độc hoặc tập lệnh vào các truy vấn hiện có. Mã độc này có mục đích tiết lộ hoặc thao túng dữ liệu được lưu trữ trong các bảng trong cơ sở dữ liệu.
### Phạm vi của SQL Injection
SQL Injection có thể là một mối đe dọa lớn đối với một trang web hoặc ứng dụng. Tác động của nó có thể được đo lường bằng cách quan sát các tham số sau mà kẻ tấn công có ý định thực hiện:

* Bỏ qua xác thực
* Tiết lộ thông tin nhạy cảm
* Tính toàn vẹn của dữ liệu được điều chỉnh
* Xóa cơ sở dữ liệu
* Thực thi mã từ xa

### Cách hoạt động của truy vấn SQL
Chèn truy vấn SQL sẽ được thực thi trên máy chủ và được phản hồi trả lời

![image](https://github.com/user-attachments/assets/3ede9066-efa3-4449-a1d9-292e03772bef)
### Các công cụ SQL Injection
Có một số công cụ có sẵn cho SQL injection như:

* BSQL Hacker
* Marathon Tool
* SQL Power Injector
* Havij
* SQLMap
## Các loại SQL Injection
SQL Injection có thể được phân thành ba loại chính:

* In-band SQLi
* Inferential SQLi
* Out-of-band SQLi

### In-Band SQL Injection
In-Band SQL injection gồm các kỹ thuật tiêm sử dụng cùng một kênh giao tiếp để khởi động cuộc tấn công tiêm và thu thập thông tin từ phản hồi. Hai kỹ thuật bao gồm:

* Error-based SQL Injection
* Union based SQL Injection

#### Error Based SQL Injection
SQL Injection dựa trên lỗi là một trong những kỹ thuật In-Band SQL Injection. Nó dựa vào các thông báo lỗi từ máy chủ cơ sở dữ liệu để tiết lộ thông tin về cấu trúc của cơ sở dữ liệu. Việc chèn SQL dựa trên lỗi rất hiệu quả để kẻ tấn công liệt kê toàn bộ cơ sở dữ liệu.
#### Union SQL Injection
Union-based SQL injection là một kỹ thuật In-Band SQL Injection khác liên quan đến toán tử SQL UNION để kết hợp các kết quả của hai hoặc nhiều câu lệnh SELECT thành một kết quả duy nhất.
### Inferential SQL Injection (Blind Injection)
Trong một Inferential SQL Injection, không có dữ liệu nào được chuyển từ một ứng dụng Web, tức là kẻ tấn công không thể nhìn thấy kết quả của cuộc tấn công do đó được gọi là tiêm mù. Kẻ tấn công chỉ quan sát hành vi của máy chủ. Hai loại inferential SQL Injection là Blind-Boolean-based SQL injection và Blind-time-based SQL injection.
#### Boolean Exploitation Technique
Blind SQL injection là kỹ thuật gửi một yêu cầu đến cơ sở dữ liệu, phản hồi không chứa bất kỳ dữ liệu nào từ cơ sở dữ liệu tuy nhiên kẻ tấn công quan sát phản hồi HTTP. Bằng cách đánh giá các phản hồi, kẻ tấn công có thể suy ra việc tiêm thành công hay không thành công, vì phản hồi sẽ là đúng hoặc sai tuy nhiên nó sẽ không chứa bất kỳ dữ liệu nào từ cơ sở dữ liệu.
### Out-of-band SQL Injection
Out-of-band SQL Injection là kỹ thuật tiêm sử dụng các kênh khác nhau để khởi chạy tiêm và thu thập các phản hồi. Nó yêu cầu một số tính năng được bật như yêu cầu DNS hoặc HTTP trên máy chủ cơ sở dữ liệu, do đó nó không phổ biến lắm.
## Phương pháp tấn công
### Thu thập thông tin và phát hiện lỗ hổng SQL Injection
Trong giai đoạn thu thập thông tin, Thu thập thông tin về ứng dụng web, hệ điều hành, cơ sở dữ liệu và cấu trúc của các thành phần. Đánh giá thông tin trích xuất sẽ hữu ích cho xác định các lỗ hổng để khai thác.

Thông tin có thể được thu thập bằng cách sử dụng các công cụ và kỹ thuật khác nhau như chèn mã vào các trường nhập để quan sát phản hồi của các thông báo lỗi.
### Khởi chạy cuộc tấn công SQL Injection
Có thể bắt đầu cuộc tấn công SQL injection ngay sau khi thu thập thông tin về cấu trúc của cơ sở dữ liệu và các lỗ hổng được tìm thấy. Bằng cách khai thác chúng, việc tiêm có thể thành công.

Các cuộc tấn công như Union SQL injection, Error-based SQL injection, Blind SQL injection và các loại khác có thể được sử dụng để trích xuất thông tin từ cơ sở dữ liệu như tên cơ sở dữ liệu, bảng, cột, hàng và trường. Việc tiêm cũng có thể nhằm mục đích bỏ qua xác thực.
### SQL Injection nâng cao
Việc chèn SQL nâng cao có thể bao gồm một danh sách các cơ sở dữ liệu như MySQL, MSSQL, MS Access, Oracle, DB2 hoặc Postgre SQL, các bảng và cột để xác định mức đặc quyền của người dùng, thông tin tài khoản của quản trị viên cơ sở dữ liệu và tiết lộ cấu trúc cơ sở dữ liệu.

Nó cũng bao gồm lấy mật khẩu và hàm băm, và chuyển cơ sở dữ liệu đến máy từ xa.
## Kỹ thuật né tránh
### Trốn tránh IDS
Để bảo mật cơ sở dữ liệu, nên triển khai cô lập ở một vị trí mạng an toàn với hệ thống phát hiện xâm nhập (IDS). IDS tiếp tục theo dõi mạng và lưu lượng máy chủ cũng như ứng dụng cơ sở dữ liệu. Kẻ tấn công phải tránh IDS để truy cập cơ sở dữ liệu, và sử dụng các kỹ thuật trốn khác nhau
### Biện pháp đối phó
Để giảm thiểu các cuộc tấn công SQL injection, có một số công cụ phát hiện có sẵn có thể được sử dụng. Các công cụ này thực hiện kiểm tra trang web và ứng dụng, đồng thời báo cáo dữ liệu, sự cố và hành động khắc phục. Một số công cụ nâng cao này cũng đề xuất mô tả kỹ thuật về vấn đề.



