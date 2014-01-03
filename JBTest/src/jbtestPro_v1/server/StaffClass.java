package jbtestPro_v1.server;

public class StaffClass 
{
	private String lName;
	private String pName;
	private String email;
	private String userName;
	private String password;
	
	public StaffClass(String lname,String pname,String email,String username,String password)
	{
		setLName(lname);
		setPName(pname);
		setEmail(email);
		setUserName(username);
		setPassword(password);
	}
	
	
	public String getLName() {
		return lName;
	}
	public void setLName(String lname) {
		this.lName = lname;
	}
	
	public String getPName() {
		return pName;
	}
	public void setPName(String pname) {
		this.pName = pname;
	}
	
	public String getUserName() {
		return userName;
	}
	public void setUserName(String userName) {
		this.userName = userName;
	}
	
	public String getPassword() {
		return password;
	}
	public void setPassword(String password) {
		this.password = password;
	}
	
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	
	
	
}
