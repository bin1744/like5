package com.kh.like5.admin.model.service;

import java.util.ArrayList;
import java.util.HashMap;

import com.kh.like5.board.model.vo.Board;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.like5.admin.model.dao.AdminDao;
import com.kh.like5.common.model.vo.PageInfo;
import com.kh.like5.member.model.vo.Member;

@Service
public class AdminServiceImpl implements AdminService{

	@Autowired
	private AdminDao adDao;
	@Autowired
	private SqlSessionTemplate sqlSession;
	
	@Override
	public int selectMemCount() {
		return adDao.selectMemCount(sqlSession);
	}

	@Override
	public ArrayList<Member> selectMemList(PageInfo pi) {
		return adDao.selectMemList(sqlSession, pi);
	}

	@Override
	public int selectSearchMemCount(HashMap<String, String> map) {
		return adDao.selectSearchMemCount(sqlSession, map);
	}

	@Override
	public ArrayList<Member> selectSearchMemList(PageInfo pi, HashMap<String, String> map) {
		return adDao.selectSearchMemList(sqlSession, pi, map);
	}

	@Override
	public int deleteMem(int memNo) {
		return adDao.deleteMem(sqlSession, memNo);
	}
	
	@Override
	public int getBoardCount() {
		return adDao.getBoardCount(sqlSession);
	}

	@Override
	public ArrayList<Board> getBoardList(PageInfo pi) {
		return adDao.getBoardList(sqlSession, pi);
	}

	@Override
	public int getSearchBoardCount(HashMap<String, String> map) {
		return adDao.getSearchBoardCount(sqlSession, map);
	}

	@Override
	public ArrayList<Board> getSearchBoardList(PageInfo pi, HashMap<String, String> map) {
		return adDao.getSearchBoardList(sqlSession, pi, map);
	}
	


}
