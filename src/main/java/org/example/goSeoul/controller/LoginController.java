package org.example.goSeoul.controller;

import org.example.goSeoul.model.KakaoVo;
import org.example.goSeoul.model.MemberBean;
import org.example.goSeoul.service.KakaoService;
import org.example.goSeoul.service.LoginService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

@Controller
public class LoginController {

    @Autowired
    private LoginService loginService;
    @Autowired
    KakaoService kakaoService;

    MemberBean memberBean = new MemberBean();

    // 로그인 폼 뷰
    @RequestMapping("MemberLogin.do")
    public String memberLogin() {

        // member폴더의 memberLogin.jsp 뷰 페이지 실행
        return "member/memberLogin";
    }

    // 로그인 처리
    @RequestMapping("MemberLoginOk.do")
    public String memberLoginOk(@ModelAttribute MemberBean mb,
                                HttpSession session,
                                Model model) throws Exception {

        int result = 0;
        MemberBean memberBean = loginService.loginCheck(mb);

        if (memberBean == null) { // 등록되지 않은 회원 일때
            result = 1;
            model.addAttribute("result", result);
            return "member/loginResult";
        } else { // 등록된 회원 일때
            session.setAttribute("mb", memberBean);
            return "member/main";
        }
    }

    // 카카오 로그인
    // 1번 카카오톡에 사용자 코드 받기(memberLogin.jsp의 a태그 href에 경로 있음)
    @RequestMapping("kakaoLogin.do")
    public String kakaoLogin(@RequestParam("code") String code, HttpSession session, HttpServletRequest request) throws Throwable {

        //토큰 발급 받기
        String access_Token = kakaoService.getAccessToken(code);

        // System.out.println("code:" + code);
        // System.out.println("access_Token: "+access_Token);

        //사용자 정보 가지고 오기
        KakaoVo kakaoVo = kakaoService.kakaoUserInfo(access_Token);

        //세션 형성 + request 내장 객체 가지고 오기
        session = request.getSession();

        System.out.println("accessToken: "+access_Token);
        System.out.println("code:"+ code);
        System.out.println("Common Controller:"+ kakaoVo);
        System.out.println("nickname: "+ kakaoVo.getNickname());
        System.out.println("email: "+ kakaoVo.getEmail());
        System.out.println("gender: "+ kakaoVo.getGender());

        //세션에 담기
        if (kakaoVo.getNickname() != null) {
            session.setAttribute("nickname", kakaoVo.getNickname());
            session.setAttribute("access_Token", access_Token);
            session.setAttribute("id", kakaoVo.getId());
        }

        return "member/main";
    }
}