# Linux Căn Bản – Bài 6: Phân quyền trong hệ thống Linux
### Phân biệt 2 cách tạo variable
Cách 1: <tên-biến>=<giá-trị>
Cách 2: export <tên-biến>=<giá-trị>
Với cách 1: Variable bạn tạo ra chỉ có thể được sử dụng trong shell và không thể được sử dụng cho các tác vụ khác.
Với cách 2: Variable của bạn có thể được sử dụng cho bất kỳ tác vụ nào cần đến nó.
Khi tạo variable bằng cách 1, variable của bạn sẽ chỉ có thể được sử dụng trong shell,
do đó khi chạy shiba2, shiba2 sẽ cần variable test1234 để chạy tác vụ và xuất ra password của shiba3.
Nhưng do test1234 không thể được sử dụng cho các tác vụ ngoài shell, dẫn đến việc shiba2 báo lỗi như bạn đã thấy. 
Để khắc phục tình trạng trên, bạn cần sử dụng cách 2 để tạo variable
### Phân quyền trong hệ thống Linux và câu lệnh chmod
Trong Linux, có 4 quyền chính:
* – (deny): Không được cấp quyền
* r (read): Cho phép bạn truy cập và đọc file dữ liệu
* w (write): Cho phép bạn chỉnh sửa, thay đổi nội dung, tạo mới hoặc xóa bỏ nội dung đang tồn tại trong file dữ liệu, cũng như bạn sẽ có quyền đổi tên dữ liệu được chứa bên trong file hiện tại
* x (execute): Cho phép bạn thực thi, chạy file dữ liệu, nếu file đó là một file thực thi
Ngoài được thể hiện dưới dạng ký tự, các quyền này còn được thể hiện dưới dạng số thập phân.
* 0 = –
* 1 = x
* 2 = w
* 4 = r
  
Như bạn đã biết, trong hệ thống số nhị phân số 1 được biểu trưng cho có và 0 biểu trưng cho không. 
Như vậy, để thiết lập quyền x, bit nhị phân chỗ x phải được bật lên 1. 
Cứ quyền nào được thiết lập thì bit ở chỗ đó sẽ được bật lên 1, những bit không được thiết lập sẽ là 0. 
# Linux Căn Bản – Bài 7: User, Group, lệnh chmod, chown và phân quyền trong hệ thống Linux
Phân quyền người dùng được theo dõi thông qua UID (User ID), UID là một chuỗi giá trị được gán cho một user account khi user accout đó được tạo ra trên hệ thống Linux. 
Và giá trị UID này là độc nhất cho mỗi user account, nghĩa là sẽ không có chuyện 2 user account có cùng UID trên cùng một hệ thống Linux. 
UID này được gán với một login name, chính là tên account mà các bạn dùng để đăng nhập hệ thống Linux
### File etc/passwd
Hệ thống Linux sử dụng một file đặc biệt để gán login name và giá trị UID lại với nhau. File này có tên là passwd và có path là /etc/passwd.
```[1]root:[2]x:[3]0:[4]0:[5]root:[6]/root:[7]/bin/```
    * [1] root: Tên của account và đây là account có quyền quản trị cao nhất
    * [2] x: Password của account đã được ẩn đi
    * [3] 0: UID của account. UID của account root luôn luôn là 0.
    * [4] 0: GID (Group ID) của account
    * [5] root: Mô tả account người dùng
    * [6] /root: Path (địa chỉ/đường dẫn) của HOME directory của account
    * [7] /bin/bash: Shell mặc định của account. (Shell mặc định của account root là shell cho phép nắm toàn quyền kiểm soát hệ thống Linux, nên cốt lõi của hành động privilege escalation hay nâng cấp đặc quyền là để lấy cho được shell mặc định của root)
Các account bên dưới root ví dụ như daemon, bin, v.v được gọi là những system accounts được tạo ra tự động bởi hệ thống Linux. 
Những account này không được tạo ra dành cho người dùng bình thường mà được sử dụng cho các phần mềm hoặc tác vụ nền chạy ẩn trong hệ thống. 
Để truy cập vào tài nguyên của hệ thống, các phần mềm hoặc tác vụ sẽ sử dụng những account này để truy cập vào hệ thống. 
### File /etc/shadow 
File /etc/shadow chính là nơi chứa mật khẩu đã bị mã hóa của tất cả account trong hệ thống Linux.
```[1]admin:[2]$6$sTgBhfj0$pkzz/JpVTl8ZAmk./d4SDarRyWsGSZHguljywUHQMP4DWo8/TgNzL5rMpejqNWuyxtFlISxdyIqPmpsIsyi.i1:[3]16088:[4]0:[5]99999:[6]7:[7]:[8]:[9]```
Tương tự như trong /etc/passwd, mỗi dòng trong file /etc/shadow sẽ là một account đi kèm theo các thông tin được cách nhau bởi dấu “:”:
    * [1] admin: Tên đăng nhập, tương ứng tên trong file /etc/passwd
    * [2] $6$sTgBhfj0$ …: Mật khẩu đã được mã hóa
    * [3] 16088: Ngày cuối cùng mật khẩu được thay đổi, được tính theo ngày 1/1/1970 là ngày hệ thống Unix ra đời. *
    * [4]0: Số ngày tối thiểu phải chờ trước khi mật khẩu được thay đổi
    * [5]99999: Số ngày trước khi mật khẩu cần phải thay đổi
    * [6]7: Số ngày sau khi mật khẩu hết hạn và người dùng nhận được cảnh báo mật khẩu sắp hết hạn
    * [7]: Số ngày sau khi mật khẩu hết hạn và account bị blocked
    * [8]: Số ngày (được tính theo ngày 1/1/1970) account đã bị khóa
    * [9]: Sẽ được dùng trong tương lai 
### Group người dùng
Phân Quyền Group cho phép nhiều account người dùng khác nhau có thể có cùng phân quyền vào một dữ liệu ví dụ như files, directories, v.v nào đó.
Mỗi group sẽ có 1 GID (Group ID) tương tự như UID. GID là một giá trị duy nhất trong toàn hệ thống. Mỗi group cũng sẽ có một tên group được gán với GID. 
### File /etc/group 
Thông tin của group sẽ được lưu giữ trong file có tên là /etc/group.
Cũng tương tự như với file /etc/passwd và /etc/shadow, mỗi dòng là một group cùng các thông tin liên quan đến group đó được cách nhau bởi dấu “:”. Ví dụ:
```[1]shiba2:[2]x:[3]1002:[4]ABC, XYZ, shiba2```
    * [1] shiba2: Tên group
    * [2] x: Group password đã được ẩn đi
    * [3] 1002: GID (Group ID)
    * [4]: ABC, XYZ, shiba2: Tên của những user account là thành viên của group
#### Khi nhìn vào file /etc/group, bạn sẽ thấy nhiều group không có thành viên nào . Điều đó không có nghĩa là group đó không có thành viên. 
#### Khi một user account sử dụng một group như là group mặc định, tên của user account đó sẽ không xuất hiện trong danh sách thành viên của group
#### Để thêm bớt người dùng hoặc group, bạn tuyệt đối không được chỉnh sửa trực tiếp vào các file /etc/passwd, /etc/shadow hoặc /etc/group
#### Mỗi group sẽ có 1 group owner, tên group thường sẽ lấy theo tên của user account của group owner. Và phân quyền của group owner sẽ là phân quyền cho tất cả thành viên trong group. 
#### Group owner sẽ được quyết định bởi người tạo ra group hoặc được chỉ định bởi những người có quyền quản trị group. 
### Lí do có 3 cụm phân quyền
    * Cụm 1: rw-: Phân quyền dành người sở hữu file
    * Cụm 2: r– : Phân quyền dành cho những người cùng group với người sở hữu file
    * Cụm 3: r– : Phân quyền dành cho tất cả những người dùng khác trong hệ thống
Tóm lại dòng “-rw-r–r–” có nghĩa là, account root sẽ có quyền đọc và thay đổi, chỉnh sửa nội dung của file /etc/group. 
Những người dùng ở chung group với root account sẽ chỉ có quyền truy cập và đọc nội dung của file /etc/group. 
Tất cả người dùng khác trong hệ thống cũng sẽ chỉ có quyền truy cập và đọc nội dung mà thôi. 
Tiếp theo chúng ta hãy chú ý đến dòng “[1]root [2]root”.
    * [1]root: Tên của người sở hữu file /etc/group
    * [2]root: Tên group của người sở hữu file /etc/group 
VD: ```-rw-rw-r-- 1 shiba3 shiba3 11 Nov 19 05:57 sample.txt```
    * Chủ sở hữu của file sample.txt là account shiba3
    * Shiba3 có quyền đọc và chỉnh sửa nội dung file cũng như được phép đọc nội dung của file
    * Các thành viên thuộc group shiba3 cũng có quyền đọc và thay đổi nội dung file sample.txt
    * Những user account không phải là owner của sample.txt cũng như không thuộc group shiba3 chỉ có quyền đọc file nhưng không có quyền thay đổi nội dung file
### Thay đổi phân quyền bằng ký tự 
    * **u**: Phân quyền cho chủ sở hữu file
    * **g**: Phân quyền cho group của chủ sở hữu file
    * **o**: Phân quyền cho những người khác
Để cấp quyền bạn sẽ dùng dấu + và để rút quyền bạn sẽ dùng dấu – 
### Phân quyền bằng chữ số
Khi cấp quyền bằng chữ số, sẽ có 3 chữ số được sử dụng. Ví dụ: 777.
Trong đó:
    * Chữ số thứ nhất được dùng để phân quyền cho owner
    * Chữ số thứ 2 sẽ phân quyền cho group
    * Chữ số thứ 3 được dùng để phân quyền cho những người khác.
### SUID và SGID
```ls -lrt /usr/bin/python```
```-rwsrw-r-x   1 root     sys        31396 Jan 20  2014 /usr/bin/python```
Phân quyền “s” trong phần phân quyền của owner được gọi là SUID (Set User Id), nó cho phép khi file được thực thi bởi một user account nào đó, nó sẽ được thực thi dưới phân quyền của người chủ của file. 
Như ví dụ trong dòng lệnh bên trên, nếu bất kỳ ai chạy câu lệnh python, câu lệnh đó sẽ được chạy với phân quyền của root. Điều này có thể bị lạm dụng cho mục đích nâng cấp đặc quyền (Privilege Escalation).
Để set SUID các bạn sẽ thêm giá trị “4” vào đầu phần phân quyền trong câu lệnh chmod
#### Phân quyền “s” thế chỗ của “x” và mang ý nghĩa rằng owner có cả quyền execute. Tuy nhiên, nếu phân quyền không phải là “s” mà là “S”, thì nó sẽ có ý nghĩa rằng owner không có quyền execute. 
SGID là viết tắt của Set Group ID, nó có công dụng gần tương tự với SUID. 
Điểm khác biệt duy nhất đó là nếu một ứng dụng được cho phép tiếp cận bởi một group người dùng, và ứng dụng này được set SGID, 
thì khi ứng dụng này được chạy, nó sẽ chạy với phân quyền của group owner và cũng là phân quyền của toàn bộ thành viên trong group. 
Để set SGID chúng ta sẽ thêm giá trị “2” ở đầu câu lệnh chmod.
#### Khi SGID được set cho một directory, thì tất cả mọi file và directory được tạo ra bên trong directory đó đều thuộc quyền sở hữu của group sở hữu directory đó
### Đổi quyền sở hữu 
```chown <tên-chủ-mới>:<tên-group-mới> <tên-file>```
Tuy nhiên, chúng ta sẽ chỉ có thể chuyển quyền sở hữu của một file từ mình sang file khác khi và chỉ khi phân quyền của mình lớn hơn phân quyền của account được chuyển quyền sở hữu. 
Vì lẽ đó, chuyển quyền sở hữu khi bạn đang nắm account root là thích hợp nhất. 
# Linux Căn Bản – Bài 8: Cấu trúc của hệ thống file trong Linux và các lệnh cd, mkdir, cp, mv, và rm
## Cấu trúc của hệ thống file trong Linux (*cái này mình chỉ takenote nên mình không có up ảnh, mọi người có thể search gg vì cái này có rất nhiều*)
phần lớn các directories này (ngoại trừ /tmp), chỉ có root account mới có phân quyền thay đổi, chỉnh sửa, thêm bớt nội dung được chứa bên trong;
nhằm hạn chế tình trạng hệ thống bị lỗi do một người dùng không phải root nào đó vô tình thay đổi dữ liệu bên trong các directories này. 
*chúng ta sẽ không đi qua tất cả directory bên dưới mà sẽ chỉ tìm hiểu sơ lược một vài những directory quan trọng nhất thôi.*
### Directory /
Nằm ở đỉnh của sơ đồ là directory /, hay còn được biết đến với cái tên root directory. Tất cả các directories hệ thống của Linux đều là con của directory root.
#### Directory / không phải là HOME directory của root user. HOME directory của root user sẽ nằm bên trong directory / và có path là /root 
### Directory /bin
Tất cả những câu lệnh phổ thông các bạn đã và đang sử dụng ví dụ như ls, cat, v.v. bản chất là những phần mềm máy tính được viết ra để tương tác với hệ thống Linux. 
Những ứng dụng đó được chứa bên trong file /bin và có thể được sử dụng bởi tất cả account người dùng.
### Directory /boot 
Directory /boot sẽ chứa những files cần trong quá trình khởi động máy tính ví dụ như kernel, initrd, grub v.v.
### Directory /dev 
Khi bạn kết nối một thiết bị (device), ví dụ bàn phím, vào hệ thống Linux, để bàn phím có thể hoạt động, hệ thống sẽ cần driver của bàn phím. 
Bạn có thể tương tác với driver bàn phím thông qua những file thiết bị (device files) hoặc nút thiết bị (device nodes) được lưu trữ trong directory /dev.
Directory /dev đồng thời còn chứa cả những pseudo-devices hay còn được gọi là thiết bị ảo (không có phần cứng nhìn thấy được như USB hay ổ cứng) ví dụ như /dev/null. 
Dành cho bạn nào chưa biết thì /dev/null là một thiết bị đặc biệt được dùng để hủy toàn bộ kết quả trả về của một câu lệnh.
### Directory /etc 
Etc là viết tắt của “edit to config”. Đây là nơi chứa những file thiết lập cần thiết cho một phần mềm nào đó trong hệ thống Linux. 
Không những thế, những file thiết lập cần cho cả hệ thống Linux và người dùng cũng được chứa tại directory /etc
### Directory /home
Directory /home chứa HOME directories của tất cả những account người dùng bình thường trong hệ thống Linux, ngoại trừ root account.
### Directory /lib
Lib viết tắt của library. Directory /lib là nơi chứa những thư viện cần để chạy những phần mềm cũng chính là các câu lệnh trong directory /bin và những ứng dụng trong directory /sbin.
### Directory /media
Được sử dụng để chứa những directories con cũng chính là những thiết bị được kết nối vào hệ thống Linux ví dụ như USB, ổ cứng rời, v.v.
### Directory /opt 
Opt viết tắt của Optional application software package. Directory /opt là nơi chứa những directories con vốn là những phần mềm của bên thứ ba ví dụ như Libreoffice, Chrome, v.v.
### Directory /proc
Proc viết tắt của process. Directory /proc là nơi chứa thông tin về hệ thống cũng như các process đang chạy trong hệ thống. 
### Directory /sbin
Sbin là viết tắt của System binaries. Đây là directory chứa những phần mềm của các câu lệnh được sử dụng chủ yếu bởi Linux system admin để quản trị hệ thống, ví dụ như reboot, ifconfig, fdisk, v.v.
### Directory /tmp 
Tmp viết tắt của temporary. Đây là directory cấp toàn quyền (rwx) cho mọi account người dùng trên hệ thống Linux và hay được dùng làm bàn đạp để vận chuyển các file mã độc/tấn công từ máy hacker đến máy nạn nhân.
Directory /tmp được dùng bởi các ứng dụng trong hệ thống Linux để lưu trữ dữ liệu tạm thời ví dụ như ảnh chụp màn hình, v.v. 
Những dữ liệu này sẽ bị xóa tự động khi ta khởi động lại hệ thống hoặc cho chạy tính năng tmpwatch để hẹn giờ xóa dữ liệu trong /tmp. 
### Directory /usr 
Usr là viết tắt của user. Đây là cũng là một nơi chứa những phần mềm được sử dụng trong hệ thống Linux. Khác biệt chính ở đây đó là:
    * /bin: Chứa các phần mềm câu lệnh phổ thông. Ví dụ như ls, cat, ping, ls, mkdir, v.v.
    * /sbin: Chứa các phần mềm câu lệnh được sử dụng bởi system admin. Ví dụ như: init, ifconfig, fdisk, v.v.
    * /opt: Chứa những phần mềm bên thứ 3. Ví dụ như : office, broswer, v.v.
    * /usr/…: Chứa những phần mềm dành riêng cho distro Linux. Ví dụ như với Kali Linux, các công cụ như nmap, gobuster, wfuzz, v.v. dành cho việc pentest đều được tập trung bên trong những directories con của directory /usr
Bên trong directory /usr có các directories con như:
    /usr/bin: Chứa các phần mềm dành cho người dùng như nmap, gobuster, v.v.
    /usr/sbin: Chứa các phần mềm dành để quản trị hệ thống
    /usr/share: Nơi chứa những file hỗ trợ dành cho các phần mềm bên trong /usr
        Các bạn cần ghi nhớ directory /usr/share/wordlists trên Kali Linux, đây là directory chứa các từ điển dùng để tấn công dictionary attack, tìm file ẩn trên website, v.v. 
### Directory /var 
Var là viết tắt của variables. Directory /var là nơi chứa những biến như log, mail, cache, v.v. mà giá trị được chứa bên trong của nó sẽ thay đổi liên tục trong suốt quá trình vận hành của hệ thống. 
# Linux Căn Bản – Bài 9: Câu lệnh ln, find và grep
Trong Linux command line, cũng có một kỹ thuật tạo shortcut được gọi là link bằng cách sử dụng câu lệnh ln. Cách hoạt động của shortcut và link là gần tương đương nhau mặc dù bản chất sẽ có khác biệt đôi chút.
 Sẽ có 2 dạng link trong Linux command line:
    * Hard link
    * Soft link
## Inode
Trong hệ thống Linux, dữ liệu được lưu giữ ở hai phần khác nhau ở ổ cứng. Nội dung dữ liệu sẽ được lưu giữ trong các data blocks. 
Nhưng thông tin về dữ liệu ví dụ như metadata, vị trị lưu trữ, v.v lại được lưu trữ trong Inode.
Inode có thể hiểu đơn giản như là một cơ sở dữ liệu lưu lại các thông tin của dữ liệu ngoại trừ nội dung của dữ liệu. 
Inode có hình dạng là một dãy số. Dãy số này tương tự như địa chỉ nhà vậy, nghĩa là trong cả một Linux file system sẽ không bao giờ có 2 files/directories hoặc file và directory có giá trị Inode như nhau. 
Hệ điều hành Linux sử dụng Inode cho mục đích lấy các thông tin của file hoặc directory như phân quyền và vị trị lưu trữ của file trên ổ cứng, v.v. 
Nói một cách đơn giản, Inode có chức năng giống như một mã số định danh một dữ liệu trong cơ sở dữ liệu vậy. 
## Hard link
Có thể hiểu đơn giản, hard link là một kết nối đến Inode của một file xác định. 
Hard link và file có Inode mà nó trỏ tới sẽ có cùng giá trị Inode, và bạn có thể sử dụng hard link để truy cập vào file có Inode mà nó trỏ tới.
Nếu file gốc bị xóa, bạn vẫn có thể truy cập file gốc thông qua hard link. Nguyên nhân là vì trong hệ thống Linux, mọi file bình thường (không bao gồm directories) đều là một hard link. 
Khi bạn tạo một file hay xóa một file, bạn chỉ đơn giản là đang tạo hay xóa một hard link trỏ tới Inode của file đó. 
Nó gần tương tự như việc nhà bạn có 2 cửa chính, phá bỏ 1 cái thì vẫn còn 1 cái để ra vào vậy. 
Hard link chỉ có thể trỏ tới Inode của file chứ không thể trỏ tới Inode của directory.
Phân quyền của hard link tương tự như phân quyền của file có Inode mà nó trỏ tới. Để thay đổi phân quyền của hard link, bạn phải thay đổi phân quyền của file có Inode mà nó trỏ tới.
Hard link chỉ có thể hoạt động trong cùng Linux file system. Ví dụ: Bạn không thể tạo hard link giữa ext3 và ext4 vì chúng khác file systems.
Với hard link, điều bạn đang làm là tạo thêm kết nối trỏ tới một file nào đó chứ không phải nhân dữ liệu đã có lên n lần như với copy. Và mỗi khi bạn truy cập file thông qua hard link để thay đổi nội dung file, bạn đang thay đổi nội dung gốc của file. 
Đồng nghĩa với việc dù bạn truy cập file bằng hard link nào thì nội dung hiện ra vẫn sẽ là nội dung mà bạn đã thay đổi.
Ứng dụng lớn nhất của hard link là để backup dữ liệu nhưng không cần phải copy dữ liệu gây lãng phí tài nguyên ổ cứng.
``` Nói tóm lại là cái này dùng đê backup địa chỉ của dữ liệu (inode) nhưng không gấy tốn bộ nhớ kiểu```
## Soft link
Soft link hay còn gọi là Symbolic link. Chức năng của nó tương tự như shortcut trên Windows. 
Tương tự như hard link, bạn cũng có thể dùng soft link để truy cập file, tuy nhiên soft link trỏ tới tới file chứ không trỏ tới Inode của file như hard link
uy nhiên soft link trỏ tới tới file chứ không trỏ tới Inode của file như hard link
Khi bạn xóa soft link sẽ không ảnh hưởng đến file gốc. Tuy nhiên nếu bạn xóa hay chuyển file mà nó trỏ tới đi nơi khác, soft link sẽ không còn hoạt động được nữa
Soft link có thể được dùng cho cả file và directory 
Soft link sẽ có Inode khác với file gốc và phân quyền cũng sẽ không thừa kế từ file gốc. Khi bạn thay đổi phân quyền của file gốc, phân quyền của soft link không thay đổi
Soft link vẫn có thể hoạt động khi file nó trỏ tới và link nằm khác file system
Vì bản thân soft link chỉ là một liên kết đến file mà nó trỏ tới, nên khi truy cập nội dung file bằng soft link và thay đổi nội dung bên trong, bạn đang thay đổi nội dung gốc của file mà soft link trỏ tới
Khi bạn kiểm tra các thông tin của một soft link bằng lệnh ls -l, bạn sẽ thấy chữ “l” ở đầu báo hiệu đây là một link, ngoài ra ở phía cuối còn có tên file mà nó trỏ tới.
## Câu lệnh Find 
Find là một câu lệnh mạnh mẽ dùng để tìm kiếm file dữ liệu trong Linux. Cú pháp cơ bản của câu lệnh find như sau:\n
```find <flag>(optional) <tên-directory-nơi-bắt-đầu-tìm-kiếm> <nội-dung-cần-tìm>```\n
Để tìm tất cả các file có phân quyền SUID chúng ta sẽ dùng câu lệnh sau\n
```find / -perm -u=s -type f 2>/dev/null```\n
Trong đó
    */ : Bắt đầu tìm từ root directory là file có vị trí cao nhất trong sơ đồ cấu trúc file của hệ thống Linux\n
    * -perm: Tìm những file thỏa mãn phân quyền theo sau\n
    * -u=s: Tìm những file binary thuộc sở hữu của root nhưng có phân quyền SUID\n
    * -type: Dạng file cần tìm \n
    * f: Dạng file bình thường, không phải directory hay các file đặc biệt ví dụ như symbolic link, v.v.\n
    *2>/dev/null: Chuyển tất cả những cảnh báo lỗi hoặc output lỗi vào /dev/null\n

