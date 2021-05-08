package com.kaitan.lesson02.utils;

import java.io.IOException;
import java.io.InputStream;
import java.sql.*;
import java.util.Properties;

public class JdbcUtils {
    private static String driver = null;
    private static String url = null;
    private static String username = null;
    private static String password = null;

    static{

        try{
            InputStream in = JdbcUtils.class.getClassLoader().getResourceAsStream("db.properties");
            Properties properties = new Properties();
            properties.load(in);

            driver = properties.getProperty("driver");
            url = properties.getProperty("url");
            username = properties.getProperty("username");
            password = properties.getProperty("password");

            //1. drive only need to be loaded once
            Class.forName("drive");
        } catch (IOException | ClassNotFoundException e) {
            e.printStackTrace();
        }
    }

    // get connection
    public static Connection getConnection() throws SQLException {
        return DriverManager.getConnection(url, username, password);
    }

    //release resource
    public static void release(Connection connection, Statement st, ResultSet rs){
        if (rs!=null){
            try{
                rs.close();
            } catch (SQLException throwables) {
                throwables.printStackTrace();
            }
        }
        if (st!=null){
            try{
                st.close();
            } catch (SQLException throwables) {
                throwables.printStackTrace();
            }
        }
        if (connection!=null){
            try{
                connection.close();
            } catch (SQLException throwables) {
                throwables.printStackTrace();
            }
        }
    }
}


