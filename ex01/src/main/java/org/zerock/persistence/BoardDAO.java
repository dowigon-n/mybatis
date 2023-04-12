package org.zerock.persistence;

import java.util.List;

import org.zerock.domain.BoardVO;
import org.zerock.domain.Criteria;
import org.zerock.domain.SearchCriteria;

public interface BoardDAO {
	
	public void create(BoardVO vo) throws Exception;
	
	public BoardVO read(Integer bno) throws Exception;
	
	public void update(BoardVO vo) throws Exception;
	
	public void delete(Integer bno) throws Exception;
	
	public List<BoardVO> listAll() throws Exception;
	
	// BOARD_TB에서 bno desc, regdate desc 정렬로 최신 10개 글 조회 
	public List<BoardVO> listPage(int page) throws Exception;
	
	// listCriteria()는 Criteria 객체를 파라미터로 전달받고, 필요한 getPageStart()와 getPerPageNum 메소드를 호출한 결과를 사용하게 됨.
	public List<BoardVO> listCriteria(Criteria cri) throws Exception;
	
	//페이징
	public int countPaging(Criteria cri) throws Exception;
	
	//동적 SQL 메소드 설정
	public List<BoardVO> listSearch(SearchCriteria cri) throws Exception;
	
	public int listSearchCount(SearchCriteria cri) throws Exception;

}
