# Spring Bean Life Cycle + @PostConstruct và @PreDestroy 
## @PostConstruct
@PostConstruct được đánh dấu trên một method duy nhất bên trong Bean. IoC Container hoặc ApplicationContext sẽ gọi hàm này sau khi một Bean được tạo ra và quản lý.

## @PreDestroy
@PreDestroy được đánh dấu trên một method duy nhất bên trong Bean. IoC Container hoặc ApplicationContext sẽ gọi hàm này trước khi một Bean bị xóa hoặc không được quản lý nữa.

## Bean Life Cycle
Spring Boot từ thời điểm chạy lần đầu tới khi shutdown thì các Bean nó quản lý sẽ có một vòng đời được biểu diễn như ảnh dưới đây:

![image](https://github.com/user-attachments/assets/2e554251-4cf1-42a6-9f9f-d3fdbb9f86fe)

@PostConstruct và @PreDestroy là 2 Annotation cực kỳ ý nghĩa, nếu bạn nắm được vòng đời của một Bean, bạn có thể tận dụng nó để làm các nhiệm vụ riêng như setting, thêm giá trị mặc định trong thuộc tính sau khi tạo, xóa dữ liệu trước khi xóa, v.v.. Rất nhiều chức năng khác tùy theo nhu cầu.
