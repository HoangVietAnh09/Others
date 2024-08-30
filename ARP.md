## ARP là gì?
ARP là viết tắt của Address Resolution Protocol, là một giao thức mạng được dùng để tìm ra địa chỉ phần cứng (địa chỉ MAC) của thiết bị từ một địa chỉ IP nguồn. Nó được sử dụng khi một thiết bị giao tiếp với các thiết bị khác dựa trên nền tảng local network.

Mục đích của ARP là giúp các thiết bị trong cùng mạng nội bộ có thể nhận biết và trao đổi dữ liệu với nhau một cách hiệu quả. Cách thức hoạt động của ARP là dựa trên quá trình request và response giữa các thiết bị.
## Có bao nhiêu loại ARP?
ARP cơ bản (Basic ARP): Loại ARP  basic được sử dụng phổ biến nhất, dùng để phân giải địa chỉ IP sang địa chỉ MAC trong cùng một mạng nội bộ. Quá trình hoạt động của ARP cơ bản gồm hai bước: gửi yêu cầu ARP (ARP request) và nhận phản hồi ARP (ARP reply)

Proxy ARP: Nhằm hỗ trợ các thiết bị trong mạng con khác nhau giao tiếp với nhau thông qua một router. Router sẽ đóng vai trò là proxy, tức là đại diện cho các thiết bị khác trong việc trả lời yêu cầu ARP.

Gratuitous ARP: Là loại ARP dùng để thông báo cho các thiết bị trong mạng biết về sự thay đổi địa chỉ IP hoặc MAC của một thiết bị nào đó. Thiết bị sẽ gửi một yêu cầu ARP cho chính nó, và nếu có thiết bị nào có cùng địa chỉ IP hoặc MAC, nó sẽ phản hồi lại.

Reverse ARP:  Dùng để tìm ra địa chỉ IP của thiết bị từ địa chỉ MAC. Nó được sử dụng khi một thiết bị chưa được cấp địa chỉ IP từ DHCP hoặc BOOTP, và muốn biết địa chỉ IP của chính nó.

Inverse ARP: Với Inverse người dùng sẽ tìm ra địa chỉ IP của thiết bị từ địa chỉ MAC trong các mạng không dây hoặc Frame Relay. Nó được sử dụng khi một thiết bị muốn biết địa chỉ IP của các thiết bị khác mà nó đã kết nối.

## Thành phần của ARP là gì?
Địa chỉ IP: Là địa chỉ mạng lớp 3, được sử dụng để xác định thiết bị trong một mạng IP.

Địa chỉ MAC: Địa chỉ phần cứng lớp 2, được gán cho mỗi card mạng của thiết bị.

Bản tin ARP request: Đây là bản tin được gửi từ thiết bị nguồn đến thiết bị đích để yêu cầu địa chỉ MAC của thiết bị đích. Bản tin ARP request được gửi dưới dạng broadcast, tức là gửi tới tất cả các thiết bị trong mạng

Bảng ARP cache: Đây là bộ nhớ tạm thời lưu trữ các cặp địa chỉ IP và MAC của các thiết bị đã được phân giải qua ARP. Bảng ARP cache giúp giảm thiểu số lượng yêu cầu ARP và tăng hiệu suất truyền thông trong mạng.
## Vai trò của ARP là gì?
* ARP cho phép một mạng quản lý các kết nối độc lập với thiết bị vật lý cụ thể được gắn vào từng mạng.

khi một thiết bị muốn gửi dữ liệu tới một thiết bị khác trong mạng, nó không cần quan tâm đến loại card mạng, cáp mạng hay switch mà các thiết bị sử dụng. Nó chỉ cần biết địa chỉ IP của thiết bị đích, và sử dụng ARP để tìm ra địa chỉ MAC tương ứng. Địa chỉ MAC là duy nhất cho mỗi card mạng, và được sử dụng để xác định thiết bị trong lớp liên kết dữ liệu

* Hai là, ARP giúp các thiết bị trong mạng có thể giao tiếp với nhau dựa trên địa chỉ IP, bằng cách dịch địa chỉ IP sang địa chỉ MAC, và ngược lại.

Đây là một yếu tố rất quan trọng, vì khi một thiết bị gửi dữ liệu qua switch hay router, nó phải sử dụng địa chỉ MAC để xác định thiết bị tiếp theo trong đường truyền. Nếu không có ARP, thiết bị nguồn sẽ không biết địa chỉ MAC của thiết bị đích hoặc router để gửi dữ liệu.

Giúp cho việc cập nhật thông tin trong bảng ARP cache được chính xác và kịp thời. Bảng ARP cache là bộ nhớ tạm thời lưu trữ các cặp địa chỉ IP và MAC của các thiết bị đã được phân giải qua ARP. 

```Source: https://tenten.vn/tin-tuc/arp-la-gi/```

## ARP Spoofing là gì? Cách phát hiện và ngăn chặn hiệu quả
giao thức ARP không có tính bảo mật nên không có khả năng xác minh một phản hồi là chính xác hay giả mạo. Điều này tạo điều kiện cho kẻ tấn công dễ dàng thực hiện ARP Spoofing trên các thiết bị của người dùng.

```ARP Spoofing (ARP Poisoning) là một cuộc tấn công MitM nhắm vào các giao tiếp giữa các thiết bị mạng dựa vào kết nối Internet với bộ định tuyến hoặc cổng.```

Đầu tiên kẻ tấn công sẽ thu thập quyền truy cập để quét mạng nhằm tìm kiếm địa chỉ của các thiết bị, chẳng hạn như máy trạm và bộ định tuyến. Sau đó sử dụng công cụ spoofing như Arpspoof hoặc Driftnet để gửi phản hồi ARP spoofing.

ARP spoofing đánh lừa địa chỉ MAC giả mạo là chính xác cho cả hai địa chỉ IP của bộ định tuyến và máy trạm nhằm mục đích kết nối trực tiếp với thiết bị của kẻ tấn công. Đồng thời hai biết bị cập nhật bộ nhớ đệm ARP cũng sẽ trực tiếp kết nối với kẻ tấn công.

Nếu cuộc tấn công ARP spoofing thành công, kẻ tấn công sẽ thực hiện:

* Tiếp tục thực hiện các thao tác liên lạc hiện tại của bộ định tuyến để đánh cắp dữ liệu từ các gói tin mạng không được mã hóa HTTPS.
* Đánh cắp ID để lấy quyền điều khiển phiên nhằm truy cập vào tài khoản hiện tại của người dùng.
* Thực hiện thay đổi như chuyển tệp hoặc trang web độc hại đến máy trạm.
* Kẻ tấn công sử dụng công cụ DDoS cung cấp địa chỉ MAC của máy chủ để tấn công IP và máy chủ mục tiêu thông qua lưu lượng truy cập.

## Cách phát hiện ARP Cache Poisoning
Sử dụng dòng lệnh là một trong những phương pháp giúp phát hiện ARP Cache Poisoning trên thiết bị khá hiệu quả. Bằng cách khởi động hệ điều hành với tư cách quản trị viên và sử dụng lệnh arp -a. Sau đó bảng ARP sẽ được hiển thị trên màn hình của Windows và Linux.

Đầu ra sẽ là: ```{{EJS0}}```

Trong bảng trên, nếu có hai địa chỉ IP khác nhau nhưng cùng một địa chỉ MAC tức là thiết bị đang bị ARP tấn công
## Một số mẹo giúp ngăn chặn ARP Spoofing trên mạng như sau:

* Sử dụng VPN kết nối các thiết bị với Internet bằng một tunnel được mã hoá giúp bảo vệ các thông tin liên lạc quan trọng khỏi ARP Spoofing.
* Sử dụng ARP tĩnh giúp xác định mục nhập ARP tĩnh cho địa chỉ IP và ngăn chặn thiết bị nghe phản hồi ARP cho địa chỉ đó.
* Sử dụng công cụ packet filtering để lọc các gói ARP Spoofing nếu phát hiện chúng chứa các thông tin nguy hiểm và tự động ngăn chặn khỏi các thiết bị mạng.
* Thực hiện ARP Spoofing kết hợp với các nhóm CNTT để kiểm tra trạng thái hoạt động của hệ thống bảo mật. Nếu phát hiện ra vấn đề hãy tìm ra nguyên nhân của các biện pháp và khắc phục lại chúng.
```Source: https://bkhost.vn/blog/arp-spoofing-poisoning/```

## SSL
SSL là viết tắt của từ Secure Sockets Layer. SSL là tiêu chuẩn của công nghệ bảo mật, truyền thông mã hoá giữa máy chủ Web server và trình duyệt. 

Hand shake protocol is used to establish the secure connection between the client and the server using the cipher suites and other parameters that both have agreed upon. Record Protocol is used to encrypt the data that is to be sent through the network using the key that have been established during the handshake protoco
Alert protocol is used to send the custom messages to other whenever they detect any intrusion in the system

**Step 1:** Client Sends a ClientHello message to the server he
wishes to contact. This message contains the Version No of the
SSL which client can support with a 32-byte random no. this
message also contains the Cipher Suites and the Compression
Method that the client can support.

**Step 2:** Now the Server sends a ServerHello message to the
client. This message is the complement to the Client Hello
message. This message contains the version of SSL both the
party will support, 32-byte random no., Session ID and the
cipher suite and the compression method that it will support

**Step 3:** Server then sends the ServerKeyExchange message to
the client. This message contains the public key information
itself, for e.g.: the Public Key in case of RSA. Then to
authenticate the client, server requests for the client’s
certificate information, if it has one

**Step 4:** After all the information have been passed to the client,
server sends a ServerHelloDone indicating the client that
server’s phase of initial negotiation have been done and now its
clients turn.

**Step 5:** Now the client will send its key information to the
server with ClientKeyExchange message encrypted with the
server public key so that the legitimate server only can access
client’s information.

![image](https://github.com/user-attachments/assets/ec21c63b-dd21-4fd0-8b24-f2ee22eb04fd)

**Step 6:** Now as both the client and the server have sent their
key information and other parameters, Client sends a
ChangeCipherSpec message to the server to notify all the
parameters of the secured connection and activate the same.

**Step 7:** Then the client sends the Finished message to the
server to let it check the newly activated options.

**Step 8:** The server sends the same ChangeCipherSpec to the
client to notify all the options in the secured connections and
then send the Finished message to client to verify all the
options.



