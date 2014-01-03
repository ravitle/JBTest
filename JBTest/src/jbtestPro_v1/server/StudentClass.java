package jbtestPro_v1.server;

public class StudentClass
{
	final int FREE_TESTS = 4;
	private int id;
	private int sr;
	private String lNameHeb;
	private String pNameHeb;
	private String lNameEng;
	private String pNameEng;
	private String userName;
	private String password;
	private String email;
	private String address;
	private String city;
	private int phoneNum;
	private int cellNum;
	private String collage;
	private int freeTest;
	private CourseClass sCourses;
	

	public StudentClass(int sid,String lnh, String pnh, String lne, String pne, String user, String spassword, String spasswordConf, String semail, String saddress, String scity, int phone, CourseClass course, String scollage)
	{
		setId(sid);
		setlNameHeb(lnh);
		setpNameHeb(pnh);
		setlNameEng(lne);
		setpNameEng(pne);
		setUserName(user);
		if(spassword == spasswordConf)
			setPassword(spassword);
		setEmail(semail);
		setAddress(saddress);
		setCity(scity);
		setCellNum(phone);
		setCollage(scollage);
		if (scollage.equals("מכללת ג'ון ברייס"))
		{
			setFreeTest(FREE_TESTS);
		}
		else
			setFreeTest(0);
		sCourses = new CourseClass(course);
	}
	
	public StudentClass(int sr)
	{
		setSr(sr);
	}
	
	//copy constructor
	public StudentClass(StudentClass student)
	{
		id = student.id;
		sr = student.sr;
		lNameHeb = student.lNameHeb;
		pNameHeb = student.pNameHeb;
		lNameEng = student.lNameEng;
		pNameEng = student.pNameEng;
		userName = student.userName;
		password = student.password;
		email = student.email;
		address = student.address;
		city = student.city;
		phoneNum = student.phoneNum;
		cellNum = student.cellNum;
		sCourses = student.sCourses;
	}

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public String getlNameHeb() {
		return lNameHeb;
	}

	public void setlNameHeb(String lNameHeb) {
		this.lNameHeb = lNameHeb;
	}

	public String getpNameHeb() {
		return pNameHeb;
	}

	public void setpNameHeb(String pNameHeb) {
		this.pNameHeb = pNameHeb;
	}

	public String getlNameEng() {
		return lNameEng;
	}

	public void setlNameEng(String lNameEng) {
		this.lNameEng = lNameEng;
	}

	public String getpNameEng() {
		return pNameEng;
	}

	public void setpNameEng(String pNameEng) {
		this.pNameEng = pNameEng;
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

	public String getAddress() {
		return address;
	}

	public void setAddress(String address) {
		this.address = address;
	}

	public String getCity() {
		return city;
	}

	public void setCity(String city) {
		this.city = city;
	}

	public int getPhoneNum() {
		return phoneNum;
	}

	public void setPhoneNum(int phoneNum) {
		this.phoneNum = phoneNum;
	}

	public int getCellNum() {
		return cellNum;
	}

	public void setCellNum(int cellNum) {
		this.cellNum = cellNum;
	}

	public int getSr() {
		return sr;
	}

	public void setSr(int sr) {
		this.sr = sr;
	}

	public CourseClass getsCourses() {
		return sCourses;
	}

	public void setsCourses(CourseClass sCourses) {
		this.sCourses = sCourses;
	}

	public String getCollage() {
		return collage;
	}

	public void setCollage(String collage) {
		this.collage = collage;
	}

	public int getFreeTest() {
		return freeTest;
	}

	public void setFreeTest(int freeTest) {
		this.freeTest = freeTest;
	}
	
	
}
