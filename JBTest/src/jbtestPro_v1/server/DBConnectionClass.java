package jbtestPro_v1.server;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.Vector;

public class DBConnectionClass
{
	static final String user="user=margarita;";
	static final String password="password=Mb123456";
	static final String dataBaseName="databaseName=JBTest;";
	static final String instanceName="instanceName=MSSQLSERVER;";
	static final String sqlPath="jdbc:sqlserver://212.150.144.16:1433;";
	static final String conString =sqlPath+instanceName+dataBaseName+user+password; 
	
	//------------system main page--------------//
	public static Vector<String[]> getTodayTests() //today table
	{
		Vector<String[]> toReturn=new  Vector<String[]>();
		
		Connection conn=null;
		Statement stmt = null;
		String sql;
		
		try {
			//to connect to the SQL server
			Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver");
			conn = DriverManager.getConnection(conString);
			stmt = conn.createStatement();
			sql = "SELECT id, firstnameheb, lastnameheb, hour FROM manager m, students s"
					+ " WHERE m.studentid = s.id AND m.passed IS NULL AND m.scheduledate='"+CalenderClass.getTodayFullDate()+"'";
			ResultSet rs = stmt.executeQuery(sql);
			
			while(rs.next()){
				
				String[] today = new String[4];


				today[0] = Integer.toString(rs.getInt("id"));
				today[1] = rs.getString("firstnameheb");
				today[2] = rs.getString("lastnameheb");
				today[3] = rs.getString("hour");

				toReturn.add(today);
			}
			rs.close();
			stmt.close();
			conn.close();
		} 
		catch (ClassNotFoundException e) 
		{
			e.printStackTrace();
		} 
		catch (SQLException e) 
		{
			e.printStackTrace();
		}
		
		return toReturn;
	}
	
	public static Vector<String[]> getNewTestsRequest() //new table - test for confirmation
	{
		Vector<String[]> toReturn=new  Vector<String[]>();
		
		Connection conn=null;
		Statement stmt = null;
		String sql;
		try {
			//to connect to the SQL server
			Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver");
			String conString =sqlPath+instanceName+dataBaseName+user+password;
			conn = DriverManager.getConnection(conString);
			stmt = conn.createStatement();
			sql = "SELECT id, firstnameheb, lastnameheb, scheduledate, hour FROM manager m, students s "
					+ "WHERE m.studentid = s.id AND m.confirmed='no' AND m.cancelledTest='no'"
					+ " AND m.scheduledate > '"+CalenderClass.getTodayFullDate()+"'";
			ResultSet rs = stmt.executeQuery(sql);
			
			while(rs.next()){
				
				String[] newTest = new String[5];

				newTest[0] = Integer.toString(rs.getInt("id"));
				newTest[1] = rs.getString("firstnameheb");
				newTest[2] = rs.getString("lastnameheb");
				newTest[3] = rs.getString("scheduledate");
				newTest[4] = rs.getString("hour");

				toReturn.add(newTest);
			}
			rs.close();
			stmt.close();
			conn.close();
		} 
		catch (ClassNotFoundException e) 
		{
			e.printStackTrace();
		} 
		catch (SQLException e) 
		{
			e.printStackTrace();
		}
		return toReturn;
	}
	 
	public static Vector<String[]> getCancelTestsRequest() //cancel table - test for cancellation
	{
		Vector<String[]> toReturn=new  Vector<String[]>();
		
		Connection conn=null;
		Statement stmt = null;
		String sql;
		
		try {
			//to connect to the SQL server
			Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver");
			String conString =sqlPath+instanceName+dataBaseName+user+password;
			conn = DriverManager.getConnection(conString);
			stmt = conn.createStatement();
			sql = "SELECT id, firstnameheb, lastnameheb, scheduledate, hour "
					+ "FROM manager m, students s "
					+ "WHERE m.studentid = s.id AND m.cancelledTest='yes'AND m.scheduledate > '"+CalenderClass.getTodayFullDate()+"'";
			ResultSet rs = stmt.executeQuery(sql);
			
			while(rs.next()){
				
				String[] cancelTest = new String[5];

				cancelTest[0] = Integer.toString(rs.getInt("id"));
				cancelTest[1] = rs.getString("firstnameheb");
				cancelTest[2] = rs.getString("lastnameheb");
				cancelTest[3] = rs.getString("scheduledate");
				cancelTest[4] = rs.getString("hour");

				toReturn.add(cancelTest);
			}
			rs.close();
			stmt.close();
			conn.close();
		} 
		catch (ClassNotFoundException e) 
		{
			e.printStackTrace();
		} 
		catch (SQLException e) 
		{
			e.printStackTrace();
		}

		return toReturn;
	}
	
	
	//------------------cancel test----------------------------//
	
	
	public static void deleteTest(int id, String date) //delete test that was already confirmed
	{
		Connection conn=null;
		Statement stmt = null;
		String sql;
		String sqlsch;
		
		try {
			//to connect to the SQL server
			Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver");
			String conString =sqlPath+instanceName+dataBaseName+user+password;
			conn = DriverManager.getConnection(conString);
			stmt = conn.createStatement();
			sql = "DELETE FROM manager WHERE cancelledTest='yes' AND studentid ="+id+" AND scheduledate='"+date+"'";
			sqlsch = "UPDATE schedule SET numoftests=numoftests-1 WHERE date='"+date+"'";
			
			stmt.executeUpdate(sql);
			stmt.executeUpdate(sqlsch);

			stmt.close();
			conn.close();
		} 
		catch (ClassNotFoundException e) 
		{
			e.printStackTrace();
		} 
		catch (SQLException e) 
		{
			e.printStackTrace();
		}

	}
	
	//-----------------system confirm student------------------------//
	//------------------get student by id----------------------------//
	
	public static String[] getStudentByID(int studentId) //cancel table - test for cancellation
	{
		String[] students = new String[14];
		
		Connection conn=null;
		Statement stmt = null;
		String sql;
		
		try {
			//to connect to the SQL server
			Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver");
			String conString =sqlPath+instanceName+dataBaseName+user+password;
			conn = DriverManager.getConnection(conString);
			stmt = conn.createStatement();
			sql = "SELECT * FROM students WHERE id=" + studentId;
			ResultSet rs = stmt.executeQuery(sql);
			
			while(rs.next()){
				students[0] = Integer.toString(rs.getInt("id"));
				students[1] = Integer.toString(rs.getInt("sr"));
				students[2] = rs.getString("firstnameheb");
				students[3] = rs.getString("lastnameheb");
				students[4] = rs.getString("firstnameeng");
				students[5] = rs.getString("lastnameeng");
				students[6] = rs.getString("address");
				students[7] = rs.getString("city");
				students[8] = rs.getString("email");
				students[9] = rs.getString("phone1");
				students[10] = rs.getString("phone2");
				students[11] = rs.getString("collage");
				students[12] = rs.getString("course");
				students[13] = rs.getString("freetestnum");
			}
			rs.close();
			stmt.close();
			conn.close();
		} 
		catch (ClassNotFoundException e) 
		{
			e.printStackTrace();
		} 
		catch (SQLException e) 
		{
			e.printStackTrace();
		}

		return students;
	}
	
	public static String[] getStudentHeb(int studentId) //cancel table - test for cancellation
	{
		String[] students = new String[2];
		
		Connection conn=null;
		Statement stmt = null;
		String sql;
		
		try {
			//to connect to the SQL server
			Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver");
			String conString =sqlPath+instanceName+dataBaseName+user+password;
			conn = DriverManager.getConnection(conString);
			stmt = conn.createStatement();
			sql = "SELECT firstnameheb ,lastnameheb  FROM students WHERE id=" + studentId;
			ResultSet rs = stmt.executeQuery(sql);
			
			while(rs.next()){
				
				students[0] = rs.getString("firstnameheb");
				students[1] = rs.getString("lastnameheb");
				
			}
			rs.close();
			stmt.close();
			conn.close();
		} 
		catch (ClassNotFoundException e) 
		{
			e.printStackTrace();
		} 
		catch (SQLException e) 
		{
			e.printStackTrace();
		}

		return students;
	}
	
	//------------------get test to confirm by student----------------------------//
	
	public static Vector<String[]> getNewTestByStudentId(int id) //new table - test for confirmation
	{
		Vector<String[]> toReturn=new  Vector<String[]>();
		
		Connection conn=null;
		Statement stmt = null;
		String sql;
		try {
			//to connect to the SQL server
			Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver");
			String conString =sqlPath+instanceName+dataBaseName+user+password;
			conn = DriverManager.getConnection(conString);
			stmt = conn.createStatement();
			sql = "SELECT testcode, scheduledate, hour, secondshot FROM manager "
					+ "WHERE studentid="+id +" AND confirmed='no' AND scheduledate > '"+CalenderClass.getTodayFullDate()+"'";
			ResultSet rs = stmt.executeQuery(sql);
			
			while(rs.next()){
				
				String[] newTest = new String[5];

				newTest[0] = rs.getString("testcode");
				newTest[1] = rs.getString("scheduledate");
				newTest[2] = rs.getString("hour");
				newTest[3] = rs.getString("secondshot");
				
				toReturn.add(newTest);
			}
			rs.close();
			stmt.close();
			conn.close();
		} 
		catch (ClassNotFoundException e) 
		{
			e.printStackTrace();
		} 
		catch (SQLException e) 
		{
			e.printStackTrace();
		}
		return toReturn;
	}

	
	//------------------get up coming test by student----------------------------//
	
		public static Vector<String[]> getUpComingTestByStudentId(int id) //new table - test for confirmation
		{
			Vector<String[]> toReturn=new  Vector<String[]>();
			
			Connection conn=null;
			Statement stmt = null;
			String sql;
			try {
				//to connect to the SQL server
				Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver");
				String conString =sqlPath+instanceName+dataBaseName+user+password;
				conn = DriverManager.getConnection(conString);
				stmt = conn.createStatement();
				sql = "SELECT testcode, scheduledate, hour, secondshot FROM manager "
						+ "WHERE studentid="+id +" AND confirmed='yes' AND scheduledate >= '"+CalenderClass.getTodayFullDate()+"'";
				ResultSet rs = stmt.executeQuery(sql);
				
				while(rs.next()){
					
					String[] newTest = new String[5];

					newTest[0] = rs.getString("testcode");
					newTest[1] = rs.getString("scheduledate");
					newTest[2] = rs.getString("hour");
					newTest[3] = rs.getString("secondshot");
					
					toReturn.add(newTest);
				}
				rs.close();
				stmt.close();
				conn.close();
			} 
			catch (ClassNotFoundException e) 
			{
				e.printStackTrace();
			} 
			catch (SQLException e) 
			{
				e.printStackTrace();
			}
			return toReturn;
		}
	
	
	//------------------get history tests by student----------------------------//
	
	public static Vector<String[]> getHistoryTestStudentId(int studentId)
	{
		Vector<String[]> toReturn=new  Vector<String[]>();

		Connection conn=null;
		Statement stmt = null;
		String sql;
		
		try {
			//to connect to the SQL server
			Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver");

			String conString =sqlPath+instanceName+dataBaseName+user+password;
			conn = DriverManager.getConnection(conString);
			stmt = conn.createStatement();
			sql = "SELECT testcode , scheduledate , hour, passed ,secondshot "
					+ "FROM manager "
					+ "WHERE studentid="+studentId+" AND scheduledate < '"+CalenderClass.getTodayFullDate()+"'";
			
			ResultSet rs = stmt.executeQuery(sql);
			while(rs.next()){
				String[] temp=new String[5];

				temp[0] = rs.getString("testcode");
				temp[1] = rs.getString("scheduledate");
				temp[2] = rs.getString("hour");
				temp[3] = rs.getString("passed");
				temp[4] = rs.getString("secondshot");

				toReturn.add(temp);
			}	
			rs.close();
			stmt.close();
			conn.close();
		} 
		catch (ClassNotFoundException e){e.printStackTrace();} 
		catch (SQLException e){e.printStackTrace();	}
		
		return toReturn;


	}

	//------------------confirm test by student----------------------------//
	
			public static void confirmTest(int id,String date, String freeTest) //new table - test for confirmation
			{			
				Connection conn=null;
				Statement stmt = null;
				String sql;
				String sqlfree;
				try {
					//to connect to the SQL server
					Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver");
					String conString =sqlPath+instanceName+dataBaseName+user+password;
					conn = DriverManager.getConnection(conString);
					stmt = conn.createStatement();
					sql = "UPDATE manager SET confirmed = 'yes' "
							+ "WHERE studentid="+id+" AND scheduledate='"+date+"'";
					if (freeTest.equals("true"))
					{
						sqlfree = "UPDATE students SET freetestnum=freetestnum-1 WHERE id="+id;
						stmt.executeUpdate(sqlfree);
					}
					stmt.executeUpdate(sql);
		
					stmt.close();
					conn.close();
				} 
				catch (ClassNotFoundException e) 
				{
					e.printStackTrace();
				} 
				catch (SQLException e) 
				{
					e.printStackTrace();
				}
			}

	
	
	//------------------update test results----------------------------//
	
	
		public static void updateTestResult(int id, String passYN) //update test result --> pass / fail
		{
			Connection conn=null;
			Statement stmt = null;
			String sql;
			
			try {
				//to connect to the SQL server
				Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver");
				String conString =sqlPath+instanceName+dataBaseName+user+password;
				conn = DriverManager.getConnection(conString);
				stmt = conn.createStatement();
				sql = "UPDATE manager SET passed='"+passYN+"' WHERE studentid="+id+" AND scheduledate='"+ CalenderClass.getTodayFullDate()+"'";
				stmt.executeUpdate(sql);

				stmt.close();
				conn.close();
			} 
			catch (ClassNotFoundException e) 
			{
				e.printStackTrace();
			} 
			catch (SQLException e) 
			{
				e.printStackTrace();
			}

		}
		

		//----------------update student details----------------//
		public static void updateStudentDetails(int id, int sr, String lnh,String pnh, String lne,String pne,
				String mail,String addr,String city,String p1,String p2,String course,String collage) //new table - test for confirmation
		{			
			Connection conn=null;
			Statement stmt = null;
			String sql;
			try {
				//to connect to the SQL server
				Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver");
				String conString =sqlPath+instanceName+dataBaseName+user+password;
				conn = DriverManager.getConnection(conString);
				stmt = conn.createStatement();
				sql = "UPDATE students SET sr="+sr+" ,firstnameheb='"+pnh+"' ,lastnameheb='"+lnh+"' ,firstnameeng='"+pne
						+"' ,lastnameeng='"+lne+"' ,address='"+addr+"' ,city='"+city+"' ,email='"+mail+"' ,phone1='"+p1
						+"' ,phone2='"+p2+"' ,collage='"+collage+"' ,course='"+course+"'"
						+ "WHERE id="+id;
				stmt.executeUpdate(sql);
	
				stmt.close();
				conn.close();
			} 
			catch (ClassNotFoundException e) 
			{
				e.printStackTrace();
			} 
			catch (SQLException e) 
			{
				e.printStackTrace();
			}
		}

	
	
	//---------------------------------------------------------//
		public static Vector<String> getTestList()
		{
			Vector<String> toReturn=new  Vector<String>();

			Connection conn=null;
			Statement stmt = null;
			String sql;
			
			try {
				//to connect to the SQL server
				Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver");

				String conString =sqlPath+instanceName+dataBaseName+user+password;
				conn = DriverManager.getConnection(conString);
				stmt = conn.createStatement();
				sql = "SELECT code FROM tests ";
				
				ResultSet rs = stmt.executeQuery(sql);
				while(rs.next()){
					String temp= rs.getString("code");
					toReturn.add(temp);
				}	
				rs.close();
				stmt.close();
				conn.close();
			} 
			catch (ClassNotFoundException e){e.printStackTrace();} 
			catch (SQLException e){e.printStackTrace();	}
			
			return toReturn;


		}

	public static Vector<String[]> getNextTestById(int studentId)
	{
		Vector<String[]> toReturn=new  Vector<String[]>();

		Connection conn=null;
		Statement stmt = null;
		String sql;
		
		try {
			//to connect to the SQL server
			Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver");

			String conString =sqlPath+instanceName+dataBaseName+user+password;
			conn = DriverManager.getConnection(conString);
			stmt = conn.createStatement();
			String studID = Integer.toString(studentId);
			sql = "SELECT code , name , scheduledate , hour "
					+ "FROM manager m,tests t "
					+ "WHERE m.testcode=t.code AND m.studentid="+studID+" AND m.scheduledate >= '"+CalenderClass.getTodayFullDate()+"' AND m.passed IS NULL";
			ResultSet rs = stmt.executeQuery(sql);
			while(rs.next()){
				String[] temp=new String[4];

				temp[0] = rs.getString("code");
				temp[1] = rs.getString("name");
				temp[2] = rs.getString("scheduledate");
				temp[3] = rs.getString("hour");

				toReturn.add(temp);
			}	
			rs.close();
			stmt.close();
			conn.close();
		} 
		catch (ClassNotFoundException e){e.printStackTrace();} 
		catch (SQLException e){e.printStackTrace();	}
		
		return toReturn;


	}
	
	

	public static Vector<String[]> getHistoryTestById(int studentId)
	{
		Vector<String[]> toReturn=new  Vector<String[]>();

		Connection conn=null;
		Statement stmt = null;
		String sql;
		
		try {
			//to connect to the SQL server
			Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver");

			String conString =sqlPath+instanceName+dataBaseName+user+password;
			conn = DriverManager.getConnection(conString);
			stmt = conn.createStatement();
			String studID = Integer.toString(studentId);
			sql = "SELECT code , name , scheduledate , passed "
					+ "FROM manager m,tests t "
					+ "WHERE m.testcode=t.code AND m.studentid="+studID+" AND m.passed IS NOT NULL AND m.scheduledate <= '"+CalenderClass.getTodayFullDate()+"'";
			ResultSet rs = stmt.executeQuery(sql);
			while(rs.next()){
				String[] temp=new String[4];

				temp[0] = rs.getString("code");
				temp[1] = rs.getString("name");
				temp[2] = rs.getString("scheduledate");
				temp[3] = rs.getString("passed");

				toReturn.add(temp);
			}	
			rs.close();
			stmt.close();
			conn.close();
		} 
		catch (ClassNotFoundException e){e.printStackTrace();} 
		catch (SQLException e){e.printStackTrace();	}
		
		return toReturn;


	}
	
	
	public static int getNumOfRegStudInDate(String date)
	{
		int toReturn=-1;
		Connection conn=null;
		Statement stmt = null;
		String sql;
		
		try {

			Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver");
			String conString =sqlPath+instanceName+dataBaseName+user+password;
			conn = DriverManager.getConnection(conString);
			stmt = conn.createStatement();
			sql = "SELECT numoftests FROM schedule WHERE date='"+date+"T00:00:00.000'";
			ResultSet rs = stmt.executeQuery(sql);
			while(rs.next())
			{
				toReturn = rs.getInt("numoftests");
			}
			rs.close();
			stmt.close();
			conn.close();
		} 
		catch (ClassNotFoundException e) 
		{
			e.printStackTrace();
		} 
		catch (SQLException e) 
		{
			e.printStackTrace();
		}
		return toReturn;
	}

	public static Vector<String[]> getNamesOfRegStudInDate(String date)
	{
		Vector<String[]> toReturn=new  Vector<String[]>();
		Connection conn=null;
		Statement stmt = null;
		String sql;
		
		
		try {

			Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver");
			String conString =sqlPath+instanceName+dataBaseName+user+password;
			conn = DriverManager.getConnection(conString);
			stmt = conn.createStatement();
			sql = "SELECT s.firstnameheb , s.lastnameheb "
					+ "FROM manager m , students s  "
					+ "WHERE m.studentid=s.id AND  m.scheduledate='"+date+"T00:00:00.000'";
			ResultSet rs = stmt.executeQuery(sql);
			while(rs.next())
			{
				String[] temp=new String[2];
				
				temp[0] = rs.getString("firstnameheb");
				temp[1] = rs.getString("lastnameheb");

				toReturn.add(temp);

			}
			rs.close();
			stmt.close();
			conn.close();
		} 
		catch (ClassNotFoundException e) 
		{
			e.printStackTrace();
		} 
		catch (SQLException e) 
		{
			e.printStackTrace();
		}
		return toReturn;
	}




	private static DBArrClass db = new DBArrClass();



	/*	private DBConnectionClass()
	{

	}
	private static DBConnectionClass theInstance;
	public static DBConnectionClass getInstance()
	{
		if (theInstance==null)
			{
				theInstance = new DBConnectionClass();
				db = new DBArrClass();
			}
		return theInstance;
	}*/


	public static String[][] searchHistory(String start,String end)
	{

		String arr[][] = new String[50][50];
		int j = 0;
		for(int i = 0; i < db.getSchedule().length;i++)
		{
			if(checkDates(start,db.getSchedule()[i].getDate()) == 2 && checkDates(db.getSchedule()[i].getDate(), end) == 2)
			{
				arr[j][0] = Integer.toString( db.getSchedule()[i].getRegStudent().getId());
				arr[j][1] =  db.getSchedule()[i].getRegStudent().getlNameHeb();
				arr[j][2] =  db.getSchedule()[i].getRegStudent().getpNameHeb();
				arr[j][3] =  db.getSchedule()[i].getDate();
				arr[j][4] =  db.getSchedule()[i].getHour();
				arr[j][5] =  Integer.toString(db.getSchedule()[i].getTestStudent().getCost());
			}
			j++;
		}
		return arr;
	}

	public static String staffName(String user)
	{
		String p_name = "";
		for(int i = 0; i < db.getStaff().length; i++)
		{
			if (db.getStaff()[i].getUserName().equals(user))
				p_name = db.getStaff()[i].getPName();
		}
		return p_name;
	}

	public static String[][] courseInfo()
	{
		int j = 0;
		String[][] courseArr = new String[10][10];

		for(int i = 0; i < db.getCourse().length; i++)
		{
			if (j < courseArr.length)
			{
				courseArr[j][0] = Integer.toString(db.getCourse()[i].getCourseId());
				courseArr[j][1] = db.getCourse()[i].getCourseName();
			}
			j++;
		}
		return courseArr;
	}



	public static String[][] searchTodayTests()
	{		
		int j = 0;
		String todayDate = "02.12.13";
		String[][] todayArr = new String[4][4];

		for(int i = 0; i < db.getSchedule().length; i++)
		{
			if (db.getSchedule()[i].getDate().equals(todayDate))
			{	
				if (j < todayArr.length)
				{
					todayArr[j][0] = Integer.toString(db.getSchedule()[i].getRegStudent().getId());
					todayArr[j][1] = db.getSchedule()[i].getRegStudent().getlNameHeb();
					todayArr[j][2] = db.getSchedule()[i].getRegStudent().getpNameHeb();
					todayArr[j][3] = db.getSchedule()[i].getHour();
				}
				j++;
			}
		}

		return todayArr;	
	}

	public static String[][] searchCancelledTests()
	{		
		int j = 0;
		String todayDate = "02.12.13";
		String[][] cancelArr = new String[10][10];

		for(int i = 0; i < db.getSchedule().length; i++)
		{
			if (checkDates(todayDate, db.getSchedule()[i].getDate()) == 2 && db.getSchedule()[i].getCancelled().equals("��"))
			{	
				if (j < cancelArr.length)
				{
					cancelArr[j][0] = Integer.toString(db.getSchedule()[i].getRegStudent().getId());
					cancelArr[j][1] = db.getSchedule()[i].getRegStudent().getlNameHeb();
					cancelArr[j][2] = db.getSchedule()[i].getRegStudent().getpNameHeb();
					cancelArr[j][3] = db.getSchedule()[i].getDate();
					cancelArr[j][4] = db.getSchedule()[i].getHour();
				}
				j++;
			}
		}

		return cancelArr;	
	}

	public static String[][] searchNewTests()
	{	
		int j = 0;
		String todayDate = "02.12.13";
		String[][] newArr = new String[20][20];

		for(int i = 0; i < db.getSchedule().length; i++)
		{
			if (checkDates(todayDate, db.getSchedule()[i].getDate()) == 2 && db.getSchedule()[i].getCancelled().equals("��"))
			{
				if (j < newArr.length)
				{
					newArr[j][0] = Integer.toString(db.getSchedule()[i].getRegStudent().getId());
					newArr[j][1] = db.getSchedule()[i].getRegStudent().getlNameHeb();
					newArr[j][2] = db.getSchedule()[i].getRegStudent().getpNameHeb();
					newArr[j][3] = db.getSchedule()[i].getDate();
					newArr[j][4] = db.getSchedule()[i].getHour();
				}
				j++;
			}
		}
		return newArr;	
	}

	public static String[][] searchStudentNewTest(String sid)
	{
		int id = Integer.parseInt(sid);	
		int j = 0;
		String todayDate = "02.12.13";
		String[][] newArr = new String[20][20];

		for(int i = 0; i < db.getSchedule().length; i++)
		{
			if (checkDates(todayDate, db.getSchedule()[i].getDate()) == 2)
			{
				if(db.getSchedule()[i].getRegStudent().getId() == id)
				{
					if (j < newArr.length)
					{
						newArr[j][0] = Integer.toString(db.getSchedule()[i].getTestStudent().getTestId());
						newArr[j][1] = db.getSchedule()[i].getDate();
						newArr[j][2] = db.getSchedule()[i].getHour();
						newArr[j][3] = db.getSchedule()[i].getSecondShot();
					}
					j++;
				}
			}
		}
		return newArr;
	}

	public static String[][] searchStudentPastTests(String sid)
	{	
		int id = Integer.parseInt(sid);
		int j = 0;
		String todayDate = "02.12.13";
		String[][] newArr = new String[20][20];

		for(int i = 0; i < db.getSchedule().length; i++)
		{
			if(checkDates(todayDate, db.getSchedule()[i].getDate()) == 1)
			{
				if (db.getSchedule()[i].getRegStudent().getId() == id)
				{

					if (j < newArr.length)
					{
						newArr[j][0] = Integer.toString(db.getSchedule()[i].getTestStudent().getTestId());
						newArr[j][1] = db.getSchedule()[i].getDate();
						newArr[j][2] = db.getSchedule()[i].getHour();
						newArr[j][3] = db.getSchedule()[i].getPass();
						newArr[j][4] = db.getSchedule()[i].getSecondShot();
					}
					j++;
				}
			}
		}
		return newArr;	
	}

	public static String[][] searchStudentTodayTests(String sid)
	{	
		int id = Integer.parseInt(sid);
		int j = 0;
		String todayDate = "02.12.13";
		String[][] newArr = new String[20][20];

		for(int i = 0; i < db.getSchedule().length; i++)
		{
			if(db.getSchedule()[i].getDate().equals(todayDate))
			{
				if (db.getSchedule()[i].getRegStudent().getId() == id)
				{

					if (j < newArr.length)
					{
						newArr[j][0] = Integer.toString(db.getSchedule()[i].getRegStudent().getId());
						newArr[j][1] = db.getSchedule()[i].getRegStudent().getlNameHeb();
						newArr[j][2] = db.getSchedule()[i].getRegStudent().getpNameHeb();
						newArr[j][3] = db.getSchedule()[i].getHour();
					}
					j++;
				}
			}
		}
		return newArr;	
	}


	private static int checkDates(String todayDate, String date)
	{
		for (int i=todayDate.length()-1; i >= 0; i--)
		{
			if(todayDate.charAt(i) == '.' || date.charAt(i) == '.')
				continue;
			else if (Character.getNumericValue(todayDate.charAt(i)) == Character.getNumericValue(date.charAt(i)))
				continue;
			else if(Character.getNumericValue(todayDate.charAt(i)) < Character.getNumericValue(date.charAt(i)))
				return 2;//2 means that todayData is previous to date and 1 after
			else if(Character.getNumericValue(todayDate.charAt(i)) > Character.getNumericValue(date.charAt(i)))
			{
				if(i-1 >= 0)
				{
					if(Character.getNumericValue(todayDate.charAt(i-1)) < Character.getNumericValue(date.charAt(i-1)))
						return 2;
					else
						return 1;
				}
			}

		}
		return 0;
	}

	public static StudentClass searchStudent(String sid)
	{
		if(sid == null)
		{ 
			return null;
		}

		for(int i = 0;i < sid.length();i++)
		{
			if(sid.charAt(i) <'0' || sid.charAt(i) > '9')
				return null;
		}
		if(sid.length() < 9 || sid.length() > 9)
			return null;

		int id = Integer.parseInt(sid);
		for (int i=0; i<db.getStudents().length ;i++)
		{
			if (db.getStudents()[i].getId() == id)
				return db.getStudents()[i];
		}

		return null;
	}



	public static CourseClass searchByCourseCode(String ccode)
	{

		if(ccode == null)
			return null;
		for(int i = 0;i < ccode.length();i++)
			if(ccode.charAt(i) < '0' || ccode.charAt(i) > '9')
				return null;
		int id = Integer.parseInt(ccode);
		for (int i=0; i<db.getCourse().length ;i++)
		{
			if (db.getCourse()[i].getCourseId() == id)
				return db.getCourse()[i];
		}

		return null;
	}

	public static String[][] searchCourse(String scode)
	{
		int j = 0;
		int code = Integer.parseInt(scode);
		String[][] newArr = new String[20][20];

		for(int i = 0; i < db.getStudents().length; i++)
		{
			if(db.getStudents()[i].getsCourses().getCourseId() == code)
			{
				if (j < newArr.length)
				{
					newArr[j][1] = Integer.toString(db.getStudents()[i].getId());
					newArr[j][2] = db.getStudents()[i].getlNameHeb();
					newArr[j][3] = db.getStudents()[i].getpNameHeb();
				}
				j++;
			}
		}
		return newArr;

	}



	public static String[][] searchByDate(String date)
	{
		int j = 0;
		String[][] newArr = new String[20][20];

		for(int i = 0; i < db.getSchedule().length; i++)
		{
			if(db.getSchedule()[i].getDate().equals(date))
			{
				if (j < newArr.length)
				{
					newArr[j][0] = Integer.toString(db.getSchedule()[i].getRegStudent().getId());
					newArr[j][1] = db.getSchedule()[i].getRegStudent().getlNameHeb();
					newArr[j][2] = db.getSchedule()[i].getRegStudent().getpNameHeb();
					newArr[j][3] = Integer.toString(db.getSchedule()[i].getTestStudent().getTestId());
					newArr[j][4] = db.getSchedule()[i].getDate();
					newArr[j][5] = db.getSchedule()[i].getHour();
					newArr[j][6] = db.getSchedule()[i].getPass();
				}
				j++;
			}
		}
		return newArr;
	}



	public static int compUserStaff(String userName, String password)
	{
		int i;
		for(i = 0; i < db.getStaff().length;i++)
		{
			String tempPass = db.getStaff()[i].getPassword();
			String tempUser = (db.getStaff()[i].getUserName());
			if(tempUser.equals(userName) && tempPass.equals(password))
			{
				return 0;
			}
		}	
		return -1;

	}

	public static int compUserStudent(String userName, String password)
	{
		int i;
		for(i = 0; i < db.getStudents().length;i++)
		{
			String temp=Integer.toString(db.getStudents()[i].getId());
			if(temp.equals(userName) && db.getStudents()[i].getPassword().equals(password))
				return 0;
		}	
		return -1;
	}

	public static int changePasswordCheck(String userName, String Email)
	{

		int i;
		for(i = 0; i < db.getStudents().length;i++)
		{

			String temp=Integer.toString(db.getStudents()[i].getId());
			if(temp.equals(userName) && db.getStudents()[i].getEmail().equals(Email))
				return 0;

		}
		return -1;
	}

	public static int changeSysPasswordCheck(String userName, String Email)
	{

		int i;
		for(i = 0; i < db.getStaff().length;i++)
		{
			if(db.getStaff()[i].getUserName() == userName && db.getStaff()[i].getEmail().equals(Email))
				return 0;
		}
		return -1;
	}
	public static int changeSysUserCheck(String Email)
	{

		int i;
		for(i = 0; i < db.getStaff().length;i++)
		{
			if(db.getStaff()[i].getEmail().equals(Email))
				return 0;
		}
		return -1;
	}



	public static int rowsNum(String[][] arr)
	{
		int rows = 0;
		for(int i = 0; i < arr.length ; i++)
		{
			if(arr[i] != null && arr[i][0] != null)
				rows++;
		}
		return rows;
	}


	public static DBArrClass getDb() {
		return db;
	}

	public static void setDb(DBArrClass dbArr) {
		db = dbArr;
	}


	public static int validDate(String date)
	{
		int c=0;
		String[] dArr = date.split(".");
		if(date == null)
			return -1;
		if(date.length() != 8)
			return -1;
		for(int i = 0;i < date.length();i++)
		{
			if(date.charAt(i) < '0' || date.charAt(i) > '9')
				return -1;
			if(date.charAt(i) == '.')
			{
				if (i == 3 || i == 5)
					c++;
			}
		}	
		if (c != 2)
			return -1;
		if(Integer.parseInt(dArr[0]) < 0 || Integer.parseInt(dArr[0]) > 31)
			return -1;
		if(Integer.parseInt(dArr[1]) < 0 || Integer.parseInt(dArr[1]) > 12)
			return -1;
		if(Integer.parseInt(dArr[3]) < 0)
			return -1;
		for(int i = 0; i < 3; i++)
			if(dArr[i].length() != 2)
				return -1;
		return 0;
	}

	public static Vector<String> getCourseByCollage(String location) 
	{
		Vector <String> codeList=new Vector<String>();
		Connection conn=null;
		Statement stmt = null;
		String sql;
		
		try {
			//to connect to the SQL server
			Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver");
			String conString =sqlPath+instanceName+dataBaseName+user+password;
			conn = DriverManager.getConnection(conString);
			stmt = conn.createStatement();
			sql = "SELECT code FROM courses c WHERE c.location='"+location+"'";
			ResultSet rs = stmt.executeQuery(sql);
				
			while(rs.next()){
				
				String code = rs.getString("code");
				codeList.add(code);
				
				
				
			}
			rs.close();
			stmt.close();
			conn.close();
		} 
		catch (ClassNotFoundException e) 
		{
			e.printStackTrace();
		} 
		catch (SQLException e) 
		{
			e.printStackTrace();
		}
		return codeList;
	}
	

	public static void insertToSql(int id,String firstnameheb,String lastnameheb,String firstnameeng,String lastnameeng,String passw, String address,String city,String email,String phone1,String phone2,String collage,String course) 
	{
		Connection conn=null;
		Statement stmt = null;
		String sql;
		String sqlFreeTest;
		try {
			//to connect to the SQL server
			Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver");
			String conString =sqlPath+instanceName+dataBaseName+user+password;
			conn = DriverManager.getConnection(conString);
			stmt = conn.createStatement();
			sql= "INSERT INTO students "+"VALUES ( "+id+","+"'',"+"'"+firstnameheb+"'"+","+"'"+lastnameheb+"','"+firstnameeng
					+"'"+","+"'"+lastnameeng+"'"+","+"'"+passw+"'"+","+"'"+address
					+"'"+","+"'"+city+"'"+","+"'"+email+"'"+","+"'"+phone1+"'"+","+"'"+phone2+"'"+","+"'"+collage
					+"','"+course+"',0)";	
			if(collage.equals("JBTJer") || collage.equals("JBTTlv"))
			{
				sqlFreeTest="UPDATE students SET freetestnum=4 WHERE id="+id;
			}
			else
			{
				sqlFreeTest="UPDATE students SET freetestnum=0 WHERE id="+id;
			}
			stmt.executeUpdate(sql);
			stmt.executeUpdate(sqlFreeTest);
			conn.close();
		} 
		catch (ClassNotFoundException e) 
		{
			e.printStackTrace();
		} 
		catch (SQLException e) 
		{
			e.printStackTrace();
		} 
		
	}
	
	
	
	
	public static void insertTotest(String testCode,int id,String date,String secondShot,int cost,String hour) 
	{
		Connection conn=null;
		Statement stmt = null;
		String sql;
		
		try {
			//to connect to the SQL server
			Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver");
			String conString =sqlPath+instanceName+dataBaseName+user+password;
			conn = DriverManager.getConnection(conString);
			stmt = conn.createStatement();
			sql= "INSERT INTO manager"+" VALUES("+"'"+testCode+"'"+","+"'"+id+"'"+","+"'"+date
					+" 00:00:00.000','"+secondShot+"'"+","+"'"+Integer.toString(cost)+"'"+","+"'"+"no"
					+"'"+","+"'"+"NULL"+"'"+","+"'"+"no"+"'"+","+"'"+"no"+"'"+","+"'"+hour+":00"
					+"')";		
			System.out.println(sql);
			stmt.executeUpdate(sql);
			conn.close();
		} 
		catch (ClassNotFoundException e) 
		{
			System.out.println("333");
			e.printStackTrace();
		} 
		catch (SQLException e) 
		{
			System.out.println("333");
			e.printStackTrace();
		} 
		
	}
	
	
	public static void insertNewSchedule(String date) 
	{
		Connection conn=null;
		Statement stmt = null;
		String sql;
		
		try {
			//to connect to the SQL server
			Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver");
			String conString =sqlPath+instanceName+dataBaseName+user+password;
			conn = DriverManager.getConnection(conString);
			stmt = conn.createStatement();
			sql= "INSERT INTO schedule"+" VALUES("+"'"+date+" 00:00:00.000'"+","+"'"+"1"
					+"')";		
			
			stmt.executeUpdate(sql);
			conn.close();
		} 
		catch (ClassNotFoundException e) 
		{
			
			e.printStackTrace();
		} 
		catch (SQLException e) 
		{
			
			e.printStackTrace();
		} 
		
	}
	
	public static void updateSchedule(String date) //new table - test for confirmation
	{			
		Connection conn=null;
		Statement stmt = null;
		String sql;
		try {
			//to connect to the SQL server
			Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver");
			String conString =sqlPath+instanceName+dataBaseName+user+password;
			conn = DriverManager.getConnection(conString);
			stmt = conn.createStatement();
			sql = "UPDATE schedule SET numoftests=numoftests+1 WHERE date='"+date+"T00:00:00.000'";
			
			stmt.executeUpdate(sql);
			
			stmt.close();
			conn.close();
		} 
		catch (ClassNotFoundException e) 
		{
			
			e.printStackTrace();
		} 
		catch (SQLException e) 
		{
			
			e.printStackTrace();
		}
	}

	
	
	//********ravit************////
	public static Vector<String[]> CourseCode(String ccode)
	{
		Vector <String[]> courseList=new Vector<String[]>();
		Connection conn=null;
		Statement stmt = null;
		String sql;
		
		try {
			//to connect to the SQL server
			Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver");
			String conString =sqlPath+instanceName+dataBaseName+user+password;
			conn = DriverManager.getConnection(conString);
			stmt = conn.createStatement();
			sql = "SELECT id,firstnameheb,lastnameheb FROM students s WHERE s.course='"+ccode+"'";
			ResultSet rs = stmt.executeQuery(sql);
			

			while(rs.next()){
				
				String[] temp=new String[3];
				temp[0] = rs.getString("id");
				temp[1] = rs.getString("firstnameheb");
				temp[2] = rs.getString("lastnameheb");
				courseList.add(temp);
			}
			rs.close();
			stmt.close();
			conn.close();
		} 
		catch (ClassNotFoundException e) 
		{
			e.printStackTrace();
		} 
		catch (SQLException e) 
		{
			e.printStackTrace();
		}
		return courseList;

	}
	
	public static String[] getCourseByCode(String code) 
	{
		String[] course = new String[4];
		Connection conn=null;
		Statement stmt = null;
		String sql;
		
		try {
			//to connect to the SQL server
			Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver");
			String conString =sqlPath+instanceName+dataBaseName+user+password;
			conn = DriverManager.getConnection(conString);
			stmt = conn.createStatement();
			sql = "SELECT code ,name,startDate,endDate FROM courses c WHERE c.code='"+code+"'";
			ResultSet rs = stmt.executeQuery(sql);

			while(rs.next()){
				
					course[0] = rs.getString("code");
					course[1] = rs.getString("name");
					course[2] = CalenderClass.dateFormatServerToWeb(rs.getString("startDate"));
					course[3] =  CalenderClass.dateFormatServerToWeb(rs.getString("endDate"));
					
			}
			
			rs.close();
			stmt.close();
			conn.close();
		} 
		catch (ClassNotFoundException e) 
		{
			e.printStackTrace();
		} 
		catch (SQLException e) 
		{
			e.printStackTrace();
		}
		return course;
	}
	

	public static Vector<String[]> coursesTable() 
	{
		Vector <String[]> courseList=new Vector<String[]>();
		Connection conn=null;
		Statement stmt = null;
		String sql;
		
		try {
			//to connect to the SQL server
			Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver");
			String conString =sqlPath+instanceName+dataBaseName+user+password;
			conn = DriverManager.getConnection(conString);
			stmt = conn.createStatement();
			sql = "SELECT code ,name,startDate,endDate FROM courses c WHERE c.location='�������'";
			ResultSet rs = stmt.executeQuery(sql);

			while(rs.next()){
					String[] temp=new String[4];
					
					temp[0] = rs.getString("code");
					temp[1] = rs.getString("name");
					temp[2] = CalenderClass.dateFormatServerToWeb(rs.getString("startDate"));
					temp[3] = CalenderClass.dateFormatServerToWeb(rs.getString("endDate"));
					courseList.add(temp);
			
			}
			
			rs.close();
			stmt.close();
			conn.close();
		} 
		catch (ClassNotFoundException e) 
		{
			e.printStackTrace();
		} 
		catch (SQLException e) 
		{
			e.printStackTrace();
		}
		return courseList;
	}
	
	public static int changePassword(String userName, String Email)
	{

		Connection conn=null;
		Statement stmt = null;
		String sql;
		int flag = 0;

		try {
			//to connect to the SQL server
			Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver");
			String conString =sqlPath+instanceName+dataBaseName+user+password;
			conn = DriverManager.getConnection(conString);
			stmt = conn.createStatement();
			sql = "SELECT id ,password FROM students WHERE id='"+userName+"'";
			ResultSet rs = stmt.executeQuery(sql);
			
			while(rs.next()){
				
				String emailS = rs.getString("email");
				if(Email.equals(emailS))
					flag = 1;

			}
			
			rs.close();
			stmt.close();
			conn.close();
		} 
		catch (ClassNotFoundException e) 
		{
			e.printStackTrace();
		} 
		catch (SQLException e) 
		{
			e.printStackTrace();
		}
		if (flag == 1)
			return 0;
		else return -1;
	}
	
	public static int compUserNameStaff(String userName, String pass)
	{
		
		Connection conn=null;
		Statement stmt = null;
		String sql;
		int flag = 0;

		try {
			//to connect to the SQL server
			Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver");
			String conString =sqlPath+instanceName+dataBaseName+user+password;
			conn = DriverManager.getConnection(conString);
			stmt = conn.createStatement();
			sql = "SELECT username ,password FROM staff WHERE username='"+userName+"'";
			ResultSet rs = stmt.executeQuery(sql);
			
			while(rs.next()){
				
				String passW = rs.getString("password");
				if(passW.equals(pass))
					flag = 1;

			}
			
			rs.close();
			stmt.close();
			conn.close();
		} 
		catch (ClassNotFoundException e) 
		{
			e.printStackTrace();
		} 
		catch (SQLException e) 
		{
			e.printStackTrace();
		}
		if (flag == 1)
			return 0;
		else return -1;

	}
	
	
	public static int compUserNameStudent(String userName, String pass)
	{

		Connection conn=null;
		Statement stmt = null;
		String sql;
		int flag = 0;

		try {
			//to connect to the SQL server
			Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver");
			String conString =sqlPath+instanceName+dataBaseName+user+password;
			conn = DriverManager.getConnection(conString);
			stmt = conn.createStatement();
			sql = "SELECT id ,password FROM students WHERE id='"+userName+"'";
			ResultSet rs = stmt.executeQuery(sql);
		
			while(rs.next()){
				
				String passW = rs.getString("password");
				if(passW.equals(pass))
					flag = 1;

			}
			
			rs.close();
			stmt.close();
			conn.close();
		} 
		catch (ClassNotFoundException e) 
		{
			e.printStackTrace();
		} 
		catch (SQLException e) 
		{
			e.printStackTrace();
		}
		if (flag == 1)
			return 0;
		else return -1;
		
	}
	
	
	//------------history result page------------------
	public static Vector<String[]>historyResult(String startD,String endD)
	{
		Vector<String[]> toReturn=new  Vector<String[]>();
				
		Connection conn=null;
		Statement stmt = null;
		String sql;
				
		try {
		//to connect to the SQL server
			Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver");

			String conString =sqlPath+instanceName+dataBaseName+user+password;
			conn = DriverManager.getConnection(conString);
			stmt = conn.createStatement();
			sql = "SELECT studentid,lastnameheb,firstnameheb,scheduledate,hour,cost "
						+ "FROM manager m, students s "
						+ "WHERE m.studentid = s.id AND m.scheduledate >= '"+startD+"' AND m.scheduledate <= '"+endD+"'";
			
			ResultSet rs = stmt.executeQuery(sql);
			while(rs.next()){
			String[] temp=new String[6];

			temp[0] = rs.getString("studentid");
			temp[1] = rs.getString("lastnameheb");
			temp[2] = rs.getString("firstnameheb");
			temp[3] = CalenderClass.dateFormatServerToWeb(rs.getString("scheduledate"));
			temp[4] = rs.getString("hour");
			temp[5] = rs.getString("cost");
						
			toReturn.add(temp);
			}	
			rs.close();
			stmt.close();
			conn.close();
			} 
			catch (ClassNotFoundException e){e.printStackTrace();} 
			catch (SQLException e){e.printStackTrace();	}
				
			return toReturn;

	}
	

}
