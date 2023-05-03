package org.example.goSeoul.controller;

import org.example.goSeoul.model.MemberBean;
import org.example.goSeoul.service.MemberService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import javax.servlet.http.HttpSession;

@Controller
public class MemberController {

    @Autowired
    private MemberService memberService;

    MemberBean memberBean = new MemberBean();

    // 로그인 폼 뷰
    @RequestMapping("MemberLogin.do")
    public String memberLogin() {

        // member폴더의 memberLogin.jsp 뷰 페이지 실행
        return "member/memberLogin";
    }

    @PostMapping("MemberLoginok.do")
    public String memberLoginOk(
    }
}
