### DeMilitarized Zone (DMZ)
IOS zone-based firewalls là một bộ quy tắc cụ thể, giúp giảm thiểu các cuộc tấn công bảo mật cấp trung bình trong môi trường mà bảo mật được thực hiện qua bộ định tuyến. 
Trong zone-based firewalls (ZBF), các giao diện của thiết bị được đặt trong các vùng riêng biệt như (bên trong, bên ngoài hoặc DMZ) và áp dụng các chính sách trên khu vực đó.

ZBFs cũng sử dụng tính năng lọc trạng thái, nghĩa là nếu quy tắc được xác định để cho phép lưu lượng truy cập gốc từ một vùng, chẳng hạn như bên trong đến một vùng khác như DMZ, thì lưu lượng truy cập trở lại sẽ tự động được cho phép.
Ưu điểm của việc áp dụng các chính sách trên vùng thay vì giao diện là khi có bất cứ yêu cầu thay đổi mới ở cấp giao diện, thì chỉ cần xóa hoặc thêm giao diện trong vùng cụ thể sẽ tự động áp dụng các chính sách trên đó.

ZBF có thể sử dụng bộ tính năng sau để triển khai:

* Kiểm tra trạng thái
* Lọc gói tin
* Lọc URL
* Tường lửa trong suốt
* Chuyển tiếp định tuyến ảo (VRF)

![image](https://github.com/user-attachments/assets/21182f06-1568-4090-b90e-df3b2d54fd1e)

### Các loại tường lửa
#### Tường lửa lọc gói tin
Packet Filtering Firewall bao gồm việc sử dụng danh sách truy cập để cho phép hoặc từ chối lưu lượng truy cập dựa trên thông tin lớp 3 và lớp 4. Bất cứ khi nào một gói truy cập vào giao diện của thiết bị lớp 3 được định cấu hình ACL (Access Control list), nó sẽ kiểm tra sự trùng khớp trong ACL (bắt đầu từ dòng đầu tiên của ACL).
Sử dụng ACL mở rộng trong thiết bị Cisco, thông tin sau có thể được sử dụng để khớp với lưu lượng truy cập:

* Địa chỉ nguồn
* Địa chỉ đích
* Cổng nguồn
* Cổng đích
* Một số tính năng bổ sung như phiên thiết lập TCP, v.v.

#### Tường lửa cổng cấp độ mạch
Circuit Level gateway firewall hoạt động ở lớp phiên của mô hình OSI. Nó nắm bắt gói tin để giám sát TCP Handshaking, để xác nhận xem các phiên có hợp lệ hay không. Các gói được chuyển tiếp đến đích từ xa thông qua Circuit Level gateway firewall dường như bắt nguồn từ cổng.
#### Tường lửa cấp ứng dụng
Tường lửa mức ứng dụng có thể hoạt động ở lớp 3 đến lớp 7 của mô hình OSI. Thông thường, một phần mềm chuyên dụng hoặc mã nguồn mở chạy trên máy chủ cao cấp đóng vai trò trung gian giữa máy khách và địa chỉ đích.

Các tường lửa này có thể hoạt động đến lớp 7, nên có thể kiểm soát chi tiết hơn các gói di chuyển vào và ra khỏi mạng. 

#### Tường lửa kiểm tra nhiều lớp trạng thái
Nó lưu trạng thái của các phiên hiện tại trong một bảng được gọi là cơ sở dữ liệu trạng thái. Kiểm tra trạng thái và tường lửa sử dụng kỹ thuật này thường từ chối bất kỳ lưu lượng nào giữa các giao diện đáng tin cậy và không đáng tin cậy.

#### Transparent firewalls
Hầu hết các tường lửa đều hoạt động từ lớp 3 trở lên. Tường lửa trong suốt cũng tương tự các kỹ thuật khác, nhưng bản thân các giao diện của nó có bản chất là lớp 2. Địa chỉ IP không được gán cho bất kỳ giao diện nào, hãy nghĩ về nó như một công tắc với các cổng được gán cho một số VLAN.

Địa chỉ IP duy nhất được gán cho tường lửa trong suốt là dành cho mục đích quản lý. Tương tự, vì không có thêm bước nhảy bổ sung giữa các thiết bị đầu cuối, người dùng sẽ không thể biết về bất kỳ thay đổi mới nào cho kiến trúc mạng và các ứng dụng tùy chỉnh có thể hoạt động mà có bất kỳ sự cố nào.

#### Next Generation FireWalls (NGFW)
NGFW là một thuật ngữ được sử dụng cho các tường lửa thế hệ mới với bộ tính năng nâng cao. Nó cung cấp các tính năng bảo mật chuyên sâu để giảm thiểu các mối đe dọa đã biết và các cuộc tấn công phần mềm độc hại. Một ví dụ là dòng Cisco ASA với các dịch vụ FirePOWER. NGFW cung cấp khả năng hiển thị đầy đủ đối với người dùng mạng, thiết bị di động, máy ảo (VM) với giao tiếp dữ liệu, v.v.

#### Personal Firewalls
Tường lửa máy tính cá nhân giúp người dùng cuối tránh các cuộc tấn công từ những kẻ xâm nhập. Những bức tường lửa như vậy dường như là hàng rào bảo mật tuyệt vời cho những người dùng thường xuyên kết nối với internet thông qua DSL hoặc modem cáp. Tường lửa cá nhân cung cấp tính năng lọc trong và ngoài, kiểm soát kết nối internet đến và đi từ máy tính (cả trong chế độ domain based và workgroup) và thay đổi người dùng để tránh bất kỳ nỗ lực xâm nhập nào.

### Honeypot
#### Khái niệm
Honeypots là các thiết bị hoặc hệ thống được triển khai để bẫy những kẻ tấn công cố gắng truy cập trái phép vào hệ thống hoặc mạng, được triển khai trong môi trường bị cô lập và giám sát.
#### Các loại Honeypots
#### High-Interaction Honeypots
Honeypots tương tác cao được cấu hình với nhiều dịch vụ về cơ bản được kích hoạt để làm lãng phí thời gian của kẻ tấn công và thu thập thông tin từ sự xâm nhập này.
#### Low-Interaction Honeypots
Honeypots tương tác thấp được cấu hình để chấp nhận các dịch vụ thường được người dùng yêu cầu. Thời gian phản hồi, ít phức tạp hơn và ít tài nguyên giúp việc triển khai dễ dàng hơn so với honeypot tương tác cao.
#### Phát hiện Honeypots
Cách cơ bản để phát hiện một honeypot trong mạng là thăm dò dịch vụ. Kẻ tấn công thường tạo ra một gói dữ liệu độc hại để quét các dịch vụ đang chạy trên hệ thống và thông tin các cổng mở và đóng. Các dịch vụ có thể là HTTPS, SMTPS hoặc IMAPS hoặc các dịch vụ khác.
Khi kẻ tấn công trích xuất thông tin, nó có thể cố gắng tạo kết nối, máy chủ thực tế sẽ hoàn tất quá trình bắt tay ba chiều nhưng việc từ chối bắt tay cho thấy sự hiện diện của một honeypot. Các công cụ phát hiện honeypots như:

* Send-Safe Honeypot Hunter
* Nessus
* Hping

### Hệ thống IDS, Firewall và Honeypot
#### Snort
Snort là một hệ thống phòng chống xâm nhập mã nguồn mở mang đến các giải pháp phòng thủ mạng thời gian thực toàn diện và hiệu quả nhất, có khả năng phân tích giao thức, phân tích gói và ghi nhật ký. Nó cũng có thể tìm kiếm, lọc nội dung, phát hiện nhiều loại tấn công, thăm dò bao gồm tràn bộ đệm, quét cổng, thăm dò SMB và hơn thế nữa.
### Snort Rule
Rules là một tiêu chí để phát hiện chống lại các mối đe dọa và lỗ hổng bảo mật với hệ thống và mạng, dẫn đến lợi thế của phát hiện zero-day. Không giống như chữ ký, các quy tắc tập trung vào việc phát hiện các lỗ hổng thực tế. Có hai cách để nhận các quy tắc Snort:

* Snort Subscribers Rule
* Snort Community Rule

Quy tắc snort có hai phần logic:

* Tiêu đề quy tắc: chứa hành động, giao thức, địa chỉ IP nguồn và đích và mặt nạ mạng cũng như thông tin về cổng nguồn và cổng đích.
* Phần tùy chọn quy tắc: chứa các thông báo cảnh báo và thông tin về những phần cần được kiểm tra quyết định thực hiện.
### Các mục của Snort Rules
Danh mục quy tắc phát hiện ứng dụng bao gồm giám sát các quy tắc Kiểm soát lưu lượng ứng dụng nhất định. Các quy tắc này kiểm soát hành vi và hoạt động mạng của các ứng dụng:

* app-detect.rules

Danh mục quy tắc danh sách đen bao gồm URL, địa chỉ IP, DNS và các quy tắc khác đã được xác định là chỉ báo về các hoạt động độc hại:

* blacklist.rules

Danh mục quy tắc trình duyệt bao gồm quy tắc phát hiện lỗ hổng bảo mật trong một số trình duyệt nhất định:

* browser-chrome.rules
* browser-firefox.rules
* browser-ie.rules
* browser-webkit
* browser-other
* browser-plugins

Danh mục quy tắc hệ điều hành bao gồm các quy tắc tìm kiếm lỗ hổng trong Hệ điều hành:

* os-Solaris
* os-windows
* os-mobile
* os-Linux
* os-other

### Trốn tránh IDS
#### Insertion Attack
Tấn công chèn là một kiểu trốn tránh IDS bằng cách lợi dụng việc tin tưởng một cách mù quáng vào IDS. Hệ thống IDS giả định rằng các gói được chấp nhận cũng được chấp nhận bởi hệ thống cuối, nhưng có thể có khả năng hệ thống cuối có thể từ chối các gói này.

Loại tấn công này thường nhắm mục tiêu đến Signature-based IDS để chèn dữ liệu vào IDS. Lợi dụng lỗ hổng bảo mật, kẻ tấn công có thể chèn các gói có giá trị tổng kiểm tra hoặc TTL không hợp lệ và gửi chúng không theo thứ tự. IDS và máy chủ lưu trữ cuối, khi tập hợp lại gói, chúng có thể có hai luồng khác nhau.

![image](https://github.com/user-attachments/assets/787c6308-14d3-43cf-aab5-2246267e9772)

#### Evasion
Evasion là một kỹ thuật nhằm gửi gói tin được chấp nhận bởi hệ thống cuối bị IDS từ chối. Kỹ thuật trốn tránh nhằm mục đích khai thác máy chủ. Một IDS từ chối nhầm một gói tin như vậy sẽ bỏ sót hoàn toàn nội dung của nó. Kẻ tấn công có thể lợi dụng điều kiện này và khai thác nó.
![image](https://github.com/user-attachments/assets/75af5d40-7823-4efb-816a-d7a580c93d63)

#### Fragmentation Attack
Phân mảnh là quá trình chia nhỏ gói tin thành các mảnh. Kỹ thuật này thường được áp dụng khi IDS và máy chủ được cấu hình với thời gian chờ khác nhau. Ví dụ nếu một IDS được định cấu hình với 10 giây trong khi máy chủ được định cấu hình với 20 giây thời gian chờ, việc gửi các gói với độ trễ 15 giây sẽ bỏ qua IDS và tập hợp lại tại máy chủ.

Tương tự Phân mảnh chồng chéo, một gói có số thứ tự TCP được định cấu hình chồng chéo. Việc tập hợp lại các gói phân mảnh, chồng chéo này dựa trên cách hệ điều hành được cấu hình để thực hiện. Máy chủ hệ điều hành có thể sử dụng phân mảnh gốc trong khi thiết bị IOS có thể sử dụng phân mảnh tiếp theo theo thứ tự.

#### Denial-of-Service Attack (DoS)
Các thiết bị IDS thụ động vốn dĩ Fail-open được thay vì Fail-Closed. Lợi dụng hạn chế này, kẻ tấn công có thể khởi động một cuộc tấn công Từ chối Dịch vụ trên mạng để làm quá tải Hệ thống IDS bằng cách làm cạn kiệt CPU hoặc bộ nhớ để làm quá tải IDS.

Những điều này có thể được thực hiện bằng cách gửi gói được chế tạo đặc biệt tiêu tốn nhiều tài nguyên CPU hơn hoặc gửi một số lượng lớn các gói không theo thứ tự bị phân mảnh.
#### Obfuscating
Obfuscation là mã hóa tải trọng của một gói tin được chuyển đến mục tiêu theo cách mà máy chủ đích có thể đảo ngược nó nhưng IDS thì không. Nó sẽ khai thác người dùng cuối mà không cảnh báo IDS sử dụng các kỹ thuật như mã hóa, đa hình.
#### False Positive Generation
Tạo cảnh báo False Positive là báo sai về kết quả được kiểm tra cho một điều kiện hoặc chính sách cụ thể. Kẻ tấn công có thể tạo ra một số lượng lớn các cảnh báo False Positive bằng cách gửi một gói đáng ngờ để vận chuyển và ẩn gói độc hại thực sự bên trong để vượt qua IDS.
#### Session Splicing
Ghép phiên là một kỹ thuật trong đó kẻ tấn công chia lưu lượng truy cập thành nhiều gói nhỏ hơn theo cách mà thậm chí không một gói nào kích hoạt cảnh báo. Điều này cũng có thể được thực hiện bằng một kỹ thuật hơi khác như thêm độ trễ giữa các gói. Kỹ thuật này có hiệu quả đối với những IDS không tập hợp lại trình tự để kiểm tra chống lại sự xâm nhập.
#### Unicode Evasion Technique
Kỹ thuật né tránh Unicode là một kỹ thuật khác trong đó kẻ tấn công có thể sử dụng Unicode để thao túng IDS. Unicode là một chuẩn mã hóa ký tự. Chuyển đổi chuỗi sử dụng ký tự Unicode có thể tránh khớp chữ ký và cảnh báo IDS, do đó vượt qua hệ thống phát hiện.

### Trốn tránh tường lửa
#### Nhận dạng tường lửa
Nhận dạng tường lửa là việc firewall fingerprinting để lấy thông tin nhạy cảm như các cổng đang mở, thông tin phiên bản của dịch vụ đang chạy, v.v. Thông tin này được trích xuất bằng các kỹ thuật khác nhau như Port scanning, Fire-walking, Banner grabbing.
#### Port Scanning
Quét cổng là quy trình kiểm tra để xác định các cổng đang mở. Việc quét cổng không phải lúc nào cũng dẫn đến một cuộc tấn công, tuy nhiên nó dùng để trinh sát mạng có thể được sử dụng trước một cuộc tấn công để thu thập thông tin
#### Fire-walking
Fire-walking là kỹ thuật trong đó kẻ tấn công sử dụng gói ICMP tìm ra vị trí của tường lửa và bản đồ mạng bằng cách thăm dò yêu cầu ICMP echo với các giá trị TTL vượt quá từng cái một. Nó giúp kẻ tấn công tìm ra số bước nhảy.
#### Banner Grabbing
Lấy biểu ngữ là kỹ thuật trong đó thông tin từ biểu ngữ được lấy. Các thiết bị khác nhau như bộ định tuyến, tường lửa và máy chủ web thậm chí còn hiển thị biểu ngữ trong bảng điều khiển sau khi đăng nhập qua FTP, telnet. Thông tin nhà cung cấp cho thiết bị mục tiêu và phiên bản chương trình cơ sở có thể được trích xuất từ biểu ngữ.
#### Giả mạo địa chỉ IP
Kẻ tấn công mạo danh bất kỳ máy người dùng nào bằng cách gửi các gói IP bị thao túng với địa chỉ IP giả mạo. Quy trình giả mạo liên quan đến việc sửa đổi tiêu đề với địa chỉ IP nguồn giả mạo, tổng kiểm tra và các giá trị thứ tự.
#### Định tuyến nguồn
Định tuyến nguồn là kỹ thuật gửi gói tin qua tuyến đường đã chọn. Trong Session Hijacking, kỹ thuật này được sử dụng để cố gắng giả mạo IP như một máy chủ hợp pháp và hướng lưu lượng truy cập qua đường dẫn giống với đường dẫn của nạn nhân.

### Các kỹ thuật Bypassing
#### Bỏ qua các trang web bị chặn bằng địa chỉ IP
Trong kỹ thuật này, trang web bị chặn trong mạng được truy cập bằng địa chỉ IP. Hãy xem xét tường lửa chặn lưu lượng đến dành cho một miền cụ thể. Nó có thể được truy cập bằng cách nhập địa chỉ IP vào URL thay vì nhập tên miền trừ khi địa chỉ IP cũng bị cấu hình trong danh sách kiểm soát truy cập.
#### Bỏ qua các trang web bị chặn bằng proxy
Việc truy cập các trang web bị chặn bằng proxy là rất phổ biến. Có rất nhiều giải pháp proxy trực tuyến có sẵn để ẩn địa chỉ IP thực của bạn để cho phép truy cập các trang web bị hạn chế.
#### Vượt tường lửa thông qua đường hầm ICMP
ICMP tunneling là phương pháp tự ý đưa dữ liệu vào trọng tải của gói echo và chuyển tiếp đến máy chủ đích. Các chức năng của đường hầm ICMP là các gói ICMP echo yêu cầu và trả lời. Về cơ bản, giao tiếp TCP được đào hầm qua yêu cầu ping và trả lời vì trường trọng tải của gói ICMP không được hầu hết các tường lửa kiểm tra, trong khi một số quản trị viên mạng cho phép ICMP vì mục đích khắc phục sự cố.
#### Vượt tường lửa thông qua đường hầm HTTP
HTTP tunneling là một cách khác để vượt qua tường lửa. Hãy xem xét một công ty có lưu lượng truy cập máy chủ web lắng nghe trên cổng 80 cho lưu lượng truy cập HTTP. HTTP tunneling cho phép kẻ tấn công bỏ qua các hạn chế của tường lửa bằng cách đóng gói dữ liệu trong lưu lượng HTTP. Tường lửa sẽ cho phép cổng 80 và kẻ tấn công có thể thực hiện các tác vụ ẩn trong HTTP, chẳng hạn như sử dụng FTP qua giao thức HTTP.
#### Vượt tường lửa thông qua đường hầm SSH
OpenSSH là một giao thức mã hóa được sử dụng để bảo mật lưu lượng truy cập khỏi các mối đe dọa và tấn công khác nhau như nghe trộm, chiếm quyền điều khiển, v.v. Kết nối SSH chủ yếu được các ứng dụng sử dụng để kết nối với các máy chủ ứng dụng. Kẻ tấn công sử dụng OpenSSH để mã hóa lưu lượng nhằm tránh bị các thiết bị bảo mật phát hiện.
#### Tấn công qua hệ thống bên ngoài
Vượt qua hệ thống bên ngoài là quá trình session hijacking của người dùng hợp pháp trong mạng công ty được phép kết nối với mạng bên ngoài. Kẻ tấn công có thể dễ dàng đánh hơi lưu lượng truy cập để trích xuất thông tin, đánh cắp SessionID, cookie và mạo danh để vượt tường lửa.

Kẻ tấn công cũng có thể lây nhiễm malware hoặc Trojan vào hệ thống bên ngoài được người dùng hợp pháp sử dụng để lấy cắp thông tin.
### Các biện pháp đối phó với trốn tránh IDS/Firewall




