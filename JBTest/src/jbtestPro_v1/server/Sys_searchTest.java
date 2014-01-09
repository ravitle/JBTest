package jbtestPro_v1.server;

import static org.junit.Assert.*;

import org.junit.Test;

public class Sys_searchTest {

	@Test
	public void testSearchStudentNull() {
		DBConnectionClass db = new DBConnectionClass();
		StudentClass result = db.searchStudent(" ");
		assertEquals(null,result);
	}
	@Test
	public void testSearchStudentLetters() {
		DBConnectionClass db = new DBConnectionClass();
		StudentClass result = db.searchStudent("12sad");
		assertEquals(null,result);
	}
	@Test
	public void testSearchStudentLength() {
		DBConnectionClass db = new DBConnectionClass();
		StudentClass result = db.searchStudent("1111111111111");
		assertEquals(null,result);
	}


	@Test
	public void testSearchByCourseCodeNull() {
		DBConnectionClass db = new DBConnectionClass();
		CourseClass result = db.searchByCourseCode(" ");
		assertEquals(null,result);
	}
	@Test
	public void testSearchByCourseCodeLetters() {
		DBConnectionClass db = new DBConnectionClass();
		CourseClass result = db.searchByCourseCode("dsfsd4 ");
		assertEquals(null,result);
	}

	@Test
	public void testSearchByDateNull() {
		DBConnectionClass db = new DBConnectionClass();
		int result = db.validDate(" ");
		assertEquals(-1,result);
	}
	
	@Test
	public void testSearchByDateLetters() {
		DBConnectionClass db = new DBConnectionClass();
		int result = db.validDate("erwe");
		assertEquals(-1,result);
	}

	@Test
	public void testSearchByDateFormat() {
		DBConnectionClass db = new DBConnectionClass();
		int result = db.validDate("2342342");
		assertEquals(-1,result);
	}

}
