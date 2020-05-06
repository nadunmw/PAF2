/**
 * 
 */
package com.labsheet10;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;

/**
 * @author nadun
 *
 */
public class Item {

	public Connection connect() {
		Connection con = null;

		try {
			Class.forName("com.mysql.jdbc.Driver");
			con = DriverManager.getConnection("jdbc:mysql://127.0.0.1:3306/healthcare", "root", "");
			// For testing
			System.out.print("Successfully connected");
		} catch (Exception e) {
			e.printStackTrace();
		}

		return con;
	}

	public String insertItem(String fname, String lname, String nic, String dob, String pw) {
		
		String output = "";
		
		try {
			Connection con = connect();

			if (con == null) {
				
				return "Error while connecting to the database";
				
			}

			// create a prepared statement
			String query = " insert into patients " + "(`patient_id`,`first_name`,`last_name`,`NIC`,`DOB`,`Password`)"
					+ " values (?, ?, ?, ?, ?, ?)";

			PreparedStatement preparedStmt = con.prepareStatement(query);

			// binding values
			preparedStmt.setInt(1, 0);
			preparedStmt.setString(2, fname);
			preparedStmt.setString(3, lname);
			preparedStmt.setString(4, nic);
			preparedStmt.setString(5, dob);
			preparedStmt.setString(6, pw);

			// execute the statement
			preparedStmt.execute();
			con.close();

			String newItems = readItems();
			output = "{\"status\":\"success\", \"data\": \"" +
			newItems + "\"}";

		}
		catch (Exception e)
		{
			output = "{\"status\":\"error\", \"data\":\"Error while inserting the item.\"}";
			System.err.println(e.getMessage());
		}
		return output;
	}

	public String updateItem( String id,String fname, String lname, String nic, String dob, String password) {
		String output = "";
		try {
			Connection con = connect();

			if (con == null) {
				return "Error while connecting to the database";
			}

			// create a prepared statement
			String query = "update patients set first_name = ?,last_name = ?,NIC = ?,DOB = ?,Password = ? where patient_id = ?";

			PreparedStatement preparedStmt = con.prepareStatement(query);

			// binding values

			preparedStmt.setString(1, fname);
			preparedStmt.setString(2, lname);
			preparedStmt.setString(3, nic);
			preparedStmt.setString(4, dob);
			preparedStmt.setString(5, password);

			preparedStmt.setInt(6, Integer.parseInt(id));
			// execute the statement
			preparedStmt.execute();
			con.close();

			String newItems = readItems();
			output = "{\"status\":\"success\", \"data\": \"" +
			newItems + "\"}";

		}
		catch (Exception e)
		{
			output = "{\"status\":\"error\", \"data\":\"Error while updating the item.\"}";
			System.err.println(e.getMessage());
		}
		return output;
	}

	public String readItems()
	{
			String output = "";
			
			try
			{
					Connection con = connect();
					
					if (con == null)
					{
							return "Error while connecting to the database for reading.";
					}
					
					// Prepare the html table to be displayed
					output = "<table border='1'><tr><th>patient_id</th>"
							+ "<th>first_name</th><th>last_name</th>"
							+ "<th>NIC</th>" + "<th>DOB</th>" + "<th>Password</th>"
							+ "<th>Update</th><th>Remove</th></tr>";
					
					String query = "select * from patients";
					Statement stmt = con.createStatement();
					ResultSet rs = stmt.executeQuery(query);
					
					// iterate through the rows in the result set
					while (rs.next())
					{
							String patient_id = Integer.toString(rs.getInt("patient_id"));
							String first_name = rs.getString("first_name");
							String last_name = rs.getString("last_name");
							String NIC = rs.getString("NIC");
							String DOB = rs.getString("DOB");
							String Password = rs.getString("Password");
							
							// Add into the html table
							output += "<tr><td><input id='hidItemIDUpdate'name='hidItemIDUpdate' type='hidden' value='" + patient_id+ "'>" + patient_id + "</td>";
							output += "<td>" + first_name + "</td>";
							output += "<td>" + last_name + "</td>";
							output += "<td>" + NIC + "</td>";
							output += "<td>" + DOB + "</td>";
							output += "<td>" + Password + "</td>";
							
							// buttons
							output += "<td><input name='btnUpdate'type='button' value='Update' class='btnUpdate btn btn-secondary'></td>"
								   + "<td><input name='btnRemove'type='button' value='Remove' class='btnRemove btn btn-danger'data-itemid='"+ patient_id + "'></td></tr>";
					}
					con.close();
					// Complete the html table
					output += "</table>";
			}
			catch (Exception e)
			{
			output = "Error while reading the items.";
			System.err.println(e.getMessage());
			}
			return output;
	}

	public String deleteItem(String itemID) {
		
		String output = "";

		try {

				Connection con = connect();
	
				if (con == null) {
					return "Error while connecting to the database for deleting.";
				}
	
				// create a prepared statement
				String query = "delete from patients where patient_id=?";
				
				PreparedStatement preparedStmt = con.prepareStatement(query);
				// binding values
				preparedStmt.setInt(1, Integer.parseInt(itemID));
	
				// execute the statement
				preparedStmt.execute();
				con.close();
				
				String newItems = readItems();
				output = "{\"status\":\"success\", \"data\": \"" +
				newItems + "\"}";
		}		
		catch (Exception e)
		{
				output = "{\"status\":\"error\", \"data\":\"Error while deleting the item.\"}";
				System.err.println(e.getMessage());
		}
		
		return output;
	}

}
