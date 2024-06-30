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
* /usr/bin: Chứa các phần mềm dành cho người dùng như nmap, gobuster, v.v.
* /usr/sbin: Chứa các phần mềm dành để quản trị hệ thống
* /usr/share: Nơi chứa những file hỗ trợ dành cho các phần mềm bên trong /usr
  
***Các bạn cần ghi nhớ directory /usr/share/wordlists trên Kali Linux, đây là directory chứa các từ điển dùng để tấn công dictionary attack, tìm file ẩn trên website, v.v.*** 
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
Find là một câu lệnh mạnh mẽ dùng để tìm kiếm file dữ liệu trong Linux. Cú pháp cơ bản của câu lệnh find như sau:

```find <flag>(optional) <tên-directory-nơi-bắt-đầu-tìm-kiếm> <nội-dung-cần-tìm>```

Để tìm tất cả các file có phân quyền SUID chúng ta sẽ dùng câu lệnh sau

```find / -perm -u=s -type f 2>/dev/null```

Trong đó
*/ : Bắt đầu tìm từ root directory là file có vị trí cao nhất trong sơ đồ cấu trúc file của hệ thống Linux
* -perm: Tìm những file thỏa mãn phân quyền theo sau
* -u=s: Tìm những file binary thuộc sở hữu của root nhưng có phân quyền SUID
* -type: Dạng file cần tìm 
* f: Dạng file bình thường, không phải directory hay các file đặc biệt ví dụ như symbolic link, v.v.
*2>/dev/null: Chuyển tất cả những cảnh báo lỗi hoặc output lỗi vào /dev/null

# Linux Căn Bản – Bài 10: Lấy mật khẩu shiba4, lệnh sudo, adduser, addgroup, usermod, userdel, và groupdel
## Câu lệnh sudo (Task 35)
Sudo là viết tắt của từ Super User Do. Khi bạn sử dụng câu lệnh này đi kèm với một câu lệnh khác

 khi sử dụng lệnh sudo, nó sẽ tạm thời cung cấp cho bạn phân quyền ở cấp cao hơn account của bạn để thực thi câu lệnh mà bạn mong muốn mà không cần phải đăng nhập vào account ở cấp cao hơn đó. Trong nhiều trường hợp, bạn sẽ phải nhập mật khẩu account hiện tại khi sử dụng lệnh sudo. 

 ## Tính ứng dụng của lệnh sudo và sự khác biệt với câu lệnh su
 lệnh su cho phép bạn đăng nhập vào một account người dùng khác thông qua giao diện dòng lệnh. 

 Lệnh sudo có nhiều ứng dụng hơn so với lệnh su. Chúng ta có thể sử dụng câu lệnh sau để đăng nhập account root (Với các hệ điều hành Linux hiện nay, bạn không còn có thể dùng lệnh su để đăng nhập root được nữa)

 ```sudo -l```

 Sudo -l sẽ cho bạn biết được những câu lệnh bạn được phép sử dụng, hoặc bị cấm sử dụng. Thông tin này rất hữu ích trong việc tìm ra giải pháp cho priv escaltion.

 ## Tạo account người dùng, tạo group và quản lý group
 Vì chỉ có duy nhất root mới có quyền tạo account người dùng hay tạo group, nên chúng ta sẽ thực tập trên máy Kali Linux của chúng ta nhé. Các bạn vào account root trên hệ thống Kali Linux bằng command sau:
### Lệnh adduser 
Lệnh adduser được sử dụng để tạo một account người dùng mới. Cú pháp của câu lệnh adduser như sau: 

```adduser <tên-account> ```
### Lệnh addgroup
Lệnh addgroup được dùng để tạo một group bao gồm nhiều account người dùng chia sẻ chung phân quyền chủ group. Cú pháp câu lệnh như sau:

```addgroup <tên-group-cần-tạo>```
### Lệnh usermod 
Chúng ta làm việc đó bằng cách sử dụng câu lệnh usermod với cú pháp như sau:

```usermod -a -G <tên-group> <tên-user-account-cần-add-vào-group>```
### Xóa account người dùng và xóa nhóm 
Để xóa một account người dùng, bạn dùng lệnh userdel. Cú pháp như sau:

```userdel <tên-account-cần-xóa>```

Để xóa một group, chúng ta sẽ sử dụng lệnh groupdel. Cú pháp như sau: 

groupdel <tên-group-cần-xóa>
# Linux Căn Bản – Bài 11: Tấn công leo thang đặc quyền với Nano và Vim và thực hành tạo file Bash script đơn giản
## Nano
Trình text editor Nano cho phép người sử dụng có thể thực thi câu lệnh bên trong Nano. Nếu Nano được cấp SUID, nó có thể bị hacker lợi dụng cho mục đích priv escalation. 
## Vim
Do Vim cũng cho phép thực thi lệnh bên trong nên cũng tương tự như Nano, Vim có thể bị lợi dụng cho mục đích leo thang đặc quyền nếu nó được set SUID. 
## Bash scripting cơ bản

# Linux Căn Bản – Bài 12: Quản lý phần mềm, tác vụ trên hệ thống Linux và tấn công leo thang đặc quyền đối với server Learn Linux
## $PATH
$PATH có liên quan đến cách một câu lệnh được thực thi.
thực tế các files thực thi của các câu lệnh không nhất thiết phải nằm trong những directories trên mà có thể nằm ở bất kỳ đâu trong hệ thống. 
khi bạn thực thi một câu lệnh trên Linux shell, hệ thống sẽ không kiểm tra tất cả directories tồn tại trong hệ thống nhằm tìm ra câu lệnh bạn muốn chạy đang được chứa tại directory nào mà nó sẽ chỉ nhìn vào environment variable hay $PATH để biết chính xác những directories câu lệnh cần chạy có thể được chứa mà thôi. 
Trên Linux cũng khác mấy trên Windows, việc thêm directory vào $PATH sẽ giúp bạn có thể thực thi một câu lệnh dễ dàng mà không cần phải gọi chính xác nơi chứa câu lệnh đó. 
Để kiểm tra những directories nào được lưu trữ trong $PATH, chúng ta sẽ sử dụng câu lệnh sau:

```echo $PATH```

Mỗi directory được chứa bên trong của $PATH sẽ được cách nhau bởi dấu “:”. Khi bạn thực thi một câu lệnh nào đó, hệ thống Linux sẽ tìm câu lệnh cần chạy trong những directories trong $PATH theo thứ tự từ trái sang phải. 
Nếu bạn có quyền sử dụng câu lệnh export, bạn có thể thêm directory vào bên trong $PATH. Directory được thêm vào sẽ xuất hiện ở vị trí đầu tiên bên trái. Để thêm directory vào $PATH ta dùng câu lệnh sau:

```export PATH=<tên-directory>:$PATH```

Điều này dẫn đến một rủi ro an ninh hệ thống. Ví dụ bạn thực thi câu lệnh ls với sudo, hacker biết được điều đó nên tạo một file mã độc giả ở với tên ls và chứa bên trong directory /tmp. Như vậy khi hệ thống tìm thấy file ls bên trong directory /tmp, nó sẽ chạy file đó và vô tình làm lây lan mã độc trong hệ thống hoặc cho phép hacker leo thang đặc quyền thành công. 
##  Quản lý phần mềm
Các hệ điều hành Linux hiện nay sử dụng một phần mềm gọi là package manager để quản lý những phần mềm được cài vào hệ thống Linux. Cụ thể, package manager sẽ có nhiệm vụ cài đặt, nâng cấp, cấu hình và xóa các phần mềm đã được cài đặt trước đó vào hệ thống Linux. 

Các phần mềm cho các hệ điều hành Linux hiện nay sẽ được đóng gói thành các packages nhằm mục đích dễ phân phối và lưu trữ. Mỗi package sẽ bao gồm: 

*File thực thi (binary)
*Các thông tin liên quan đến phần mềm (metadata). Ví dụ như: tên phần mềm, mô tả phần mềm, version.
*Danh sách những phần mềm hoặc thư viện hỗ trợ cần thiết cho hoạt động của phần mềm (dependencies)

Các hệ điều hành Linux khác nhau đã tạo nên các định dạng package (package format) khác nhau. Ví dụ như:

* .deb: Dành cho các hệ điều hành Linux Debian như: Kali Linux, Ubuntu, Parrot OS, Mint, v.v.
* .rpm: Dành cho các hệ điều hành Linux của nhà Red Hat như: Red Hat, CentOS, Fedora, v.v.

Mỗi hệ điều hành Linux đều sẽ có một danh sách chứa những software repositories. Bạn có thể hiểu một cách đơn giản software repositories như là những nơi bạn có thể tải phần mềm online về máy của mình. Trên Kali Linux và Ubuntu, danh sách chứa software repositories có path là /etc/apt/sources.list.

Ở trên các hệ điều hành Linux Debian, người dùng được cung cấp nhiều lựa chọn để quản lý các packages. Ví dụ chúng ta có:

* dpkg: Là một ứng dụng được dùng để quản lý, cài đặt, và xóa bỏ phần mềm ra khỏi hệ thống Linux. Điểm hạn chế của dpkg đó là nó không cài dependencies đi kèm với phần mềm, dẫn đến phần mềm bị lỗi và không thể hoạt động được.
    * Để cài đặt phần mềm ta dùng lệnh: dpkg -i <tên-phần-mềm>
    * Để xóa phần mềm ta dùng lệnh: dpkg –remove <tên-phần-mềm>
    * Để liệt kê phần mềm đã cài ta dùng lệnh: dpkg -l
      
* apt hoặc apt-get: Lệnh apt hoặc apt-get vượt trội hơn dpkg ở chỗ, nó không chỉ cài đặt package mà còn cả những dependencies mà phần mềm cần để chạy ổn định. Thực tế, khi người dùng sử dụng apt hoặc apt-get để cài đặt một package, nó sẽ sử dụng dpkg để cài đặt phần mềm và apt hoặc apt-get sẽ lo phần dependencies. Đây cũng là câu lệnh được dùng phổ biến nhất để quản lý packages trên các hệ điều hành Linux Debian.
    * Để cài đặt phần mềm ta dùng lệnh: apt install <tên-phần-mềm>
    * Để xóa phần mềm ta dùng lệnh: apt remove <tên-phần mềm>
    * Để xóa toàn bộ những packages được dùng làm dependency của phần mềm cần xóa ta dùng lệnh: apt autoremove <tên-phần-mềm>
    * Để xóa tất cả những gì liên quan đến phần mềm cần xóa ta dùng lệnh: apt purge <tên-phần-mềm>
    * Để liệt kê những packages đã cài đặt ta dùng lệnh ta dùng lệnh: apt list
### Sự khác biệt giữa apt và apt-get
apt-get từng được sử dụng rất phổ biến trong quá khứ, tuy nhiên ở các phiên bản mới của các hệ điều hành Linux Debian, người dùng được đề nghị nên sử dụng apt thay vì apt-get vì sự thân thiện, tiện lợi và những cải tiến về mặt thiết kế so với apt-get.

### Cập nhật và nâng cấp các packages trong hệ thống Linux
```sudo apt update```

Câu lệnh apt update sẽ tìm và cập nhật phiên bản mới nhất của của các packages trong list /etc/apt/sources.list.

```sudo apt upgrade```

Câu lệnh apt upgrade sẽ dựa vào list /etc/apt/sources.list đã được cập nhật mà cài đặt các phiên bản mới nhất cho các phần mềm bên trong hệ thống Linux. 

```sudo apt dist-upgrade```

Câu lệnh dist-upgrade, bên cạnh thực hiện chức năng của câu lệnh upgrade, nó còn kiêm luôn cả việc cập nhật phiên bản mới nhất cho cả những dependencies của các phần mềm được cập nhật nữa. Hoặc nếu có những dependencies xung đột với nhau câu lệnh dist-upgrade sẽ ra tay xóa bỏ những dependencies gây xung đột này. 

### Quản lý tác vụ
#### Lệnh ps
Lệnh ps có được sử dụng để hiện thị các tác vụ hiện đang chạy trong hệ thống. Đặc điểm của câu lệnh ps đó là nó không hiển thị thông tin của tác vụ theo thời gian thực mà chỉ xuất ra thông tin của tất cả processes đang có trong hệ thống ngay tại thời điểm câu lệnh ps được thực thi. Cú pháp của câu lệnh ps như sau:

```ps <tùy-chọn-flag>```

Khi sử dụng lệnh ps không kèm flag, bạn lệnh ps sẽ chỉ in ra những thông tin về process đang chạy câu lệnh ps và shell mà câu lệnh ps đang chạy. 

![image](https://github.com/HoangVietAnh09/Others/assets/111860567/ba1278c2-6dca-4857-b4fc-4b5c9f234775)

Trong đó:
* PID (Process ID): Số định danh của process trong hệ thống. Mỗi process sẽ mang một PID và con số này là độc nhất. Nghĩa là sẽ không bao giờ cùng một lúc có 2 processes có cùng
* TTY (TeleTYpewriter): Tên của thiết bị đầu cuối thực thi câu lệnh
* TIME: Thời gian CPU cần để xử lý process trên tính theo phút và giây
* CMD: Tên của câu lệnh đã bắt đầu process

Để in ra toàn bộ process đang chạy trong hệ thống chúng ta sẽ dùng câu lệnh sau:

```ps -e```

![image](https://github.com/HoangVietAnh09/Others/assets/111860567/4a303f85-fc6d-4e18-a3c0-460603c633b4)

Để xuất ra tác vụ kèm theo PID của parent tác vụ và UID đang chạy tác vụ ta sử dụng câu lệnh sau

```ps -ef```

![image](https://github.com/HoangVietAnh09/Others/assets/111860567/077670a5-c611-4e5f-a055-55f2227171fd)

Trong đó:
* UID: Tên user chạy tác vụ
* PPID (Parent PID): ID của parent của tác vụ
* C: Số chu kỳ của CPU được sử dụng bởi mỗi tác vụ
* STIME: Thời điểm process bắt đầu
#### Lệnh top
Câu lệnh top cũng là một công cụ được sử dụng để quản lý các tác vụ trên hệ điều hành Linux. Khác với câu lệnh ps, câu lệnh top sẽ cập nhật thông tin tác vụ đang chạy trên hệ thống theo thời gian thực cho đến khi nào bạn dừng lệnh mới thôi. Cú pháp của câu lệnh top như sau: 

```top <tùy-chọn-flag>```

Với top, bạn có thể tùy chọn những thông tin bạn muốn hiện ra. Ví dụ khi lệnh top đang chạy, bạn nhấn phím “f”. Lúc này thông tin của tất cả các cột sẽ hiện ra. Các tên cột có dấu “*” phía trước là những thông tin đang được hiển thị. 

![image](https://github.com/HoangVietAnh09/Others/assets/111860567/5924c3e3-93c8-4cdb-b740-9ad0373a88eb)


Để di chuyển lên hoặc xuống các bạn sẽ dùng 2 phím mũi tên lên hoặc xuống. Để chọn hoặc bỏ chọn hiện thị một cột các bạn nhấn phím space (phím khoản trống). Và để thoát ra, các bạn dùng phím “q” hoặc “ECS”.

### Tấn công leo thang đặc quyền (priv escalation) server Learn Linux 
Thông thường, một số cách phổ biến nhất để leo thang đặc quyền đó là:

1. Kernel exploit: Lợi dụng một lỗ hổng trong kernel hoặc hệ điều hành để leo thang đặc quyền
2. SUID: Lợi dụng SUID để leo thang đặc quyền như ta đã thực hành với vim và nano ở bài 11
3. Cron tasks: Lợi dụng những tác vụ được thiết lập chạy tự động bởi root để leo thang đặc quyền
4. Sudo rights: Lợi dụng những công cụ được cấp phép sử dụng để leo thang đặc quyền
5. Tìm mật khẩu của account root được chứa bên trong các file quan trọng như web database, log file, v.v

Directory /var/log là nơi chứa log (nhật ký) từ hệ điều hành, những dịch vụ và những ứng dụng đang chạy trong hệ thống.

End.








