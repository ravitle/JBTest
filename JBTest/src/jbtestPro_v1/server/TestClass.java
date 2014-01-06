package jbtestPro_v1.server;

public class TestClass 
{
	private int testId;
	private String testName;
	private int cost;
	
	public TestClass(int id,String name,int cost)
	{
		setTestId(id);
		setTestName(name);
		setCost(cost);
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

	public int getCost() {
		return cost;
	}

	public void setCost(int cost) {
		this.cost = cost;
	}
	
}
