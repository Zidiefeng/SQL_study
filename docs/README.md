# 【狂】MySQL

## 什么是数据库

[1、什么是数据库，为什么要学习数据库](https://www.bilibili.com/video/BV1NJ411J79W?p=1)

### Web构成

JavaEE:是企业级Java开发，主要是Web

- 前端（页面渲染，展示数据）
- 后台（跟数据库打交道，同时连接数据库，连接前端是为了控制，跳转，给前端传递数据）
- 数据库（SQL，存储数据，早期的时候可以存为变量，txt，excel)

### 程序员等级

Level1：只会写代码，还有增删改查，混饭吃

Level2： 懂操作系统（很多公司自己开发系统），数据结构和算法

Level3：离散数学，数字电路（程序），体系结构，编译原理，实战经验

* 数据库是所有软件体系中最核心的存在，码农也需要会SQL

### 什么是数据库

- 作用：存数据，管理数据
- 概念：是数据仓库，是软件，安装在操作系统之上（Windows，Linux，Mac...），SQL是语句（500万以下，500万以上要优化检索，要不会很慢）

## 关系型和非关系型数据库

[2、初识Mysql，关系型和非关系型数据库区别](https://www.bilibili.com/video/BV1NJ411J79W?p=2)

### 数据库分类

- 关系型数据库
    - SQL
    - 代表：MySQL, Oracle, SQL Server, DB2, SQLlite
    - 通过表和表之间，行和列的关系进行数据的存储
- 非关系型数据库
    - NoSQL（Not Only SQL）
    - key-value pair
    - 经典：Redis，MongoDB
    - 以对象存储，通过对象的自身的属性来决定

### DBMS 数据库管理系统

- 数据库的管理软件，科学有效管理数据，维护，获取数据（用来打开数据，操作）
- 最上面的应用通过DBMS来从数据库中调取数据，一个数据库可以管理很多应用的数据、

![%E3%80%90%E7%8B%82%E3%80%91MySQL%20d8996e76f4e14f6da3d24640c3cd349b/Untitled.png](%E3%80%90%E7%8B%82%E3%80%91MySQL%20d8996e76f4e14f6da3d24640c3cd349b/Untitled.png)

### MySQL介绍

- MySQL就是一个RDBMS（relational database management system **关系型数据库管理系统**）软件应用，不止可以存（DB是只能存）还可以管理数据
- 由瑞士MySQL AB公司开发，现在属于Oracle旗下产品
- 是最流行的关系型数据库管理系统之一，最好的SQL
- 是开源的，成本低，速度快，灵活（将数据存在不同表中）
- 企业中稳定的版本：5.7（最新8.0，驱动不太一样，可能要不同的配置）
- 可以搭集群，比如去阿里云买MySQL存储空间（云端的），也可以买服务器
- 官网（Development Zone就是开发者日志，去下载吧）

    [MySQL](https://www.mysql.com/)

## MySQL安装

[3、安装MySQL详细说明](https://www.bilibili.com/video/BV1NJ411J79W?p=3)

### 安装信息

- 官网：[https://www.mysql.com](https://www.mysql.com/)
- 官网下载地址：[https://dev.mysql.com/downloads/mysql/](https://dev.mysql.com/downloads/mysql/)
    - 选择OS（需要log in Oracle）
- 博主网盘下载地址：[https://pan.baidu.com/s/1prPSmOp_xczQY5RFavKo-g](https://pan.baidu.com/s/1prPSmOp_xczQY5RFavKo-g) 提取码：0cm3
- Tips：
    - 尽量不要用exe，因为注册表中难删干净（这样可能无法重新安装）
    - 尽可能用压缩包zip安装（卸载容易，直接删掉就行）

Oracle，在产品中找到MySQL
**注册邮箱**：ksun01@email.wm.edu
**密码**：google chrome自行填补

### 安装步骤

Ref: **[MySQL5.7免安装版配置详细教程](https://www.cnblogs.com/ly570/p/11161460.html)**

1. 下载MySQL

    MySQL 5.7 版本 64位下载地址：https://dev.mysql.com/get/Downloads/MySQL-5.7/mysql-5.7.19-winx64.zip

2. 解压zip压缩包
    - 删掉名称中的winx64，剩下就是sql包了
    - 把这个包放到自己的电脑环境目录下（狂神 解压到的是D:\Environment\mysql-5.7.19），建议把所有的环境放到环境目录，所有的程序放到程序目录
    - 解压后其实就可以用了，但是最好要配置一下
3. 添加环境变量
    - `我的电脑`->`属性`->`高级`->`环境变量`
    - 选择`PATH`,在其后面添加: mysql 的`bin`文件夹所在地

        ![%E3%80%90%E7%8B%82%E3%80%91MySQL%20d8996e76f4e14f6da3d24640c3cd349b/Untitled%201.png](%E3%80%90%E7%8B%82%E3%80%91MySQL%20d8996e76f4e14f6da3d24640c3cd349b/Untitled%201.png)

4. 新建配置文件ini
    - 因为是压缩版没有配置文件，所以要手动创立
    - 在`D:\Environment\mysql-5.7.19`下新建 my.ini 文件编辑 `my.ini` 文件, 将下面的内容复制进这个文件

        ```python
        [mysqld]
        basedir=D:\Environment\mysql-5.7.19\ # 基础目录，替换成自己的
        datadir=D:\Environment\mysql-5.7.19\data\ # 这个repository之后自动生成，不要自己加
        port=3306 # 端口
        skip-grant-tables #跳过密码验证
        ```

5. 安装MySQL服务
    - 要在 `任务管理器`中手动装个MySQL的`服务`，所以要管理员权限

        ![%E3%80%90%E7%8B%82%E3%80%91MySQL%20d8996e76f4e14f6da3d24640c3cd349b/Untitled%202.png](%E3%80%90%E7%8B%82%E3%80%91MySQL%20d8996e76f4e14f6da3d24640c3cd349b/Untitled%202.png)

    - 启动**管理员模式**下的CMD，cd至mysql下的bin目录（bin目录装有所有的`执行程序`，比如用mysql.exe, 还有mysqld.exe）
    - 输入`mysqld –install` (安装mysql) ,安装服务service

        ![%E3%80%90%E7%8B%82%E3%80%91MySQL%20d8996e76f4e14f6da3d24640c3cd349b/Untitled%203.png](%E3%80%90%E7%8B%82%E3%80%91MySQL%20d8996e76f4e14f6da3d24640c3cd349b/Untitled%203.png)

6. 初始化data默认数据库
    - 再输入 `mysqld --initialize-insecure --user=mysql` 初始化数据文件到`mysql-5.7.19\data\`

7. 启动MySQL，进去修改密码
    - 启动MySQL：输入`net start mysql`
    - 启动成功之后，任务器中就有这个服务了（`正在运行`）
    - 用命令 `mysql –u root –p` 进入mysql管理界面（密码目前为空，直接回车就好）
    - 进入CMD的sql界面后更改root密码：

        ```sql
        # 更新密码
        update mysql.user set authentication_string=password(‘root’) where user=‘root’ and Host = ‘localhost’;
        ALTER USER 'root'@'localhost' IDENTIFIED BY 'root';

        # 刷新权限
        flush privileges;
        ```

    - 删除my.ini 文件中的`skip-grant-tables #跳过密码验证`
    - exit退出sql界面
8. 关闭程序：`net stop mysql` , 服务显示`已停止`
9. 重启、连接测试MySQL
    - `net start mysql`
    - `mysql –u root –pmypassword`有密码直接紧挨着写就行(或者回车 后面再输)

我自己之前装过了 ，我这里service的名字是

**可能出现的问题：**

1. 缺少组件.dll
2. 命令输出错误

可以用：`sc delete mysql` , 清空服务 然后再次重新安装

## SQLyog安装

[4、Sqlyog软件安装和使用](https://www.bilibili.com/video/BV1NJ411J79W?p=4)

很多人用的是navicat，据说体验更好

### 安装SQLyog

1. 注册
2. 无脑安装

### UI链接数据库

1. 打开连接数据库

    ![%E3%80%90%E7%8B%82%E3%80%91MySQL%20d8996e76f4e14f6da3d24640c3cd349b/1838702-20200116165639632-1179725848.png](%E3%80%90%E7%8B%82%E3%80%91MySQL%20d8996e76f4e14f6da3d24640c3cd349b/1838702-20200116165639632-1179725848.png)

2. 建一个数据库 school

    ![%E3%80%90%E7%8B%82%E3%80%91MySQL%20d8996e76f4e14f6da3d24640c3cd349b/Untitled%204.png](%E3%80%90%E7%8B%82%E3%80%91MySQL%20d8996e76f4e14f6da3d24640c3cd349b/Untitled%204.png)

    **注意：**每一个sqlyog的执行操作，本质就是对应了一个sql，可以在软件的历史记录中查看

3. 新建一张表 student（id，name，age）

    注意去看右边的历史记录

    ![%E3%80%90%E7%8B%82%E3%80%91MySQL%20d8996e76f4e14f6da3d24640c3cd349b/1838702-20200116165710010-334306978.png](%E3%80%90%E7%8B%82%E3%80%91MySQL%20d8996e76f4e14f6da3d24640c3cd349b/1838702-20200116165710010-334306978.png)

    ```sql
    CREATE TABLE `school`.`student` ( `id` INT(10) NOT NULL COMMENT 'Student ID', `name` VARCHAR(100) NOT NULL COMMENT 'Student Name', `age` INT(3) NOT NULL COMMENT 'Student Age', PRIMARY KEY (`id`) ) ENGINE=INNODB CHARSET=utf8 COLLATE=utf8_general_ci;
    ```

4. 查看表（open table）
    - 可以添加记录
5. 注意操作界面，可以用tab-tools-user manager 查看user

    ![%E3%80%90%E7%8B%82%E3%80%91MySQL%20d8996e76f4e14f6da3d24640c3cd349b/Untitled%205.png](%E3%80%90%E7%8B%82%E3%80%91MySQL%20d8996e76f4e14f6da3d24640c3cd349b/Untitled%205.png)

- [ ]  [P44、Sqlyog软件安装和使用14:20](https://www.bilibili.com/video/BV1NJ411J79W?p=4)
- [ ]  [P55、基本的命令行操作15:07](https://www.bilibili.com/video/BV1NJ411J79W?p=5)

### 连接数据库-command

1. 将SQL bin目录添加到path：C:\Users\sunka\Downloads\mysql-8.0.21-winx64\bin
2. admin进入terminal，链接mysql

    ```bash
    mysql -uroot -proot
    # mysql -uroot -p123456 --连接数据库
    ```

3. 修改密码，刷新权限

    ```bash
    update mysql.user set authentication_string=password('123456') where user='root' and Host = 'localhost'; -- 修改用户密码
    flush privileges;   -- 刷新权限
    ```

    点入SQLyog，可以看到相应的table：

    ![%E3%80%90%E7%8B%82%E3%80%91MySQL%20d8996e76f4e14f6da3d24640c3cd349b/Untitled%206.png](%E3%80%90%E7%8B%82%E3%80%91MySQL%20d8996e76f4e14f6da3d24640c3cd349b/Untitled%206.png)

4. 用SQL基本语句查看DB
    - SQL可以换行，所有的语句都使用`；`结尾

    ```sql
    show databases;  -- 查看所有的数据库

    use school;  -- 切换数据库 use 数据库名
    -- Database changed

    show tables; -- 查看school数据库中所有的表

    describe student; -- 显示数据库中所有的表的信息

    create database westos; -- 创建一个数据库

    exit;  --退出连接

    -- ^C 终止SQL
    -- 单行注释（SQL 的本来的注释）

    /*   
    （sql的多行注释）0
    */

    ```

### database ~ language

- DDL -definition 数据库定义语言
- DML -manipulation 数据库操作语言
- DQL -query 数据库查询语言
- DCL -control 控制库查询语言

### CRUD

- 增 create
- 删 delete
- 改 update
- 查 read

- [ ]  [P66、操作数据库语句10:59](https://www.bilibili.com/video/BV1NJ411J79W?p=6)

## learning path

1. operations on DB
2. operations on Tables in a DB
3. operations on Data of a Table in a DB

## Operations on DB

了解即可

### 创建DB

```sql
CREATE DATABASE [IF NOT EXISTS] westos;
```

### 删除DB

```sql
DROP DATABASE [IF EXISTS] westos;
```

### 使用DB

- 加``` 以区分关键词

    ``` 也可以用于区分feature：`SELECT `age` FROM student;`

```sql
USE `westos`;
USE westos;
```

### 查看DB

```sql
--查看所有的数据库DB
SHOW DATABASES;
```

- [ ]  [P77、列的数据类型讲解13:07](https://www.bilibili.com/video/BV1NJ411J79W?p=7)

### 数据库的column类型

- Ref: [https://www.w3schools.com/sql/sql_datatypes.asp](https://www.w3schools.com/sql/sql_datatypes.asp)
- 注意一般可以定义长度

### Int

- `tinyint`: very small int，1个字节（1个字节等于8位二进制）
    - Signed range is from -128 to 127
    - Unsigned range is from 0 to 255 （2^8=256）
- `smallint`: small int，2个字节
    - Signed range is from -32768 to 32767
    - Unsigned range is from 0 to 65535（2^16=65536）
- `mediumint`: medium int，3个字节
    - Signed range is from -8388608 to 8388607
    - Unsigned range is from 0 to 16777215（2^24=16777216）
- `int`/`integer`: 标准整数，4个字节 `常用`
    - Signed range is from -2147483648 to 2147483647
    - Unsigned range is from 0 to 4294967295（2^32=4294967296）
- `bigint`：较大数据，8个字节
    - Signed range is from 9223372036854775808 to 9223372036854775807
    - Unsigned range is from 0 to 18446744073709551615（2^64）

### Float

- `float`: 浮点数，单精度，4个字节 `常用`
    - Single precision floating-point. Will handle most decimals
- `double`：浮点数，8个字节
    - Double precision floating-point. Will handle most decimals

        ![%E3%80%90%E7%8B%82%E3%80%91MySQL%20d8996e76f4e14f6da3d24640c3cd349b/Untitled%207.png](%E3%80%90%E7%8B%82%E3%80%91MySQL%20d8996e76f4e14f6da3d24640c3cd349b/Untitled%207.png)

- `decimal` : string形式的浮点数， 比如金融计算的时候，用decimal

### Money

- `smallmoney`4 bytes
Monetary data from -214,748.3648 to 214,748.3647
- `money`8 bytes
Monetary data from -922,337,203,685,477.5808 to 922,337,203,685,477.5807

### string

- `char` 字符大小固定，0~255
A FIXED length string
- `varchar` 可变字符串，0~65535 （对应java的String），保存变量 `常用`
A VARIABLE length string
- `tinytext` 微型文本 2^8-1
Holds a string with a maximum length of 255 characters
- `text` 大型文本 2^16-1，保存大文本 `常用`
Holds a string with a maximum length of 65,535 bytes

### date

- `date` YYYY-MM-DD 日期
The supported range is from '1000-01-01' to '9999-12-31'
- `time` HH:mm:ss 时间
The supported range is from '-838:59:59' to '838:59:59'
- `datetime` YYYY-MM-DD HH:mm:ss `常用`
The supported range is from '1000-01-01 00:00:00' to '9999-12-31 23:59:59'
- `timestamp` 时间戳，1970.1.1到现在的毫秒，全球统一 `常用`
- `year` 年份
1901 to 2155, and 0000.

### null

- 没有值，未知
- 注意不要用null进行计算

- [ ]  [P88、数据库的字段属性13:45](https://www.bilibili.com/video/BV1NJ411J79W?p=8)

### feature属性

- unsigned：无符号的整数，不能是负数
- zerofill: 不足的位数用0填充，比如005 （长度为3）
- Auto Incre: 自增,在上一条上加1（也可以设计别的增幅，起始值），通常来设计primary key, 必须是整数

    ![%E3%80%90%E7%8B%82%E3%80%91MySQL%20d8996e76f4e14f6da3d24640c3cd349b/Untitled%208.png](%E3%80%90%E7%8B%82%E3%80%91MySQL%20d8996e76f4e14f6da3d24640c3cd349b/Untitled%208.png)

- default 默认填充值

### 项目的必要列

表示一个record存在意义

- id： primary key,自增
- version：记录的version，对应乐观锁
- is_delete: 伪删除，不希望真删掉，管理员可以查看被删除的东西
- gmt_create: 记录的创建时间
- gmt_update：记录的修改时间

- [ ]  [P99、创建数据库表15:38](https://www.bilibili.com/video/BV1NJ411J79W?p=9)

## Create Table by SQL

### 建Table

- 注意点
    - 关键feature用``` 不是`"` 或`'`
    - 必须单引号
    - 最后加上`,`
    - 加上描述`comment`
- 套路

    ```sql
    CREATE TABLE [IF NOT EXISTS] `表名`(
    	`字段名` 列类型 [属性] [索引] [注释COMMENT],
    	...
    	`字段名` 列类型 [属性] [索引] [注释COMMENT],
    	PRIMARY KEY(`字段名`)
    )[表类型ENGINE] [字符集设置CHARSET]
    ```

- 例子

    ```sql
    USE school;
    CREATE TABLE IF NOT EXISTS `student`(
    	`id` INT(4) NOT NULL AUTO_INCREMENT COMMENT 'student id',
    	`name` VARCHAR(30) NOT NULL DEFAULT 'Anonymous' COMMENT 'student name',
    	`pwd` VARCHAR(20) NOT NULL DEFAULT '000000' COMMENT 'passworc',
    	`gender` VARCHAR(7) NOT NULL DEFAULT 'female' COMMENT 'gender',
    	`birthday` DATETIME DEFAULT NULL COMMENT 'birthday',
    	`address` VARCHAR(100) DEFAULT NULL COMMENT 'home address',
    	`email` VARCHAR(500) DEFAULT NULL COMMENT 'email address',
    	PRIMARY KEY(`id`)
    )ENGINE = INNODB DEFAULT CHARSET=utf8;
    ```

### 查看

- 查看一个已有DB或table 的`create`语句

    ```sql
    SHOW CREATE DATABASE school; --DB
    SHOW CREATE TABLE `student`; --Table
    ```

- 查看一个table的结构（feature，attribute）

    ```sql
    DESC student;
    ```

- [ ]  [P1010、MyISAM和InnoDB区别18:21](https://www.bilibili.com/video/BV1NJ411J79W?p=10)

## 数据表的类型

- 所有的`ENGINE`

    ![%E3%80%90%E7%8B%82%E3%80%91MySQL%20d8996e76f4e14f6da3d24640c3cd349b/Untitled%209.png](%E3%80%90%E7%8B%82%E3%80%91MySQL%20d8996e76f4e14f6da3d24640c3cd349b/Untitled%209.png)

- 重要的两个类型：
    1. INNODB 默认
    2. MYISAM 早期使用

### INNODB vs. MYISAM

- INNODB：安全性高，支持事务处理，支持多表多用户操作，行锁定
- MYISAM：节约空间，较快

[INNODB vs. MYISAM](https://www.notion.so/9cd00b4b7651455f9dc88be667d64551)

### 物理空间存放位置

- 所有data 都存在`data` dir下，本质还是文件的存储

    文件夹对应database

    ![%E3%80%90%E7%8B%82%E3%80%91MySQL%20d8996e76f4e14f6da3d24640c3cd349b/Untitled%2010.png](%E3%80%90%E7%8B%82%E3%80%91MySQL%20d8996e76f4e14f6da3d24640c3cd349b/Untitled%2010.png)

- Engine在物理文件上的区别
    - `InnoDB`在数据库中只有一个`*.frm`文件，以及上一级目录下的`ibdata1` 文件中的数据
    - 如果用`MyISAM`创建table

        ![%E3%80%90%E7%8B%82%E3%80%91MySQL%20d8996e76f4e14f6da3d24640c3cd349b/Untitled%2011.png](%E3%80%90%E7%8B%82%E3%80%91MySQL%20d8996e76f4e14f6da3d24640c3cd349b/Untitled%2011.png)

        新建立了三个文件

        - `*.frm` 表结构定义文件
        - `*.MYD` MyISAM  data文件，data文件
        - `*.MYI` MyISAM index文件，索引文件

        ![%E3%80%90%E7%8B%82%E3%80%91MySQL%20d8996e76f4e14f6da3d24640c3cd349b/Untitled%2012.png](%E3%80%90%E7%8B%82%E3%80%91MySQL%20d8996e76f4e14f6da3d24640c3cd349b/Untitled%2012.png)

### 设置字符集编码

- 方法1
    - 建表的时候设置编码 `CHARSET=utf8`
    - 不设置，会是MySQL默认的`Latin1`编码，不支持中文
- 方法2
    - 其实还有另外一种解决办法，可以在`my.ini`中配置默认编码：

        ```sql
        character-set-server=utf8
        ```

    - 这种方法不太好，换到别人电脑不一定能运行

## 修改删除表

- [ ]  [P1111、修改和删除数据表字段11:08](https://www.bilibili.com/video/BV1NJ411J79W?p=11)

### 修改Table

- 改table名称：`ALTER TABLE 表名 RENAME AS 新表名`
- 增加一个column: `ALTER TABLE 表名 ADD 列名 列的类型`
- 修改一列
    - 修改列类型 `ALTER TABLE 表名 MODIFY 列名 列的类型`
    - 修改列名 `ALTER TABLE 表名 CHANGE 列名 新列名 列的类型`
- modify与change区别：
    - modify：只能改column类型和constraints，不能改column名
    - change：可以改column名，类型和constraints

        ```sql
        -- alter table name
        ALTER TABLE teacher RENAME AS teacher1;

        -- alter table to add another feature
        ALTER TABLE teacher1 ADD age INT(11);

        -- alter constraints of a feature
        ALTER TABLE teacher1 MODIFY age VARCHAR(11);

        -- rename a feature
        ALTER TABLE teacher1 CHANGE age age1 INT(11);
        ```

### 删除Table

- 删除最要用上[if exists]

    ```sql
    -- delete a feature
    ALTER TABLE teacher1 DROP age1;

    -- delete a table
    DROP TABLE IF EXISTS teacher1;
    ```

- [ ]  [P1212、数据库级别的外键20:59](https://www.bilibili.com/video/BV1NJ411J79W?p=12)

## MySQL数据管理1-外键

- 下面的两个方式，都是增加的物理Foreign Key，DB级别的foreign key, 不建议使用
    - 建表的时候麻烦
    - 删除delete, 更新update的时候麻烦
    - 避免DB太多造成困扰
- 最佳实践：
    - DB的table就是单纯的table，只用来存数据（行，列），无foreign key （阿里手册定下了）
    - 若想使用foreign key, 用程序去实现

### 添加FK方式1：创建table的时候，增加constraint（foreign key）

- 约束constraints

    ![%E3%80%90%E7%8B%82%E3%80%91MySQL%20d8996e76f4e14f6da3d24640c3cd349b/Untitled%2013.png](%E3%80%90%E7%8B%82%E3%80%91MySQL%20d8996e76f4e14f6da3d24640c3cd349b/Untitled%2013.png)

- SQL query
    - 根据指定列添加foreign key `KEY `FK_gradeid` (`gradeid`)`
    - 添加constraint-指定那个列是key, 指引到which table which col `CONSTRAINT `FK_gradeid` FOREIGN KEY (`gradeid`) REFERENCES `grade` (`gradeid`)`
    - foreign key一般命名由`FK_`开头

    ```sql
    -- --------------------- foreign key - method 1
    -- create table `grade`
    CREATE TABLE IF NOT EXISTS `grade` (
    	`gradeid` INT(10) NOT NULL AUTO_INCREMENT COMMENT 'grade id',
    	`gradename` VARCHAR(50) NOT NULL COMMENT 'grade name',
    	PRIMARY KEY (`gradeid`)
    )ENGINE=INNODB DEFAULT CHARSET = utf8;

    -- student gradeid引用 grade表的 gradeid
    -- 定义Foreign Key
    -- 给这个FK 添加constraint reference
    USE school;
    DROP TABLE IF EXISTS `student` ;
    CREATE TABLE IF NOT EXISTS `student`(
    	`id` INT(4) NOT NULL AUTO_INCREMENT COMMENT 'student id',
    	`name` VARCHAR(30) NOT NULL DEFAULT 'Anonymous' COMMENT 'student name',
    	`pwd` VARCHAR(20) NOT NULL DEFAULT '000000' COMMENT 'passworc',
    	`gender` VARCHAR(7) NOT NULL DEFAULT 'female' COMMENT 'gender',
    	`birthday` DATETIME DEFAULT NULL COMMENT 'birthday',
    	`address` VARCHAR(100) DEFAULT NULL COMMENT 'home address',
    	`email` VARCHAR(500) DEFAULT NULL COMMENT 'email address',
    	`gradeid` INT(10) NOT NULL COMMENT 'student grade',
    	PRIMARY KEY(`id`),
    	KEY `FK_gradeid` (`gradeid`),
    	CONSTRAINT `FK_gradeid` FOREIGN KEY (`gradeid`) REFERENCES `grade` (`gradeid`)
    )ENGINE = INNODB DEFAULT CHARSET=utf8;
    ```

- 对照UI：

    ![%E3%80%90%E7%8B%82%E3%80%91MySQL%20d8996e76f4e14f6da3d24640c3cd349b/Untitled%2014.png](%E3%80%90%E7%8B%82%E3%80%91MySQL%20d8996e76f4e14f6da3d24640c3cd349b/Untitled%2014.png)

### 添加FK方式1：创建table之后，增加constraint（foreign key）

- 代码
    - 创建两个table without FK
    - 通过`alter table` 添加FK：`ALTER TABLE 表名 ADD CONSTRAINT `FK_名称` FOREIGN KEY (列) REFERENCES `另一表名` (`列`);`

    ```sql
    -- --------------------- foreign key - method 2
    -- create table `grade`
    USE school;
    DROP TABLE IF EXISTS `grade` ;
    CREATE TABLE IF NOT EXISTS `grade` (
    	`gradeid` INT(10) NOT NULL AUTO_INCREMENT COMMENT 'grade id',
    	`gradename` VARCHAR(50) NOT NULL COMMENT 'grade name',
    	PRIMARY KEY (`gradeid`)
    )ENGINE=INNODB DEFAULT CHARSET = utf8;

    -- create table `student` without FK
    DROP TABLE IF EXISTS `student` ;
    CREATE TABLE IF NOT EXISTS `student`(
    	`id` INT(4) NOT NULL AUTO_INCREMENT COMMENT 'student id',
    	`name` VARCHAR(30) NOT NULL DEFAULT 'Anonymous' COMMENT 'student name',
    	`pwd` VARCHAR(20) NOT NULL DEFAULT '000000' COMMENT 'passworc',
    	`gender` VARCHAR(7) NOT NULL DEFAULT 'female' COMMENT 'gender',
    	`birthday` DATETIME DEFAULT NULL COMMENT 'birthday',
    	`address` VARCHAR(100) DEFAULT NULL COMMENT 'home address',
    	`email` VARCHAR(500) DEFAULT NULL COMMENT 'email address',
    	`gradeid` INT(10) NOT NULL COMMENT 'student grade',
    	PRIMARY KEY(`id`)
    )ENGINE = INNODB DEFAULT CHARSET=utf8;

    -- add constraint FK
    ALTER TABLE `student` ADD CONSTRAINT `FK_gradeid` FOREIGN KEY (`gradeid`) REFERENCES `grade` (`gradeid`)
    ```

### 删除reference table

- 无法直接删除被其他table的foreign key引用的table

    ![%E3%80%90%E7%8B%82%E3%80%91MySQL%20d8996e76f4e14f6da3d24640c3cd349b/Untitled%2015.png](%E3%80%90%E7%8B%82%E3%80%91MySQL%20d8996e76f4e14f6da3d24640c3cd349b/Untitled%2015.png)

- 若要删除，这里可以先删除student table，然后就可以删除grade table了
- 即，先删除引用别人的表-从表，然后再删除被别人引用的表-主表

## MySQL数据管理2-DML语言

要背下来

### 数据库意义

存储，管理data

### DML语言

- data manipulation language
- 包括：insert, update, delete

- [ ]  [P1313、Insert语句详解14:44](https://www.bilibili.com/video/BV1NJ411J79W?p=13)

### 添加insert

- 语法

    ```sql
    -- grammar:
    INSERT INTO 表名([col1,col2,col3]) VALUES('value1'), ('value2'), ('value3')

    -- 插入一列一行
    INSERT INTO `grade` (`gradename`) VALUES ('大四');

    -- 插入一列，多行
    INSERT INTO `grade` (`gradename`) VALUES ('大一'),('大二');

    -- 插入一行，多列
    INSERT INTO `student` (`name`,`gradeid`) VALUES ('张三', '1');

    -- 插入多行，多列
    INSERT INTO `student` (`name`,`gradeid`,`gender`) VALUES ('李四', '1','male'), ('王五', '2','male');

    -- value一一对应，可以省略column name
    INSERT INTO `student` VALUES (4,'李四四','123456', 'male','2020-01-01','beijing','ee@gmail.com','2');
    ```

    ![%E3%80%90%E7%8B%82%E3%80%91MySQL%20d8996e76f4e14f6da3d24640c3cd349b/Untitled%2016.png](%E3%80%90%E7%8B%82%E3%80%91MySQL%20d8996e76f4e14f6da3d24640c3cd349b/Untitled%2016.png)

    ![%E3%80%90%E7%8B%82%E3%80%91MySQL%20d8996e76f4e14f6da3d24640c3cd349b/Untitled%2017.png](%E3%80%90%E7%8B%82%E3%80%91MySQL%20d8996e76f4e14f6da3d24640c3cd349b/Untitled%2017.png)

- 注意事项
    - value 一一对应的时候，可以省略column name
    - 一行数据在一个()里，多行形如(), (), (), ...

### update

- 语法&例子

    ```sql
    -- ---------------DML-update
    -- 语法
    UPDATE 表名 SET column_name = 'content' WHERE 条件(大于，小于，等于，在~之间);

    -- 根据条件修改行
    UPDATE `student` SET `birthday`='2000-01-01' WHERE id = 1;

    -- 不指定条件，会改动所有行
    UPDATE `student` SET `gender`='female';

    -- 修改多个属性
    UPDATE `student` SET `birthday`='2000-01-01', `email` = 'ggg@gmail.com' WHERE id = 1;
    ```

- 注意：
    - 列可以加上````
    - 没有指定，会修改所有的行
    - set后面可以设置 variable，函数，或者具体值
- 操作符
    - =
    - <> 或 !=
    - >=, >, <. <=
    - `BETWEEN a AND b` , 包含a, b, 比如 `where id BETWEEN 2 AND 5`
    - AND
    - OR

- [ ]  [P1414、Update语句详解17:20](https://www.bilibili.com/video/BV1NJ411J79W?p=14)
- [ ]  [P1515、Delete和Truncate详解12:06](https://www.bilibili.com/video/BV1NJ411J79W?p=15)

### delete

- 语法&例子

    ```sql
    DELETE FROM 表名 [WHERE 条件]

    -- 这样会全删。不要这样做
    DELETE FROM `student`

    -- 删除指定数据
    DELETE FROM `student` WHERE id=1;

    -- ---------------DML-truncate
    TRUNCATE `student`;
    ```

- truncate 与 delete 删除全表时 - 区别
    - truncate会重新设置自增列，计数器归零，不会影响事务
    - 用delete删除所有行之后，自增列不会重置，会接着往下走

        ```sql
        CREATE TABLE `test`(
        	`id` INT(4) NOT NULL AUTO_INCREMENT,
        	`col1` VARCHAR(20) NOT NULL,
        	PRIMARY KEY (`id`)
        )ENGINE=INNODB DEFAULT CHARSET=utf8;

        -- test delete
        INSERT INTO `test`(`col1`) VALUES('1'),('2'),('3');
        DELETE FROM `test`;
        INSERT INTO `test`(`col1`) VALUES('1'),('2'),('3');

        -- test truncate
        TRUNCATE TABLE `test`;
        INSERT INTO `test`(`col1`) VALUES('1'),('2'),('3');
        ```

        ![%E3%80%90%E7%8B%82%E3%80%91MySQL%20d8996e76f4e14f6da3d24640c3cd349b/Untitled%2018.png](%E3%80%90%E7%8B%82%E3%80%91MySQL%20d8996e76f4e14f6da3d24640c3cd349b/Untitled%2018.png)

        ![%E3%80%90%E7%8B%82%E3%80%91MySQL%20d8996e76f4e14f6da3d24640c3cd349b/Untitled%2019.png](%E3%80%90%E7%8B%82%E3%80%91MySQL%20d8996e76f4e14f6da3d24640c3cd349b/Untitled%2019.png)

- 用完delete，重启数据库后的 现象:
    - InnoDB: 自增列从1开始 （因为自增 是在内存中的，断电即失）（但是这个好像8.0版本修复了）
    - MyISAM：继续从上一个自增量开始（子增量存在文件中，不会丢失）

## MySQL数据管理3-DQL语言

### DQL

- data query language 数据查询语言
- 所有查询操作都用它，数据库中最核心的语言
- 使用频率最高

- [ ]  [P1616、基本的Select语句和别名使用12:27](https://www.bilibili.com/video/BV1NJ411J79W?p=16)

### 指定查询column（简单查询）

- 注意可以给table, column起别名
- select 表达式 from 表

```sql
-- all students
SELECT * FROM student;

-- selected columns
SELECT `studentname`,`sex` FROM `student`;

-- us other name, 可以给table， column， 结果 起别名
SELECT `studentname` AS `name`,`sex` AS gender FROM `student` ;

-- 函数 concat 拼接string
SELECT CONCAT('name:',`studentname`) AS new_name FROM student;

```

- [ ]  [P1717、去重及据库的表达式08:50](https://www.bilibili.com/video/BV1NJ411J79W?p=17)

### 去重

- 去除select查询出来的结果中重复的data，重复的只保留一行

    ```sql
    SELECT DISTINCT `studentno` FROM result;
    ```

### select可以查询的内容

- 文本值，列，null，函数，计算表达式，系统变量

```sql
-- select system version of mysql（函数）
SELECT VERSION();

-- calculator（表达式）
SELECT 100*3-1 AS result; 

-- 查询自增的步长（变量）
SELECT @@auto_increment_increment;

-- 比如，grade +1
SELECT `studentno`, `studentresult`+1 AS '提分后' FROM result;
```

- [ ]  [P1818、Where子句之逻辑运算符09:49](https://www.bilibili.com/video/BV1NJ411J79W?p=18)

### where

- 检索符合条件的value
- 例子

    ```sql
    -- and
    SELECT studentno, studentresult 
    FROM result
    WHERE studentresult>=95 AND studentresult <=100;

    -- &&
    SELECT studentno, studentresult 
    FROM result
    WHERE studentresult>=95 && studentresult <=100;

    -- between and 
    SELECT studentno, studentresult 
    FROM result
    WHERE studentresult BETWEEN 95 AND 100;

    -- !=
    SELECT studentno, studentresult 
    FROM result
    WHERE studentresult !=98;

    -- not
    SELECT studentno, studentresult 
    FROM result
    WHERE NOT studentresult =98;
    ```

### 逻辑运算符

- `and` `&&` True, True → True  True, False → False
- `or` `||` True, False → True
- `not` `!`

### 比较运算符

均返回T/F

- `is null`  a is null
- `is not null`  a is not null
- `between` a between b and c， 若a在b，c之间，T
- `like` a like b 若a匹配b，T
- `in`  a in (a1, a2, a3, ...) 若a在后面的value中, T

- [ ]  [P1919、模糊查询操作符详解15:53](https://www.bilibili.com/video/BV1NJ411J79W?p=19)

### 模糊查询

- like
    - `%` 代表0或多个字符
    - `_` 精准的一个字符

    ```sql
    -- 赵某某
    SELECT `studentno`, `studentname`
    FROM `student`
    WHERE studentname LIKE '赵_';

    -- 赵某
    SELECT `studentno`, `studentname`
    FROM `student`
    WHERE studentname LIKE '赵__';

    -- 赵开头的
    SELECT `studentno`, `studentname`
    FROM `student`
    WHERE studentname LIKE '赵%';

    -- 名字中带有伟的
    SELECT `studentno`, `studentname`
    FROM `student`
    WHERE studentname LIKE '%伟%';
    ```

- in
    - 注意`（）` 中的必须是精确的，不能使用`%`或者`_`

    ```sql
    -- ----------------模糊查询in
    -- 查询1000，1002，1003的学员
    SELECT `studentno`, `studentname`
    FROM `student`
    WHERE studentno IN (1000,1002,1003);

    -- 查询gradeid为1或2的科目
    SELECT `subjectname`, `classhour`, gradeid
    FROM `subject`
    WHERE gradeid IN (1,2)
    ```

- not null

    ```sql
    -- address为空
    SELECT studentno, studentname, address FROM student
    WHERE address = '' OR address IS NULL;

    -- 出生日期不为空
    SELECT studentno, studentname, borndate FROM student
    WHERE borndate IS NOT NULL;
    ```

- [ ]  [P2020、联表查询JoinON详解28:56](https://www.bilibili.com/video/BV1NJ411J79W?p=20)

### join

- 思路：
    1. 分析需求，看查询的内容来自于哪些表（如果超过一张表，需要join）
    2. 使用哪种join？哪些是共用的列？
    3. 如果多张表，慢慢来，从先join两张表开始
- 例子

    ![%E3%80%90%E7%8B%82%E3%80%91MySQL%20d8996e76f4e14f6da3d24640c3cd349b/Untitled%2020.png](%E3%80%90%E7%8B%82%E3%80%91MySQL%20d8996e76f4e14f6da3d24640c3cd349b/Untitled%2020.png)

    ![%E3%80%90%E7%8B%82%E3%80%91MySQL%20d8996e76f4e14f6da3d24640c3cd349b/Untitled%2021.png](%E3%80%90%E7%8B%82%E3%80%91MySQL%20d8996e76f4e14f6da3d24640c3cd349b/Untitled%2021.png)

    ![%E3%80%90%E7%8B%82%E3%80%91MySQL%20d8996e76f4e14f6da3d24640c3cd349b/Untitled%2022.png](%E3%80%90%E7%8B%82%E3%80%91MySQL%20d8996e76f4e14f6da3d24640c3cd349b/Untitled%2022.png)

    ![%E3%80%90%E7%8B%82%E3%80%91MySQL%20d8996e76f4e14f6da3d24640c3cd349b/Untitled%2023.png](%E3%80%90%E7%8B%82%E3%80%91MySQL%20d8996e76f4e14f6da3d24640c3cd349b/Untitled%2023.png)

### join方式总结

- left/right: 显示这张table全部，即使另一张没有匹配

![%E3%80%90%E7%8B%82%E3%80%91MySQL%20d8996e76f4e14f6da3d24640c3cd349b/Untitled%2024.png](%E3%80%90%E7%8B%82%E3%80%91MySQL%20d8996e76f4e14f6da3d24640c3cd349b/Untitled%2024.png)

![%E3%80%90%E7%8B%82%E3%80%91MySQL%20d8996e76f4e14f6da3d24640c3cd349b/Untitled%2025.png](%E3%80%90%E7%8B%82%E3%80%91MySQL%20d8996e76f4e14f6da3d24640c3cd349b/Untitled%2025.png)

### 完整query

![%E3%80%90%E7%8B%82%E3%80%91MySQL%20d8996e76f4e14f6da3d24640c3cd349b/Untitled%2026.png](%E3%80%90%E7%8B%82%E3%80%91MySQL%20d8996e76f4e14f6da3d24640c3cd349b/Untitled%2026.png)

- [ ]  [P2121、自连接及联表查询练习18:11](https://www.bilibili.com/video/BV1NJ411J79W?p=21)

### 自连接

- 核心：把一张table拆成两张一样的table
- 例子
    - 如下，自己的id是categoryid, parent id 是自己所属类的id，也在同一张表里

        ![%E3%80%90%E7%8B%82%E3%80%91MySQL%20d8996e76f4e14f6da3d24640c3cd349b/Untitled%2027.png](%E3%80%90%E7%8B%82%E3%80%91MySQL%20d8996e76f4e14f6da3d24640c3cd349b/Untitled%2027.png)

    - 若想查对应关系：需要自连接

        ![%E3%80%90%E7%8B%82%E3%80%91MySQL%20d8996e76f4e14f6da3d24640c3cd349b/Untitled%2028.png](%E3%80%90%E7%8B%82%E3%80%91MySQL%20d8996e76f4e14f6da3d24640c3cd349b/Untitled%2028.png)

        ![%E3%80%90%E7%8B%82%E3%80%91MySQL%20d8996e76f4e14f6da3d24640c3cd349b/Untitled%2029.png](%E3%80%90%E7%8B%82%E3%80%91MySQL%20d8996e76f4e14f6da3d24640c3cd349b/Untitled%2029.png)

- [ ]  [P2222、分页和排序15:06](https://www.bilibili.com/video/BV1NJ411J79W?p=22)

### 排序orderby

- 排序
    - `ASC` `DESC`
- 例子

    ![%E3%80%90%E7%8B%82%E3%80%91MySQL%20d8996e76f4e14f6da3d24640c3cd349b/Untitled%2030.png](%E3%80%90%E7%8B%82%E3%80%91MySQL%20d8996e76f4e14f6da3d24640c3cd349b/Untitled%2030.png)

### 分页limit

- `limit a, b`
    - `a`从第几行开始（min 0），`b`显示几行
    - limit 6，5 代表从第7行开始的，显示往后的5行
- 例子

    ![%E3%80%90%E7%8B%82%E3%80%91MySQL%20d8996e76f4e14f6da3d24640c3cd349b/Untitled%2031.png](%E3%80%90%E7%8B%82%E3%80%91MySQL%20d8996e76f4e14f6da3d24640c3cd349b/Untitled%2031.png)

    ![%E3%80%90%E7%8B%82%E3%80%91MySQL%20d8996e76f4e14f6da3d24640c3cd349b/Untitled%2032.png](%E3%80%90%E7%8B%82%E3%80%91MySQL%20d8996e76f4e14f6da3d24640c3cd349b/Untitled%2032.png)

- 页面设计

    ![%E3%80%90%E7%8B%82%E3%80%91MySQL%20d8996e76f4e14f6da3d24640c3cd349b/Untitled%2033.png](%E3%80%90%E7%8B%82%E3%80%91MySQL%20d8996e76f4e14f6da3d24640c3cd349b/Untitled%2033.png)

- 也可以设计成瀑布流

- [ ]  [P2323、子查询和嵌套查询25:28](https://www.bilibili.com/video/BV1NJ411J79W?p=23)

### 子查询

- 若where 后面的值是需要计算出来的，需要再嵌套一个子查询语句
- 形如 `where(select ...)`
- 目前观察到的，where 返回的 是单feature 的序列，之前配合用 in
- 例子

    ```sql
    -- 原始：找到高等数学科目的学生成绩和科目
    SELECT studentno, subjectname, studentresult
    FROM result r
    INNER JOIN SUBJECT sub
    ON r.`subjectno` = sub.`subjectno`
    WHERE subjectname LIKE '高等数学%'
    ORDER BY studentresult DESC;

    -- sub query 方法（注意用in）
    SELECT studentno, subjectno, studentresult
    FROM result
    WHERE subjectno IN (
    	SELECT subjectno
    	FROM `subject`
    	WHERE subjectname LIKE '高等数学%'
    )
    ORDER BY studentresult DESC;
    ```

    ![%E3%80%90%E7%8B%82%E3%80%91MySQL%20d8996e76f4e14f6da3d24640c3cd349b/Untitled%2034.png](%E3%80%90%E7%8B%82%E3%80%91MySQL%20d8996e76f4e14f6da3d24640c3cd349b/Untitled%2034.png)

    ![%E3%80%90%E7%8B%82%E3%80%91MySQL%20d8996e76f4e14f6da3d24640c3cd349b/Untitled%2035.png](%E3%80%90%E7%8B%82%E3%80%91MySQL%20d8996e76f4e14f6da3d24640c3cd349b/Untitled%2035.png)

- [ ]  [P2424、MySQL常用函数23:41](https://www.bilibili.com/video/BV1NJ411J79W?p=24)

### 常用函数

- Ref: [https://dev.mysql.com/doc/refman/5.7/en/sql-function-reference.html](https://dev.mysql.com/doc/refman/5.7/en/sql-function-reference.html)

```sql
-- math
SELECT ABS(-8);
SELECT CEILING(9.3); -- 向上取整,10
SELECT FLOOR(9.6); -- 向下取整,9
SELECT RAND(); -- 返回一个 0~1 随机数
SELECT SIGN(-3); -- 符号，-1负数，0为0，1正数

-- string
SELECT CHAR_LENGTH("this is an example"); -- 18
SELECT CHAR_LENGTH("再小的帆也能远航"); -- 8
SELECT CONCAT("我","爱","你们"); -- 拼接
SELECT INSERT('12345678',2,3,'abcd'); -- 1abcd5678, 从位置2开始，用后面的string（abcd）替换掉之前3个字符（234）
SELECT LOWER('KuangShen');
SELECT UPPER('KuangShen');
SELECT INSTR('13aasdoi123','3'); -- 第一次出现指定字符3的位置：2
SELECT REPLACE("坚持就能成功，坚持吧","坚持",'努力'); -- ‘努力就能成功，努力吧’替换所有指定string 为后面的string
SELECT SUBSTR('abcde',2,3); -- 起始位置，截取长度
SELECT REVERSE("坚持就能成功"); -- 倒序string

-- example
SELECT * FROM student
WHERE studentname LIKE '赵%';

-- 可以对一个结果进行操作
SELECT REPLACE(studentname,'赵','藻')
FROM student
WHERE studentname LIKE '赵%';

-- 可以对多行进行操作，类似apply
SELECT REPLACE(studentname,'赵','藻')
FROM student;

-- 日期，时间
SELECT CURRENT_DATE(); -- 2021-05-05
SELECT CURDATE(); -- 2021-05-05
SELECT NOW(); -- 2021-05-05 13:32:27
SELECT LOCALTIME(); -- 2021-05-05 13:32:27
SELECT SYSDATE(); -- 2021-05-05 13:33:07
SELECT YEAR(NOW()); 
SELECT MONTH(NOW()); 
SELECT DAY(NOW()); 
SELECT HOUR(NOW()); 
SELECT MINUTE(NOW()); 
SELECT SECOND(NOW()); 

-- system
SELECT SYSTEM_USER(); -- root@localhost
SELECT USER(); -- root@localhost
SELECT VERSION();
```

- [ ]  [P2525、聚合函数及分组过滤13:41](https://www.bilibili.com/video/BV1NJ411J79W?p=25)

### 聚合函数

- count(), sum(), avg(), max(), min(), ...
- 基础理解

    ```sql
    -- 统计行数
    SELECT COUNT(studentname) FROM student; -- 一般作用在PK上，最快，但会忽略该列的null值,只会计数非null的行数
    SELECT COUNT(*) FROM student; -- null也会计数，计算行数，走所有的列
    SELECT COUNT(1) FROM student; -- null也会计数，计算行数，按行走，把一行当成1(?)，较快

    -- 基本应用
    SELECT SUM(studentresult) AS 总分 FROM result;
    SELECT AVG(studentresult) AS 均分 FROM result;
    SELECT MAX(studentresult) AS 最高分 FROM result;
    SELECT MIN(studentresult) AS 最低分 FROM result;
    ```

- 分组
    - 理解顺序：最先进行join，然后先分组-groupby，然后每组聚合-select, 最后筛选-having，所以having可以识别select重命名的列

    ![%E3%80%90%E7%8B%82%E3%80%91MySQL%20d8996e76f4e14f6da3d24640c3cd349b/Untitled%2036.png](%E3%80%90%E7%8B%82%E3%80%91MySQL%20d8996e76f4e14f6da3d24640c3cd349b/Untitled%2036.png)

- [ ]  [P2626、拓展之数据库级别的MD5加密11:19](https://www.bilibili.com/video/BV1NJ411J79W?p=26)

### DB级别MD5加密

- md5, 第五代，不可逆，具体的md5值

    ```sql
    -- 新建DB
    CREATE TABLE `testmd5`(
    	`id` INT(4) NOT NULL,
    	`name` VARCHAR(20) NOT NULL,
    	`pwd` VARCHAR(50) NOT NULL,
    	PRIMARY KEY(`id`)
    )ENGINE = INNODB DEFAULT CHARSET = utf8;

    -- 加行
    INSERT INTO testmd5 VALUES (1, '张三','123456'),(2, '李四','123456'),(3, '王五','123456');

    -- 加密
    -- update testmd5 set pwd=MD5(pwd) where id=1;
    UPDATE testmd5 SET pwd=MD5(pwd);

    -- 插入时加密
    INSERT INTO testmd5 VALUES(4,'jessy',MD5('123456'));

    -- 校验：对比加密后的值
    SELECT * FROM testmd5 WHERE `name`='jessy' AND pwd = MD5('123456');
    ```

- 一般直接存MD5加密后的密码，核对密码的时候，用 `where user=input_user AND pwd = MD5(input_pwd)` 来查身分

- [ ]  [P2727、Select小结06:44](https://www.bilibili.com/video/BV1NJ411J79W?p=27)

### select小结

![%E3%80%90%E7%8B%82%E3%80%91MySQL%20d8996e76f4e14f6da3d24640c3cd349b/Untitled%2037.png](%E3%80%90%E7%8B%82%E3%80%91MySQL%20d8996e76f4e14f6da3d24640c3cd349b/Untitled%2037.png)

## 事务

- [ ]  [P2828、事务ACID原则、脏读、不可重复读、幻读12:34](https://www.bilibili.com/video/BV1NJ411J79W?p=28)

### 事务Transaction

- 一组事务，要不都成功，要不都失败
- 比如转账, 最开始 A 1000, B 200
    - SQL1: A给B转200元，A → 800
    - SQL2: B收A的200元，B → 400
- 两个SQL必须放在同一个batch里，同生同灭，否则结果错误
- InnoDB支持事务，最新版的MySIAM也支持了（之前不支持）

### Transaction原则ACID

- **atomicity 原子性**

    要么都成功，要么都失败

- **consistency 一致性**

    一个transaction操作前后状态一致（数据完整性要保持一致），比如转账前后两账户资金总和相同

- **isolation 隔离性**

    针对多个用户同时操作的时候，多个transaction之间相互独立，互不干扰

- **durability 持久性**

    transaction结束后数据不随着外界原因导致数据丢失，transaction成功提交之前，保持之前的状态，能够恢复到提交之前，transaction 提交之后，不可逆了，持续位置到新的状态

### 可能发生的问题

- **脏读**
一个transaction 读取了另外1个transaction 未提交的数据

    ![%E3%80%90%E7%8B%82%E3%80%91MySQL%20d8996e76f4e14f6da3d24640c3cd349b/Untitled%2038.png](%E3%80%90%E7%8B%82%E3%80%91MySQL%20d8996e76f4e14f6da3d24640c3cd349b/Untitled%2038.png)

- **不可重复读**
多次读取数据的时候发现不一致，因为数据在更新之后读取的时候，发现数据改变了

    ![%E3%80%90%E7%8B%82%E3%80%91MySQL%20d8996e76f4e14f6da3d24640c3cd349b/Untitled%2039.png](%E3%80%90%E7%8B%82%E3%80%91MySQL%20d8996e76f4e14f6da3d24640c3cd349b/Untitled%2039.png)

- **幻读（虚读）**
一个transaction内读取了别的transaction插入的数据，导致前后不一致

    ![%E3%80%90%E7%8B%82%E3%80%91MySQL%20d8996e76f4e14f6da3d24640c3cd349b/Untitled%2040.png](%E3%80%90%E7%8B%82%E3%80%91MySQL%20d8996e76f4e14f6da3d24640c3cd349b/Untitled%2040.png)

- [ ]  [P2929、测试事务实现转账17:34](https://www.bilibili.com/video/BV1NJ411J79W?p=29)

### 执行transaction

- MySQL默认开启transaction自动提交，需要先关上`autocommit`(要不然第一个SQL 直接就执行了)
- 执行一个transaction流程：

    ```sql
    --  关闭自动commit
    SET autocommit = 0 -- 关闭

    --  transaction 开始
    START TRANSACTION -- 标记事务开启，表示同一组transaction，同生同灭

    INSERT ***
    INSERT ***

    -- 提交，持久化（陈工）
    COMMIT 

    -- 回滚，回到原来（失败）
    ROLLBACK 

    -- 回复自动commit
    SET autocommit = 1 -- 开启（默认）
    ```

- 设置保存点

    ```sql
    -- 中间的话可以保存
    SAVEPOINT 保存名称 -- 设置checkpoint
    ROLLBACK TO SAVEPOINT 保存名称 -- 回滚到保存点
    RELEASE SAVEPOINT 保存名称 -- 撤销保存点
    ```

- 模拟场景-转账
    - commit之前，也能看到db变化，但是不是真正的commit，rollback可以回到原点
    - 如果commit了，rollback就回不去了

    ```sql
    -- 转账
    SET autocommit =0;
    START TRANSACTION ;
    UPDATE `account` SET money = money-500 WHERE `name`='A';
    UPDATE `account` SET money = money+500 WHERE `name`='B';

    COMMIT;
    ROLLBACK;

    SET autocommit =1;
    ```

### transaction实操预览

- 实际是java方法可以调用
- 执行成功，commit，执行失败，rollback

    ![%E3%80%90%E7%8B%82%E3%80%91MySQL%20d8996e76f4e14f6da3d24640c3cd349b/Untitled%2041.png](%E3%80%90%E7%8B%82%E3%80%91MySQL%20d8996e76f4e14f6da3d24640c3cd349b/Untitled%2041.png)

- [ ]  [P3030、索引介绍及索引的分类16:13](https://www.bilibili.com/video/BV1NJ411J79W?p=30)

## Index

### index定义

- 索引index 是帮助MySQL 高效获取data 的数据结构
- 用index 会大幅加快search速度
- 结构：在某column上建立新的index，如下（不太懂，可以再看）

    ![%E3%80%90%E7%8B%82%E3%80%91MySQL%20d8996e76f4e14f6da3d24640c3cd349b/Untitled%2042.png](%E3%80%90%E7%8B%82%E3%80%91MySQL%20d8996e76f4e14f6da3d24640c3cd349b/Untitled%2042.png)

### Index分类

- Primary Key 主键索引
    - 唯一，一个表中只有一个Primary Key
- Unique Key 唯一索引
    - 避免重复的列出现，一个表中可以有多个Unique Key的列
- Key/Index 常规索引
    - 默认的，提高效率
- FullText 全文索引
    - 在特定数据库engine才有，MyISAM
    - 快速定位数据

### index创建

- 在创建表的时候，给column添加索引

    ![%E3%80%90%E7%8B%82%E3%80%91MySQL%20d8996e76f4e14f6da3d24640c3cd349b/Untitled%2043.png](%E3%80%90%E7%8B%82%E3%80%91MySQL%20d8996e76f4e14f6da3d24640c3cd349b/Untitled%2043.png)

- 创建表后，用`alter`增加索引
    - 空为默认的key索引

    ```sql
    alter table `school`.`student` add fulltext index `studentName`(`studentName`)
    ```

    ![%E3%80%90%E7%8B%82%E3%80%91MySQL%20d8996e76f4e14f6da3d24640c3cd349b/Untitled%2044.png](%E3%80%90%E7%8B%82%E3%80%91MySQL%20d8996e76f4e14f6da3d24640c3cd349b/Untitled%2044.png)

- 用create index 在表上添加

    一般命名为 `id_表名_列名`

    ```sql
    CREATE INDEX id_app_user_name ON app_user(`name`);
    ```

### 显示index

```sql
-- 显示table所有index
show index from student
```

![%E3%80%90%E7%8B%82%E3%80%91MySQL%20d8996e76f4e14f6da3d24640c3cd349b/Untitled%2045.png](%E3%80%90%E7%8B%82%E3%80%91MySQL%20d8996e76f4e14f6da3d24640c3cd349b/Untitled%2045.png)

### 增加一个全文索引FullText

- 第一个studentName是index名称，后面跟列名
- 默认的Primary Key 的名字就是Primary，所以不需要写括号前的

```sql
-- 添加index
alter table `school`.`student` add fulltext index `studentName`(`studentName`)
```

### 分析SQL执行状况

1. 非全文索引

    ```sql
    -- 分析SQL状况
    EXPLAIN SELECT * FROM student;
    ```

    ![%E3%80%90%E7%8B%82%E3%80%91MySQL%20d8996e76f4e14f6da3d24640c3cd349b/Untitled%2046.png](%E3%80%90%E7%8B%82%E3%80%91MySQL%20d8996e76f4e14f6da3d24640c3cd349b/Untitled%2046.png)

2. 全文索引

    ```sql
    EXPLAIN SELECT * FROM student WHERE MATCH(studentName) AGAINST('赵'); -- 非全文索引
    ```

    ![%E3%80%90%E7%8B%82%E3%80%91MySQL%20d8996e76f4e14f6da3d24640c3cd349b/Untitled%2047.png](%E3%80%90%E7%8B%82%E3%80%91MySQL%20d8996e76f4e14f6da3d24640c3cd349b/Untitled%2047.png)

    直接搜这一段select不出来

    ![%E3%80%90%E7%8B%82%E3%80%91MySQL%20d8996e76f4e14f6da3d24640c3cd349b/Untitled%2048.png](%E3%80%90%E7%8B%82%E3%80%91MySQL%20d8996e76f4e14f6da3d24640c3cd349b/Untitled%2048.png)

    ![%E3%80%90%E7%8B%82%E3%80%91MySQL%20d8996e76f4e14f6da3d24640c3cd349b/Untitled%2049.png](%E3%80%90%E7%8B%82%E3%80%91MySQL%20d8996e76f4e14f6da3d24640c3cd349b/Untitled%2049.png)

    （上面的不太懂）

- [ ]  [P3131、SQL编程创建100万条数据测试索引18:06](https://www.bilibili.com/video/BV1NJ411J79W?p=31)

### 测试索引

- 创建1M行数据
    - 注意`$$`开始，就要`$$`结束
    - 需要加`DETERMINISTIC`
    - select结果是1000000
    - 用时55秒

    ```sql
    CREATE TABLE `app_user` (
    `id` BIGINT(20) UNSIGNED NOT NULL AUTO_INCREMENT,
    `name` VARCHAR(50) DEFAULT '' COMMENT '用户昵称',
    `email` VARCHAR(50) NOT NULL COMMENT '用户邮箱',
    `phone` VARCHAR(20) DEFAULT '' COMMENT '手机号',
    `gender` TINYINT(4) UNSIGNED DEFAULT '0' COMMENT '性别（0：男;1:女）',
    `password` VARCHAR(100) NOT NULL COMMENT '密码',
    `age` TINYINT(4) DEFAULT '0'  COMMENT '年龄',
    `create_time` DATETIME DEFAULT CURRENT_TIMESTAMP,
    `update_time` TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    PRIMARY KEY (`id`)
    ) ENGINE=INNODB DEFAULT CHARSET=utf8 COMMENT ='app用户表';

    -- insert 1m rows
    DELIMITER $$ -- start func
    CREATE FUNCTION mock_data()
    RETURNS INT
    DETERMINISTIC
    BEGIN
    	DECLARE num INT DEFAULT 1000000;
    	DECLARE i INT DEFAULT 0;
    	WHILE i<num DO
    		-- insert SQL
    		INSERT INTO app_user(`name`,`email`,`phone`,`gender`,`password`,`age`)
    		VALUES(CONCAT('user_',i), 
    			'gg@gmail.com',
    			CONCAT('18',FLOOR(RAND()*899999999+100000000)), -- create a 9-digit num
    			FLOOR(RAND()*2), -- 0~2 生成 0 or 1 
    			UUID(), -- password
    			FLOOR(RAND()*100)
    			);
    		SET i = i+1;
    	END WHILE;
    	RETURN i;
    END $$
    SELECT mock_data();
    ```

    ![%E3%80%90%E7%8B%82%E3%80%91MySQL%20d8996e76f4e14f6da3d24640c3cd349b/Untitled%2050.png](%E3%80%90%E7%8B%82%E3%80%91MySQL%20d8996e76f4e14f6da3d24640c3cd349b/Untitled%2050.png)

- 普通查询测试
    - 查了992237行才找到
    - 单纯查询的速度减慢，0.970 sec

    ```sql
    SELECT * FROM app_user WHERE `name`='user_99999'; -- 开始慢了
    EXPLAIN SELECT * FROM app_user WHERE `name`='user_99999'; 
    ```

    ![%E3%80%90%E7%8B%82%E3%80%91MySQL%20d8996e76f4e14f6da3d24640c3cd349b/Untitled%2051.png](%E3%80%90%E7%8B%82%E3%80%91MySQL%20d8996e76f4e14f6da3d24640c3cd349b/Untitled%2051.png)

- 添加index之后再查询
    - 用时只有0.003 sec了！！！
    - 小数据量的时候，用处不大，大数据的时候，区分明显

    ```sql
    -- create index
    CREATE INDEX id_app_user_name ON app_user(`name`);
    SELECT * FROM app_user WHERE `name`='user_99999';
    ```

- [ ]  [P3232、索引原则和明日安排06:06](https://www.bilibili.com/video/BV1NJ411J79W?p=32)

### index原则

1. 索引不是越多越好
2. 不要对经常变动的column加index
3. 小数据量不需要加index
4. index一般加在常用来查询的column上

### index 的数据结构

- 默认，hash索引
- InnoDB默认的data structure是`BTREE` index

    ![%E3%80%90%E7%8B%82%E3%80%91MySQL%20d8996e76f4e14f6da3d24640c3cd349b/Untitled%2052.png](%E3%80%90%E7%8B%82%E3%80%91MySQL%20d8996e76f4e14f6da3d24640c3cd349b/Untitled%2052.png)

### 强烈推荐ref

[MySQL索引背后的数据结构及算法原理](https://www.notion.so/MySQL-d6e6fc493bf1477abe77d7bf1758857e)

- [https://blog.codinglabs.org/articles/theory-of-mysql-index.html](https://blog.codinglabs.org/articles/theory-of-mysql-index.html)

- [ ]  [P3333、数据库用户管理18:33](https://www.bilibili.com/video/BV1NJ411J79W?p=33)

## 用户管理

### 权限

- windows最高权限：admin
- linux最高权限：root

### SQL yog可视化管理

- user manager

    ![%E3%80%90%E7%8B%82%E3%80%91MySQL%20d8996e76f4e14f6da3d24640c3cd349b/Untitled%2053.png](%E3%80%90%E7%8B%82%E3%80%91MySQL%20d8996e76f4e14f6da3d24640c3cd349b/Untitled%2053.png)

- 创建user，选择权限

    ![%E3%80%90%E7%8B%82%E3%80%91MySQL%20d8996e76f4e14f6da3d24640c3cd349b/Untitled%2054.png](%E3%80%90%E7%8B%82%E3%80%91MySQL%20d8996e76f4e14f6da3d24640c3cd349b/Untitled%2054.png)

    ![%E3%80%90%E7%8B%82%E3%80%91MySQL%20d8996e76f4e14f6da3d24640c3cd349b/Untitled%2055.png](%E3%80%90%E7%8B%82%E3%80%91MySQL%20d8996e76f4e14f6da3d24640c3cd349b/Untitled%2055.png)

- 测试：点击file-new connection

    注意，虽然`localhost`和`127.0.0.1`意思都是主机，但是log in 的时候不能混填

- 删除：选中user，点击删除即可

    ![%E3%80%90%E7%8B%82%E3%80%91MySQL%20d8996e76f4e14f6da3d24640c3cd349b/Untitled%2056.png](%E3%80%90%E7%8B%82%E3%80%91MySQL%20d8996e76f4e14f6da3d24640c3cd349b/Untitled%2056.png)

### SQL实现user 管理

- user信息储存在mysql.user
- 本质：对user这张表增删改查

    ![%E3%80%90%E7%8B%82%E3%80%91MySQL%20d8996e76f4e14f6da3d24640c3cd349b/Untitled%2057.png](%E3%80%90%E7%8B%82%E3%80%91MySQL%20d8996e76f4e14f6da3d24640c3cd349b/Untitled%2057.png)

- user中的`%`代表所有ip都可以登录（帮助远程登录）
- create user

    ```sql
    --  create user (by pwd)
    CREATE USER kaikai IDENTIFIED BY 'root';
    ```

- old修改密码（8.0新版不行）

    ```sql
    -- update pwd of current user 
    SET PASSWORD = PASSWORD('root');

    -- update pwd for a given user
    SET PASSWORD FOR 'kaikai' = PASSWORD('root');
    ```

![%E3%80%90%E7%8B%82%E3%80%91MySQL%20d8996e76f4e14f6da3d24640c3cd349b/Untitled%2058.png](%E3%80%90%E7%8B%82%E3%80%91MySQL%20d8996e76f4e14f6da3d24640c3cd349b/Untitled%2058.png)

- new修改密码（8.0）

    ```sql
    -- alter user "root"@"localhost" identified by "new_pwd"
    ALTER USER 'kaikai' IDENTIFIED BY 'root';
    ```

- 重命名

    ```sql
    -- rename user
    RENAME USER kaikai TO kai;
    ```

- 授予全部权限，给所有的DB, table（不过还是没有root高）

    除了`GRANT` （授权给别人）的权限，其他都有（只有root默认有`GRANT`权限）

    ```sql
    GRANT ALL PRIVILEGES ON *.* TO kai;
    ```

- 查看指定user权限

    ```sql
    -- 查看指定user权限
    SHOW GRANTS FOR kai;

    -- 查看root权限（必须带有localhost）
    SHOW GRANTS FOR root@localhost;
    -- GRANT PROXY ON ''@'' TO 'root'@'localhost' WITH GRANT OPTION
    ```

- 注意权限分global, 和 DB级别

    ![%E3%80%90%E7%8B%82%E3%80%91MySQL%20d8996e76f4e14f6da3d24640c3cd349b/Untitled%2059.png](%E3%80%90%E7%8B%82%E3%80%91MySQL%20d8996e76f4e14f6da3d24640c3cd349b/Untitled%2059.png)

- 撤销权限

    撤销 哪些权限， 哪个DB的，给谁

    ```sql
    REVOKE ALL PRIVILEGES ON *.* FROM kai;
    ```

- 删除用户

    ```sql
    DROP USER kai;
    ```

- [ ]  [P3434、MySQL备份14:15](https://www.bilibili.com/video/BV1NJ411J79W?p=34)

## 基础MySQL备份

### 为什么备份

- 保证data不丢失（备份数据库）
- 数据转移的时候需要备份 （比如发给朋友）

### MySQL数据库备份的方式

1. 因为数据库都在物理磁盘上，可以把`/data` 上的数据拷贝
2. 用SQL可视化工具比如 SQLyog，右键export/backup 
3. CLI导出

### SQLyog备份

- 用SQL可视化工具比如 SQLyog，选中DB/table,右键export/backup

    ![%E3%80%90%E7%8B%82%E3%80%91MySQL%20d8996e76f4e14f6da3d24640c3cd349b/Untitled%2060.png](%E3%80%90%E7%8B%82%E3%80%91MySQL%20d8996e76f4e14f6da3d24640c3cd349b/Untitled%2060.png)

    导出的是SQL文件

    ![%E3%80%90%E7%8B%82%E3%80%91MySQL%20d8996e76f4e14f6da3d24640c3cd349b/Untitled%2061.png](%E3%80%90%E7%8B%82%E3%80%91MySQL%20d8996e76f4e14f6da3d24640c3cd349b/Untitled%2061.png)

### cli导入导出backup

- 备份

    使用命令行导出 `mysqldump`

    非常快！

    ```bash
    # mysqldump -h(host) -u(user) -p(password) (db) (table) > (path.sql)
    mysqldump -hlocalhost -uroot -proot nasdaq cov >C:/Users/sunka/export_cov.sql
    ```

- 加载备份
    1. 先登录mySQL：

        ```bash
        mysql -uroot -proot
        ```

    2. 选定db，进行导入

        ```sql
        use nasdaq;
        source C:\Users\sunka\export_nasdaq.sql;
        ```

    - 也可以

        ```sql
        mysql -u(user) -p(password) db < (path.sql)
        ```

- [ ]  [P3535、如何设计一个项目的数据库32:55](https://www.bilibili.com/video/BV1NJ411J79W?p=35)

## DB设计

### 为什么要设计DB

- 复杂的时候，需要设计
- 糟糕的DB设计
    - 数据redundancy，浪费储存空间
    - 如果物理foreign key设计有问题，可能insert，delete都很麻烦，还可能出现异常
    - 程序性能差
- 好的DB设计
    - 节省内存空间
    - 保证DB完整性，不设物理外键
    - 方便系统开发

### 软件开发中，关于DB的设计

1. 分析需求，分析业务和需要处理的DB的需求
2. 概要设计：设计关系图 E-R图

### 设计DB的步骤（blog例子）

1. 收集信息，分析需求
    - 需要user表（用户个人信息，用户权限）
    - 文章表，文章信息
    - 分类表（谁创建的，文章分类）
    - 友情链接表
    - 评论表
    - 自定义表（kuang'shen个人习惯，比如系统信息，某个关键的字，或者一些主column，只有两列：`key`, `value`）
    - 说说表（id，content, create time）
    - 粉丝表，谁粉了谁（可以用nosql实现，也可用mysql）

        ![%E3%80%90%E7%8B%82%E3%80%91MySQL%20d8996e76f4e14f6da3d24640c3cd349b/Untitled%2062.png](%E3%80%90%E7%8B%82%E3%80%91MySQL%20d8996e76f4e14f6da3d24640c3cd349b/Untitled%2062.png)

2. 标识entity（把需求落实到每个column）

    ```sql
    CREATE TABLE `user` (
      `id` INT(10) NOT NULL AUTO_INCREMENT COMMENT 'user id',
      `username` VARCHAR(60) NOT NULL COMMENT 'user name',
      `password` VARCHAR(60) NOT NULL COMMENT 'password',
      `sex` VARCHAR(2) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT 'sex',
      `age` INT(3) DEFAULT NULL COMMENT 'age',
      `signature` VARCHAR(200) DEFAULT NULL COMMENT 'signature',
      `open_id` VARCHAR(1000) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL COMMENT 'wechat id',
      `avator` VARCHAR(1000) DEFAULT NULL COMMENT 'address of image',
      PRIMARY KEY (`id`)
    ) ENGINE=INNODB DEFAULT CHARSET=utf8;

    CREATE TABLE `blog` (
      `id` INT(10) NOT NULL COMMENT 'blog id',
      `title` VARCHAR(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT 'blog title',
      `author_id` INT(10) NOT NULL COMMENT 'blog author(user id)',
      `category_id` INT(10) NOT NULL COMMENT 'blog category',
      `content` TEXT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT 'blog content',
      `create_time` DATETIME NOT NULL COMMENT 'create time',
      `update_time` DATETIME NOT NULL COMMENT 'update time',
      `love` INT(10) DEFAULT NULL COMMENT 'love number',
      PRIMARY KEY (`id`)
    ) ENGINE=INNODB DEFAULT CHARSET=utf8;

    CREATE TABLE `category` (
      `id` INT(10) NOT NULL COMMENT 'category id',
      `category_name` VARCHAR(30) NOT NULL COMMENT 'category name',
      `create_user_id` INT(10) NOT NULL COMMENT 'user id',
      PRIMARY KEY (`id`)
    ) ENGINE=INNODB DEFAULT CHARSET=utf8;

    CREATE TABLE `comment` (
      `id` INT(10) NOT NULL COMMENT 'comment id',
      `blog_id` INT(10) NOT NULL COMMENT 'blog id',
      `user_id` INT(10) NOT NULL COMMENT 'user id',
      `content` VARCHAR(2000) NOT NULL COMMENT 'comment content',
      `create_time` DATETIME NOT NULL COMMENT 'comment time',
      `user_id_parent` INT(10) NOT NULL COMMENT 'reply to whom',
      PRIMARY KEY (`id`)
    ) ENGINE=INNODB DEFAULT CHARSET=utf8;

    CREATE TABLE `followers` (
      `id` INT(10) NOT NULL,
      `user_id` INT(10) NOT NULL COMMENT 'followed, user_id',
      `follower_id` INT(10) NOT NULL COMMENT 'follower, user_id',
      PRIMARY KEY (`id`)
    ) ENGINE=INNODB DEFAULT CHARSET=utf8;

    CREATE TABLE `links` (
      `id` INT(10) NOT NULL COMMENT 'link id',
      `links` VARCHAR(50) NOT NULL COMMENT 'website',
      `href` VARCHAR(2000) NOT NULL COMMENT 'to link',
      `sort` INT(10) NOT NULL COMMENT 'sort',
      PRIMARY KEY (`id`)
    ) ENGINE=INNODB DEFAULT CHARSET=utf8;
    ```

3. entity之间的关系
    - user写blog
    - user创建category
    - user关注user
    - 友情链接：link
    - 评论：user-user-blog

- [ ]  [P3636、数据库的三大范式13:11](https://www.bilibili.com/video/BV1NJ411J79W?p=36)

## DB三大范式

### 为什么DB要规范化

- 信息重复
- 更新可能异常
- 插入异常-无法正常显示信息
- 删除异常-丢失有效信息

### 三大范式

规范数据库设计

- 第一范式 1NF
    - 要求每一列都是不可分的atom数据项
    - 错误例子

        ![%E3%80%90%E7%8B%82%E3%80%91MySQL%20d8996e76f4e14f6da3d24640c3cd349b/Untitled%2063.png](%E3%80%90%E7%8B%82%E3%80%91MySQL%20d8996e76f4e14f6da3d24640c3cd349b/Untitled%2063.png)

        修正

        ![%E3%80%90%E7%8B%82%E3%80%91MySQL%20d8996e76f4e14f6da3d24640c3cd349b/Untitled%2064.png](%E3%80%90%E7%8B%82%E3%80%91MySQL%20d8996e76f4e14f6da3d24640c3cd349b/Untitled%2064.png)

- 第二范式 2NF
    - 前提：满足第一范式
    - 每张表只描述一件事，确保每一列都跟primary key直接相关

        ![%E3%80%90%E7%8B%82%E3%80%91MySQL%20d8996e76f4e14f6da3d24640c3cd349b/Untitled%2065.png](%E3%80%90%E7%8B%82%E3%80%91MySQL%20d8996e76f4e14f6da3d24640c3cd349b/Untitled%2065.png)

- 第三范式 3NF
    - 前提：满足第一范式，第二范式
    - 确保每一列都跟primary key直接相关

        ![%E3%80%90%E7%8B%82%E3%80%91MySQL%20d8996e76f4e14f6da3d24640c3cd349b/Untitled%2066.png](%E3%80%90%E7%8B%82%E3%80%91MySQL%20d8996e76f4e14f6da3d24640c3cd349b/Untitled%2066.png)

### 规范&性能

- 关联查询的表不得超过三张（阿里）
- 考虑商业化的需求和目标（成本，用户体验）
- 关联表太多，query速度下降，性能不好
- 在考虑性能的时候，考虑一下规范性
- 有时故意给一些表添加redundancy的信息，从而变成单表查询
    - 比如在订单表中，添加所有商品信息
- 有时故意计算列，从大数据量降低为小数据量的查询
- 还可以增加index（但是index占内存）

### MySQL两个级别

- 业务级别MySQL：这里学习的
- 运维级别MySQL：架构原理，集群搭建，负载均衡，底层，总复制

## JDBC

- [ ]  [P3737、数据库驱动和JDBC08:30](https://www.bilibili.com/video/BV1NJ411J79W?p=37)

需要用Java操作DB，此时用到JDBC

### 数据库驱动

- 比如声卡，显卡需要安装驱动，DB也需要安装驱动
- APP通过驱动操作DB，这些驱动通过DB厂商提供

    ![%E3%80%90%E7%8B%82%E3%80%91MySQL%20d8996e76f4e14f6da3d24640c3cd349b/Untitled%2067.png](%E3%80%90%E7%8B%82%E3%80%91MySQL%20d8996e76f4e14f6da3d24640c3cd349b/Untitled%2067.png)

- 我们的程序会通过DB驱动与DB打交道

### JDBC

- SUN公司 为了简化 开发人员的（对DB统一）操作，提供了一个Java操作DB 的规范：JDBC
- 这些规范的实现，由具体的厂商实现
- 对于开发人员来说，只需要掌握JDBC接口的操作即可

    ![%E3%80%90%E7%8B%82%E3%80%91MySQL%20d8996e76f4e14f6da3d24640c3cd349b/Untitled%2068.png](%E3%80%90%E7%8B%82%E3%80%91MySQL%20d8996e76f4e14f6da3d24640c3cd349b/Untitled%2068.png)

### Dependencies

- java.sql
- javax.sql
- 还需要导入一个DB驱动包`mysql-connector-java-8.0.15.jar`
    - sql 下载：[https://downloads.mysql.com/archives/c-j/](https://downloads.mysql.com/archives/c-j/)
    - `mysql-connector-java` 版本要跟mysql一致

- [ ]  [P3838、第一个JDBC程序16:34](https://www.bilibili.com/video/BV1NJ411J79W?p=38)

### DB建立代码

```sql
CREATE DATABASE `jdbcStudy` CHARACTER SET utf8 COLLATE utf8_general_ci;

USE `jdbcStudy`;

CREATE TABLE `users`(
 `id` INT PRIMARY KEY,
 `NAME` VARCHAR(40),
 `PASSWORD` VARCHAR(40),
 `email` VARCHAR(60),
 birthday DATE
);

INSERT INTO `users`(`id`,`NAME`,`PASSWORD`,`email`,`birthday`)
VALUES(1,'zhangsan','123456','zs@sina.com','1980-12-04'),
(2,'lisi','123456','lisi@sina.com','1981-12-04'),
(3,'wangwu','123456','wangwu@sina.com','1979-12-04')
```

### 第一个JDBC程序

1. 创建普通项目（Java），一直next下去就好
2. 导入驱动包：
    1. project目录下新建`lib` dir
    2. dir中复制过来jar包 `mysql-connector-java-8.0.15.jar`
    3. 右键添加为lib

        ![%E3%80%90%E7%8B%82%E3%80%91MySQL%20d8996e76f4e14f6da3d24640c3cd349b/Untitled%2069.png](%E3%80%90%E7%8B%82%E3%80%91MySQL%20d8996e76f4e14f6da3d24640c3cd349b/Untitled%2069.png)

3. 测试代码

    ```sql
    package com.kaitan.lesson01;

    import java.sql.*;

    //my first jdbc program
    public class JdbcDemo1 {
        public static void main(String[] args) throws ClassNotFoundException, SQLException {
            //1. load jar(sql drive)
                //forName: Returns the Class object associated with the class
                //         or interface with the given string name
            //Class.forName("com.mysql.jdbc.Driver");//固定写法,加载drive，depreciated
            Class.forName("com.mysql.cj.jdbc.Driver");//固定写法,加载drive

            //2. user info, url
                //useUnicode: 支持中文编码
                //characterEncoding: 设置中文字符utf8
                //useSSL：安全连接
            String url = "jdbc:mysql://localhost:3306/jdbcstudy?useUnicode=true&characterEncoding=utf8&useSSL=false"; //true: exception
            String username="root";
            String password="root";

            //3. connect, returns db object
                // connection 代表 DB
            Connection connection = DriverManager.getConnection(url, username, password);

            //4. get sql object
            Statement statement = connection.createStatement();

            //5. use the sql object to execute sql, check result
                //statement.executeQuery/executeUpdate(delete/insert)
            String sql = "select * from users";
            ResultSet resultSet = statement.executeQuery(sql); //returned set, all results

            while(resultSet.next()){
                System.out.println("id="+resultSet.getObject("id"));
                System.out.println("name="+resultSet.getObject("NAME"));
                System.out.println("pwd="+resultSet.getObject("PASSWORD"));
                System.out.println("email="+resultSet.getObject("email"));
                System.out.println("birthday="+resultSet.getObject("birthday"));
                System.out.println("-----------------------");
            }

            //6. disconnect
            resultSet.close();
            statement.close();
            connection.close();
        }
    }
    ```

### Java代码流程

1. 加载drive
2. 连接DriverManager
3. 获取执行sql对象
4. 获得返回的result set
5. 释放连接

### 如果没法run，自行配置configuration

![%E3%80%90%E7%8B%82%E3%80%91MySQL%20d8996e76f4e14f6da3d24640c3cd349b/Untitled%2070.png](%E3%80%90%E7%8B%82%E3%80%91MySQL%20d8996e76f4e14f6da3d24640c3cd349b/Untitled%2070.png)

要认真核对project structure的下面的path和modules 的path （设置src为source）

![%E3%80%90%E7%8B%82%E3%80%91MySQL%20d8996e76f4e14f6da3d24640c3cd349b/Untitled%2071.png](%E3%80%90%E7%8B%82%E3%80%91MySQL%20d8996e76f4e14f6da3d24640c3cd349b/Untitled%2071.png)

- [ ]  [P3939、JDBC中对象解释14:51](https://www.bilibili.com/video/BV1NJ411J79W?p=39)

### JDBC对象解释

1. 为什么`Class.forName("com.mysql.cj.jdbc.Driver");` 不用返回对象？
    - 后面不需要用到这个class类进行操作
2. `Class.forName("com.mysql.cj.jdbc.Driver");` 作用？
    - 加载驱动，放到class模板里即可，相当于激活他，拿到静态代码
    - 等价于`DriverManager.registerDriver(new com.mysql.cj.jdbc.Driver());`

        创建类的时候，下面的static代码块已经运行，不需要再重复运行了

        上面的代码等于注册了两次(new的时候，注册的时候各一次)

        直接forName就好了，执行一次

        ```sql

        // static code
        public class Driver extends NonRegisteringDriver implements java.sql.Driver {
            public Driver() throws SQLException {
            }

            static {
                try {
                    DriverManager.registerDriver(new Driver());
                } catch (SQLException var1) {
                    throw new RuntimeException("Can't register driver!");
                }
            }
        }
        ```

3. url组成 `jdbc:mysql://主机地址:端口号/DB?param1&param2&param3`
    - useUnicode=true&characterEncoding=utf8&useSSL=false
    - jdbc:mysql 类似 http
    - [localhost:3306](http://localhost:3306) 类似 www.baidu.com
    - DB_name?param1&param2&param3...

    ```java
    String url = "jdbc:mysql://localhost:3306/jdbcstudy?useUnicode=true&characterEncoding=utf8&useSSL=false"; //true: exception
    ```

4. mysql 与 oracle驱动写法不一样
    - 都遵循 `协议://主机地址:端口号/数据库名？参数1`

    ```java
    // oracle
    String url = "jdbc:oracle:thin:@localhost:1521:sid" 
    //端口号是1521，里面没有DB，全是table

    // mysql
    String url = "jdbc:mysql://localhost:3306/jdbcstudy?useUnicode=true&characterEncoding=utf8&useSSL=false"; //true: exception
    ```

5. connection代表DB

    ```java
    Connection connection = DriverManager.getConnection(url, username, password);
    ```

    - DB级别可以设置自动提交，transaction commit, rollback等

        ```java
        connection.rollback();
        connection.commit();
        connection.setAutoCommit();
        ```

        ![%E3%80%90%E7%8B%82%E3%80%91MySQL%20d8996e76f4e14f6da3d24640c3cd349b/Untitled%2072.png](%E3%80%90%E7%8B%82%E3%80%91MySQL%20d8996e76f4e14f6da3d24640c3cd349b/Untitled%2072.png)

        ![%E3%80%90%E7%8B%82%E3%80%91MySQL%20d8996e76f4e14f6da3d24640c3cd349b/Untitled%2073.png](%E3%80%90%E7%8B%82%E3%80%91MySQL%20d8996e76f4e14f6da3d24640c3cd349b/Untitled%2073.png)

6. statement类执行SQL

    ```java
    statement.executeQuery(); //查询，返回结果result set
    statement.execute();      //执行任何SQL，有判断过程，效率略低
    statement.executeUpdate();//update, insert, delete都可以，返回受影响的行数
    statement.executeBatch(); //批量处理SQL
    ```

7. 编写SQL，获得结果集（仅适用于query）
    - resultSet 封装了所有的query result

        ```java
        String sql = "select * from users";
        ResultSet resultSet = statement.executeQuery(sql); //returned set, all results
        ```

    - 获得指定的数据类型，按照列类型来获取

        如果直到列type, 用指定类型，不知道可以通用`getObject`

        ```java
        resultSet.getObject();
        resultSet.getString();
        resultSet.getDouble();
        resultSet.getInt();
        resultSet.getDate();
        resultSet.getFloat();
        ...
        ```

    - resultSet可以遍历，有指针，可以向前向后操作

        ```java
        resultSet.next(); //移动到下一个
        resultSet.previous();
        resultSet.beforeFirst();//移动到最前面
        resultSet.afterLast();//移动到最后面
        resultSet.absolute(row);//移动到指定行
        ```

8. 一定要释放资源，因为很占内存（especially connection）

    ```java
    resultSet.close();
    statement.close();
    connection.close();
    ```

- [ ]  [P4040、Statement对象详解23:55](https://www.bilibili.com/video/BV1NJ411J79W?p=40)

### statement对象解释

- jdbc中的statement 用于向DB发送SQL语句，进行增删改查

    ```java
    statement.executeQuery(); //查询，返回结果result set
    statement.execute();      //执行任何SQL，有判断过程，效率略低
    statement.executeUpdate();//update, insert, delete都可以，返回受影响的行数
    statement.executeBatch(); //批量处理SQL
    ```

- 增删改`executeUpdate`

    ![%E3%80%90%E7%8B%82%E3%80%91MySQL%20d8996e76f4e14f6da3d24640c3cd349b/Untitled%2074.png](%E3%80%90%E7%8B%82%E3%80%91MySQL%20d8996e76f4e14f6da3d24640c3cd349b/Untitled%2074.png)

    ![%E3%80%90%E7%8B%82%E3%80%91MySQL%20d8996e76f4e14f6da3d24640c3cd349b/Untitled%2075.png](%E3%80%90%E7%8B%82%E3%80%91MySQL%20d8996e76f4e14f6da3d24640c3cd349b/Untitled%2075.png)

- 查`executeQuery`

    ![%E3%80%90%E7%8B%82%E3%80%91MySQL%20d8996e76f4e14f6da3d24640c3cd349b/Untitled%2076.png](%E3%80%90%E7%8B%82%E3%80%91MySQL%20d8996e76f4e14f6da3d24640c3cd349b/Untitled%2076.png)

### 代码实现-提取工具类

1. 提取工具类
    - configuration file: `src/db.properties`

        ```java
        driver = com.mysql.cj.jdbc.Driver
        url=jdbc:mysql://localhost:3306/jdbcstudy?useUnicode=true&characterEncoding=utf8&useSSL=false
        username=root
        password=root
        ```

    - 工具类：`utils/JdbcUtils.java`
        - static块(最早加载)：
            1. 加载config文件`db.properties` 中的driver, url, username, password
            2. 加载SQL drive: `Class.forName(driver);`
        - 定义获取connection的function `getConnection()`：返回`DriverManager.getConnection(url, username, password)`
        - 定义释放资源的function：`release(Connection connection, Statement st, ResultSet rs)`

        ```java
        package com.kaitan.lesson02.utils;

        import java.io.IOException;
        import java.io.InputStream;
        import java.sql.*;
        import java.util.Properties;

        public class JdbcUtils {
            private static String driver = null;
            private static String url = null;
            private static String username = null;
            private static String password = null;

            static{
        				
                try{
                    InputStream in = JdbcUtils.class.getClassLoader().getResourceAsStream("db.properties");
                    Properties properties = new Properties();
                    properties.load(in);

                    driver = properties.getProperty("driver");
                    url = properties.getProperty("url");
                    username = properties.getProperty("username");
                    password = properties.getProperty("password");

                    //1. drive only need to be loaded once
                    Class.forName(driver);
                } catch (IOException | ClassNotFoundException e) {
                    e.printStackTrace();
                }
            }

            // get connection
            public static Connection getConnection() throws SQLException {
                return DriverManager.getConnection(url, username, password);
            }

            //release resource
            public static void release(Connection connection, Statement st, ResultSet rs){
                if (rs!=null){
                    try{
                        rs.close();
                    } catch (SQLException throwables) {
                        throwables.printStackTrace();
                    }
                }
                if (st!=null){
                    try{
                        st.close();
                    } catch (SQLException throwables) {
                        throwables.printStackTrace();
                    }
                }
                if (connection!=null){
                    try{
                        connection.close();
                    } catch (SQLException throwables) {
                        throwables.printStackTrace();
                    }
                }
            }
        }
        ```

2. 编写增删改的方法
    1. 使用调用包获取connection：`JdbcUtils.getConnection()`
    2. 获取statement：`st = connection.createStatement();`
    3. 使用`executeUpdate` 执行sql：`st.executeUpdate(sql);`
    4. 最后释放资源：`JdbcUtils.release(connection,st,rs);`

        ```java
        // Insert
        Connection connection = null;
        Statement st = null;
        ResultSet rs = null;

        try {
            connection = JdbcUtils.getConnection();// get connection
            st = connection.createStatement();// get statement object
            String sql = "insert into users(`id`,`NAME`,`PASSWORD`,`email`,`birthday`) " +
                    "VALUES(5,'kuangshen','123456','1231231@qq.com','2021-01-01')";
            int i = st.executeUpdate(sql);
            if (i>0){
                System.out.println("Inserted successfully!");
            }

        } catch (SQLException throwables) {
            throwables.printStackTrace();
        }finally{
            JdbcUtils.release(connection,st,rs);
        }
        ```

        ```java
        // Delete
        Connection connection = null;
        Statement st = null;
        ResultSet rs = null;

        try {
            connection = JdbcUtils.getConnection();// get connection
            st = connection.createStatement();// get statement object
            String sql = "delete from users where id = 5";
            int i = st.executeUpdate(sql);
            if (i>0){
                System.out.println("Deleted successfully!");
            }

        } catch (SQLException throwables) {
            throwables.printStackTrace();
        }finally{
            JdbcUtils.release(connection,st,rs);
        }
        ```

        ```java
        // TestUpdate
        Connection connection = null;
        Statement st = null;
        ResultSet rs = null;

        try {
            connection = JdbcUtils.getConnection();// get connection
            st = connection.createStatement();// get statement object
            String sql = "update users set `name`='jessy' where id =4";
            int i = st.executeUpdate(sql);
            if (i>0){
                System.out.println("Updated successfully!");
            }

        } catch (SQLException throwables) {
            throwables.printStackTrace();
        }finally{
            JdbcUtils.release(connection,st,rs);
        }
        ```

3. 查

    ```java
    Connection connection=null;
    Statement st=null;
    ResultSet rs=null;

    try {
        connection = JdbcUtils.getConnection();
        st = connection.createStatement();
        String sql = "select * from users where id =1;";
        rs=st.executeQuery(sql);
        while(rs.next()){
            System.out.println(rs.getString("NAME"));
        }
    } catch (SQLException throwables) {
        throwables.printStackTrace();
    }finally{
        JdbcUtils.release(connection,st,rs);
    }
    ```

- [ ]  [P4141、SQL注入问题09:49](https://www.bilibili.com/video/BV1NJ411J79W?p=41)

### SQL注入问题

- SQL存在漏洞，可能被攻击，数据泄露
- web应用程序对user的输入 没有严密判断，过滤不严，攻击者利用String拼接，定义额外的SQL语句，进行非法操作

### SQL注入例子

- 非正常输入
    - 违规输入

        ```java
        login(" 'or '1=1","12 'or '1=1");
        ```

    - 查询语句变成

        ```sql
        select * from users where `NAME`='' or '1=1' and `password`='' or '1=1' 
        ```

        无需密码就可以套出所有密码

- 正常代码

    ```java
    public static void main(String[] args) {
        login("zhangsan","123456");
    }

    //log in
    public static void login(String username, String password){
        Connection connection=null;
        Statement st=null;
        ResultSet rs=null;

        try {
            connection = JdbcUtils.getConnection();
            st = connection.createStatement();

            // SQL
            String sql = "select * from users where `NAME`='"+username+"' and `password` ='"+password+"'";
            rs=st.executeQuery(sql);
            while(rs.next()){
                System.out.println(rs.getString("NAME"));
                System.out.println(rs.getString("password"));
            }
        } catch (SQLException throwables) {
            throwables.printStackTrace();
        }finally{
            JdbcUtils.release(connection,st,rs);
        }
    }
    ```

- [ ]  [P4242、PreparedStatement对象22:29](https://www.bilibili.com/video/BV1NJ411J79W?p=42)

### PreparedStatement

- 跟Statement功能一样，但是可以防止SQL注入，效率还更好
- `PreparedStatement` 继承于`Statement` ，在上面做了扩展

### PreparedStatement代码

1. 先prepare SQL，不执行 `connection.prepareStatement(sql)`
    - 此时不赋值，用？代替value：`VALUES(?,?,?,?,?)`
2. 然后依次赋值（第几个参数`?`，value）
    - 注意，`java.sql.Date(new java.util.Date().getTime())`涉及的Date类不同：默认的是`java.util.Date`， 但这里SQL接收的是`java.sql.Date`，所以需要转换
3. 执行的时候直接：`st.executeUpdate();` 不需要参数sql了

    ```sql
    //--------insert
    connection = JdbcUtils.getConnection();
    String sql = "insert into users(`id`,`NAME`,`PASSWORD`,`email`,`birthday`) VALUES(?,?,?,?,?)";
    st = connection.prepareStatement(sql);//预编译SQL，不执行

    //手动赋值
    st.setInt(1,5);
    st.setString(2,"kuangshen");
    st.setString(3,"123456");
    st.setString(4,"1231231@qq.com");
    st.setDate(5, new java.sql.Date(new java.util.Date().getTime()));

    int i = st.executeUpdate();
    if(i>0){
        System.out.println("Inserted!");
    }
    ```

    ```sql
    //--------delete
    connection = JdbcUtils.getConnection();// get connection
    String sql = "delete from users where id =?";
    st = connection.prepareStatement(sql);
    st.setInt(1,3);

    int i = st.executeUpdate();
    if (i>0){
        System.out.println("Deleted successfully!");
    }
    ```

    ```sql
    //--------update
    connection = JdbcUtils.getConnection();// get connection
    String sql = "update users set `name`=? where id =?";
    st = connection.prepareStatement(sql);// get statement object
    st.setInt(2,1);
    st.setString(1,"kk");

    int i = st.executeUpdate();
    if (i>0){
        System.out.println("Updated successfully!");
    }
    ```

    ```sql
    //--------select
    connection = JdbcUtils.getConnection();

    String sql = "select * from users where id =?;";
    st = connection.prepareStatement(sql);
    st.setInt(1, 2);

    rs=st.executeQuery();
    while(rs.next()){
        System.out.println(rs.getString("NAME"));
    }
    ```

- 防止SQL注入
    - 原理：把传递进来的参数当成字符，假设存在转义字符比如`\'` ，直接转义，被忽略

    ```sql
    public static void main(String[] args) {
        login(" 'or '1=1","12 'or '1=1");
        //login("lisi","123456");
    }

    //log in
    public static void login(String username, String password){
        Connection connection=null;
        PreparedStatement st=null;
        ResultSet rs=null;

        try {
            connection = JdbcUtils.getConnection();
            String sql = "select * from users where `NAME`=? and `password`=?";

            st = connection.prepareStatement(sql);
            st.setString(1,username);
            st.setString(2,password);

            rs=st.executeQuery();
            while(rs.next()){
                System.out.println(rs.getString("NAME"));
                System.out.println(rs.getString("password"));
            }
        } catch (SQLException throwables) {
            throwables.printStackTrace();
        }finally{
            JdbcUtils.release(connection,st,rs);
        }
    }
    ```

- [ ]  [P4343、使用IDEA连接数据库07:48](https://www.bilibili.com/video/BV1NJ411J79W?p=43)

### IDEA连接MySQL

1. 下载DB Navigator的plug-in

    侧边栏点进去DB

    ![%E3%80%90%E7%8B%82%E3%80%91MySQL%20d8996e76f4e14f6da3d24640c3cd349b/Untitled%2077.png](%E3%80%90%E7%8B%82%E3%80%91MySQL%20d8996e76f4e14f6da3d24640c3cd349b/Untitled%2077.png)

    注意lib上要导入SQL Drive，否则无法运行

    ![%E3%80%90%E7%8B%82%E3%80%91MySQL%20d8996e76f4e14f6da3d24640c3cd349b/Untitled%2078.png](%E3%80%90%E7%8B%82%E3%80%91MySQL%20d8996e76f4e14f6da3d24640c3cd349b/Untitled%2078.png)

    ![%E3%80%90%E7%8B%82%E3%80%91MySQL%20d8996e76f4e14f6da3d24640c3cd349b/4AF5720A-4188-4BDA-A883-9C25DEDF525C.jpeg](%E3%80%90%E7%8B%82%E3%80%91MySQL%20d8996e76f4e14f6da3d24640c3cd349b/4AF5720A-4188-4BDA-A883-9C25DEDF525C.jpeg)

    ![%E3%80%90%E7%8B%82%E3%80%91MySQL%20d8996e76f4e14f6da3d24640c3cd349b/BDAA7EAF-64FE-4D41-87AD-7639B0E7B27B.jpeg](%E3%80%90%E7%8B%82%E3%80%91MySQL%20d8996e76f4e14f6da3d24640c3cd349b/BDAA7EAF-64FE-4D41-87AD-7639B0E7B27B.jpeg)

2. 添加connection（可以先test）

    ![%E3%80%90%E7%8B%82%E3%80%91MySQL%20d8996e76f4e14f6da3d24640c3cd349b/Untitled%2079.png](%E3%80%90%E7%8B%82%E3%80%91MySQL%20d8996e76f4e14f6da3d24640c3cd349b/Untitled%2079.png)

3. 双击table可以查看table

    ![%E3%80%90%E7%8B%82%E3%80%91MySQL%20d8996e76f4e14f6da3d24640c3cd349b/Untitled%2080.png](%E3%80%90%E7%8B%82%E3%80%91MySQL%20d8996e76f4e14f6da3d24640c3cd349b/Untitled%2080.png)

4. 修改数据之后，点击commit就可以更新了，还可以rollback

    如果不commit，刷新后会变回去

    ![%E3%80%90%E7%8B%82%E3%80%91MySQL%20d8996e76f4e14f6da3d24640c3cd349b/Untitled%2081.png](%E3%80%90%E7%8B%82%E3%80%91MySQL%20d8996e76f4e14f6da3d24640c3cd349b/Untitled%2081.png)

5. 编写SQL的console

    左上的`mysql`代表了当前DB

    ![%E3%80%90%E7%8B%82%E3%80%91MySQL%20d8996e76f4e14f6da3d24640c3cd349b/Untitled%2082.png](%E3%80%90%E7%8B%82%E3%80%91MySQL%20d8996e76f4e14f6da3d24640c3cd349b/Untitled%2082.png)

6. 测试使用

    ![%E3%80%90%E7%8B%82%E3%80%91MySQL%20d8996e76f4e14f6da3d24640c3cd349b/Untitled%2083.png](%E3%80%90%E7%8B%82%E3%80%91MySQL%20d8996e76f4e14f6da3d24640c3cd349b/Untitled%2083.png)

- [ ]  [P4444、JDBC操作事务11:44](https://www.bilibili.com/video/BV1NJ411J79W?p=44)

### JDBC操作transaction

- 问题

    ![%E3%80%90%E7%8B%82%E3%80%91MySQL%20d8996e76f4e14f6da3d24640c3cd349b/Untitled%2084.png](%E3%80%90%E7%8B%82%E3%80%91MySQL%20d8996e76f4e14f6da3d24640c3cd349b/Untitled%2084.png)

- test table

    ```sql
    use jdbcstudy;
    CREATE TABLE account(
        id Int PRIMARY KEY AUTO_INCREMENT,
        NAME VARCHAR(40),
        money FLOAT
    );

    /*插入测试数据*/
    insert into account(name,money) values('A',1000);
    insert into account(name,money) values('B',1000);
    insert into account(name,money) values('C',1000);
    ```

- 进行transaction
    1. 开启事务 `connection.setAutoCommit(false);` 
        - 这里autoCommit = false自动开启transaction,所以不需要单写transaction开启那个步骤
        - autoCommit 关闭之后，在commit或rollback之前的 所有execution视为同一波transaction
    2. 如果正常commit视为成功，如果不成功，进行rollback（可以在catch 中写出rollback，不过不写也会自动rollback）
    3. 最终关闭所有尚未关闭的服务

        ```sql
        Connection connection = null;
        PreparedStatement st1 = null;
        PreparedStatement st2 = null;
        ResultSet rs = null;

        try{
            connection = JdbcUtils.getConnection();
            connection.setAutoCommit(false);
            //这里autoCommit = false自动开启transaction,不需要写那一步，

            // A->B 100
            String sql1 = "update `account` set money =money-100 where `NAME` = 'A';";
            st1 = connection.prepareStatement(sql1);
            st1.executeUpdate();

            String sql2 = "update account set money =money+100 where `NAME` = 'B';";
            st2 = connection.prepareStatement(sql2);
            st2.executeUpdate();

            connection.commit();
            System.out.println("Successfully");

        } catch (SQLException e) {
            connection.rollback();
            e.printStackTrace();
        }finally{
            JdbcUtils.release(connection, st1, rs);
            JdbcUtils.release(connection, st2, rs);
        }
        ```

- 测试，失败的时候确实回滚了

    ```java
    connection = JdbcUtils.getConnection();
    connection.setAutoCommit(false);
    //这里autoCommit = false自动开启transaction,不需要写那一步，

    // A->B 100
    String sql1 = "update `account` set money =money-100 where `NAME` = 'A';";
    st1 = connection.prepareStatement(sql1);
    st1.executeUpdate();

    int x=1/0;//error

    String sql2 = "update account set money =money+100 where `NAME` = 'B';";
    st2 = connection.prepareStatement(sql2);
    st2.executeUpdate();

    connection.commit();
    System.out.println("Successfully");
    ```

- 注意，其实默认会回滚，不用手动写rollback

- [ ]  [P4545、DBCP-C3P0连接池31:47](https://www.bilibili.com/video/BV1NJ411J79W?p=45)

## DB连接池

DB连接，执行，释放，十分浪费资源
可以提前准备好资源，直接进行连接

### 池化技术

- 预先准备资源，直接连接预先准备好的资源
- 比如执行10个SQL，需要连接-释放10次，但如果用池化技术，可以预留5个接口，准备好，直接可以用，用完之后，放回pool，不释放，继续等待下次使用
- 类比：从模式1到2
    1. 开门，服务，关门
    2. 开门，业务员-等待，服务，关门（直到彻底服务器关闭，所有业务员下线）
- 最小连接数：（最少需要的业务员），一般设置为常用连接数
- 最大连接数：业务最高承载上线（加上备用业务员）
- 排队等待：超出最大连接数，需要排队等待
- 等待超时：等待时间过长，不想等了，等待超时

### 编写连接池

- 编写连接池，实现一个接口即可，DataSource
- 这个接口的实现类有很多，`开源数据源`实现（这些类继承DataSource,含有所需功能）
    - DBCP
    - C3P0：更流行一点
    - Druid（alibaba）：也流行，性能没有前面的高，做了一些监控，没有那么快
    - 还有很多。。。
- 使用了这些数据库连接池之后，我们在项目开发中，就不需要编写连接DB的代码了
- 不同的数据源要不同的jar包

### DBCP

- 需要两个jar包
    - `commons-dbcp-1.4.jar`:[https://commons.apache.org/proper/commons-dbcp/download_dbcp.cgi](https://commons.apache.org/proper/commons-dbcp/download_dbcp.cgi)
    - `commons-pool-1.6.jar`:[https://commons.apache.org/proper/commons-pool/download_pool.cgi](https://commons.apache.org/proper/commons-pool/download_pool.cgi)
- 配置文件
    - 前四行之后可以不配置

    ```java
    #连接设置,这里的名字是DBCP定义好的，不要换param名字
    driverClassName=com.mysql.cj.jdbc.Driver
    url=jdbc:mysql://localhost:3306/jdbcstudy?useUnicode=true&characterEncoding=utf8&useSSL=false
    username=root
    password=root

    #!-- 初始化连接 --
    initialSize=10

    #最大连接数量
    maxActive=50

    #!-- 最大空闲连接 --
    maxIdle=20

    #!-- 最小空闲连接, --
    minIdle=5

    #!-- 超时等待时间以毫秒为单位,等待超时之后，再释放业务员 6000毫秒/1000等于60秒 --
    maxWait=60000
    #JDBC驱动建立连接时附带的连接属性属性的格式必须为这样：【属性名=property;】
    #注意：user 与 password 两个属性会被明确地传递，因此这里不需要包含他们。
    connectionProperties=useUnicode=true;characterEncoding=UTF8

    #指定由连接池所创建的连接的自动提交（auto-commit）状态。
    defaultAutoCommit=true

    #driver default 指定由连接池所创建的连接的只读（read-only）状态。
    #如果没有设置该值，则“setReadOnly”方法将不被调用。（某些驱动并不支持只读模式，如：Informix）
    defaultReadOnly=

    #driver default 指定由连接池所创建的连接的事务级别（TransactionIsolation）。
    #可用值为下列之一：（详情可见javadoc。）NONE,READ_UNCOMMITTED, READ_COMMITTED, REPEATABLE_READ, SERIALIZABLE
    defaultTransactionIsolation=READ_UNCOMMITTED
    ```

- 重新定义实现类
    - 使用`dataSource` 加载config创立DB对象：`dataSource = BasicDataSourceFactory.createDataSource(properties);`
    - 使用dataSource创立`connection:dataSource.getConnection();`
    - 跟之前一样，设计函数释放资源

    ```java
    public class JdbcUtils_DBCP {
        private static DataSource dataSource = null;

        static{

            try{
                InputStream in = JdbcUtils_DBCP.class.getClassLoader().getResourceAsStream("dbcpconfig.properties");
                Properties properties = new Properties();
                properties.load(in);
                //创建DB源-工厂模式（设计模式）-创建对象
                dataSource = BasicDataSourceFactory.createDataSource(properties);

            } catch (Exception e) {
                e.printStackTrace();
            }
        }

        // get connection
        public static Connection getConnection() throws SQLException {
            return dataSource.getConnection();//从数据源中获取连接
        }

        //release resource
        public static void release(Connection connection, Statement st, ResultSet rs){
            if (rs!=null){
                try{
                    rs.close();
                } catch (SQLException throwables) {
                    throwables.printStackTrace();
                }
            }
            if (st!=null){
                try{
                    st.close();
                } catch (SQLException throwables) {
                    throwables.printStackTrace();
                }
            }
            if (connection!=null){
                try{
                    connection.close();
                } catch (SQLException throwables) {
                    throwables.printStackTrace();
                }
            }
        }
    }
    ```

- 实现的时候，基本跟之前一样
    - 调用定义的实现类来创建connection:`connection = JdbcUtils_DBCP.getConnection()`
    - 释放资源：`JdbcUtils_DBCP.release(connection,st,rs);`

    ```java
    Connection connection = null;
    Statement st = null;
    ResultSet rs = null;

    try {
        connection = JdbcUtils_DBCP.getConnection();// get connection
        st = connection.createStatement();// get statement object
        String sql = "insert into users(`id`,`NAME`,`PASSWORD`,`email`,`birthday`) " +
                "VALUES(6,'kuangshen','123456','1231231@qq.com','2021-01-01')";
        int i = st.executeUpdate(sql);
        if (i>0){
            System.out.println("Inserted successfully!");
        }

    } catch (SQLException throwables) {
        throwables.printStackTrace();
    }finally{
        JdbcUtils_DBCP.release(connection,st,rs);
    }
    ```

### C3P0

- 需要导入的jar包
    - `c3p0-0.9.5.5.jar` ：[https://mvnrepository.com/artifact/com.mchange/c3p0/0.9.5.5](https://mvnrepository.com/artifact/com.mchange/c3p0/0.9.5.5)
    - `mchange-commons-java-0.2.19.jar` ：[https://mvnrepository.com/artifact/com.mchange/mchange-commons-java/0.2.19](https://mvnrepository.com/artifact/com.mchange/mchange-commons-java/0.2.19)
- 配置文件
    - 可以配置若干组，比如有默认配置default-config,还可以配mysql, oracle等
    - 启动的时候，通过不同参数来确定用哪组config建立dataSource, 如`ComboPooledDataSource("MySQL")`

    ```xml
    <?xml version="1.0" encoding="UTF-8"?>
    <!--
    Ref: https://github.com/Whale2021/Whale/blob/17ae5f55922f9de0c814549a343dd6702e8677e1/whale-common/src/main/resources/c3p0-config.xml
    c3p0-config.xml必须位于类路径下面
    private static ComboPooledDataSource ds;
    static{
        try {
            ds = new ComboPooledDataSource("MySQL");
        } catch (Exception e) {
            throw new ExceptionInInitializerError(e);
        }
    }
    -->

    <c3p0-config>
        <!--
        C3P0的缺省(默认)配置，
        如果在代码中“ComboPooledDataSource ds = new ComboPooledDataSource();”这样写就表示使用的是C3P0的缺省(默认)配置信息来创建数据源
        -->
        <default-config>
            <property name="driverClass">com.mysql.cj.jdbc.Driver</property>
            <property name="jdbcUrl">jdbc:mysql://localhost:3306/jdbcstudy?useUnicode=true;characterEncoding=utf8;useSSL=false</property>
            <property name="user">root</property>
            <property name="password">root</property>

            <property name="acquireIncrement">5</property>
            <property name="initialPoolSize">10</property>
            <property name="minPoolSize">5</property>
            <property name="maxPoolSize">20</property>
        </default-config>

        <!--
        C3P0的命名配置，
        如果在代码中“ComboPooledDataSource ds = new ComboPooledDataSource("MySQL");”这样写就表示使用的是name是MySQL的配置信息来创建数据源
        -->
        <named-config name="MySQL">
            <property name="driverClass">com.mysql.cj.jdbc.Driver</property>
            <property name="jdbcUrl">jdbc:mysql://localhost:3306/jdbcstudy?useUnicode=true;characterEncoding=utf8;useSSL=false</property>
            <property name="user">root</property>
            <property name="password">root</property>

            <property name="acquireIncrement">5</property>
            <property name="initialPoolSize">10</property>
            <property name="minPoolSize">5</property>
            <property name="maxPoolSize">20</property>
        </named-config>

    </c3p0-config>
    ```

- 创建dataSource的方法
    1. 配置文件写法（推荐）
        - xml不用手动写加载，直接可以读入`ComboPooledDataSource`

        ```java
        private static DataSource dataSource = null;
        dataSource= new ComboPooledDataSource();//无参指默认配置，可以填入"MySQL"用MySQL那套配置
        ```

    2.  代码版配置
        - 其实`ComboPooledDataSource` 继承于`DataSource`
        - 可以在code中配置，不建议

        ```java
        private static ComboPooledDataSource dataSource = null;
        dataSource = new ComboPooledDataSource();

        dataSource.setDriverClass();
        dataSource.setUser();
        dataSource.setPassword();
        dataSource.setJdbcUrl();

        dataSource.setMaxPoolSize();
        dataSource.setMinPoolSize();
        dataSource.setMaxIdleTime();

        ```

- 实现类
    - 用C3P0包建立`dataSource`(通过读取config文件)：`dataSource = new ComboPooledDataSource("MySQL");`

    ```java
    public class JdbcUtils_C3P0 {
        private static ComboPooledDataSource dataSource = null;

        static{

            try{
                //创建DB源-工厂模式（设计模式）-创建对象
                //配置文件写法
                dataSource = new ComboPooledDataSource("MySQL");//无参指默认配置，可以写MySQL那套配置
            } catch (Exception e) {
                e.printStackTrace();
            }
        }

        // get connection
        public static Connection getConnection() throws SQLException {
            return dataSource.getConnection();//从数据源中获取连接
        }

        //release resource
        public static void release(Connection connection, Statement st, ResultSet rs){
            if (rs!=null){
                try{
                    rs.close();
                } catch (SQLException throwables) {
                    throwables.printStackTrace();
                }
            }
            if (st!=null){
                try{
                    st.close();
                } catch (SQLException throwables) {
                    throwables.printStackTrace();
                }
            }
            if (connection!=null){
                try{
                    connection.close();
                } catch (SQLException throwables) {
                    throwables.printStackTrace();
                }
            }
        }
    }
    ```

- 使用

    ```java
    Connection connection = null;
    Statement st = null;
    ResultSet rs = null;

    try {
        connection = JdbcUtils_C3P0.getConnection();// get connection
        st = connection.createStatement();// get statement object
        String sql = "insert into users(`id`,`NAME`,`PASSWORD`,`email`,`birthday`) " +
                "VALUES(7,'kuangshen','123456','1231231@qq.com','2021-01-01')";
        int i = st.executeUpdate(sql);
        if (i>0){
            System.out.println("Inserted successfully!");
        }

    } catch (SQLException throwables) {
        throwables.printStackTrace();
    }finally{
        JdbcUtils_C3P0.release(connection,st,rs);
    }
    ```

### Apache基金组织

- [https://www.apache.org/](https://www.apache.org/)
- 黄色是狂神学过的，红是要学习的

    ![%E3%80%90%E7%8B%82%E3%80%91MySQL%20d8996e76f4e14f6da3d24640c3cd349b/Untitled%2085.png](%E3%80%90%E7%8B%82%E3%80%91MySQL%20d8996e76f4e14f6da3d24640c3cd349b/Untitled%2085.png)