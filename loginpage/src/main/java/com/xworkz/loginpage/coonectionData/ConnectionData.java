package com.xworkz.loginpage.coonectionData;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class ConnectionData {

	private static final String URL = "jdbc:mysql://localhost:3306/loginpage";
	private static final String USERNAME = "root";
	private static final String PASSWORD = "Ravikumar@7862";
	static {
		try {
			// Load the MySQL JDBC driver
			Class.forName("com.mysql.cj.jdbc.Driver");
		} catch (ClassNotFoundException e) {
			e.printStackTrace();
		}
	}

	public static Connection getConnection() throws SQLException {
		return DriverManager.getConnection(URL, USERNAME, PASSWORD);
	}

}
