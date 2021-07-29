package com.kh.like5.admin.controller;

import java.util.ArrayList;
import java.util.HashMap;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.kh.like5.admin.model.service.AdminService;
import com.kh.like5.board.model.vo.Board;
import com.kh.like5.common.model.vo.PageInfo;
import com.kh.like5.common.template.Pagination;
import com.kh.like5.member.model.vo.Member;

import lombok.extern.java.Log;

@Controller
@Log
public class AdminController {
	
	@Autowired
	private AdminService adService;

	// about 페이지
	@RequestMapping("about.ad")
	public String about() {
		return "admin/about";
	}

	// faq 페이지
	@RequestMapping("faq.ad")
	public String faq() {
		return "admin/faq";
	}

	// tags 페이지
	@RequestMapping("tags.ad")
	public String tag() {
		return "admin/tags";
	}

	// ============================= [지현] =============================

	// 회원관리 페이지
    @RequestMapping("member.ad")
    public  ModelAndView memberPage(ModelAndView mv, @RequestParam(value="currentPage", defaultValue="1") int currentPage) {
    	
    	int listCount = adService.selectMemCount();
    	
    	PageInfo pi = Pagination.getPageInfo(listCount, currentPage, 5, 15);
    	ArrayList<Member> list = adService.selectMemList(pi);
    	
    	mv.addObject("pi", pi)
		  .addObject("list", list)
		  .setViewName("admin/adminMember");
    	
        return mv;
    }
    
    // 회원관리-검색기능
    @RequestMapping("searchMem.ad")
    public ModelAndView searchMemList(ModelAndView mv, @RequestParam(value="currentPage", defaultValue="1") int currentPage, String condition , String keyword) {
    	
    	HashMap<String,String> map = new HashMap<>();
    	map.put("condition", condition);
    	map.put("keyword", keyword);
    	
    	int listCount = adService.selectSearchMemCount(map);
    	
    	PageInfo pi = Pagination.getPageInfo(listCount, currentPage, 5, 15);
    	ArrayList<Member> list = adService.selectSearchMemList(pi,map);
    	
    	mv.addObject("pi",pi)
    	  .addObject("list",list)
    	  .addObject("condition", condition)
    	  .addObject("keyword", keyword)
    	  .setViewName("admin/adminMember");
    	
    	return mv;
    	
    }

	// 회원탈퇴 처리 기능
	@RequestMapping("deleteMem.ad")
	public String  deleteMem(int memNo, Model model, HttpSession session ) {

		// 회원의 탈퇴 상태를 'Y'로 업데이트 해주기
		int result= adService.deleteMem(memNo);
		// 기존의 페이지로 돌아갈 수 있게 해주기
		if(result>0) { //제대로 삭제된 경우
			session.setAttribute("alertMsg", "해당 회원이 성공적으로 탈퇴 처리 되었습니다!");
			return "redirect:member.ad";
		}else {
			model.addAttribute("errorMsg", "게시글 삭제 실패");
			return "common/errorPage";
		}


	}
	
	// 후원관리 - 메인페이지 불러오기 & 리스트 조회
	@RequestMapping("dona.ad")
	public String donaMain() {
		return "admin/donationMain";
	}
	
	// 후원관리 - 검색 기능
	
	
	// 후원관리 - 상세 페이지로 넘어가기 => 후원내역
	@RequestMapping("donaDetailOne.ad")
	public String donaDetailOne() {
		return "admin/donationDetailOne";
	}
	
	// 후원관리 - 상세 페이지로 넘어가기 => 정산내역
		@RequestMapping("donaDetailTwo.ad")
		public String donaDetailTwo() {
			return "admin/donationDetailTwo";
		}
		
	
	
	
	
	
	
	
	

	// ============================= [재환] =============================

    // 게시글 관리 페이지
	@RequestMapping("board.ad")
	public ModelAndView boardList(ModelAndView mv, @RequestParam(value="currentPage", defaultValue="1") int currentPage) {

		int listCount = adService.getBoardCount();

		PageInfo pi = Pagination.getPageInfo(listCount, currentPage, 10, 15);
		ArrayList<Board> list = adService.getBoardList(pi);

		mv.addObject("pi", pi)
				.addObject("list", list)
				.setViewName("admin/adminBoard");

		adService.getBoardList(pi).forEach(board -> log.info("list: " + board));

		return mv;
	}

	// 게시글 관리 페이지 검색 기능
	@RequestMapping("searchBoard.ad")
	public ModelAndView boardSearchList(ModelAndView mv, @RequestParam(value="currentPage", defaultValue="1") int currentPage, String condition , String keyword) {

		HashMap<String,String> map = new HashMap<>();
		map.put("condition", condition);
		map.put("keyword", keyword);

		int listCount = adService.getSearchBoardCount(map);

		PageInfo pi = Pagination.getPageInfo(listCount, currentPage, 5, 15);
		ArrayList<Board> list = adService.getSearchBoardList(pi,map);

		mv.addObject("pi",pi)
				.addObject("list",list)
				.addObject("condition", condition)
				.addObject("keyword", keyword)
				.setViewName("admin/adminBoard");

		return mv;

	}
	

}
