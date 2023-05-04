package org.example.goSeoul.controller;

import org.example.goSeoul.model.MemberBean;
import org.example.goSeoul.service.MemberService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
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

    // 로그인 인증
    @PostMapping("MemberLoginOk.do")
    public String memberLoginOk(@RequestParam("id") String id,
                                @RequestParam("pass") String pass,
                                HttpSession session,
                                Model model) throws Exception{

        int result = 0;
        MemberBean memberBean = memberService.userCheck(id);

        if(memberBean == null) { // 등록되지 않은 회원 일때
            result = 1;
            model.addAttribute("result", result);

        }
    }
}
