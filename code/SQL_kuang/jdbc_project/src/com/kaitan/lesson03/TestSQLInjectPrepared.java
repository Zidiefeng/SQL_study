package com.kaitan.lesson03;

import com.kaitan.lesson02.utils.JdbcUtils;

import java.sql.*;

public class TestSQLInjectPrepared {
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
}
