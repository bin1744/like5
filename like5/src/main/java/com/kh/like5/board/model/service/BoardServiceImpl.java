package com.kh.like5.board.model.service;

import java.util.ArrayList;
import java.util.HashMap;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.like5.board.model.dao.BoardDao;
import com.kh.like5.board.model.vo.Board;
import com.kh.like5.board.model.vo.Reply;
import com.kh.like5.board.model.vo.Report;
import com.kh.like5.board.model.vo.Tag;
import com.kh.like5.common.model.vo.PageInfo;

@Service
public class BoardServiceImpl implements BoardService {

	
	@Autowired
	private BoardDao bDao;
	
	@Autowired
	private SqlSessionTemplate sqlSession;
	
	
	/**
	 *  [커뮤니티] 전체 목록 리스트 페이징 처리시 필요한 게시글 전체 count
	 *  @author seong
	 */
	@Override
	public int comListCount() {
		return bDao.comListCount(sqlSession);
	}
	
	/**
	 *  [커뮤니티] 전체 목록 리스트 조회
	 *  @author seong
	 */
	@Override
	public ArrayList<Board> comList(PageInfo pi) {
		return bDao.comList(sqlSession,pi);
	}
	
	/**
	 * [커뮤니티] - 키워드 검색 결과 list count
	 * @author seong
	 */
	
	@Override
	public int comSearchListCount(HashMap<String, String> map) {
		return bDao.comSearchListCount(sqlSession, map);
	}

	
	/**
	 * [커뮤니티] - 키워드 검색 결과 조회 
	 * @author seong
	 */
	
	@Override
	public ArrayList<Board> comSearchList(PageInfo pi, HashMap<String, String> map) {
		return bDao.comSearchList(sqlSession, pi, map);
	}
	
	/**
	 * [커뮤니티] - 카테고리별 게시글 list count
	 * @author seong
	 */
	
	@Override
	public int comOrderByListCount(String condition) {
		return bDao.comOrderByListCount(sqlSession, condition);
	}
	
	/**
	 * [커뮤니티] 전체 | 일상 | 스터디 모집 | 카테고리별 조회
	 * @author seong
	 */
	@Override
	public ArrayList<Board> comOrderByCategory(PageInfo pi, String condition) {
		return bDao.comOrderByCategory(sqlSession, pi, condition);
	}

	/**
	 * [커뮤니티]최신 | 조회수 | 댓글수 기준으로 조회
	 * @author seong
	 */
	@Override
	public ArrayList<Board> comOrderByCount(PageInfo pi, String condition) {
		return bDao.comOrderByCount(sqlSession,pi,condition);
	}

	/**
	 *  [커뮤니티] 게시글 상세보기시 조회수 증가
	 *  @author seong
	 */
	@Override
	public int increaseCount(int bno) {
		return bDao.increaseCount(sqlSession, bno);
	}

	
	/**
	 *  [커뮤니티] 커뮤니티 게시글 상세보기
	 *  @author seong
	 */
	
	@Override
	public Board comDetail(int bno) {
		return bDao.comDetail(sqlSession, bno);
	}

	/**
	 * [커뮤니티] 댓글 | 대댓글 전체 조회
	 * @author seong
	 */
	@Override
	public ArrayList<Reply> selectReplyList(int bno) {
		return bDao.selectReplyList(sqlSession, bno);
	}
	
	/**
	 * [커뮤니티] 댓글 작성하기
	 * @author seong
	 */
	
	@Override
	public int insertReply(Reply r) {
		return bDao.insertReply(sqlSession, r);
	}

	/**
	 * [커뮤니티] 대댓글 작성하기
	 * @author seong
	 */
	@Override
	public int insertReplies(Reply r) {
		return bDao.insertReplies(sqlSession, r);
	}
	
	/**
	 * [커뮤니티] 게시글 작성하기
	 * @author seong
	 */
	
	@Override
	public int insertCommunity(Board b) {
		return bDao.insertCommunity(sqlSession, b);
	}

	/**
	 * [커뮤니티] 게시글 삭제하기
	 * @author seong
	 */
	
	@Override
	public int deleteCommunity(int bno) {
		return bDao.deleteCommunity(sqlSession, bno);
	}

	/**
	 * [커뮤니티] - 게시글 수정하기
	 * @author seong
	 */

	@Override
	public int updateCommunity(Board b) {
		return bDao.updateCommunity(sqlSession, b);
	}
	
	/**
	 * [커뮤니티] - 게시글 신고하기
	 * @author seong
	 */
	@Override
	public int reportCommunity(Report r) {
		return bDao.reportCommunity(sqlSession, r);
	}
	
	
	/**
	 *  [칼럼] - 전체 목록 리스트 조회
	 *  @author seong
	 */
	
	@Override
	public ArrayList<Board> colList(PageInfo pi) {
		// TODO Auto-generated method stub
		return null;
	}

	/**
	 *  [칼럼] - 글 상세보기
	 *  @author seong
	 */
	
	@Override
	public Board colDetail(int bno) {
		// TODO Auto-generated method stub
		return null;
	}


	
	//------------------ 한솔 -------------------------
	
	/**
	 * [QnA] - QnaList 총 게시글 개수 조회
	 * @author Hansol
	 */
	@Override
	public int qnaListCount() {
		return bDao.qnaListCount(sqlSession);
	}

	/**
	 * [QnA] - QnaList 사용자가 요청한 페이지에 뿌려줄 리스트
	 * @author Hansol
	 */
	@Override
	public ArrayList<Board> qnaList(PageInfo pi) {
		return bDao.qnaList(sqlSession, pi);
	}

	/**
	 * [QnA] - QnaEnrollForm 게시글 작성
	 * @author Hansol
	 */
	@Override
	public int qnaInsert(Board b) {
		return bDao.qnaInsert(sqlSession, b);
	}

	/**
	 * [QnA] - QnaDetail 실제 게시글 조회
	 * @author Hansol
	 */
	@Override
	public Board qnaDetail(int bno) {
		// TODO Auto-generated method stub
		return null;
	}

	/**
	 * [QnA] - QnaDetail 게시글 삭제(status값 변경)
	 * @author Hansol
	 */
	@Override
	public int qnaDelete(int bno) {
		// TODO Auto-generated method stub
		return 0;
	}

	/**
	 * [QnA] - QnaUpdateForm 게시글 수정
	 * @author Hansol
	 */
	@Override
	public int qnaUpdate(Board b) {
		// TODO Auto-generated method stub
		return 0;
	}

	/**
	 * [QnA] - QnaList 키워드 검색 총 게시글 개수 조회
	 * @author Hansol
	 */
	@Override
	public int qnaSearchListCount(HashMap<String, String> map) {
		// TODO Auto-generated method stub
		return 0;
	}

	/**
	 * [QnA] - QnaList 키워드 검색 결과 조희
	 * @author Hansol
	 */
	@Override
	public ArrayList<Board> qnaSearchListCount(PageInfo pi, HashMap<String, String> map) {
		// TODO Auto-generated method stub
		return null;
	}

	/**
	 * [QnA] - QnaList 정렬 기준별 총 게시글 개수 조회
	 * @author Hansol
	 */
	@Override
	public int qnaOrderByListCount(String condition) {
		// TODO Auto-generated method stub
		return 0;
	}

	/**
	 * [QnA] - QnaList 정렬 기준별 결과 조회
	 * @author Hansol
	 */
	@Override
	public ArrayList<Board> qnaOrderByCount(PageInfo pi, String condition) {
		// TODO Auto-generated method stub
		return null;
	}

	/**
	 * [QnA] - QnaEnrollForm 태그 리스트
	 * @author Hansol
	 */
	@Override
	public ArrayList<Tag> tagList() {
		return bDao.tagList(sqlSession);
	}










	








	
	
	
}
