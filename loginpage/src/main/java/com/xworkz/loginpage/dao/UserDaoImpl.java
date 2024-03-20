package com.xworkz.loginpage.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import com.xworkz.loginpage.coonectionData.ConnectionData;

public class UserDaoImpl implements UserDao {

	@Override
	public boolean addUser(User user) {
		String query = "INSERT INTO user_table (username, passwords, email) VALUES (?, ?, ?)";

		try (Connection connection = ConnectionData.getConnection();
				PreparedStatement preparedStatement = connection.prepareStatement(query)) {

			preparedStatement.setString(1, user.getUsername());
			preparedStatement.setString(2, user.getPasswords());
			preparedStatement.setString(3, user.getEmail());

			int rowsAffected = preparedStatement.executeUpdate();

			return rowsAffected > 0;
		} catch (SQLException e) {
			e.printStackTrace();
			return false;
		}
	}

	@Override
	public boolean isValiderUser(String username, String passwords) {

		String query = "SELECT * FROM user_table WHERE username = ? AND passwords = ?";

		try (Connection connection = ConnectionData.getConnection();
				PreparedStatement preparedStatement = connection.prepareStatement(query)) {
			System.out.println("connection is ok");
			preparedStatement.setString(1, username);
			preparedStatement.setString(2, passwords);
			ResultSet resultSet = preparedStatement.executeQuery();

			if (resultSet.next()) {
				// Username and password match found in the database
				return true;
			} else {
				// No matching username and password found in the database
				return false;
			}
		} catch (SQLException e) {
			e.printStackTrace();
			return false;
		}
	}

}
