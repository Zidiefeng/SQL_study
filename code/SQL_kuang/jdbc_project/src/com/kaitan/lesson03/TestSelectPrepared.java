package com.kaitan.lesson03;

import com.kaitan.lesson02.utils.JdbcUtils;

import java.sql.*;

public class TestSelectPrepared {
    public static void main(String[] args) {

        Connection connection=null;
        PreparedStatement st=null;
        ResultSet rs=null;

        try {
            connection = JdbcUtils.getConnection();

            String sql = "select * from users where id =?;";
            st = connection.prepareStatement(sql);
            st.setInt(1, 2);

            rs=st.executeQuery();
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
