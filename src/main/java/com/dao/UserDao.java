package com.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import com.entities.User;

public class UserDao {
	private Connection connection;

	public UserDao(Connection connection) {
		super();
		this.connection = connection;
	}

	public boolean addUser(User u) {
		boolean f = false;
		try {
			String query = "INSERT INTO USER (uname, uemail, upassword, uqualification, urole) values(?,?,?,?,?)";
			PreparedStatement pstmt = this.connection.prepareStatement(query);
			pstmt.setString(1, u.getName());
			pstmt.setString(2, u.getEmail());
			pstmt.setString(3, u.getPassword());
			pstmt.setString(4, u.getQualification());
			pstmt.setString(5, "user");

			int i = pstmt.executeUpdate();
			if (i == 1)
				f = true;
		} catch (Exception e) {
			e.printStackTrace();
		}

		return f;
	}
	public User login(String email, String pwd) {
		User u = null;
		try {
			String query = "SELECT * FROM USER WHERE UEMAIL=? AND UPASSWORD=?";
			PreparedStatement pstmt = this.connection.prepareStatement(query);
			pstmt.setString(1, email);
			pstmt.setString(2, pwd);
			
			ResultSet rSet = pstmt.executeQuery();
			while (rSet.next()) {
				u = new User();
				u.setId(rSet.getInt(1));
				u.setName(rSet.getString(2));
				u.setEmail(rSet.getString(3));
				u.setPassword(rSet.getString(4));
				u.setQualification(rSet.getString(5));
				u.setRole(rSet.getString(6));
			}
		} catch (Exception e) {
			e.printStackTrace();
		}

		return u;
	}

}
