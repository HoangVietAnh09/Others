## Khái niệm
### Wireless Networks
Mạng không dây là một loại mạng có khả năng truyền và nhận dữ liệu qua một phương tiện không dây như sóng vô tuyến. Ưu điểm là giảm chi phí về dây dẫn, thiết bị và độ phức tạp trong cài đặt.

Thông thường, liên lạc không dây dựa vào liên lạc vô tuyến, các dải tần số khác nhau được sử dụng cho các công nghệ khác nhau tùy theo nhu cầu. Ví dụ phổ biến nhất là mạng di động, truyền thông vệ tinh, liên lạc, v.v. Các mạng không dây được sử dụng phổ biến cho Cá nhân, Tổ chức, Khu vực.
### Global System for Mobile Communication (GSM)
Hệ thống Toàn cầu cho Truyền thông Di động (GSM) là một tiêu chuẩn của Viện Tiêu chuẩn Viễn thông Châu Âu. Nó là giao thức thế hệ thứ hai (2G) cho các mạng di động kỹ thuật số. 2G được phát triển để thay thế công nghệ 1G (tương tự).
### Access Point (AP)
Trong mạng Không dây, Điểm truy cập (AP) hoặc Điểm truy cập không dây (WAP) là một thiết bị phần cứng cho phép kết nối không dây với các thiết bị đầu cuối. Điểm truy cập có thể được tích hợp với bộ định tuyến (router) hoặc một thiết bị riêng biệt được kết nối với bộ định tuyến.
### Service Set Identifier (SSID)
Mã định danh nhóm dịch vụ (SSID) là tên của một Điểm truy cập.

Mã định danh nhóm dịch vụ (SSID) là tên của một Điểm truy cập. Về mặt kỹ thuật, SSID là một mã thông báo, được sử dụng để xác định mạng 802.11 (Wi-Fi) 32 byte. Mạng Wi-Fi phát liên tục SSID (nếu được bật). Việc phát sóng này về cơ bản nhằm mục đích xác định và hiện diện của một mạng không dây.

Nếu truyền phát SSID bị tắt, các thiết bị không dây sẽ không tìm thấy mạng trừ khi chúng được định cấu hình với SSID theo cách thủ công bằng cách truy cập từng thiết bị. Các thông số mặc định như SSID và mật khẩu mặc định phải được thay đổi để tránh bị xâm phạm.
### BSSID
Địa chỉ MAC của một Điểm truy cập.
### ISM Band
Băng tần ISM còn được gọi là băng tần không có giấy phép là băng tần vô tuyến dành riêng cho mục đích Công nghiệp, Khoa học và Y tế. Dải tần 2,54 GHz dành riêng cho ISM. Lò vi sóng, điện thoại không dây, máy tẩm nước y tế, radar quân sự và lò sưởi công nghiệp là một số thiết bị sử dụng dải tần này.
### Orthogonal Frequency Division Multiplexing (OFDM)
Ghép kênh phân chia theo tần số trực giao (OFDM) là một phương pháp mã hóa kỹ thuật số trên nhiều tần số sóng mang. Nó được sử dụng trong TV kỹ thuật số, phát sóng âm thanh, mạng DSL và truyền thông 4G.
### Frequency-hopping Spread Spectrum (FHSS)
FHSS là một kỹ thuật truyền tín hiệu vô tuyến bằng cách chuyển đổi hoặc nhảy sóng mang các tần số khác nhau.
### Công nghệ Wi-Fi
Wi-Fi là công nghệ LAN không dây theo tiêu chuẩn 802.11. Nhiều thiết bị như máy tính cá nhân, máy chơi game, điện thoại di động, máy tính bảng, máy in hiện đại và nhiều thiết bị khác đều tương thích với Wi-Fi.

Các thiết bị sẽ được kết nối với internet thông qua WAP. Có một số giao thức con trong 802.11 như 802.11 a/b/g/n được sử dụng trong WLAN.
### Wi-Fi Authentication Modes
Có hai chế độ xác thực cơ bản trong các mạng dựa trên Wi-Fi.

* Mở Xác thực
* Xác thực khóa chia sẻ
#### Mở Xác thực
Quá trình xác thực mở yêu cầu liên lạc sáu bước giữa máy khách và bộ phản hồi để hoàn tất quá trình xác thực.

![image](https://github.com/user-attachments/assets/171ba0ab-f9ce-496c-957c-a43fd3c547d1)

* Trong mạng LAN dựa trên Wi-Fi, khi một máy khách cố gắng kết nối Wi-Fi, nó sẽ bắt đầu quá trình liên kết bằng cách gửi yêu cầu thăm dò để khám phá mạng 802.11. Yêu cầu này chứa thông tin tốc độ dữ liệu được hỗ trợ của khách hàng.
* Yêu cầu thăm dò được trả lời bằng một phản hồi chứa các tham số như SSID, tốc độ dữ liệu, mã hóa, v.v. nếu AP tìm thấy tốc độ dữ liệu được hỗ trợ tương thích, mã hóa và một tham số khác với máy khách.
* Máy khách gửi một yêu cầu xác thực mở (khung xác thực) đến điểm truy cập với chuỗi 0x0001 để đặt mở xác thực.
* Yêu cầu xác thực mở được trả lời bởi điểm truy cập với phản hồi có chuỗi 0x0002.
* Sau khi nhận được phản hồi, máy khách sẽ gửi yêu cầu liên kết với các tham số bảo mật đã chọn tới điểm truy cập.
* Điểm truy cập phản hồi yêu cầu hoàn tất quá trình liên kết và máy khách có thể bắt đầu gửi dữ liệu.

#### Xác thực khóa chia sẻ
Chế độ xác thực Khóa chia sẻ yêu cầu bốn bước để hoàn tất quá trình xác thực.

![image](https://github.com/user-attachments/assets/1a6a01af-229a-4430-adc1-23a6a83051f4)

* Yêu cầu xác thực ban đầu được máy khách gửi đến điểm truy cập.
* Điểm truy cập phản hồi yêu cầu xác thực với khung phản hồi xác thực với nội dung thử thách.
* Máy khách sẽ mã hóa thử thách bằng khóa bí mật được chia sẻ và gửi lại cho AP.
* Người trả lời giải mã thử thách bằng khóa bí mật được chia sẻ. Nếu giải mã khớp, khung phản hồi xác thực thành công sẽ được gửi đến máy khách.

### Các loại mạng không dây
Các loại mạng không dây được triển khai trong một khu vực địa lý là:

* Wireless Personal Area Network (Wireless PAN)
* Wireless Local Area Network (WLAN)
* Wireless Metropolitan Area Network (WMAN)
* Wireless Wide Area Network (WWAN)

### Xác thực Wi-Fi với Máy chủ Xác thực Tập trung
Tùy chọn Xác thực cho mạng IEEE 802.11 là cơ chế Xác thực Khóa Chia sẻ hoặc WEP (Wired Equivalency Privacy), một tùy chọn khác là Mở Xác thực. Các Tùy chọn này không có khả năng bảo mật mạng do đó IEEE 802.11 vẫn được bảo mật.
Hai cơ chế xác thực Xác thực Mở và Xác thực Chia sẻ không thể bảo mật mạng một cách hiệu quả vì khóa WEP là bắt buộc và trong Xác thực Khóa Chia sẻ, Thử thách được chuyển tiếp tới máy khách có thể bị phát hiện. Bằng cách tấn công có thể tìm ra gói thử thách rõ ràng và gói được mã hóa.
IEEE 802.1x đi kèm với tính năng Bảo mật mạng LAN không dây thay thế cung cấp tùy chọn xác thực người dùng nâng cao hơn với khóa Động. IEEE 802.1x là giải pháp tập trung cho WLAN cung cấp Xác thực Trung tâm. IEEE 802.1x được triển khai với EAP (Extensible Authentication Protocol) dưới dạng Giải pháp bảo mật WLAN.

Các thành phần chính mà giải pháp bảo mật WLAN nâng cao IEEE 802.1x với EAP này phụ thuộc:

* Authentication: Quy trình xác thực lẫn nhau giữa Người dùng cuối và Máy chủ xác thực RADIUS, tức là ISE hoặc ACS.
* Encryption: Các khóa mã hóa được cấp phát động sau quá trình xác thực.
* Central Policy: Chính sách trung tâm cung cấp khả năng quản lý và Kiểm soát quá trình xác thực lại, thời gian chờ, khóa tái tạo và mã hóa, v.v.

*** 
ISE (Identity Services Engine) thế hệ tiếp theo của NAC 

EAP (Extensible Authentication Protocol) giao thức xác thực mở rộng dùng để mã hóa network

ACS (Automatic Configuration Server) là máy chủ máy tính giúp quản lý và cấu hình các thiết bị mạng

RADIUS (Remote Authentication Dial-In User Service) giao thức-chủ kích hoạt truy cập từ xa với máy chủ trung tâm
***

![image](https://github.com/user-attachments/assets/837fa38a-ad62-453b-956f-59d229caae9e)

* A. Người dùng không dây với EAP Supplicant kết nối mạng để truy cập tài nguyên thông qua Điểm truy cập.
* B. Khi nó kết nối và liên kết xuất hiện, Điểm truy cập sẽ chặn tất cả lưu lượng truy cập từ thiết bị được kết nối gần đây cho đến khi người dùng này đăng nhập vào mạng.
* C. Người dùng cung cấp Thông tin đăng nhập (thường là Tên người dùng và Mật khẩu, có thể là ID người dùng và mật khẩu dùng một lần hoặc kết hợp ID người dùng và Chứng chỉ). Các thông tin này được xác thực bởi máy chủ RADIUS.
* D. Xác thực lẫn nhau đang thực hiện tại điểm D và E giữa máy chủ xác thực và máy khách. Đây là một quá trình xác thực hai giai đoạn. Ở giai đoạn đầu, máy chủ xác thực Người dùng.
* E. Ở giai đoạn thứ hai, Người dùng xác thực Máy chủ hoặc ngược lại
* F. Sau quá trình xác thực lẫn nhau, việc xác định khóa WEP được thực hiện. Máy khách sẽ lưu khóa phiên này
* G. Máy chủ xác thực RADIUS gửi khóa phiên này đến Điểm truy cập
* H. Cuối cùng, AP mã hóa khóa Broadcast bằng khóa phiên và gửi khóa đã mã hóa đến máy khách.
* I. Máy khách đã có Khóa phiên, khóa này sẽ sử dụng để giải mã gói khóa broadcast được mã hóa. Giờ đây, Khách hàng có thể giao tiếp với AP bằng cách sử dụng các khóa phiên và broadcast.

### Wi-Fi Chalking
Wi-Fi Chalking bao gồm một số phương pháp để phát hiện các mạng không dây đang mở.

* WarWalking: Đi bộ xung quanh để phát hiện các mạng Wi-Fi đang mở
* WarChalking: Sử dụng Biểu tượng và Dấu hiệu để quảng cáo mạng Wi-Fi mở
* WarFlying: Phát hiện mạng Wi-Fi đang mở bằng Drone
* WarDriving: Lái xe xung quanh để phát hiện mạng Wi-Fi mở

## Các loại Ăng-ten không dây
### Directional Antenna
Ăng-ten định hướng được thiết kế để hoạt động theo một hướng cụ thể để cải thiện hiệu quả khi liên lạc, giảm nhiễu. Loại ăng-ten định hướng phổ biến nhất là sử dụng “Dish” với truyền hình vệ tinh và internet. Các loại khác như anten Yagi, anten Quad, anten Horn, anten Billboard và anten Helical.
### Omnidirectional Antenna
Ăng ten đa hướng là những ăng ten bức xạ đều theo mọi hướng. Mô hình bức xạ thường được mô tả như bánh Donut. Việc sử dụng ăng-ten đa hướng phổ biến nhất trong phát sóng vô tuyến, điện thoại di động và GPS. Các loại anten đa hướng bao gồm anten Dipole và anten Rubber Ducky.
### Parabolic Antenna
Ăng ten Parabol phụ thuộc vào phản xạ bề mặt cong của parabol để hướng sóng vô tuyến. Loại anten parabol phổ biến nhất là Dish Antenna (Parabolic Dish). Sử dụng ăng-ten parabol trong Radars, phát hiện thời tiết, truyền hình vệ tinh, v.v.
### Yagi Antenna
Ăng-ten Yagi-Uda thường được gọi là ăng-ten Yagi là loại ăng-ten định hướng bao gồm các phần tử ký sinh và phần tử điều khiển. Nó nhẹ, rẻ tiền và cấu tạo đơn giản. Nó được sử dụng làm anten truyền hình mặt đất, liên lạc cố định 1-1 trong anten radar, v.v.
### Dipole Antenna
Anten lưỡng cực là anten đơn giản nhất bao gồm hai cực giống nhau. Một bên được kết nối với đường cấp liệu trong khi một bên được kết nối với đất. Sử dụng phổ biến nhất trong ăng-ten thu sóng FM và ăng-ten TV.
## Mã hóa không dây
### Mã hóa WEP
Wired Equivalent Privacy (WEP) là một giao thức mã hóa lâu đời nhất và yếu nhất, được phát triển để đảm bảo tính bảo mật của các giao thức không dây tuy nhiên rất dễ bị tấn công. Nó sử dụng 24-bit initialization vector (IV) để tạo mật mã luồng RC4 với Cyclic Redundant Check (CRC) để đảm bảo tính bảo mật và toàn vẹn.

WEP chuẩn 64 bit sử dụng khóa 40 bit, WEP 128 bit sử dụng khóa 104 bit và WEP 256 bit sử dụng khóa 232 bit. Xác thực được sử dụng là xác thực Hệ thống mở và xác thực Khóa chia sẻ.
#### Hoạt động của mã hóa WEP
Initialization Vector (IV) và Khoá đều được gọi là WEP Seed. Nó được sử dụng cho Khóa RC4. RC4 tạo ra một luồng bit giả ngẫu nhiên và được XOR với Văn bản thuần để mã hóa dữ liệu. CRC-32 Checksum được sử dụng để tính giá trị kiểm tra tính toàn vẹn (ICV).
#### Initialization Vectors (IV) yếu
Một trong những vấn đề lớn với WEP là với Initialization Vector (IV). Giá trị IV quá nhỏ để bảo vệ khỏi việc sử dụng lại và phát lại. Thuật toán RC4 sử dụng IV và Key để tạo luồng bằng thuật toán Key Scheduling. IV yếu tiết lộ thông tin. Tập hợp các IV yếu sẽ là chìa khóa cơ bản. WEP không có cung cấp tích hợp để cập nhật khóa.
#### Phá vỡ mã hóa WEP
Việc phá vỡ mã hóa WEP có thể được thực hiện theo các bước sau:

* Giám sát kênh Điểm truy cập.
* Kiểm tra khả năng tiêm vào điểm truy cập.
* Sử dụng công cụ để xác thực giả mạo.
* Đánh hơi các gói tin bằng các công cụ Đánh hơi Wi-Fi
* Sử dụng công cụ Mã hóa để đưa các gói được mã hóa vào.
* Sử dụng công cụ Cracking để trích xuất khóa mã hóa từ IV.
#### Mã hóa WPA
Wi-Fi Protected Access (WPA) là một kỹ thuật mã hóa dữ liệu khác được sử dụng phổ biến cho mạng WLAN dựa trên Tiêu chuẩn 802.11i. Giao thức bảo mật này được phát triển bởi Wi-Fi Alliance để bảo mật mạng WLAN như một giải pháp cho điểm yếu và lỗ hổng được tìm thấy trong Wired Equivalent Privacy (WEP).
Việc triển khai WPA yêu cầu nâng cấp chương trình cơ sở cho các thẻ giao diện mạng không dây được thiết kế cho WEP. Temporal Key Integrity Protocol (TKIP) đảm bảo cho mỗi khóa gói tự động tạo khóa mới cho mỗi gói 128-bit để ngăn chặn mối đe dọa dễ bị tấn công bởi WEP
#### Temporal Key Integrity Protocol
Giao thức toàn vẹn khóa tạm thời (TKIP) là một giao thức được sử dụng trong mạng không dây IEEE 802.11i. Giao thức này được sử dụng trong Wi-Fi Protected Access (WPA). TKIP đã giới thiệu ba tính năng bảo mật:

* Khoá gốc bí mật và Vector khởi tạo (IV) Trộn trước RC4.
* Bộ đếm trình tự để đảm bảo nhận theo thứ tự và ngăn chặn các cuộc tấn công phát lại.
* Kiểm tra tính toàn vẹn của tin nhắn 64-bit (MIC).

![image](https://github.com/user-attachments/assets/5f887170-bcf6-47ca-a577-726c41d5c718)


* Khóa mã hóa tạm thời, địa chỉ truyền và số thứ tự TKIP ban đầu được trộn để tạo WEP Seed trước khi đầu vào thuật toán RC4.
* WEP Seed được đưa vào thuật toán RC4 để tạo Khoá nguồn
* Đơn vị dữ liệu dịch vụ MAC (MSDU) và Kiểm tra tính toàn vẹn của thông báo (MIC) được kết hợp bằng cách sử dụng Thuật toán Michael.
* Kết quả của Thuật toán Michael được phân mảnh để tạo Đơn vị dữ liệu giao thức MAC (MPDU).
* Giá trị kiểm tra tính toàn vẹn 32-bit (ICV) được tính cho MPDU.
* Sự kết hợp của MPDU và ICV được XOR với khóa nguồn để tạo Bản mã

#### Mã hóa WPA2
WPA2 được thiết kế để khắc phục và thay thế WPA, cung cấp, thậm chí hơn, bảo mật tốt hơn bằng cách sử dụng mã hóa 192-bit và mã hóa cá nhân cho từng người dùng làm cho nó phức tạp và khó bị xâm phạm hơn.
### Mối đe dọa không dây
#### Access Control Attacks
Tấn công kiểm soát truy cập không dây là những cuộc tấn công xâm nhập vào mạng không dây bằng cách trốn tránh tham số kiểm soát truy cập như giả mạo địa chỉ MAC, lỗi điểm truy cập và cấu hình sai, v.v.
#### Integrity and Confidentiality Attacks
Các cuộc tấn công toàn vẹn bao gồm WEP injection. Chèn khung dữ liệu, tấn công phát lại và lật bit, v.v. Các cuộc tấn công bảo mật bao gồm phân tích lưu lượng, chiếm quyền điều khiển phiên, giả mạo, bẻ khóa, tấn công MITM, v.v. để đánh chặn thông tin bí mật.
#### Availability Attacks
Các cuộc tấn công sẵn sàng bao gồm cả các cuộc tấn công Flooding và DoS nhằm ngăn người dùng hợp pháp kết nối hoặc truy cập vào mạng không dây. Các cuộc tấn công khả dụng có thể được thực hiện bằng cách ngập xác thực, nhiễm độc ARP, tấn công hủy xác thực, tấn công hủy liên kết, v.v.
#### Authentication Attacks
Tấn công xác thực nhằm đánh cắp thông tin nhận dạng hoặc máy khách không dây hợp pháp để truy cập vào mạng bằng cách mạo danh. Nó có thể bao gồm các kỹ thuật bẻ khóa mật khẩu, đánh cắp danh tính, đoán mật khẩu.
#### Rogue Access Point Attack
Tấn công điểm truy cập giả là một kỹ thuật trong đó AP giả mạo ở một nơi có mạng không dây hợp pháp thường là với một SSID. Người dùng nhận AP giả là AP hợp pháp và kết nối. Khi người dùng kết nối với AP giả, tất cả lưu lượng truy cập sẽ đi qua và kẻ tấn công đánh hơi gói tin để theo dõi hoạt động.
#### Client Mis-association
Liên kết sai máy khách bao gồm một AP giả mạo bên ngoài các tham số của mạng công ty. Khi một nhân viên kết nối với nó bằng cách bỏ qua các chính sách bảo mật, tất cả lưu lượng truy cập sẽ đi qua kẻ tấn công.
#### Misconfigured Access Point Attack
Tấn công điểm truy cập cấu hình sai bao gồm việc truy cập vào AP hợp pháp lợi dụng các cấu hình sai của nó như mật khẩu yếu, mật khẩu mặc định, không có mật khẩu bảo vệ, v.v.
#### Unauthorized Association
Liên kết trái phép là một kỹ thuật khác mà người dùng bị nhiễm Trojan hoạt động như một AP cho phép kẻ tấn công kết nối mạng công ty thông qua nó. Các Trojan này kích hoạt điểm truy cập mềm thông qua tập lệnh độc hại cho phép các máy tính xách tay biến các thẻ WLAN thành mạng WLAN.
#### Ad Hoc Connection Attack
Kết nối Ad Hoc là mạng không an toàn vì chúng không cung cấp xác thực và mã hóa mạnh. Kẻ tấn công có thể xâm nhập máy khách trong chế độ ad hoc.
#### Jamming Signal Attack
Các cuộc tấn công gây nhiễu yêu cầu tín hiệu tần số khuếch đại cao gây ra cuộc tấn công Từ chối dịch vụ. Thuật toán Carrier Sense Multiple Access/Collision Avoidance yêu cầu thời gian chờ để truyền sau khi phát hiện va chạm.
### Phương pháp tấn công không dây
#### Wi-Fi Discovery
Bước đầu tiên trong việc tấn công xâm phạm mạng không dây đó là lấy thông tin về nó. Thông tin này có thể được thu thập bằng footprinting chủ động, thụ động cũng như các công cụ khác.
#### GPS Mapping
Lập bản đồ GPS là quá trình tạo danh sách các mạng Wi-Fi được phát hiện để tạo bản ghi GPS theo dõi vị trí của Wi-Fi được phát hiện. Thông tin này có thể được sử dụng để bán cho kẻ tấn công hoặc cộng đồng hack.
#### Wireless Traffic Analysis
Phân tích lưu lượng mạng không dây bao gồm bắt gói tin để tiết lộ bất kỳ thông tin nào như broadcast SSID, phương pháp xác thực, kỹ thuật mã hóa, v.v. Có một số công cụ có sẵn để nắm bắt và phân tích mạng không dây như Wireshark/Pilot, Omni peek, Commview, …
#### Launch Wireless Attacks
Kẻ tấn công sử dụng công cụ như Aircrack-ng và các cuộc tấn công khác như nhiễm độc ARP, MITM, phân mảnh, MAC Spoofing, De-Authentication, Disassociation và AP giả để bắt đầu cuộc tấn công mạng không dây.

![image](https://github.com/user-attachments/assets/deda1578-3b1d-4d5c-8932-d060ef462f58)

### Bluetooth Hacking
Hack Bluetooth đề cập đến các cuộc tấn công vào giao tiếp Bluetooth. Bluetooth là một công nghệ không dây phổ biến có thể được sử dụng trên hầu hết thiết bị di động. Công nghệ này được sử dụng để liên lạc trong phạm vi ngắn giữa các thiết bị. Nó hoạt động ở tần số 2,4 GHz và phạm vi quả lên đến 10 mét.
#### BlueSmacking
BlueSmack là kiểu tấn công DoS Bluetooth. Trong đó, thiết bị mục tiêu bị tràn bởi các gói ngẫu nhiên. Ping of death được sử dụng để khởi động cuộc tấn công này, bằng cách làm ngập một số lượng lớn các gói echo gây ra DoS.
#### BlueBugging
BlueBugging là một kiểu tấn công trong đó kẻ tấn công khai thác thiết bị Bluetooth để giành quyền truy cập và xâm phạm nó. Về cơ bản, BlueBugging là một kỹ thuật truy cập Bluetooth hỗ trợ kết nối từ xa. Kẻ tấn công có thể để theo dõi nạn nhân, truy cập danh sách liên hệ, tin nhắn và thông tin cá nhân khác
#### BlueJacking
BlueJacking là một nghệ thuật để gửi tin nhắn không mong muốn đến các thiết bị Bluetooth. Hacker có thể gửi tin nhắn, hình ảnh và các tệp khác tới một thiết bị khác.
#### BluePrinting
BluePrinting là một kỹ thuật hoặc một phương pháp để trích xuất thông tin chi tiết về thiết bị Bluetooth từ xa. Thông tin này có thể là phần lõi, thông tin nhà sản xuất và kiểu thiết bị, v.v..
#### BlueSnarfing
BlueSnarfing là một kỹ thuật khác trong đó kẻ tấn công đánh cắp thông tin từ các thiết bị Bluetooth. Những kẻ tấn công khai thác các lỗ hổng bảo mật của phần mềm Bluetooth, truy cập thiết bị và lấy cắp thông tin như danh sách liên hệ, tin nhắn văn bản, email, v.v.
## Công cụ bảo mật không dây
### Wireless Intrusion Prevention Systems (WIPS)
Hệ thống Ngăn chặn Xâm nhập Không dây là một thiết bị mạng dành cho các mạng không dây. Nó giám sát mạng không dây và bảo vệ nó khỏi các AP trái phép và tự động ngăn chặn xâm nhập. Bằng cách giám sát quang phổ vô tuyến, nó ngăn chặn các AP giả mạo và cảnh báo cho quản trị viên mạng.
Phương pháp fingerprinting giúp tránh các thiết bị có địa chỉ MAC giả mạo. WIPS gồm ba phần: Máy chủ, Cảm biến và Điều khiển. Các AP giả, cấu hình sai AP, cấu hình sai máy khách, MITM, mạng Ad hoc, MAC Spoofing, Honeypots, DoS có thể được giảm thiểu bằng cách sử dụng WIPS.
### Wi-Fi Security Auditing Tool
Sử dụng các công cụ Bảo mật Không dây là một cách khác để bảo vệ mạng không dây. Các phần mềm này cung cấp khả năng kiểm tra mạng không dây, khắc phục sự cố, phát hiện, ngăn chặn xâm nhập, giảm thiểu mối đe dọa, phát hiện giả mạo, bảo vệ mối đe dọa zero-day, điều tra pháp y và báo cáo tuân thủ.

* AirMagnet WiFi Analyzer
* Motorola’s AirDefense Services Platform (ADSP)
* Cisco Adaptive Wireless IPS
* Aruba RFProtect
### Biện pháp đối phó
ông nghệ không dây như Wi-Fi và Bluetooth là những công nghệ phổ biến nhất và được sử dụng rộng rãi. Những công nghệ này có thể được bảo mật bằng cách sử dụng các công cụ kiểm tra và giám sát mạng khác nhau, cấu hình các chính sách kiểm soát truy cập nghiêm ngặt và kỹ thuật.

Như trước đó, chúng ta đã thảo luận về mã hóa Wi-Fi và các vấn đề của chúng, chuyển từ WEP sang WPA2, xác thực mạnh và mã hóa sẽ giúp mạng không dây của bạn khó bị xâm phạm hơn.








