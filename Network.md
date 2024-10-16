## NetBIOS Name Service and LLMNR
Network Basic Input/Output System (NetBIOS) và Link-Local Multicast Name Resolution (LLMNR) là các giao thức chủ yếu được Microsoft Windows sử dụng để nhận dạng máy chủ. LLMNR dựa trên định dạng giao thức Hệ thống tên miền (DNS). NetBIOS cung cấp ba dịch vụ: Dịch vụ tên (NetBIOS-NS), Dịch vụ gói dữ liệu (NetBIOS-DGM) và Dịch vụ phiên (NetBIOS-SSN). Các hoạt động này sử dụng các cổng TCP và UDP cụ thể để liên lạc. Các nhóm làm việc Windows là các mạng ngang hàng LAN, trong khi các triển khai dựa trên miền là các mạng client-to-server hỗ trợ nhiều máy chủ trên nhiều mạng con.

Trong lịch sử, đã có nhiều lỗ hổng trong NetBIOS, SMB và LLMNR. Một lỗ hổng LLMNR phổ biến liên quan đến kẻ tấn công giả mạo một nguồn có thẩm quyền để phân giải tên, đầu độc dịch vụ LLMNR và lấy tên người dùng và hàm băm NTLMv2 của nạn nhân. Các công cụ như NBNSpoof, Metasploit và Responder có thể được sử dụng để thực hiện các cuộc tấn công này. Pupy, một công cụ quản trị từ xa đa nền tảng dựa trên Python mã nguồn mở, cũng phổ biến trong số những người kiểm tra thâm nhập và kẻ tấn công. 

## SMB Exploits
The topic discusses SMB's history of vulnerabilities and highlights the notorious EternalBlue exploit. Leaked by the Shadow Brokers, this exploit has been used in ransomware like WannaCry and Nyeta. Metasploit is one tool that has ported the EternalBlue exploit.

## DNS Cache Poisoning
Ngộ độc bộ nhớ cache DNS là một cuộc tấn công trong đó các tác nhân đe dọa thao túng bộ nhớ cache của trình phân giải DNS bằng cách tiêm dữ liệu bị hỏng. Điều này buộc máy chủ DNS gửi sai địa chỉ IP cho nạn nhân, chuyển hướng họ đến hệ thống của kẻ tấn công. Quá trình này bao gồm các bước sau:

* Kẻ tấn công làm hỏng bộ nhớ cache của máy chủ DNS để mạo danh một trang web.
* Sau cuộc tấn công, máy chủ DNS sẽ phân giải trang web đến địa chỉ IP của kẻ tấn công thay vì địa chỉ chính xác.
* Nạn nhân yêu cầu địa chỉ IP của miền từ máy chủ DNS.
* Máy chủ DNS trả lời bằng địa chỉ IP của kẻ tấn công.
* Nạn nhân gửi yêu cầu HTTP GET đến hệ thống của kẻ tấn công và kẻ tấn công mạo danh tên miền. 

Các cuộc tấn công đầu độc bộ nhớ cache DNS cũng có thể sử dụng các chiến thuật kỹ thuật xã hội để lừa nạn nhân tải xuống phần mềm độc hại hoặc nhập dữ liệu nhạy cảm vào các biểu mẫu và ứng dụng giả mạo. 

## SNMP Exploits
SNMP là một giao thức được sử dụng để quản lý các thiết bị mạng, với mỗi thiết bị chứa một tác nhân SNMP kết nối với máy chủ SNMP. Quản trị viên có thể sử dụng SNMP để lấy thông tin, thay đổi cấu hình và thực hiện các tác vụ khác. Có nhiều phiên bản, với SNMPv2c và SNMPv3 là phổ biến nhất. SNMPv2c sử dụng chuỗi cộng đồng làm mật khẩu, trong khi SNMPv3 an toàn hơn với tên người dùng và mật khẩu. Tuy nhiên, cả hai phiên bản đều dễ bị tấn công nếu thông tin đăng nhập yếu hoặc mặc định được sử dụng.

Máy quét Nmap, cùng với các tập lệnh NSE của nó, có thể được sử dụng để thu thập thông tin từ các thiết bị hỗ trợ SNMP và thông tin đăng nhập yếu brute-force. Ngoài ra, công cụ kiểm tra snmp có thể được sử dụng để thực hiện đi bộ SNMP để thu thập thông tin thiết bị. 

## SMTP Exploits
Các máy chủ SMTP không an toàn có thể bị khai thác để gửi thư rác và tiến hành lừa đảo và các cuộc tấn công dựa trên email khác. SMTP open relay là một cấu hình máy chủ email có thể bị lạm dụng cho các mục đích như vậy. Nmap cung cấp một tập lệnh NSE để kiểm tra các cấu hình chuyển tiếp mở. Các lệnh SMTP hữu ích, chẳng hạn như HELO, EHLO và VRFY, có thể được sử dụng để đánh giá bảo mật của máy chủ email. Công cụ smtp-user-enum trong Kali Linux tự động thu thập thông tin. Vô hiệu hóa các lệnh VRFY và EXPN trên các máy chủ email hiện đại và sử dụng tường lửa để chặn các kết nối SMTP bằng các lệnh này có thể cải thiện bảo mật. Khai thác máy chủ SMTP đã biết có thể được tìm thấy bằng cách sử dụng lệnh searchsploit . 

## FTP Exploits
Các máy chủ FTP thường bị kẻ tấn công lạm dụng để đánh cắp thông tin, vì giao thức FTP cũ thiếu mã hóa và xác thực tính toàn vẹn. Để tăng cường bảo mật, bạn nên sử dụng FTPS hoặc SFTP. Các giao thức này sử dụng mã hóa, nhưng một số triển khai có mật mã mã hóa yếu như Blowfish và DES. Bạn nên sử dụng các thuật toán mạnh hơn như AES. Máy chủ SFTP và FTPS cũng sử dụng thuật toán băm để xác minh tính toàn vẹn của việc truyền tệp. Các phương pháp hay nhất bao gồm vô hiệu hóa các giao thức băm yếu như MD5 hoặc SHA-1 và sử dụng các thuật toán mạnh hơn trong dòng SHA-2.

Máy chủ FTP có thể cho phép xác thực người dùng ẩn danh, có thể bị kẻ tấn công khai thác. Để giảm thiểu điều này, hãy tắt đăng nhập ẩn danh trong tệp cấu hình máy chủ. Các phương pháp hay nhất bổ sung bao gồm sử dụng mật khẩu mạnh và xác thực đa yếu tố, triển khai bảo mật tệp và thư mục, mã hóa tệp được lưu trữ trên máy chủ, khóa tài khoản quản trị, cập nhật phần mềm máy chủ, sử dụng mật mã mã hóa được xác thực FIPS 140-2, lưu trữ cơ sở dữ liệu phụ trợ trên các máy chủ riêng biệt và yêu cầu xác thực lại cho các phiên không hoạt động. 

## Pass-the-Hash Attacks
Các cuộc tấn công vượt qua hàm băm khai thác việc lưu trữ các hàm băm mật khẩu trong tệp Trình quản lý tài khoản bảo mật (SAM) của Windows. Những kẻ tấn công sử dụng băm mật khẩu thu thập được từ các hệ thống bị xâm nhập để đăng nhập vào các hệ thống khác mà không biết mật khẩu thực. Điều này bỏ qua quá trình nhập mật khẩu và chuyển đổi thông thường. 

## Kerberos and LDAP-Based Attacks
Kerberos là một giao thức xác thực được sử dụng bởi Windows và nhiều ứng dụng và hệ điều hành. Active Directory sử dụng LDAP làm giao thức truy cập, hỗ trợ xác thực Kerberos. Các cuộc tấn công phổ biến bao gồm các cuộc tấn công vé vàng và vé bạc của Kerberos, nơi kẻ tấn công thao túng vé Kerberos dựa trên các hàm băm có sẵn. Ủy quyền Kerberos không bị hạn chế là một điểm yếu khác, cho phép các ứng dụng sử dụng lại thông tin đăng nhập của người dùng cuối để truy cập tài nguyên được lưu trữ trên các máy chủ khác nhau. 

## Kerberoasting
Kerberoasting là một cuộc tấn công trích xuất băm thông tin xác thực tài khoản dịch vụ từ Active Directory để bẻ khóa ngoại tuyến. Nó khai thác các triển khai mã hóa yếu và thực hành mật khẩu không phù hợp. 

## On-Path Attacks
Các cuộc tấn công trên đường liên quan đến việc kẻ tấn công chặn giao tiếp giữa hai thiết bị hoặc cá nhân để đánh cắp hoặc thao túng dữ liệu. Những điều này có thể xảy ra ở Lớp 2 hoặc Lớp 3. Giả mạo ARP, giả mạo MAC và thao túng Spanning Tree Protocol (STP) là những ví dụ về các cuộc tấn công trên đường dẫn. Để bảo mật cơ sở hạ tầng, hãy làm theo các phương pháp hay nhất về bảo mật Lớp 2 như chọn VLAN không sử dụng, định cấu hình cổng chuyển mạch làm cổng truy cập, giới hạn số lượng địa chỉ MAC đã học trên một cổng, điều khiển Spanning Tree, tắt Cisco Discovery Protocol (CDP) trên các cổng không đáng tin cậy, tắt tất cả các cổng trên công tắc mới, sử dụng Root Guard, triển khai 802.1X khi có thể, và triển khai danh sách kiểm soát truy cập (ACL)
Trong các cuộc tấn công hạ cấp, kẻ tấn công buộc hệ thống sử dụng giao thức mã hóa hoặc thuật toán băm yếu hơn dễ bị lỗ hổng. Lỗ hổng Padding Oracle on Downgraded Legacy Encryption (POODLE) trong OpenSSL là một ví dụ về cuộc tấn công hạ cấp. Để ngăn chặn các cuộc tấn công như vậy, loại bỏ khả năng tương thích ngược thường là giải pháp duy nhất. 

## Route Manipulation Attacks
Một cuộc tấn công thao túng tuyến đường phổ biến là chiếm quyền điều khiển BGP. Trong cuộc tấn công này, tác nhân đe dọa cấu hình hoặc thỏa hiệp bộ định tuyến biên để thông báo các tiền tố trái phép. Điều này có thể chuyển hướng lưu lượng truy cập của nạn nhân đến kẻ tấn công nếu tuyến đường độc hại cụ thể hơn hoặc ngắn hơn tuyến đường hợp pháp. Những kẻ tấn công đôi khi sử dụng các tiền tố không sử dụng để tránh sự chú ý từ người dùng hoặc tổ chức hợp pháp. 

## DoS and DDoS Attacks
Các cuộc tấn công DoS và DDoS nhằm mục đích áp đảo mục tiêu với lưu lượng truy cập quá mức hoặc khai thác lỗ hổng cho các hệ thống sụp đổ. Có ba loại tấn công DoS: direct, reflected, and amplification.
*  Direct DoS Attacks: Kẻ tấn công gửi các gói tin trực tiếp đến nạn nhân, làm ngập băng thông kết nối của họ hoặc làm cạn kiệt tài nguyên hệ thống của họ. Các cuộc tấn công SYN flood là một ví dụ về các cuộc tấn công DoS trực tiếp.
* Reflected DoS and DDoS Attacks: Những kẻ tấn công gửi các gói giả mạo đến các nguồn dường như là từ nạn nhân, khiến các nguồn vô tình tham gia vào cuộc tấn công. UDP thường được sử dụng làm cơ chế vận chuyển trong các cuộc tấn công này do thiếu cái bắt tay ba chiều.
* Amplification DDoS Attacks: Một loại tấn công DoS được phản ánh trong đó lưu lượng phản hồi lớn hơn nhiều so với các gói ban đầu được gửi bởi kẻ tấn công. Một ví dụ là gửi các truy vấn DNS đến một trình phân giải mở, trả lời với các phản hồi lớn hơn, làm ngập máy của nạn nhân.

## Network Access Control (NAC) Bypass
NAC thẩm vấn các điểm cuối trước khi tham gia mạng có dây hoặc không dây, thực thi các chính sách như kiểm tra phần mềm bảo mật, phiên bản hệ điều hành và vá lỗi. Những kẻ tấn công có thể bỏ qua NAC bằng cách giả mạo các địa chỉ MAC được ủy quyền, cho phép chúng kết nối với mạng. 

## VLAN Hopping
VLAN nhảy là một phương pháp để có quyền truy cập vào lưu lượng truy cập trên các VLAN khác mà thông thường không thể truy cập được. Hai phương pháp chính của VLAN nhảy tồn tại: giả mạo chuyển đổi và gắn thẻ kép. Giả mạo switch liên quan đến việc bắt chước một công tắc trunking bằng cách gửi thẻ VLAN tương ứng và các giao thức trunking. Gắn thẻ kép thêm hai thẻ VLAN vào một khung, với hầu hết các công tắc chỉ loại bỏ thẻ bên ngoài, cho phép kẻ tấn công truy cập VLAN của nạn nhân. 

## DHCP Starvation Attacks and Rogue DHCP Servers
Các cuộc tấn công đói DHCP liên quan đến việc phát nhiều tin nhắn DHCP REQUEST giả mạo với địa chỉ MAC giả mạo, làm cạn kiệt các địa chỉ IP khả dụng trong phạm vi máy chủ DHCP. Không có địa chỉ IP khả dụng, kẻ tấn công có thể thiết lập máy chủ DHCP giả mạo và phản hồi các yêu cầu DHCP mới, chặn lưu lượng truy cập từ các máy chủ mạng.

