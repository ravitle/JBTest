package jbtestPro_v1.server;


public class ScheduleClass
{
	private String date;
	private String hour;
	private StudentClass regStudent;
	private TestClass testStudent;
	private String pass;
	private String secondShot;
	private String cancelled;
	
	public ScheduleClass(String date,String hour, StudentClass student, TestClass test, String p, String ss,String cancel)
	{
		setDate(date);
		setHour(hour);
		setPass(p);
		setSecondShot(ss);
		setCancelled(cancel);
		regStudent = new StudentClass(student);
		testStudent = new TestClass(test);	
	}
	public ScheduleClass(String date)
	{
		setDate(date);
		
	}
	
	public ScheduleClass(ScheduleClass schedule)
	{
		date = schedule.date;
		hour = schedule.hour;
		regStudent = schedule.regStudent;
		testStudent = schedule.testStudent;
	}
	
	public String getDate() {
		return date;
	}
	public void setDate(String date) {
		this.date = date;
	}
	public String getHour() {
		return hour;
	}
	public void setHour(String hour) {
		this.hour = hour;
	}

	public StudentClass getRegStudent() {
		return regStudent;
	}

	public void setRegStudent(StudentClass regStudent) {
		this.regStudent = regStudent;
	}
	public TestClass getTestStudent() {
		return testStudent;
	}
	public void setTestStudent(TestClass testStudent) {
		this.testStudent = testStudent;
	}

	public String getPass() {
		return pass;
	}

	public void setPass(String pass) {
		this.pass = pass;
	}

	public String getSecondShot() {
		return secondShot;
	}

	public void setSecondShot(String secondShot) {
		this.secondShot = secondShot;
	}

	public String getCancelled() {
		return cancelled;
	}

	public void setCancelled(String cancelled) {
		this.cancelled = cancelled;
	}
	
}
