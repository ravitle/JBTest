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

/*
	@Test
	public void testSearchByCourseCode() {

	}

	@Test
	public void testSearchByDate() {
		fail("Not yet implemented");
	}
*/
}
