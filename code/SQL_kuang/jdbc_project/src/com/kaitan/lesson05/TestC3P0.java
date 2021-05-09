package com.kaitan.lesson05;

import com.kaitan.lesson05.utils.JdbcUtils_C3P0;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

public class TestC3P0 {
    public static void main(String[] args) {
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
    }
}
