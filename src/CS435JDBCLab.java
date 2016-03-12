/**
 * Project: CS 435 Lab 4
 * Authors: Kacey Yahl and Justin Ordonez
 * 
 * Purpose:
 */

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.ResultSetMetaData;
import java.sql.Statement;


public class CS435JDBCLab {
	
	private static String dbHost = "localhost";
	private static String dbName = "world";
	private static String dbUser = "JohnCena";
	
	
	public static void main(String[] args) {
		if(args.length < 1) {
			System.out.println("Insufficient data provided.");
		}
		String varTableName = args[0];
		varTableName = varTableName.toUpperCase();
		System.out.println("Showing Table " + varTableName);
		try{
			//Load the MySQL Connector / J classes
			Class.forName("com.mysql.jdbc.Driver").newInstance();
			
			//Set connect string to local MySQL database, user is JohnCena
			String connString = "jdbc:mysql://" + dbHost + "/" + dbName + 
					"?user=" + dbUser + "&password=doot"  + "&useSSL=false";
			
			System.out.println("Trying connection with " + connString);
			Connection conn = DriverManager.getConnection(connString);
			
			//Get result set
			Statement stmt = conn.createStatement();
			String varSQL = "SELECT * FROM " + varTableName;
			ResultSet rs = stmt.executeQuery(varSQL);
			
			//Get meta data on just opened result set
			ResultSetMetaData rsMeta = rs.getMetaData();
			
			// Display Column names as string
			String varColNames = " ";
			int varColCount = rsMeta.getColumnCount();
			for(int col = 1; col <= varColCount;col++){
				varColNames = varColNames + rsMeta.getColumnName(col)+ " ";
			}
			System.out.println(varColNames);
			
			//Display column values
			while(rs.next()){
				for(int col = 1; col <= varColCount;col++){
					System.out.print(rs.getString(col) + " ");
				}
				System.out.println();
			}
			
			//Clean up
			rs.close();
			stmt.close();
			conn.close();
			
		} catch(Exception e){
			e.printStackTrace();
		}
	}
}
