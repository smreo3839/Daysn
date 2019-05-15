package kr.mycom.ojo;

import javax.inject.Inject;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import kr.mycom.ojo.domain.SearchCriteria;
import kr.mycom.ojo.service.RoomService;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations = { "file:src/main/webapp/WEB-INF/spring/**/root-context.xml" })
public class TestDao {
	@Inject
	private RoomService service;

	/*
	 * @Test public void getTimeTest() throws Exception { dao.getTime(); }
	 */
	@Test
	public void read() throws Exception {
		System.out.println(service.listAll());
	}
}
