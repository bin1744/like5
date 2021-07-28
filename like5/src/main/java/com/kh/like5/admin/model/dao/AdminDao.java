package com.kh.like5.admin.model.dao;

import java.util.ArrayList;
import java.util.HashMap;

import com.kh.like5.board.model.vo.Board;
import org.apache.ibatis.session.RowBounds;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.kh.like5.member.model.vo.Member;
import com.kh.like5.common.model.vo.PageInfo;

@Repository
public class AdminDao {
	// 관리자-회원관리 기능
	// 회원 정보 불러오기
	public int selectMemCount(SqlSessionTemplate sqlSession) {
		return sqlSession.selectOne("memberMapper.selectMemCount");
	}
	
	public ArrayList<Member> selectMemList(SqlSessionTemplate sqlSession, PageInfo pi){
		
		int offset = (pi.getCurrentPage()-1)*pi.getBoardLimit();
		RowBounds rowBounds = new RowBounds(offset, pi.getBoardLimit());
	
		return (ArrayList)sqlSession.selectList("memberMapper.selectMemList",null, rowBounds);
	}
	
	// 검색 기능 
	public int selectSearchMemCount(SqlSessionTemplate sqlSession, HashMap<String, String>map) {
		return sqlSession.selectOne("memberMapper.selectSearchMemCount", map);
	}
	
	public ArrayList<Member> selectSearchMemList(SqlSessionTemplate sqlSession, PageInfo pi, HashMap<String, String>map){
		int offset = (pi.getCurrentPage() - 1) * pi.getBoardLimit();
		RowBounds rowBounds = new RowBounds(offset, pi.getBoardLimit());
		
		return (ArrayList)sqlSession.selectList("memberMapper.selectSearchMemList", map, rowBounds);
	}
	
	public int deleteMem(SqlSessionTemplate sqlSession, int mno) {
		return sqlSession.update("memberMapper.deleteMem", mno);
	}

	// 게시글 리스트 조회
	public int getBoardCount(SqlSessionTemplate sqlSession) {
		return sqlSession.selectOne("boardMapper.getBoardCount");
	}

	public ArrayList<Board> getBoardList(SqlSessionTemplate sqlSession, PageInfo pi) {

		int offset = (pi.getCurrentPage() - 1) * pi.getBoardLimit();
		RowBounds rowBounds = new RowBounds(offset, pi.getBoardLimit());

		return (ArrayList)sqlSession.selectList("boardMapper.getBoardList", null, rowBounds);

	}

	// 게시글 검색 리스트 조회
	public int getSearchBoardCount(SqlSessionTemplate sqlSession, HashMap<String, String>map) {
		return sqlSession.selectOne("boardMapper.getSearchBoardCount", map);
	}

	public ArrayList<Board> getSearchBoardList(SqlSessionTemplate sqlSession, PageInfo pi, HashMap<String, String>map){

		int offset = (pi.getCurrentPage() - 1) * pi.getBoardLimit();
		RowBounds rowBounds = new RowBounds(offset, pi.getBoardLimit());

		return (ArrayList)sqlSession.selectList("boardMapper.getSearchBoardList", map, rowBounds);
	}
	
	
	
	
	
}
