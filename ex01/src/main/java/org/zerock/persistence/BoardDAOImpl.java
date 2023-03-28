package org.zerock.persistence;

import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;
import org.zerock.domain.BoardVO;
import org.zerock.domain.Criteria;

@Repository
public class BoardDAOImpl implements BoardDAO {
	
	@Inject
	private SqlSession sqlSession;
	

	@Override
	public void create(BoardVO vo) throws Exception {
		sqlSession.insert("mappers.boardMapper.create", vo);
	}

	@Override
	public BoardVO read(Integer bno) throws Exception {		
		return sqlSession.selectOne("mappers.boardMapper.read", bno);
	}

	@Override
	public void update(BoardVO vo) throws Exception {
		sqlSession.update("mappers.boardMapper.update", vo);
	}

	@Override
	public void delete(Integer bno) throws Exception {
		sqlSession.delete("mappers.boardMapper.delete", bno);
	}

	@Override
	public List<BoardVO> listAll() throws Exception {
		return sqlSession.selectList("mappers.boardMapper.listAll");
	}

	@Override
	public List<BoardVO> listPage(int page) throws Exception {
		
		if (page <= 0) {
			page = 1;
		}
		
		page = (page - 1) * 10;

		return sqlSession.selectList("mappers.boardMapper.listPage", page);
	}

	@Override
	public List<BoardVO> listCriteria(Criteria cri) throws Exception {
		
		return sqlSession.selectList("mappers.boardMapper.listCriteria", cri);
	}

	@Override
	public int countPaging(Criteria cri) throws Exception {
		
		return sqlSession.selectOne("mappers.boardMapper.countPaging", cri);
	}
	
}
