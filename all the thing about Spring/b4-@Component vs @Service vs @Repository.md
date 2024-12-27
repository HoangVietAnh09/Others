# @Component vs @Service vs @Repository
## Kiến trúc trong Spring Boot
Kiến trúc MVC trong Spring Boot được xây dựng dựa trên tư tưởng "độc lập" kết hợp với các nguyên lý thiết kế hướng đối tượng (một đại diện tiêu biểu là Dependency Inversion). Độc lập ở đây ám chỉ việc các layer phục vụ các mục đích nhất định, khi muốn thực hiện một công việc ngoài phạm vi thì sẽ đưa công việc xuống các layer thấp hơn.

![image](https://github.com/user-attachments/assets/70080c3a-936e-4726-b193-96997b62b832)

Consumer Layer hay Controller: là tầng giao tiếp với bên ngoài và handler các request từ bên ngoài tới hệ thống.

Service Layer: Thực hiện các nghiệp vụ và xử lý logic

Repository Layer:: Chịu trách nhiệm giao tiếp với các DB, thiết bị lưu trữ, xử lý query và trả về các kiểu dữ liệu mà tầng Service yêu cầu.

## @Controller vs @Service vs @Repository
Để phục vụ cho kiến trúc ở trên, Spring Boot tạo ra 3 Annotation là @Controller vs @Service vs @Repository để chúng ta có thể đánh dấu các tầng với nhau.

