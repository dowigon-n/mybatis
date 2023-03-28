package com.zerock.web;

import java.sql.Connection;
import java.sql.DriverManager;

import org.junit.Test;

public class OcacleConnectionTest {
	
	private static final String DRIVER = "oracle.jdbc.OracleDriver";
	private static final String URL = "jdbc:oracle:thin:@localhost:1521:XE";
	private static final String USER = "C##SGCNC";
	private static final String PWD = "1234";
	
	@Test
	public void testConnection() throws Exception {
		
		Class.forName(DRIVER);
		
		try(Connection con = DriverManager.getConnection(URL, USER, PWD)) {
			System.out.println(con);
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	

}
