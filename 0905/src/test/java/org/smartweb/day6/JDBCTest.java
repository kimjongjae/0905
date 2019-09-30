package org.smartweb.day6;

import static org.junit.Assert.fail;

import java.sql.DriverManager;

import org.junit.Test;

import lombok.extern.log4j.Log4j;

@Log4j
public class JDBCTest {

	static {
		try {
			Class.forName("com.mysql.jdbc.Driver");
		}catch(Exception e) {
			e.printStackTrace();
		}
	}
	
	@Test
	public void test() {
		try {
			String url="jdbc:mysql://localhost:3306/smartweb";
			String user="root";
			String password="123456";
			DriverManager.getConnection(url, user, password);
		}catch (Exception e) {
			fail(e.getMessage());
		}
		
	}

}
