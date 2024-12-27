# Giải thích cách Thymeleaf vận hành + Expression + Demo Full 
## Thymeleaf

Thymeleaf là một Java Template Engine. Có nhiệm vụ xử lý và generate ra các file HTML, XML, v.v..

Các file HMTL do Thymeleaf tạo ra là nhờ kết hợp dữ liệu và template + quy tắc để sinh ra một file HTML chứa đầy đủ thông tin.

## Cú pháp
Cú pháp của Thymeleaf sẽ là một attributes (Thuộc tính) của thẻ HTML và bắt đầu bằng chữ th:

## Model & View Trong Spring Boot

Model là đối tượng lưu giữ thông tin và được sử dụng bởi Template Engine để generate ra webpage. Có thể hiểu nó là Context của Thymeleaf

Trong template thymeleaf, để lấy các thông tin trong Model. bạn sẽ sử dụng Thymeleaf Standard Expression.

## ${...} - Variables Expressions
## *{...} - Variables Expressions on selections
Điểm khác biệt là nó sẽ lấy ra giá trị của một biến cho trước bởi th:object
## #{...} - Message Expression
## @{...} - URL Expression
@{...} xử lý và trả ra giá trị URL theo context của máy chủ cho chúng ta.

