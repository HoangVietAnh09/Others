## Lỗ hổng deserialization trong ngôn ngữ PHP

1. Hàm serialize() và unserialize()

![image](https://github.com/user-attachments/assets/3c9364f4-1cbd-4598-b6e7-2c89a9365077)

Chuỗi sau khi đã được serialize:

**O:6:"Person":3:{s:4:"name";s:5:"Aland";s:11:"Personage";i:18;s:6:"*sex";s:4:"male";}***

+ O là Object
+ 6 độ dài tên đối tượng
+ Person chỉ tên đối tượng thực hiện serialize
+ 3 là số lượng thành phần trong đối tượng Persion
+ s chỉ biến dạng chuỗi
+ i chỉ chữ số

Các quy ước đối với phạm vi truy cập dữ liệu
+ public không thay đổi
+ private có thêm ký tự đặc biệt null với định dạng %00 + tên object + %00 + tên thuộc tính

## Khai thác lỗ hổng Deserialization trong PHP - Thay đổi serialized objects
## Magic methods trong PHP

*Magic PHP là 1 phương thức đặc biệt được kế thừa từ các hành động PHP nguyên mẫu khi những hành động chắc chắn được thực thi bởi object*

Bắt đầu bằng ký tự "_"

Các Magic method thường gặp

***
__construct()

__destruct()

__toString()

__sleep()

__wakeup()
***

### __construct()

được sử dụng để khởi tạo một đối tượng. Phương thức này được gọi tự động ngay khi một đối tượng được tạo ra bằng từ khóa ***new***

![image](https://github.com/user-attachments/assets/453106ec-2b24-480d-8caf-1737ec8d73a7)

### __destruct()

được sử dụng để xử lý tác vụ cuối cùng trước khi một đối tượng bị hủy hoặc giải phóng bộ nhớ.

![image](https://github.com/user-attachments/assets/8965b528-fcd8-4bac-a0dc-5503d0cf07e8)


### __toString()

khi một đối tượng được gọi hoặc sử dụng dưới vai trò là chuỗi thì phương thức __toString() được sử .

![image](https://github.com/user-attachments/assets/bc0793fa-7807-4760-ab77-55c65f94ae0e)

### __sleep()

Trong trường hợp muốn loại bỏ một số thuộc tính để giảm kích thước output thì sử dụng __sleep()

__sleep() được gọi trước khi thực hiện serialize

![image](https://github.com/user-attachments/assets/90c11afc-3843-42d8-a961-82c7c7401721)

### __wakeup()

Để đảm bảo tính toàn vẹn của dữ liệu trong quá trình deserialize có thể sử dụng phương thức __wakeup()

phương thức __wakeup() được sử dụng trước quá trình deserializze.

![image](https://github.com/user-attachments/assets/fc440758-1b72-48a6-a544-3961b292e232)





