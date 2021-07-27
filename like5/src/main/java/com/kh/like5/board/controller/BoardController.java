package com.kh.like5.board.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class BoardController {
	
	/**
	 * [한솔] QnA 게시글 리스트 페이지 
	 */
	@RequestMapping("qList.bo")
	public String qList() {
		return "board/qna/qnaListView";
	}
	
	/**
	 * [한솔] QnA 게시글 작성 페이지
	 */
	
	@RequestMapping("qEnrollForm.bo")
	public String qEnrollForm() {
		
		return "board/qna/qnaEnrollForm";
	}
	
	/**
	 * [한솔] QnA 게시글 상세 페이지
	 * 		 → 별도 가공처리 아직 X, 페이지 확인용으로 연결만 해둠
	 */
	
	@RequestMapping("qDetail.bo")
	public String qDetail() {
		
		return "board/qna/qnaDetailView";
	}
}
