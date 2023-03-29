package org.zerock.controller;

import java.util.List;

import javax.inject.Inject;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;
import org.zerock.domain.BoardVO;
import org.zerock.domain.Criteria;
import org.zerock.persistence.BoardDAO;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations= {"file:src/main/webapp/WEB-INF/spring/**/root-context.xml"})
public class BoardDAOTest {
	
	@Inject
	private BoardDAO dao;
	
	private static Logger logger = LoggerFactory.getLogger(BoardDAOTest.class);
	
//	@Test
//	public void testCreate() throws Exception {
//		
//		BoardVO vo = new BoardVO();
//		vo.setBno(2);
//		vo.setTitle("새 글을 등록합니다.");
//		vo.setContent("새 내용을 넣습니다.");
//		vo.setWriter("user01");
//		
//		dao.create(vo);
//	}
	
//	@Test
//	public void testRead() throws Exception {
//		logger.info(dao.read(1).toString());
//	}

//	@Test
//	public void testUpdate() throws Exception {
//		BoardVO vo = new BoardVO();
//		vo.setBno(1);
//		vo.setTitle("수정된 제목입니다.");
//		vo.setContent("수정된 내용입니다.");
//		dao.update(vo);
//	}
		
//	@Test
//	public void testDelete() throws Exception {		                                                                                                    
//		dao.delete(2);
//	}
	
//	@Test
//	public void testListPage() throws Exception {
//		
//		int page = 2;
//		
//		List<BoardVO> list = dao.listPage(page);
//		for (BoardVO boardVO : list) {  // BoardVO는 제네릭으로 사용되어 List에 BoardVO 객체만 담을 수 있다. 제네릭을 사용함으로써 컴파일 타임에 타입 안전성(type safety)을 보장할 수 있다.
//			logger.info(boardVO.getBno() + ":" + boardVO.getTitle());
//		}
//	}
	
	
	@Test
	public void testListCriteria() throws Exception {
		
		Criteria cri = new Criteria();
		cri.setPage(2);
		cri.setPerPageNum(20);
		
		List<BoardVO> list = dao.listCriteria(cri);
		
		for (BoardVO boardVO : list) {
			logger.info(boardVO.getBno() + ":" + boardVO.getTitle());
		}
		
	}

}
