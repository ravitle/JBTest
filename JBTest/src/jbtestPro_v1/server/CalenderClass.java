package jbtestPro_v1.server;

import java.util.Calendar;

public class CalenderClass extends DBConnectionClass
{
	public static int daysInMonth(int year,int month)
	{
		
		switch (month) 
		{
		case 1:
			return 31;
		case 2:
			if((year%4==0 && year%100!=0)|| year%400==0)
			{
				return 29;
			}
			return 28;
		case 3:
			return 31;
		case 4:
			return 30;
		case 5:
			return 31;
		case 6:
			return 30;
		case 7:
			return 31;
		case 8:
			return 31;
		case 9:
			return 30;
		case 10:
			return 31;
		case 11:
			return 30;
		case 12:
			return 31;
		default:
			return 0;
		}
		
	}
	
	public static int getTodayYear()
	{
		
		Calendar now = Calendar.getInstance();   // This gets the current date and time.
		return now.get(Calendar.YEAR);
	}
	
	public static int getTodayMonth()
	{
		Calendar now = Calendar.getInstance();   // This gets the current date and time.
		return now.get(Calendar.MONTH)+1;	
	}
	
	public static int getTodayDay()
	{
		Calendar now = Calendar.getInstance();   
		return now.get(Calendar.DAY_OF_MONTH);
	}
	
	public static String getTodayFullDate()
	{
		String day,month;
		if(getTodayDay()<10)
				day="0"+Integer.toString(getTodayDay());
		else
			day=Integer.toString(getTodayDay());
		if(getTodayMonth()<10)
			month="0"+Integer.toString(getTodayMonth());
		else
			month=Integer.toString(getTodayMonth());
		
		return "'"+Integer.toString(getTodayYear())+"-"+month+"-"+day+"'";
	}

	public static int getNumOfRegStudent(String day,String month,String year)

	{
		int toReturn=0;
		String fullDate=""+year+"-"+month+"-"+day;
		toReturn=getNumOfRegStudInDate(fullDate);	
		return toReturn;	
	}
	
	public static int getFirstDayOfMonth(int year,int month)
	{
		Calendar c=Calendar.getInstance();
	    c.set(Calendar.DAY_OF_MONTH, 1);
	    c.set(Calendar.MONTH, month-1);
	    c.set(Calendar.YEAR,year);
	    return c.get(Calendar.DAY_OF_WEEK);
	  
	   
	}
	
	public static String getHebMonthName(int month)
	{
		switch(month)
		{
		case 1:
			return "ינואר";
		case 2:
			return "פברואר";
		case 3:
			return "מרץ";	
		case 4:
			return "אפריל";
		case 5:
			return "מאי";
		case 6:
			return "יוני";
		case 7:
			return "יולי";
		case 8:
			return "אוגוסט";
		case 9:
			return "ספטמבר";
		case 10:
			return "אוקטובר";
		case 11:
			return "נובמבר";
		case 12:
			return "דצמבר";
		default:
			return "";
		
		}
	}
}
