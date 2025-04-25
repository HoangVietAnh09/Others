* /proc/cpuinfo: Danh sách thông tin về CPU(s) trên hệ thống, bao gồm model, speed, số lượng cores,…
* /proc/meminfo: Danh sách chi tiết về memory sử dụng và số liệu thống kê bao gồm tổng số lượng memory, memory trống, và memory sử dụng bởi từng tiến trình
* /proc/filesystems: Chứa 1 danh sách tất cả các filesystem mà được hỗ trợ bởi kernel
* /proc/sys: Danh sách các tham số cấu hình và runtime cho kernel
* /proc/loadavg: Cho thấy trung bình tải của hệ thống trong khoảng thời gian khác nhau, ví dụ như 1, 5, và 15 phút
* ***/proc/self: 1 symlink đến chủ sở hữu của tiến trình***
* /proc/stat: Chứa 1 vài số liệu thống kê về hệ thống, như số lượng tiến trình đang chạy, số lượng interrupts, và số lượng thời gian bỏ ra trong mỗi CPU state
* /proc/uptime: Chứa con số thời gian mà hệ thống đã chạy
* /proc/PID: Chứa thông tin về 1 tiến trình cụ thể, trong đó PID là process ID


* /proc/self/cmdline: Lệnh được dùng để khởi động tiến trình.
* /proc/self/status: Thông tin trạng thái tiến trình (PID, UID, bộ nhớ, CPU...).
* /proc/self/environ: Biến môi trường của tiến trình.
* /proc/self/fd/: Thư mục chứa các file descriptor mà tiến trình đang mở.
* /proc/self/cwd: Đường dẫn đầy đủ tới thư mục làm việc hiện tại của tiến trình.


* /proc/1/task/10/root/flag.txt
* /proc/1/task/1/root/proc/19/root/flag.txt
