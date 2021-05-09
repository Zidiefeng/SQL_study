package com.kaitan.lesson04;

import com.kaitan.lesson02.utils.JdbcUtils;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

public class TestTransaction {
    public static void main(String[] args) throws SQLException {
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

            //int x=1/0; //error

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
    }
}
