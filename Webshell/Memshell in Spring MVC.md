# Memshell in Spring MVC
## Mô hình MVC 
Mô hình MVC là mô hình sử dụng Model - View - Controller.pring MVC sử dụng các controller là nơi xử lý, và không thể truy cập trực tiếp từ Website. Ta sẽ phải thông qua chức năng routing để điều phối đến controller. Đây là mô hình hoạt động của Spring.

![2645322a-55c0-4191-be95-84ee84bee044](https://github.com/user-attachments/assets/8b7603ab-2431-4250-bf95-a1f59dbc8382)

* Filter: chặn các request trước khi chúng đến được DispatcherServlet, khiến chúng phù hợp để triển khai các chức năng
* DispatcherServlet: được sử dụng để xử lý các HTTP request, DispatcherServlet gửi các request tới các controller và quyết định hồi đáp bằng cách gửi lại view.
* HandlerIntercepors: chặn các yêu cầu giữa DispatcherServlet và các Controller. Cung cấp quyền truy cập vào các object Handler và ModelAndView.


## Tiến hành inject memory shell
Quá trình bao gồm 3 bước:
* Lấy context của ứng dụng đang chạy
* Thêm các thuôc tính cho controller mới
* Đăng kí một controller mới

### Lấy context của ứng dụng đang chạy
#### WebApplicationContext là gì?
WebApplicationContext là một container trong Spring cung cấp các bean và dịch vụ cụ thể cho ứng dụng web. Nó hoạt động như một context gốc hoặc context con của ApplicationContext, được tích hợp với ServletContext.

Các đặc điểm chính của WebApplicationContext:
* Có thể truy cập ServletContext để lấy thông tin cấu hình của ứng dụng web.
* Thường được sử dụng với Spring MVC để quản lý các controller và service.
* Có thể có nhiều context con trong cùng một ứng dụng web (ví dụ: một context gốc và một context con cho mỗi DispatcherServlet).
* 
