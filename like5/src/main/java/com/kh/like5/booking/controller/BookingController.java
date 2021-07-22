package com.kh.like5.booking.controller;

import java.io.File;
import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.Iterator;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.servlet.ModelAndView;

import com.kh.like5.booking.model.service.BookingService;
import com.kh.like5.booking.model.vo.Booking;
import com.kh.like5.booking.model.vo.Office;
import com.kh.like5.common.model.vo.Attachment;
import com.kh.like5.common.model.vo.PageInfo;
import com.kh.like5.common.template.Pagination;

@Controller
public class BookingController {
	
	@Autowired
	private BookingService bService;
	
	/**
	 * [신원]오피스예약메인페이지
	 */
	@RequestMapping("bMain.bk")
	public String bMain() {
		return "booking/bMain";
	}
	
	/**
	 * [신원]오피스검색결과
	 */
	@RequestMapping("searchOffice.bk")
	public String searchOffice(Booking b, Model model, HttpServletRequest request) {
		//System.out.println(b.getStartDate());
		//System.out.println(b.getEndDate());
		//System.out.println(b.getBranch());
		ArrayList<Office> list = bService.selectList(b);
		model.addAttribute("list",list);
		model.addAttribute("b", b);
		return "booking/bResult";
		
	}
	
	@RequestMapping("list.bk")
	public String selectListAll(@RequestParam(value="currentPage", defaultValue="1") int currentPage, Model model) {
		int listCount = bService.selectListCount();
		
		PageInfo pi = Pagination.getPageInfo(listCount, currentPage, 10, 5);
		
		ArrayList<Office> list = bService.selectListAll(pi);
		
		model.addAttribute("list", list);
		model.addAttribute("pi", pi);
		
		return "booking/aOfficeList";
	}
	
	@RequestMapping("detail.bk")
	public ModelAndView selectOffice(int ono, ModelAndView mv) {
		int officeNo = ono;
		Office o = bService.selectOffice(officeNo);
		if(o != null) {
			mv.addObject("o", o).setViewName("booking/aOfficeDetailView");
		} else {
			mv.addObject("errorMsg", "조회 실패").setViewName("common/errorPage");
		}
		return mv;
	}
	
	@RequestMapping("insertForm.bk")
	public String enrollForm() {
		return "booking/aOfficeInsertForm";
	}
	@RequestMapping("insertOf.bk")
	public String insertOffice(Office o, HttpServletRequest request, MultipartFile[] file, HttpSession session, Model model) {
		String[] facilityArr = request.getParameterValues("facility");
		String facility ="";
		if(facilityArr != null) {
			facility = String.join(",", facilityArr);
		}
		o.setFacility(facility);
		
		ArrayList<Attachment> list = new ArrayList<>();
		
		for(int i=0; i< file.length; i++) {
			if(!file[i].getOriginalFilename().equals("")) {
				Attachment att = new Attachment();
				String changeName = saveFile(file[i], session);
				att.setFilePath("/resources/images/" + changeName);
				att.setRefBno(9);
				list.add(att);
			}
			
		}
		//System.out.println(o);
		System.out.println(list);
		int result = bService.insertOffice(o, list);
		
		if(result > 0) {
			session.setAttribute("alertMsg", "업로드 성공");
			return "redirect:list.bk";
		} else {
			model.addAttribute("errorMsg","업로드 실패");
			return "common/errorPage";
		}
	}
	
	public String saveFile(MultipartFile file, HttpSession session) {
		
		String savePath = session.getServletContext().getRealPath("resources/images/");
		
		String originName = file.getOriginalFilename();
		//20210702(년월일) + 23432(랜덤값) + .jpg(원본파일확장자) 
		String currentTime = new SimpleDateFormat("yyyyMMdd").format(new Date());
		int ranNum = (int)(Math.random() * 90000 + 10000);
		String ext = originName.substring(originName.lastIndexOf("."));//.다음 인덱스부터의 문자열 추출
		
		String changeName = currentTime + "_" + ranNum + ext;
		
		try {
			file.transferTo(new File(savePath + changeName));
		} catch (IllegalStateException | IOException e) {
			e.printStackTrace();
		}
		return changeName;
	}	
}
