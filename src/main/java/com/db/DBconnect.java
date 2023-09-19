package com.db;

import java.sql.Connection;
import java.sql.DriverManager;

public class DBconnect {
	private static Connection con;
	public static Connection getCon() {
		try {
			if(con==null)
				con = DriverManager.getConnection("jdbc:mysql://localhost:3306/job_portal","root","root");
//			System.out.println("Done");
		} catch (Exception e) {
			System.err.println("Data not inserted");
			e.printStackTrace();
		}
		return con;
	}
}
