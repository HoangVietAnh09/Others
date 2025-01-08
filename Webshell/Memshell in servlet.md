# Memory Webshell trong Tomcat Servlet

![image](https://github.com/user-attachments/assets/94fb3827-f2bc-4070-8ab2-adb6fc9ba0d5)

## Inject Memory Webshell thông quan Fiter

## Inject Memory Webshell thông qua Listener

**Listener:** Theo dõi các sự kiện khởi tạo hay hủy bỏ của những đối tượng như application, session hay request để thực thi các đoạn mã tương ứng với các sự kiện.

Một số hàm để gọi listener trong servlet:

* **ServletContextListener:** Dùng để theo dõi các sự kiện liên quan đến ServletContext (ứng dụng web).

  ![image](https://github.com/user-attachments/assets/c33704d9-f604-4407-bea5-8d8fc1e91442)

* **HttpSessionListener:** Dùng để theo dõi các sự kiện liên quan đến HttpSession.

  ![image](https://github.com/user-attachments/assets/abc432d1-7ca3-4d4e-9664-d86b7473f4ca)

* **ServletRequestListener:** Dùng để theo dõi các sự kiện liên quan đến ServletRequest.

  ![image](https://github.com/user-attachments/assets/53b9d0ee-6768-4f3c-968f-a749c4dfd2c7)

* **Attribute Listener:** Dùng để theo dõi các thay đổi của các thuộc tính trong ServletContext, HttpSession, hoặc ServletRequest.
  * **ServletContextAttributeListener:**
    
    ![image](https://github.com/user-attachments/assets/71830c12-cdaa-4849-bf4a-1e3771fbeeb0)
    
  * **HttpSessionAttributeListener:**
    
    ![image](https://github.com/user-attachments/assets/f9bc682f-89a8-4b54-84fe-bb73e804d7aa)

* **AsyncListener:** Dùng để theo dõi các sự kiện liên quan đến xử lý asynchronous (xử lý bất đồng bộ) trong Servlet.

  ![image](https://github.com/user-attachments/assets/1bf10076-1bf8-4997-8a55-52616e787ff0)


Quan sát các class có thể gọi listener ta thấy rằng hầu hết các class đều có tồn tại method với chức năng là khởi tạo hoặc là kết thúc.

Lợi dụng điều này ta sẽ chèn shell vào quá trình khởi tạo của một class nào đó có thực hiện qua lớp listener.

Ở đây mình sẽ chọn class ServletRequestListener. Tức là khi thực hiện 1 request mới sẽ gọi đến method requestInitialized()

![image](https://github.com/user-attachments/assets/cd72dac3-18f4-4ad9-8f43-0c11898976ea)

Method requestInitialized() nhận vào tham số dạng ServletRequestEvent.

Đoạn code trên sẽ nhận vào 1 tham số với tên là "cmd". Nếu như giá trị của tham số khác giỗng thì sẽ thực thi giá trị truyền vào.

### Trước hết hãy cùng tìm hiểu về Reflection API
Reflection API là một phần quan trọng của Java, giúp bạn thao tác với các lớp, phương thức, và thuộc tính ngay cả khi bạn không biết về chúng tại thời điểm biên dịch.

Reflection cho phép bạn khám phá và sử dụng các thành phần của một chương trình trong quá trình chạy (runtime).

Công dụng chính của Reflection API:

* Khám phá thông tin của các lớp: Bạn có thể lấy thông tin về tên lớp, các phương thức, các trường (fields) và các hàm tạo (constructors) của một lớp.
* Tạo đối tượng: Reflection cho phép bạn tạo ra các đối tượng của một lớp mà không cần biết trước tên của lớp đó.
* Gọi phương thức: Bạn có thể gọi các phương thức của một đối tượng, ngay cả khi bạn không biết tên phương thức đó tại thời điểm biên dịch.
* Thay đổi giá trị của các trường: Bạn có thể truy cập và thay đổi giá trị của các trường của một đối tượng.

![image](https://github.com/user-attachments/assets/09f7c3bc-6e34-4925-bb52-1582d833b2a9)
Một ví dụ về reflect lấy ra tất cả các method.





 







## Inject Memory Webshell thông qua Servlet
