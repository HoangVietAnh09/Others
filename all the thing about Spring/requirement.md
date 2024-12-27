**tight-coupling** ám chỉ việc mối quan hệ giữa các Class quá chặt chẽ

**loosely-coupled**  giảm bớt sự phụ thuộc giữa các Class với nhau.

## Dependency Injection (DI)

là một phương pháp lập trình

Các cách để Inject dependency vào một đối tượng có thể kể đến như sau:

* **Constructor Injection**: tiêm dependency ngay vào Contructor cho tiện.
* **Setter Injection**: tiếm dependency vào hàm setter
* **Interface Injection**: Mỗi Class muốn inject cái gì, thì phải implement một Interface có chứa một hàm inject(xx) (Gần như thay thế cho setter ý bạn). Rồi bạn muốn inject gì đó thì gọi cái hàm inject(xx) ra.

 ## Inversion of Control

 khi code bạn sẽ phải kiêm thêm nhiệm vụ Inject dependency (tiêm sự phụ thuộc). Thử tưởng tượng một Class có hàng chục dependency thì bạn sẽ phải tự tay inject từng ý cái. Việc này lại dẫn tới khó khăn trong việc code, quản lý code và dependency

 
