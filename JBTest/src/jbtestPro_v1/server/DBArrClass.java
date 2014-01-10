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
		course[0] = new CourseClass(88692,"�����",test);
		course[1] = new CourseClass(88695,"�����",test);
		course[2] = new CourseClass(88696,"�����",test);
		course[3] = new CourseClass(11111,"����",test);
		
	}

	public StudentClass[] getStudents() {
		return students;
	}

	public void setStudents(StudentClass[] students) {
		students[0] = new StudentClass(111111111,"����","����","Miler","Amir","amirm","1234","1234","amirm@gmail.com","����","�������",0541111111,course[0],"����� �'�� �����");
		students[1] = new StudentClass(222222222,"�����","����","Mizrahi","Yoram","yoramm","1234","1234","yoramm@gmail.com","�����","�������",0542222222,course[0],"����� �'�� �����");
		students[2] = new StudentClass(333333333, "���", "��", "Levi", "Shay", "shayl", "1234", "1234", "shatl@gmail.com", "������", "�������", 0543333333, course[0],"����� �'�� �����");
		students[3] = new StudentClass(444444444,"����","����","Dadon","Shira","shirad","1234","1234","shirad@gmail.com","�����","�������",0544444444,course[0],"����� �'�� �����");
		students[4] = new StudentClass(555555555,"����","���","Dadon","Adi","adid","1234","1234","adid@gmail.com","���� ����","�������",0545555555,course[1],"����� �'�� �����");
		students[5] = new StudentClass(666666666,"���","����","Shahar","Meital","meitals","1234","1234","meitals@gmail.com","����","�������",0546666666,course[1],"����� �'�� �����");
		students[6] = new StudentClass(777777777,"���","�����","Levi","Maayan","maayanl","1234","1234","maayanl@gmail.com","��� ����","�������",0547777777,course[1],"����� �'�� �����");
		students[7] = new StudentClass(888888888,"���","�����","Zaken","Ortal","ortalz","1234","1234","ortalz@gmail.com","���� ������","�������",0541555555,course[1],"����� �'�� �����");
		students[8] = new StudentClass(999999999,"�����","��","Biton","Shay","bitons","1234","1234","shayb@gmail.com","����� ����","�������",0541666666,course[2],"����� �'�� �����");
		students[9] = new StudentClass(122222222,"���","�����","Shefer","Sivan","sivans","1234","1234","sivans@gmail.com","���� ������","�������",0541222222,course[2],"����� �'�� �����");
		students[10] = new StudentClass(133333333,"����","����","Miler","Einat","einatm","1234","1234","einatm@gmail.com","���� �����","�������",0541333333,course[3],"������ ������");
		students[11] = new StudentClass(144444444,"������","�����","Elimelech","Lior","liore","1234","1234","liore@gmail.com","������","�������",0541444444,course[3],"�������");
	}

	public ScheduleClass[] getSchedule() {
		return schedule;
	}

	public void setSchedule(ScheduleClass[] schedule) {
		StudentClass[] student = getStudents();
		schedule[0] = new ScheduleClass("02.12.13","10:00",student[0],test[1],"","10BGC","��");
		schedule[1] = new ScheduleClass("05.12.13","10:00",student[1],test[1],"","11BGC","��");
		schedule[2] = new ScheduleClass("05.12.13","11:00",student[2],test[1],"","12BGC","��");
		schedule[3] = new ScheduleClass("09.12.13","10:30",student[3],test[1],"","13BGC","��");
		schedule[4] = new ScheduleClass("10.12.13","12:00",student[4],test[2],"","14BGC","��");
		schedule[5] = new ScheduleClass("01.10.13","10:00",student[5],test[2],"���","15BGC","��");
		schedule[6] = new ScheduleClass("01.10.13","11:00",student[6],test[2],"����","16BGC","��");
		schedule[7] = new ScheduleClass("07.10.13","10:30",student[7],test[2],"����","17BGC","��");
		schedule[8] = new ScheduleClass("08.10.13","10:00",student[8],test[3],"���","18BGC","��");
		schedule[9] = new ScheduleClass("22.10.13","11:00",student[9],test[3],"���","19BGC","��");
		schedule[10] = new ScheduleClass("23.10.13","10:30",student[10],test[3],"���","20BGC","��");
		schedule[11] = new ScheduleClass("31.10.13","12:00",student[11],test[3],"����","21BGC","��");
		schedule[12] = new ScheduleClass("31.10.13","12:00",student[1],test[0],"���","22BGC","��");
		schedule[13] = new ScheduleClass("03.12.13","11:00",student[10],test[0],"","33BGC","��");
	}

	public StaffClass[] getStaff() {
		return staff;
	}

	public void setStaff(StaffClass[] staff) {
		staff[0] = new StaffClass("���", "����", "carmiz@jbh.co.il", "carmiz", "carmiz");
	}
}
