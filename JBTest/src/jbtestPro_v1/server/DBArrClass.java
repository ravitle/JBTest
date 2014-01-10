package jbtestPro_v1.server;

public class DBArrClass 
{
	private TestClass[] test = new TestClass[4];
	private CourseClass[] course = new CourseClass[4];
	private StudentClass[] students = new StudentClass[12];
	private ScheduleClass[] schedule = new ScheduleClass[14];
	private StaffClass[] staff = new StaffClass[1];
	
	public DBArrClass()
	{
		setTest(test);
		setCourse(course);
		setStudents(students);
		setSchedule(schedule);
		setStaff(staff);
	}
	
	public TestClass[] getTest() {
		return test;
	}

	public void setTest(TestClass[] test) 
	{
		test[0] = new TestClass(70640,"Windows Server 2008 Active Directory Configuring",580);
		test[1] = new TestClass(70642,"Windows Server 2008 Network Infrastructure Configuring",580);
		test[2] = new TestClass(70646,"Windows Server 2008 Server Administrator",580);
		test[3] = new TestClass(70662,"TS: Microsoft Exchange Server 2010, Configuring",580);
	}

	public CourseClass[] getCourse() {
		return course;
	}

	public void setCourse(CourseClass[] course) {
		course[0] = new CourseClass(88692,"רשתות",test);
		course[1] = new CourseClass(88695,"רשתות",test);
		course[2] = new CourseClass(88696,"רשתות",test);
		course[3] = new CourseClass(11111,"כללי",test);
		
	}

	public StudentClass[] getStudents() {
		return students;
	}

	public void setStudents(StudentClass[] students) {
		students[0] = new StudentClass(111111111,"מילר","אמיר","Miler","Amir","amirm","1234","1234","amirm@gmail.com","גילה","ירושלים",0541111111,course[0],"מכללת ג'ון ברייס");
		students[1] = new StudentClass(222222222,"מזרחי","יורם","Mizrahi","Yoram","yoramm","1234","1234","yoramm@gmail.com","קטמון","ירושלים",0542222222,course[0],"מכללת ג'ון ברייס");
		students[2] = new StudentClass(333333333, "לוי", "שי", "Levi", "Shay", "shayl", "1234", "1234", "shatl@gmail.com", "תלפיות", "ירושלים", 0543333333, course[0],"מכללת ג'ון ברייס");
		students[3] = new StudentClass(444444444,"דדון","שירה","Dadon","Shira","shirad","1234","1234","shirad@gmail.com","רחביה","ירושלים",0544444444,course[0],"מכללת ג'ון ברייס");
		students[4] = new StudentClass(555555555,"דדון","עדי","Dadon","Adi","adid","1234","1234","adid@gmail.com","קרית יובל","ירושלים",0545555555,course[1],"מכללת ג'ון ברייס");
		students[5] = new StudentClass(666666666,"שחר","מיטל","Shahar","Meital","meitals","1234","1234","meitals@gmail.com","גילה","ירושלים",0546666666,course[1],"מכללת ג'ון ברייס");
		students[6] = new StudentClass(777777777,"לוי","מעיין","Levi","Maayan","maayanl","1234","1234","maayanl@gmail.com","בית הכרם","ירושלים",0547777777,course[1],"מכללת ג'ון ברייס");
		students[7] = new StudentClass(888888888,"זקן","אורטל","Zaken","Ortal","ortalz","1234","1234","ortalz@gmail.com","גבעת מורדכי","ירושלים",0541555555,course[1],"מכללת ג'ון ברייס");
		students[8] = new StudentClass(999999999,"ביטון","שי","Biton","Shay","bitons","1234","1234","shayb@gmail.com","קריית מנחם","ירושלים",0541666666,course[2],"מכללת ג'ון ברייס");
		students[9] = new StudentClass(122222222,"שפר","סיוון","Shefer","Sivan","sivans","1234","1234","sivans@gmail.com","גבעת מורדכי","ירושלים",0541222222,course[2],"מכללת ג'ון ברייס");
		students[10] = new StudentClass(133333333,"מילר","עינת","Miler","Einat","einatm","1234","1234","einatm@gmail.com","גבעת משואה","ירושלים",0541333333,course[3],"המכללה החרדית");
		students[11] = new StudentClass(144444444,"אלימלך","ליאור","Elimelech","Lior","liore","1234","1234","liore@gmail.com","ארנונה","ירושלים",0541444444,course[3],"אקסטרני");
	}

	public ScheduleClass[] getSchedule() {
		return schedule;
	}

	public void setSchedule(ScheduleClass[] schedule) {
		StudentClass[] student = getStudents();
		schedule[0] = new ScheduleClass("02.12.13","10:00",student[0],test[1],"","10BGC","לא");
		schedule[1] = new ScheduleClass("05.12.13","10:00",student[1],test[1],"","11BGC","לא");
		schedule[2] = new ScheduleClass("05.12.13","11:00",student[2],test[1],"","12BGC","לא");
		schedule[3] = new ScheduleClass("09.12.13","10:30",student[3],test[1],"","13BGC","לא");
		schedule[4] = new ScheduleClass("10.12.13","12:00",student[4],test[2],"","14BGC","כן");
		schedule[5] = new ScheduleClass("01.10.13","10:00",student[5],test[2],"עבר","15BGC","כן");
		schedule[6] = new ScheduleClass("01.10.13","11:00",student[6],test[2],"נכשל","16BGC","לא");
		schedule[7] = new ScheduleClass("07.10.13","10:30",student[7],test[2],"נכשל","17BGC","לא");
		schedule[8] = new ScheduleClass("08.10.13","10:00",student[8],test[3],"עבר","18BGC","לא");
		schedule[9] = new ScheduleClass("22.10.13","11:00",student[9],test[3],"עבר","19BGC","כן");
		schedule[10] = new ScheduleClass("23.10.13","10:30",student[10],test[3],"עבר","20BGC","לא");
		schedule[11] = new ScheduleClass("31.10.13","12:00",student[11],test[3],"נכשל","21BGC","לא");
		schedule[12] = new ScheduleClass("31.10.13","12:00",student[1],test[0],"עבר","22BGC","לא");
		schedule[13] = new ScheduleClass("03.12.13","11:00",student[10],test[0],"","33BGC","כן");
	}

	public StaffClass[] getStaff() {
		return staff;
	}

	public void setStaff(StaffClass[] staff) {
		staff[0] = new StaffClass("זקן", "כרמי", "carmiz@jbh.co.il", "carmiz", "carmiz");
	}
}
