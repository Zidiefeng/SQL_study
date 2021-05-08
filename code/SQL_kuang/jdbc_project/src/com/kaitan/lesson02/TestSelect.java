package com.kaitan.lesson02;

import com.kaitan.lesson02.utils.JdbcUtils;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

public class TestSelect {
    public static void main(String[] args) {
        Connection connection=null;
        Statement st=null;
        ResultSet rs=null;

        try {
             connection = JdbcUtils.getConnection();
             st = connection.createStatement();

             // SQL
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
    }
}
