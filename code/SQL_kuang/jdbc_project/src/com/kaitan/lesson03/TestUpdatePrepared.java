package com.kaitan.lesson03;

import com.kaitan.lesson02.utils.JdbcUtils;

import java.sql.*;

public class TestUpdatePrepared {
    public static void main(String[] args) {

        Connection connection = null;
        PreparedStatement st = null;
        ResultSet rs = null;

        try {
            connection = JdbcUtils.getConnection();// get connection

            String sql = "update users set `name`=? where id =?";


            st = connection.prepareStatement(sql);// get statement object
            st.setInt(2,1);
            st.setString(1,"kk");
            int i = st.executeUpdate();
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
