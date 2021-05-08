package com.kaitan.lesson02;

import com.kaitan.lesson02.utils.JdbcUtils;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

public class TestUpdate {
    public static void main(String[] args) {

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
    }
}

