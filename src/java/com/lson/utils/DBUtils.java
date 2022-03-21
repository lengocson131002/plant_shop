package com.lson.utils;

import java.sql.Connection;
import java.sql.DriverManager;

public class DBUtils {
    public static Connection makeConnection() throws Exception {
        Connection conn = null;
     
        String IP = "localhost";
        String instanceName = "DESKTOP-AVJF699\\SQLEXPRESS";
        String port = "1433";
        String uid = "sa";
        String pwd = "131022";

        String db = "PlantShop";
        String driver = "com.microsoft.sqlserver.jdbc.SQLServerDriver";
       
        String url = "jdbc:sqlserver://" + IP + "\\" + instanceName + ":" + port
                + ";databasename=" + db + ";user=" + uid + ";password=" + pwd;
        Class.forName(driver);
        
        conn = DriverManager.getConnection(url);
        return conn;
        
    }
}
