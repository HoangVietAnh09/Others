# Core
# Bluetooth LE
# Wifi
# HID on 2.4 GHz
# CAN-bus 
#  IPv4 / IPv6  
## net.recon
**net.recon on**

Bắt đầu khám phá các thiết bị trong mạng

**net.recond off**

Dừng đầu khám phá các thiết bị trong mạng

**net.clear**

Xóa tất cả các endpoints thu thập được qua module khám phá

**net.show**

Hiển thị bộ nhớ đếm danh sách máy chủ

**net.show ADDRESS1, ADDRESS2**

Hiển thị thông tin về một danh sách địa chỉ cụ thể

**net.show.meta ADDRESS1, ADDRESS2**

Hiển thị metadata về một danh sách địa chỉ cụ thể

**Parameters**

|Tham số|Mặc định|Mô tả|
|--|--|--|
|net.show.meta|false||Nếu đúng thì sẽ hiển thị tất cả metadata thu thập được từ các endpoint|
|net.show.filter|||Định nghĩa biểu thức chính quy cho net.show|
|net.show.sort|ip asc||Xác định trường sắp xếp (ip, mac, seen, sent, rcvd) và hướng (tăng dần hoặc giảm dần) cho net.show.|
|net.show.limit|0||nếu lớn hơn 0 sẽ giới hạn cho net.show|

## net.probe
**net.probe on**

Bắt đầu thăm dò

**net.probe off**

Dừng thăm dò
|Tham số|Mặc định|Mô tả|
|--|--|--|
|net.probe.throttle|10|Nếu lớn hơn 0, các gói thăm dò sẽ bị giới hạn bởi giá trị này tính bằng mili giây|
||||
||||
||||


# Utils
