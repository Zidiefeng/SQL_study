package com.kaitan.lesson03;

import com.kaitan.lesson02.utils.JdbcUtils;

import java.sql.*;

public class TestInsert {
    public static void main(String[] args) {
        Connection connection = null;
        PreparedStatement st = null;
        ResultSet rs=null;
        try {

            connection = JdbcUtils.getConnection();
            String sql = "insert into users(`id`,`NAME`,`PASSWORD`,`email`,`birthday`) VALUES(?,?,?,?,?)";
            st = connection.prepareStatement(sql);//预编译SQL，不执行
            //手动赋值
            st.setInt(1,5);
            st.setString(2,"kuangshen");
            st.setString(3,"123456");
            st.setString(4,"1231231@qq.com");
            st.setDate(5, new java.sql.Date(new java.util.Date().getTime()));

            int i = st.executeUpdate();
            if(i>0){
                System.out.println("Inserted!");
            }

        } catch (SQLException throwables) {
            throwables.printStackTrace();
        }finally{
            JdbcUtils.release(connection,st,rs);
        }
    }
}
