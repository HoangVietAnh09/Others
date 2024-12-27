# @Configuration và @Bean 
@Configuration là một Annotation đánh dấu trên một Class cho phép Spring Boot biết được đây là nơi định nghĩa ra các Bean.

@Bean là một Annotation được đánh dấu trên các method cho phép Spring Boot biết được đây là Bean và sẽ thực hiện đưa Bean này vào Context.

@Bean sẽ nằm trong các class có đánh dấu @Configuration.

## In Background
Đằng sau chương trình, Spring Boot lần đầu khởi chạy, ngoài việc đi tìm các @Component thì nó còn làm một nhiệm vụ nữa là tìm các class @Configuration.


* Đi tìm class có đánh dấu @Configuration
* Tạo ra đối tượng từ class có đánh dấu @Configuration
* tìm các method có đánh dấu @Bean trong đối tượng vừa tạo
* Thực hiện gọi các method có đánh dấu @Bean để lấy ra các Bean và đưa vào `Context.

Ngoài ra, về bản chất, @Configuration cũng là @Component. Nó chỉ khác ở ý nghĩa sử dụng. (Giống với việc class được đánh dấu @Service chỉ nên phục vụ logic vậy).

Tuy nhiên trong thực tế, nếu một Bean có quá nhiều logic để khởi tạo và cấu hình, thì chúng ta sẽ sử dụng @Configuration và @Bean để tự tay tạo ra Bean. Việc tự tay tạo ra Bean như này có thể hiểu phần nào là chúng ta đang config cho chương trình.


## @Bean có tham số
Nếu method được đánh dấu bởi @Bean có tham số truyền vào, thì Spring Boot sẽ tự inject các Bean đã có trong Context vào làm tham số.
