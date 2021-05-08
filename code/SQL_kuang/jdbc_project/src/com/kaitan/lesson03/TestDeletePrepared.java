package com.kaitan.lesson03;

import com.kaitan.lesson02.utils.JdbcUtils;

import java.sql.*;

public class TestDeletePrepared {
    public static void main(String[] args) {

        Connection connection = null;
        PreparedStatement st = null;
        ResultSet rs = null;

        try {
            connection = JdbcUtils.getConnection();// get connection
            String sql = "delete from users where id =?";
            st = connection.prepareStatement(sql);
            st.setInt(1,3);

            int i = st.executeUpdate();
            if (i>0){
                System.out.println("Deleted successfully!");
            }

        } catch (SQLException throwables) {
            throwables.printStackTrace();
        }finally{
            JdbcUtils.release(connection,st,rs);
        }
    }
}
