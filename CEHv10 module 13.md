## Vấn đề bảo mật Web Server
Bảo mật với máy chủ web có thể bao gồm các cuộc tấn công cấp độ mạng và tấn công cấp hệ điều hành. Thông thường, kẻ tấn công nhắm vào bất kỳ lỗ hổng và sai sót nào trong cấu hình máy chủ web và khai thác những sơ hở đó
Quản trị viên máy chủ đảm bảo về việc loại bỏ tất cả các lỗ hổng và triển khai các biện pháp bảo mật mạng như IPS/IDS, Firewall. Một khi máy chủ Web bị xâm nhập, nó sẽ ảnh hưởng đến tất cả tài khoản người dùng, từ chối các dịch vụ cung cấp, thay đổi giao diện, điểm tựa để khởi động các cuộc tấn công khác, truy cập tài nguyên và đánh cắp dữ liệu,…
## Kiến trúc máy chủ web nguồn mở
Open source web server là mô hình máy chủ Web được lưu trữ trên máy chủ khác hoặc máy chủ bên thứ ba qua internet. Một số máy chủ web nguồn mở phổ biến và được sử dụng rộng rãi nhất là:

* Apache HTTP Server
* NGINX
* Apache Tomcat
* Lighttpd
* Node.js

![image](https://github.com/user-attachments/assets/57868b62-8332-4e45-b2dc-0f688e1b0f74)

## Kiến trúc máy chủ web IIS
Internet information services (IIS) là một dịch vụ của Windows cung cấp nền tảng xử lý yêu cầu. Kiến trúc bao gồm Windows Activation Services (WAS), Web Server Engine và các đường ống xử lý tích hợp. IIS chứa nhiều thành phần xử lý một số chức năng như lắng nghe yêu cầu, quản lý quy trình, đọc cấu hình, v.v.
## Các thành phần của IIS
### Protocol Listener
Protocol Listener có trách nhiệm nhận các yêu cầu giao thức cụ thể, chuyển tiếp các yêu cầu này đến IIS để xử lý và trả lại phản hồi cho người dùng.
### HTTP.sys
Trình nghe HTTP được triển khai dưới dạng một trình điều khiển thiết bị chế độ hạt nhân được gọi là ngăn xếp giao thức HTTP (HTTP.sys). Nó chịu trách nhiệm lắng nghe các yêu cầu HTTP và chuyển tiếp đến IIS để xử lý, sau đó trả về các phản hồi đã xử lý cho người dùng
Trong phiên bản cũ của IIS, dịch vụ phát hành web toàn cầu (WWW) làm nhiệm vụ xử lý chức năng, từ phiên bản 7 trở lên, có thêm dịch vụ WAS được sử dụng. Các dịch vụ này chạy svchost.exe trên máy cục bộ và dùng chung các tệp nhị phân.
## Tấn công máy chủ web
### DoS/DDoS Attacks
Tấn công DoS/DDoS là các kỹ thuật đã được định nghĩa ở chương 9. Nó được sử dụng để làm tràn ngập yêu cầu giả với máy chủ web dẫn đến sự cố không khả dụng hoặc từ chối dịch vụ cho tất cả người dùng.
### DNS Server Hijacking
Bằng cách xâm nhập máy chủ DNS, kẻ tấn công sửa đổi cấu hình DNS chuyển hướng yêu cầu của máy chủ web mục tiêu đến máy chủ độc hại do kẻ tấn công sở hữu hoặc kiểm soát.
### DNS Amplification Attack
Tấn công Khuếch đại DNS được thực hiện bằng phương pháp đệ quy DNS. Kẻ tấn công lợi dụng tính năng này và giả mạo yêu cầu tìm kiếm tới máy chủ DNS. Máy chủ DNS phản hồi yêu cầu tới địa chỉ giả mạo, tức là địa chỉ của mục tiêu. Bằng cách khuếch đại quy mô và sử dụng botnet, kết quả là một cuộc tấn công từ chối dịch vụ phân tán.
### Directory Traversal Attacks
Trong tấn công này, kẻ tấn công cố gắng sử dụng phương pháp thử và lỗi để truy cập các thư mục bị hạn chế bằng cách sử dụng chuỗi dấu chấm và dấu gạch chéo. Bằng cách truy cập các thư mục ở ngoài thư mục gốc, kẻ tấn công tiết lộ thông tin nhạy cảm về hệ thống.
### Man-in-the-Middle/Sniffing Attack
Như đã định nghĩa ở các chương trước, kẻ tấn công tự đặt mình vào giữa máy khách và máy chủ để đánh hơi các gói tin, trích xuất thông tin nhạy cảm từ giao tiếp bằng cách chặn và thay đổi các gói tin.
### Phishing Attacks
Sử dụng Phishing, kẻ tấn công trích xuất các thông tin đăng nhập từ trang web giả mạo trông giống như một trang web hợp pháp. Thông tin này được kẻ tấn công sử dụng để mạo danh thành người dùng hợp pháp trên máy chủ mục tiêu mục tiêu.
### Website Defacement
Sau khi xâm nhập vào máy chủ web thành công, kẻ tấn công sẽ chỉnh sửa nội dung, thay đổi giao diện, để lại lời nhắn hoặc chế nhạo, v.v. Nó có thể được thực hiện bằng một số kỹ thuật như SQL Injection để truy cập trang web và deface nó.
### Web server Misconfiguration
Một phương pháp khác là tìm lỗ hổng trong trang web và khai thác chúng. Kẻ tấn công có thể tìm các cấu hình sai, các lỗ hổng của hệ thống và các thành phần của máy chủ web. Xác định các điểm yếu về cấu hình mặc định, chức năng từ xa, cấu hình sai, chứng chỉ mặc định và gỡ lỗi để khai thác chúng.
### HTTP Response Splitting Attack
Tấn công phân tách phản hồi HTTP, kẻ tấn công gửi các yêu cầu phân tách phản hồi đến máy chủ mục tiêu. Kết quả là máy chủ sẽ chia thành hai phản hồi. Phản hồi thứ hai nằm trong tầm kiểm soát của kẻ tấn công, vì vậy người dùng có thể được chuyển hướng đến trang web độc hại.
### Web Cache Poisoning Attack
Tấn công đầu độc bộ nhớ đệm là kỹ thuật trong đó kẻ tấn công xóa sạch bộ nhớ cache thực của máy chủ web và lưu trữ các truy cập giả bằng cách gửi một yêu cầu thủ công vào bộ nhớ cache. Điều này sẽ chuyển hướng người dùng đến trang web độc hại.
### SSH Brute-force Attack
Brute-force đường hầm SSH cho phép kẻ tấn công sử dụng đường hầm được mã hóa để liên lạc giữa các máy chủ. Bằng cách brute forcing thông tin đăng nhập SSH, kẻ tấn công có thể truy cập trái phép vào đường hầm SSH.
## Phương pháp tấn công
### Information Gathering
Thu thập thông tin về mục tiêu sử dụng các nền tảng khác nhau hoặc bằng kỹ thuật xã hội, lướt internet, v.v. Kẻ tấn công có thể sử dụng các công cụ, các lệnh khác nhau để trích xuất thông tin. Kẻ tấn công có thể điều hướng đến tệp robot.txt để trích xuất thông tin về các tệp nội bộ.
### Web server Footprinting
Footprinting tập trung máy chủ web bằng cách sử dụng các công cụ khác nhau như Netcraft, Maltego và httprecon, v.v. Kết quả mang lại tên máy chủ, loại, hệ điều hành và ứng dụng đang chạy và thông tin khác về trang web mục tiêu.
### Mirroring a Website
Như đã định nghĩa trước đó, sao chép một trang web là quá trình sao chép toàn bộ trang web trong hệ thống cục bộ. Nếu toàn bộ trang web được tải xuống hệ thống, sẽ cho phép kẻ tấn công sử dụng, kiểm tra, thư mục, cấu trúc và tìm các lỗ hổng khác từ bản sao được tải xuống này. Thay vì gửi nhiều bản sao đến một máy chủ web, đây là một cách để tìm các lỗ hổng trên một trang web.
### Vulnerability Scanning
Máy quét lỗ hổng bảo mật là tiện ích tự động được phát triển đặc biệt để phát hiện các lỗ hổng, điểm yếu, sự cố và lỗi trong hệ điều hành, mạng, phần mềm và ứng dụng. Các công cụ quét này thực hiện kiểm tra sâu các tập lệnh, cổng mở, biểu ngữ, dịch vụ đang chạy, lỗi cấu hình và các khu vực khác.
### Session Hijacking
Kẻ tấn công chặn, thay đổi và sử dụng tấn công Man-in-the-Middle để chiếm quyền điều khiển phiên. Kẻ tấn công sử dụng phiên được xác thực của người dùng hợp pháp mà không bắt đầu phiên mới với mục tiêu.
### Hacking Web Passwords
Password Cracking là phương pháp trích xuất mật khẩu để có được quyền truy cập hợp lệ vào hệ thống mục tiêu dưới vỏ bọc của một người dùng hợp pháp.
## Biện pháp đối phó
Biện pháp cơ bản là đặt máy chủ web trong vùng an toàn nơi các thiết bị bảo mật như tường lửa, IPS và IDS được triển khai, lọc và kiểm tra lưu lượng truy cập . Đặt vào một môi trường biệt lập như DMZ sẽ bảo vệ máy chủ web khỏi các mối đe dọa.

![image](https://github.com/user-attachments/assets/5832cfd9-3f84-4a4a-a387-339962c0dfa6)
### Phát hiện tấn công máy chủ web
Có một số kỹ thuật đang được sử dụng để phát hiện bất kỳ sự xâm nhập hoặc hoạt động không mong muốn nào trong máy chủ web, chẳng hạn như Website change detection system, phát hiện nỗ lực tấn công bằng cách sử dụng lệnh tập trung vào việc kiểm tra các thay đổi thực hiện bởi các tệp thực thi. Tương tự, các hàm băm được so sánh định kỳ để phát hiện sửa đổi.
## Quản lý bản vá
### Patches và Hotfixes
Patches và Hotfixes bắt buộc phải loại bỏ các lỗ hổng, lỗi và sự cố trong một bản phát hành phần mềm. Hotfix là các bản cập nhật khắc phục các sự cố trong khi patches là 1 phần được thiết kế đặc biệt để khắc phục sự cố.

Hotfix được gọi là một hot system, được thiết kế đặc biệt trong môi trường sản xuất trực tiếp, nơi sửa lỗi các sản phẩm đã được đưa ra sử dụng và thử nghiệm để giải quyết vấn đề.

Patches phải được tải xuống từ các trang web chính thức, trang chủ nhà cung cấp ứng dụng và hệ điều hành. Khuyến nghị là đăng ký để nhận thông báo về các bản vá và sự cố mới nhất. Có thể tải xuống thủ công từ nhà cung cấp hoặc cập nhật tự động.
### Patch Management
Quản lý bản vá là một quy trình tự động đảm bảo cài đặt các bản vá bắt buộc hoặc cần thiết trên hệ thống. Quy trình quản lý bản vá phát hiện các bản vá bảo mật còn thiếu, tìm ra giải pháp, tải xuống bản vá, kiểm tra bản vá trong môi trường cô lập, tức là máy thử nghiệm, sau đó triển khai bản vá trên hệ thống.



