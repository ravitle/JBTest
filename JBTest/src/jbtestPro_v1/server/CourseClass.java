package jbtestPro_v1.server;


public class CourseClass
{
	private int courseId;
	private String courseName;
	private TestClass[] tests = new TestClass[4]; 
	
	public CourseClass(int id, String name,TestClass[] testArr)
	{
		setCourseId(id);
		setCourseName(name);
		for (int i = 0; i < testArr.length; i++)
			tests[i] = new TestClass(testArr[i]);
	}

	public CourseClass(CourseClass course)
	{
		courseId = course.courseId;
		courseName = course.courseName;
	}
	
	public String getCourseName() {
		return courseName;
	}

	public void setCourseName(String courseName) {
		this.courseName = courseName;
	}

	public int getCourseId() {
		return courseId;
	}

	public void setCourseId(int courseId) {
		this.courseId = courseId;
	}

	public TestClass[] getTests() {
		return tests;
	}

	public void setTests(TestClass[] tests) {
		this.tests = tests;
	}

}
