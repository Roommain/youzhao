package com.workweb;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.ResultSetMetaData;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import oracle.jdbc.driver.OracleDriver;

public class DBUtils {

    private static String url = "jdbc:oracle:thin:@10.25.209.97:1521/orcl";
    private static Connection conn = null;

    static {
        // 1. 加载驱动类
        try {
            DriverManager.registerDriver(new OracleDriver());
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    private static Connection getConn() {
        // 2. 获取连接
        try {
            if(null == conn || conn.isClosed()) {
                conn = DriverManager.getConnection(url, "system", "123456");
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return conn;
    }

    /**
     * 通用方法: INSERT, UPDATE, DELETE
     * @param sql
     * @return
     */
    public static int modify(String sql, Object...params) {
        Connection conn = getConn();
//		Statement st = null;
        PreparedStatement ps = null;
        int result = 0;
        try {
//			st = conn.createStatement();
//			result = st.executeUpdate(sql);
            ps = conn.prepareStatement(sql);
            for(int i = 0; i < params.length; i++) {
                ps.setObject(i+1, params[i]);
            }
            result = ps.executeUpdate();
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            close(null, ps, conn);
        }
        return result;
    }

    public static Map<String, Object> querySingle(String sql, Object...params) {
        List<Map<String, Object>> result = query(sql, params);
        return (result.size() > 0) ? result.get(0) : null;
    }

    /**
     * 通用的查询方法
     * @param sql
     * SELECT * FROM t_user WHERE user_name=? and pwd=?, ?, ?"
     * DBUtils.querySingle(sql, uname, pwd, ss, ss);
     * @return
     */
    public static List<Map<String, Object>> query(String sql, Object...params) {
        Connection conn = getConn();
        // 3. 创建 Statement 对象执行SQL
//		Statement st = null;
        PreparedStatement ps = null;
        ResultSet rs = null;
        List<Map<String, Object>> result = new ArrayList<>();
        try {
//			st = conn.createStatement();
            ps = conn.prepareStatement(sql);
            for(int i = 0; i < params.length; i++) {
                ps.setObject(i + 1, params[i]);
            }
            // 4. 处理结果集
//			rs = st.executeQuery(sql);
            rs = ps.executeQuery();
            ResultSetMetaData rsmd = rs.getMetaData();
            Map<String, Object> row = null;
            while(rs.next()) {
                row = new HashMap<>();
                int columnCount = rsmd.getColumnCount();
                for(int i = 1; i <= columnCount; i++) {
                    String columnLabel = rsmd.getColumnLabel(i);
                    Object columnValue = rs.getObject(i);
                    row.put(columnLabel, columnValue);
                }
                result.add(row);
            }
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            close(rs, ps, conn);
        }
        return result;
    }

    private static void close(ResultSet rs, Statement st, Connection conn) {
        if(null != rs) {
            try {
                rs.close();
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }
        if(null != st) {
            try {
                st.close();
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }
        if(null != conn) {
            try {
                conn.close();
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }
    }

}