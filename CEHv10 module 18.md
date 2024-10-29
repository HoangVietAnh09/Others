## Khái niệm
Như chúng ta đã biết sự khác biệt về hiệu suất và năng suất giữa quy trình thủ công và quy trình tự động, việc tiến tới kết nối mọi thứ với nhau sẽ tiến bộ và làm cho quy trình thậm chí còn nhanh hơn. Thuật ngữ “Things” dùng để chỉ máy móc, thiết bị, xe cộ, cảm biến và nhiều thiết bị khác.

Một ví dụ về quá trình tự động hóa này thông qua Internet of Things là kết nối một camera CCTV được đặt trong một tòa nhà sẽ ghi lại sự xâm nhập và ngay lập tức tạo ra cảnh báo trên các thiết bị của khách hàng ở vị trí từ xa. Tương tự, chúng ta có thể kết nối qua internet để giao tiếp với các thiết bị khác.

Công nghệ IoT yêu cầu xác thực duy nhất đặc biệt là IPv6 để cung cấp cho mỗi thiết bị một định danh duy nhất. Việc lập kế hoạch và triển khai IPv4 và IPv6 trên một cấu trúc mạng tiên tiến đòi hỏi phải xem xét kỹ lưỡng các chiến lược và kỹ thuật tiên tiến.

## Internet of Things hoạt động như thế nào?
Các thiết bị IoT có thể sử dụng các cổng IoT để giao tiếp với internet hoặc chúng có thể trực tiếp giao tiếp với internet. Tích hợp thiết bị điều khiển, bộ điều khiển logic và các mạch điện tử có thể lập trình tiên tiến giúp chúng có khả năng giao tiếp và điều khiển từ xa.

![image](https://github.com/user-attachments/assets/8cca5a32-8e3b-486b-b958-8182bc1b49f5)

Kiến trúc IoT phụ thuộc vào 5 lớp sau:

![image](https://github.com/user-attachments/assets/8409518d-0083-4f23-8c32-9ee9c9b4efb4)

* Lớp Ứng dụng chịu trách nhiệm cung cấp dữ liệu cho người dùng ở ứng dụng. Đây là giao diện người dùng để điều khiển, quản lý và chỉ huy các thiết bị IoT.
* Lớp Trung gian để quản lý thiết bị và thông tin.
* Lớp mạng chịu trách nhiệm kết nối các điểm cuối.
* Lớp cổng truy cập chịu trách nhiệm dịch giao thức và nhắn tin.
* Lớp Công nghệ Edge bao gồm các thiết bị có khả năng IoT.

## Mô hình giao tiếp IoT
### Device-to-Device Model
Mô hình thiết bị với thiết bị là một mô hình giao tiếp IoT cơ bản trong đó hai thiết bị đang giao tiếp với nhau mà không can thiệp vào bất kỳ thiết bị nào khác. Giao tiếp này được thiết lập bằng phương tiện như mạng không dây. Ví dụ là người dùng Điện thoại di động và máy in Wi-Fi. Người dùng có thể kết nối bằng Wi-Fi và gửi lệnh để in.

![image](https://github.com/user-attachments/assets/e6f3c5cd-06f4-40aa-a141-da96693e093e)
### Device-to-Cloud Model
Mô hình thiết bị với đám mây là một mô hình giao tiếp IoT khác trong đó các thiết bị IoT giao tiếp trực tiếp với máy chủ ứng dụng.

![image](https://github.com/user-attachments/assets/10f92ded-1ab3-41d3-9e15-0ce3fbc60f6a)
### Device-to-Gateway Model
Mô hình thiết bị với cổng tương tự như mô hình Device to cloud. Thiết bị IoT được thêm vào để thu thập dữ liệu từ các cảm biến và gửi đến máy chủ ứng dụng từ xa. Ngoài ra, bạn sẽ có một điểm hợp nhất, nơi bạn có thể kiểm tra và kiểm soát dữ liệu được truyền đi.

![image](https://github.com/user-attachments/assets/0ab28fcd-6e1c-4d84-b949-a8a1d46a582e)
### Back-End Data-Sharing Model
Mô hình Chia sẻ Dữ liệu Back-End là một mô hình nâng cao trong đó các thiết bị đang giao tiếp với các máy chủ ứng dụng. Điều này được sử dụng trong quan hệ đối tác tập thể giữa các nhà cung cấp ứng dụng khác nhau.

![image](https://github.com/user-attachments/assets/bfe1b2ea-4b80-4099-bf5c-de035033e8b9)
## Hiểu các cuộc tấn công IoT
### Những thách thức đối với IoT
Có rất nhiều thách thức đối với việc triển khai Internet of Things (IoT). Vì nó mang lại sự dễ dàng, di động và kiểm soát nhiều hơn các quy trình. Có các mối đe dọa, lỗ hổng bảo mật và thách thức đối với công nghệ IoT. Một số thách thức lớn đối với công nghệ IoT như sau:

* Thiếu an ninh
* Thiết bị dễ bị tổn thương
* Rủi ro An ninh Vật lý
* Thiếu sự hỗ trợ của nhà cung cấp
* Khó cập nhật chương trình cơ sở và hệ điều hành
* Vấn đề về khả năng tương tác
### Các cuộc tấn công IoT
#### DDoS Attack
Tấn công từ chối dịch vụ phân tán như đã định nghĩa trước đó nhằm mục đích làm cho các dịch vụ của mục tiêu không khả dụng. Sử dụng tấn công DDoS, tất cả các thiết bị IoT, cổng IoT và máy chủ ứng dụng có thể bị nhắm đến và gửi yêu cầu tràn ngập dẫn đến từ chối dịch vụ.
#### Rolling Code Attack
Rolling code hoặc Code hopping là một kỹ thuật khác để khai thác. Trong kỹ thuật này, kẻ tấn công nắm bắt mã, chuỗi hoặc tín hiệu từ các thiết bị phát và đồng thời chặn thiết bị thu nhận tín hiệu. Mã đã được chụp này sau đó sẽ được sử dụng để truy cập trái phép.
#### BlueBorne Attack
Cuộc tấn công blueborne được thực hiện bằng các kỹ thuật khác nhau để khai thác các lỗ hổng Bluetooth. Tập hợp các kỹ thuật để truy cập trái phép vào các thiết bị hỗ trợ Bluetooth được gọi là tấn công Blueborne.
#### Jamming Attack
Kẹt tín hiệu để ngăn các thiết bị giao tiếp với nhau và với máy chủ.
#### Backdoor
Triển khai cửa sau trên máy tính của nhân viên trong tổ chức hoặc nạn nhân để truy cập trái phép vào mạng riêng. Nó không phải là tất cả về việc tạo một backdoor trên các thiết bị IoT.
### Phương pháp tấn công IoT
#### Information Gathering
Bước đầu tiên để hack IoT là yêu cầu thu thập thông tin. Thu thập thông tin bao gồm trích xuất thông tin như địa chỉ IP, giao thức đang chạy, cổng mở, loại thiết bị, thông tin của nhà cung cấp, v.v. Shodan, Censys và Thingful là công cụ tìm kiếm để tìm hiểu thông tin về thiết bị IoT.
#### Vulnerability Scanning
Quét lỗ hổng bảo mật bao gồm quét mạng và các thiết bị để xác định các lỗ hổng như mật khẩu yếu, lỗi phần mềm và phần sụn, cấu hình mặc định, v.v. Multi-ping, Nmap, RIoT Vulnerability scanner, Foren6 được sử dụng để quét các lỗ hổng.
#### Launch Attack
Khởi động giai đoạn tấn công bao gồm việc khai thác các lỗ hổng này bằng cách sử dụng các cuộc tấn công khác nhau như DDoS, Rolling Code, jamming,… RFCrack, Attify Zigbee Framework, HackRF One là những công cụ phổ biến để tấn công.
#### Gain Access
Đạt được quyền truy cập bao gồm việc kiểm soát môi trường IoT. Giành quyền truy cập, nâng cấp đặc quyền cho quản trị viên, cài đặt cửa sau cũng được bao gồm trong giai đoạn này.
#### Maintain Attack









