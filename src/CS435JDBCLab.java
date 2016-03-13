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
import java.util.Scanner;


public class CS435JDBCLab {
	
	private static String dbHost = "localHost";
	private static String dbName = "world";
	private static String dbUser = "JohnCena";
	
	
	public static void main(String[] args) {
		menu();
		
		System.out.println("end!");
	}
	
	public static void menu() {
		System.out.println("What would you like to do?");
		System.out.println("[1] Display schedule for all trips.");
		System.out.println("[2] Edit the schedule");
		System.out.println("[3] Display the stops of a given trip");
		System.out.println("[4] Display the weekly schedule of a given driver and date");
		System.out.println("[5] Add a driver");
		System.out.println("[6] Add a bus");
		System.out.println("[7] Delete a bus");
		System.out.println("[8] Record data of a given trip");
		
		Scanner in = new Scanner(System.in);
		int input = in.nextInt();
		
		switch(input) {
		case 1: displaySchedule();
			break;
		case 2: editSchedule();
			break;
		case 3: displayStops();
			break;
		case 4: displayWeeklySchedule();
			break;
		case 5: addDriver();
			break;
		case 6: addBus();
			break;
		case 7: deleteBus();
			break;
		case 8: recordData();
			break;
		default: System.out.println("Invalid input. Try again.");
			menu();
			break;
		}
		in.close();
		
	}

	private static void recordData() {
		// TODO Auto-generated method stub
		
	}

	private static void deleteBus() {
		// TODO Auto-generated method stub
		
	}

	private static void addBus() {
		// INSERT INTO 'pomona_transit'.'bus'('BusID', 'Model', 'Year') VALUES('5', 'Tour', '2013');
		int a = 0;
		String b = "NULL";
		int c = 0;
		
		System.out.println("Add stuff");
		Scanner in = new Scanner(System.in);

			a = in.nextInt();
			c = in.nextInt();
			b = in.next();

		
		
		System.out.println("A: " + a);
		System.out.println("B: " + b);
		System.out.println("C: " + c);
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
			String varSQL = "INSERT INTO BUS VALUES('" + a + "', '" + b + "', '" + c + "');";
			stmt.executeUpdate(varSQL);
			
			
			/**Can delete beneath this**/
			String select = "SELECT * FROM BUS";
			ResultSet rs = stmt.executeQuery(select);
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
		in.close();
	}

	private static void addDriver() {
		// TODO Auto-generated method stub
		
	}

	private static void displayWeeklySchedule() {
		// TODO Auto-generated method stub
		
	}

	private static void displayStops() {
		// TODO Auto-generated method stub
		
	}

	private static void editSchedule() {
		// TODO Auto-generated method stub
		
	}

	private static void displaySchedule() {
		// TODO Auto-generated method stub
		
	}
}
