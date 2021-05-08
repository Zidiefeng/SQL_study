package com.kaitan.lesson01;

import java.sql.*;

//my first jdbc program
public class JdbcDemo1 {
    public static void main(String[] args) throws ClassNotFoundException, SQLException {
        //1. load jar(sql drive)
            //forName: Returns the Class object associated with the class
            //         or interface with the given string name
        DriverManager.registerDriver(new com.mysql.cj.jdbc.Driver()); //alternative
        //Class.forName("com.mysql.jdbc.Driver");//固定写法,加载drive, depreciated
        //Class.forName("com.mysql.cj.jdbc.Driver");//固定写法,加载drive

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
