## Tổng quan về Điện toán đám mây
Điện toán đám mây cho phép truy cập vào các tài nguyên cá nhân và chia sẻ với mức độ quản lý tối thiểu. Nó thường dựa vào internet.
Ngoài ra còn có giải pháp đám mây của bên thứ ba giúp tiết kiệm tài nguyên mở rộng và bảo trì. Ví dụ thích hợp nhất là Amazon Elastic Cloud Compute (EC2), có khả năng cao, chi phí thấp và linh hoạt. Các đặc điểm chính của điện toán đám mây bao gồm:

* Dịch vụ tự phục vụ theo nhu cầu
* Bộ nhớ phân tán
* Thay đổi nhanh
* Dịch vụ đo lường
* Quản lý tự động
* Ảo hóa
### Các loại dịch vụ điện toán đám mây
Dịch vụ Điện toán đám mây được phân thành ba loại sau:

* Infrastructure-as-a-Service (IaaS)
* Platform-as-a-Service (PaaS)
* Software-as-a-Service (SaaS)

#### Infrastructure-as-a-Service (IaaS)
Dịch vụ cơ sở hạ tầng (IaaS) còn được gọi là Dịch vụ cơ sở hạ tầng đám mây về cơ bản là một mô hình tự phục vụ. IaaS được sử dụng cho mục đích truy cập, giám sát và quản lý.
#### Platform-as-a-Service (PaaS)
Nền tảng như một dịch vụ (PaaS) là một dịch vụ điện toán đám mây. Nó cho phép người dùng phát triển, chạy và quản lý các ứng dụng. PaaS cung cấp các công cụ Phát triển, Quản lý cấu hình, Nền tảng Triển khai và chuyển ứng dụng sang các mô hình kết hợp.
#### Software-as-a-Service (SaaS)
Phần mềm như một dịch vụ (SaaS) là một trong những dịch vụ Điện toán đám mây phổ biến được sử dụng rộng rãi nhất. Phần mềm theo nhu cầu được lưu trữ tập trung để người dùng có thể truy cập thông qua trình duyệt.
### Mô hình triển khai đám mây
![image](https://github.com/user-attachments/assets/78226130-07b4-4879-98ae-8bb5d49a0ffa)
### Kiến trúc tham chiếu điện toán đám mây NIST
Kiến trúc sau đây là một kiến trúc tham chiếu khái niệm cấp cao chung được trình bày bởi NIST (Viện Tiêu chuẩn và Công nghệ Quốc gia). Nó xác định các Thành phần chính và chức năng của chúng trong điện toán đám mây nhằm tạo điều kiện hiểu biết các yêu cầu, cách sử dụng, đặc điểm và tiêu chuẩn của điện toán đám mây.

![image](https://github.com/user-attachments/assets/25f1d837-db23-4b7b-96bb-c1f37eec37cf)

Kiến trúc điện toán đám mây NIST xác định 5 tác nhân chính:

* Người tiêu dùng đám mây: Một cá nhân hoặc tổ chức duy trì mối quan hệ kinh doanh và sử dụng dịch vụ từ Nhà cung cấp đám mây.
* Nhà cung cấp đám mây: Một cá nhân, tổ chức hoặc thực thể chịu trách nhiệm cung cấp dịch vụ cho các bên quan tâm.
* Nhà cung cấp dịch vụ đám mây: Một trung gian cung cấp kết nối và vận chuyển các dịch vụ đám mây từ Nhà cung cấp đám mây đến Người tiêu dùng trên đám mây.
* Người kiểm toán đám mây: Một bên có thể tiến hành đánh giá độc lập về các dịch vụ đám mây, hoạt động của hệ thống thông tin, hiệu suất và tính bảo mật của việc triển khai đám mây.
* Nhà môi giới đám mây: Một pháp nhân quản lý việc sử dụng, hiệu suất và phân phối các dịch vụ đám mây, đồng thời thương lượng mối quan hệ giữa Nhà cung cấp đám mây và Người tiêu dùng trên đám mây

### Lợi ích của Điện toán đám mây
* Tăng sức chứa
* Tăng tốc độ
* Tăng tốc độ
* Độ trễ thấp
* Chi phí kinh tế ít hơn
* Bảo mật
* Hiểu về ảo hóa

## Các mối đe dọa từ điện toán đám mây
Vì điện toán đám mây cung cấp nhiều dịch vụ với hiệu quả và linh hoạt, nên cũng có một số mối đe dọa khiến nó dễ bị tấn công. Những mối đe dọa bao gồm mất/vi phạm dữ liệu, giao diện và API không an toàn, nội gián độc hại, leo thang đặc quyền, thiên tai, lỗi phần cứng, xác thực, tấn công cấp máy ảo và hơn thế nữa.
### Data Loss/Breach
Mất dữ liệu và Vi phạm dữ liệu là mối đe dọa phổ biến nhất đối với mọi nền tảng. Mã hóa không đúng cách hoặc làm mất khóa mã hóa có thể dẫn đến việc sửa đổi, xóa, đánh cắp dữ liệu và sử dụng sai dữ liệu.
### Abusing Cloud Services
Lạm dụng Dịch vụ Đám mây bao gồm việc sử dụng dịch vụ cho mục đích xấu cũng như lạm dụng các dịch vụ này. Ví dụ, dịch vụ đám mây Dropbox đã bị kẻ tấn công lợi dụng để phát tán chiến dịch lừa đảo lớn. Tương tự, nó có thể được sử dụng để lưu trữ, dữ liệu độc hại, lệnh và kiểm soát Botnet, v.v.
### Insecure Interface and APIs
Giao diện Người dùng Phần mềm (UI) và Giao diện Lập trình Ứng dụng (API) là những giao diện được khách hàng sử dụng để tương tác với dịch vụ. Các giao diện này có thể được bảo mật bằng cách thực hiện Giám sát, Điều phối, Quản lý và cung cấp. Các giao diện này phải an toàn trước các nỗ lực độc hại.
## Các cuộc tấn công điện toán đám mây
Sau đây là các cuộc tấn công phổ biến nhất được kẻ tấn công sử dụng để trích xuất thông tin nhạy cảm như thông tin xác thực hoặc truy cập trái phép.

* Đánh cắp dịch vụ bằng cách sử dụng các kỹ thuật xã hội
* Đánh cắp phiên sử dụng XSS Attack
* Tấn công hệ thống tên miền (DNS)
* Tấn công SQL Injection
* Wrapping Attack
* Đánh cắp dịch vụ bằng cách sử dụng Network Sniffing
* Đánh cắp phiên bằng cách sử dụng Session Riding
* Tấn công kênh bên hoặc vi phạm máy ảo khách chéo
* Phân tích mật mã
* Tấn công Dos/DDoS
### Service Hijacking using Social Engineering Attacks
Chúng tôi đã thảo luận về các cuộc tấn công xã hội. Sử dụng các kỹ thuật Social Engineering, cuộc tấn công có thể cố gắng đoán mật khẩu. Các cuộc tấn công Social Engineering dẫn đến việc làm lộ thông tin nhạy cảm theo cấp đặc quyền của người dùng bị xâm phạm.
### Service Hijacking using Network Sniffing
Sử dụng các công cụ Packet Sniffing bằng cách tự đặt mình vào mạng, kẻ tấn công có thể nắm bắt thông tin nhạy cảm như mật khẩu, ID phiên, cookie và thông tin khác liên quan đến dịch vụ web như UDDI, SOAP và WSDL.
### Session Hijacking using XSS Attack
Bằng cách khởi chạy Cross-Site Scripting (XSS), kẻ tấn công có thể đánh cắp cookie bằng cách đưa mã độc vào trang web
### Session Hijacking using Session Riding
Session Riding nhằm mục đích chiếm quyền điều khiển phiên. Kẻ tấn công có thể khai thác nó bằng cách cố gắng giả mạo yêu cầu cross-site. Kẻ tấn công sử dụng phiên hiện đang hoạt động và lái trên đó bằng cách thực hiện các yêu cầu như sửa đổi dữ liệu, xóa dữ liệu, giao dịch trực tuyến và thay đổi mật khẩu bằng cách theo dõi người dùng nhấp vào một liên kết độc hại.
### Domain Name System (DNS) Attacks
Các cuộc tấn công Hệ thống tên miền (DNS) bao gồm DNS Poisoning, Cybersquatting, Domain hijacking và Domain Snipping. Kẻ tấn công có thể cố gắng giả mạo bằng cách đầu độc máy chủ DNS hoặc bộ nhớ cache để lấy thông tin đăng nhập của người dùng nội bộ.
Domain Hijacking liên quan đến việc đánh cắp tên miền dịch vụ đám mây. Tương tự, thông qua các trò lừa đảo Phishing, người dùng có thể được chuyển hướng đến một trang web giả mạo.
### Side Channel Attacks or Cross-guest VM Breaches
Side Channel Attacks hoặc Cross-Guest VM Breach là một cuộc tấn công yêu cầu triển khai một máy ảo độc hại trên cùng máy chủ. Ví dụ một máy chủ vật lý đang lưu trữ một máy ảo cung cấp các dịch vụ đám mây do đó trở thành mục tiêu của kẻ tấn công.
Kẻ tấn công sẽ cài đặt một máy ảo độc hại trên cùng máy chủ để lợi dụng việc chia sẻ tài nguyên của máy chủ như bộ nhớ đệm của bộ xử lý, khóa mật mã, v.v. Việc cài đặt có thể được thực hiện bởi kẻ nội gián độc hại hoặc tấn công bằng cách mạo danh người dùng hợp pháp
## Bảo mật đám mây
Cloud Computing Security đề cập đến việc triển khai và ngăn chặn bảo mật để bảo vệ khỏi các mối đe dọa. Bảo mật đám mây bao gồm các chính sách Kiểm soát, triển khai các thiết bị bảo mật như tường lửa ứng dụng, thiết bị IPS thế hệ tiếp theo và củng cố cơ sở hạ tầng của Điện toán đám mây.
### Lớp kiểm soát bảo mật đám mây
#### Lớp ứng dụng
