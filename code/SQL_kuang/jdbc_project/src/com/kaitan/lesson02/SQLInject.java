package com.kaitan.lesson02;

import com.kaitan.lesson02.utils.JdbcUtils;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

public class SQLInject {
    public static void main(String[] args) {
        //login("zhangsan","123456");
        login(" 'or '1=1","12 'or '1=1");
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

}
