# Tạo Web Helloworld với @Controller + Thymeleaf 

Để xây dựng một trang web với Spring Boot, bạn sẽ cần tuân theo quy trình như hình dưới đây:

![image](https://github.com/user-attachments/assets/3f8be649-d954-4fc7-a7f5-1402d1829098)

@Controller là nơi tiếp nhận các thông tin request từ phía người dùng. Nó có nhiệm vụ đón nhận các yêu cầu (kèm theo thông tin request) và chuyển các yêu cầu này xuống cho tầng @Serivce xử lý logic.

Model ở đây là một object được Spring Boot đính kém trong mỗi response.

Model chứa các thông tin mà bạn muốn trả về và Template Engine sẽ trích xuất thông tin này ra thành html và đưa cho người dùng.
