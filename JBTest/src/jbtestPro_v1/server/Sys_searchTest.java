package jbtestPro_v1.server;

import static org.junit.Assert.*;

import org.junit.Test;

public class Sys_searchTest {

	@Test
	public void testSearchStudent() {
		DBConnectionClass db = new DBConnectionClass();
		StudentClass student = new  StudentClass(" ");
		
		StudentClass result = db.searchStudent("");
		
		assertEquals(student.getId(),result.getId());
	}

	@Test
	public void testSearchByCourseCode() {
		fail("Not yet implemented");
	}

	@Test
	public void testSearchByDate() {
		fail("Not yet implemented");
	}

}
