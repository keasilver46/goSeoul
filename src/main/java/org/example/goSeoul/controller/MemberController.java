package org.example.goSeoul.controller;

import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.commons.mail.HtmlEmail;
import org.example.goSeoul.MailUtil;
import org.example.goSeoul.model.MemberBean;
import org.example.goSeoul.service.MemberService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.MediaType;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import java.lang.reflect.Member;
import java.util.UUID;

@Controller
public class MemberController {

	@Autowired
	private MemberService memberService;

	// 로그인 폼 뷰
	@RequestMapping("MemberLogin.do")
	public String memberLogin() throws Exception {

		// member폴더의 memberLogin.jsp 뷰 페이지 실행
		return "member/memberLogin";
	}

	// 로그인 처리
	@RequestMapping("MemberLoginOk.do")
	public String memberLoginOk(@RequestParam("id") String id, @RequestParam("pass") String pass, HttpSession session,
			Model model) throws Exception {

		int result = 0;
		MemberBean memberBean = memberService.loginCheck(id);

		if (memberBean == null) { // 등록되지 않은 회원 일때
			result = 1;
			model.addAttribute("result", result);
			return "member/loginResult";
		} else { // 등록된 회원 일때
			if (memberBean.getPass().equals(pass)) {
				session.setAttribute("id", id);
				return "main";
			} else {
				result = 2;
				model.addAttribute("result", result);
				return "member/loginResult";
			}
		}
	}

	// 로그아웃
	@RequestMapping("logout.do")
	public String logout(HttpSession session) throws Exception {
		session.invalidate();
		return "main";
	}

	@RequestMapping("findid.do")
	public String findId() throws Exception{
		return "member/findID";
	}

	@RequestMapping("result.do")
	public String result(@RequestParam("name") String name, @RequestParam("email") String email, Model model) throws Exception {
		MemberBean memberBean = memberService.findMemberId(name);

		if (memberBean == null) {
			return "member/case1";
		} else {
			if (memberBean.getEmail() == email) {
				model.addAttribute("bonobono", memberBean);
				return "member/case2";
			} else {
				return "member/case3";
			}
		}
	}

	@RequestMapping("finduserpwd.do")
	public String findpw() {
		return "member/FindPwd";
	}

	// @ResponseBody를 사용하면 해당 메소드가 반환하는
	// 데이터를 뷰를 통해 출력하는 것이 아니라, HTTP 응답 데이터에 직접 쓰여지게 됩니다.
	// 보통 JSON, XML, 문자열, 파일 등의 형태로 데이터를 반환할 때 사용됩니다.
	@RequestMapping(value = "find.do", method = {RequestMethod.GET, RequestMethod.POST}, produces = MediaType.APPLICATION_JSON_VALUE)
	@ResponseBody
	public String findPw(@RequestParam("id") String id, @RequestParam("email") String email) throws Exception {
		BCryptPasswordEncoder encoder = new BCryptPasswordEncoder();
		String result = null;

		// 회원정보 불러오기
		MemberBean memberBean = memberService.searchEmail(email);
		System.out.println(memberBean);
		if (memberBean != null) {
			// 가입된 이메일이 존재한다면 이메일 전송
			// 임시 비밀번호 생성(UUID이용)
			String tempPw = UUID.randomUUID().toString().replace("-", "");	// - 를 제거
			tempPw = tempPw.substring(0, 10);// tempPw를 앞에서부터 10자리 잘라줌
			memberBean.setPass(tempPw);// 임시 비밀번호 담기
			MailUtil mail = new MailUtil(); // 메일 전송하기
			mail.sendEmail(memberBean);
			memberService.updatePass(memberBean);
			String securePw = encoder.encode(memberBean.getPass());// 회원 비밀번호를 암호화하면 dto객체에 다시 저장
			memberBean.setPass(securePw);

			result = "true";

		} else {
			result = "false";
		}
		return result;
	}
}
