package jbtestPro_v1.server;

public class DBConnectionClass
{
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
	
	
	public static void cancleTest(String id,String date)
	{
		System.out.println("נמחק");
	}
	
	public static String[][] searchHistory(String start,String end)
	{
		
		String arr[][] = new String[50][50];
		int j = 0;
		for(int i = 0; i < db.getSchedule().length;i++)
		{
			if((checkDates(start,db.getSchedule()[i].getDate()) == 2 || db.getSchedule()[i].getDate().equals(start) == true) &&
					(checkDates(db.getSchedule()[i].getDate(), end) == 2 || db.getSchedule()[i].getDate().equals(end) == true))
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
			if (checkDates(todayDate, db.getSchedule()[i].getDate()) == 2 && db.getSchedule()[i].getCancelled().equals("כן"))
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
			if (checkDates(todayDate, db.getSchedule()[i].getDate()) == 2 && db.getSchedule()[i].getCancelled().equals("לא"))
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
			{
				if(i-1 >= 0)
				{
					if(Character.getNumericValue(todayDate.charAt(i-1)) > Character.getNumericValue(date.charAt(i-1)))
						return 1;
					else
						return 2;//2 means that todayData is previous to date and 1 after
		
				}	
			}	
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
	
	public static int changePasswordCheck(int userName, String Email)
	{
			
		int i;
		for(i = 0; i < db.getStudents().length;i++)
		{
			if(db.getStudents()[i].getId() == userName && db.getStudents()[i].getEmail().equals(Email))
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


}
