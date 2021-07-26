package com.kh.like5.admin.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class AdminController {

    /**
     *  회원관리 페이지
     */
    @RequestMapping("member.ad")
    public String memberPage() {
        return "admin/adminMember";
    }

}
