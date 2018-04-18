package com.note.util;

import java.io.InputStream;
import java.io.Serializable;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.Properties;

public class DBUtil implements Serializable{
	/**
	 * jar包
	 */
	private static final long serialVersionUID = 1L;
	//什么获取连接所需要的参数
	private static String url="";
	private static String user="";
	private static String password="";
	
	static{
		//获取配置文件
		Properties properties=new Properties();
		try {
			//默认加载src跟目录下的文件
			InputStream inStream =DBUtil.class.getClassLoader().getResourceAsStream("DBConfig.properties");//类加载器
			properties.load(inStream);
			//选择数据库类型
			String database =properties.getProperty("database");
			//给获取连接所需要的参数赋值
			url=properties.getProperty(database+".url");
			user=properties.getProperty(database+".user");
			password=properties.getProperty(database+".password");
			//获取classname
			String className=properties.getProperty(database+".className");
			//加载驱动一次就可以了
			Class.forName(className);
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	/**
	 * 获取连接
	 * @return
	 */
	public static Connection getConnection(){
		Connection connection=null;
		try {
			connection = DriverManager.getConnection(url,user,password);
		} catch (SQLException e) {
			System.out.println("DBUtil.getConnection(如果打印这句话，说明你的数据库配置有问题！)["+url+"]["+user+"]["+password+"]");
			e.printStackTrace();
		}
		return connection;
	}
	/**
	 * 关闭连接
	 * @param connection
	 */
	public static void closeConnection(Connection connection){
			try {
				if(connection!=null){
				connection.close();
				}
			} catch (SQLException e) {
				e.printStackTrace();
			}
	}
	/**
	 * 获取Statement
	 * @param connection
	 * @return
	 */
	public static Statement getStatement(Connection connection){
		Statement statement=null;
		try {
			statement = connection.createStatement();
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return statement;
	}
	/**
	 * 获取预处理Statement
	 * @param connection
	 * @param sql
	 * @return
	 */
	public static PreparedStatement getPreparedStatement(Connection connection , String sql){
		PreparedStatement preparedStatement =null;
		try {
			preparedStatement = connection.prepareStatement(sql.toString());
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return preparedStatement;
	}
	/**
	 * 关闭statement
	 * @param statement
	 */
	public static void closeStatement(Statement statement){
		try {
			if(statement!=null){
				statement.close();
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}

	public static ResultSet executeQuery(Statement stmt, String sql) {
		ResultSet rs = null;
		try {
			rs = stmt.executeQuery(sql);
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return rs;
	}

	public static ResultSet executeQuery(Connection conn, String sql) {
		ResultSet rs = null;
		try {
			rs = conn.createStatement().executeQuery(sql);
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return rs;
	}

	public static void executeUpdate(Connection conn, String sql) {
		try {
			conn.createStatement().executeUpdate(sql);
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}

	public static ResultSet getResultSet(Statement stmt, String sql) {
		ResultSet rs = null;
		try {
			if(stmt != null) {
				rs = stmt.executeQuery(sql);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return rs;
	}
	
	/**
	 * 关闭结果集
	 * @param resultSet
	 */
	public static void closeResultSet(ResultSet resultSet){
		try {
			if(resultSet!=null){
				resultSet.close();
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}
	/**
	 * 释放全部资源
	 */
	public static void closeAll(Connection connection,Statement statement,ResultSet resultSet){
		closeResultSet(resultSet);
		closeStatement(statement);
		closeConnection(connection);
	}
}