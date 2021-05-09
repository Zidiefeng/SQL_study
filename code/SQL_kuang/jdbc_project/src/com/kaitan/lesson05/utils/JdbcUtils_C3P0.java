package com.kaitan.lesson05.utils;

import com.mchange.v2.c3p0.ComboPooledDataSource;
import org.apache.commons.dbcp.BasicDataSource;
import org.apache.commons.dbcp.BasicDataSourceFactory;

import javax.sql.DataSource;
import java.io.IOException;
import java.io.InputStream;
import java.sql.*;
import java.util.Properties;

public class JdbcUtils_C3P0 {
    private static ComboPooledDataSource dataSource = null;

    static{

        try{
            //创建DB源-工厂模式（设计模式）-创建对象
            //配置文件写法
            dataSource = new ComboPooledDataSource("MySQL");//无参指默认配置，可以写MySQL那套配置
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    // get connection
    public static Connection getConnection() throws SQLException {
        return dataSource.getConnection();//从数据源中获取连接
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


