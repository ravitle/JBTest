package jbtestPro_v1.server;

public class TestClass 
{
	private int testId;
	private String testName;
	
	public TestClass(int id,String name)
	{
		setTestId(id);
		setTestName(name);
	}
	
	public TestClass(TestClass test)
	{
		testId = test.testId;
		testName = test.testName;
	}
	
	public int getTestId() {
		return testId;
	}
	public void setTestId(int testId) {
		this.testId = testId;
	}
	
	public String getTestName() {
		return testName;
	}
	public void setTestName(String testName) {
		this.testName = testName;
	}
	
}
