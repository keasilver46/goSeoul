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

	MemberBean memberBean = new MemberBean();

	// ????
	@RequestMapping("logout.do")
	public String logout(HttpSession session) {
		session.invalidate();
		return "main";
	}

	// ??? ? ?
	@RequestMapping("MemberLogin.do")
	public String memberLogin() {

		// member??? memberLogin.jsp ? ??? ??
		return "member/memberLogin";
	}

	// ??? ??
	@RequestMapping("MemberLoginOk.do")
	public String memberLoginOk(@RequestParam("id") String id, @RequestParam("pass") String pass,
								HttpSession session, Model model) throws Exception {

		System.out.println("memberLoginOk");

		int result = 0;
		MemberBean memberBean = memberService.checkLogin(id);

		if (memberBean == null) { // ???? ?? ?? ??
			result = 1;
			model.addAttribute("result", result);

			return "member/loginResult";
		} else { // ??? ?? ??
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

	@RequestMapping("findid.do")
	public String findId() throws Exception{
		return "member/findID";
	}

	@RequestMapping("result.do")
	public String result(@ModelAttribute MemberBean memberBean, Model model) throws Exception {
		MemberBean dto = memberService.findMemberId(memberBean);

		if (dto == null) {
			return "member/case1";
		} else {
			model.addAttribute("bonobono", dto);
			return "member/case2";
		}
	}

	@RequestMapping("finduserpwd.do")
	public String findpw() {
		return "member/FindPwd";
	}

	// @ResponseBody? ???? ?? ???? ????
	// ???? ?? ?? ???? ?? ???, HTTP ?? ???? ?? ???? ???.
	// ?? JSON, XML, ???, ?? ?? ??? ???? ??? ? ?????.
	@RequestMapping(value = "find.do", produces = {MediaType.APPLICATION_JSON_VALUE})
	public @ResponseBody String findPw(@ModelAttribute MemberBean memberBean) throws Exception {
		BCryptPasswordEncoder encoder = new BCryptPasswordEncoder();
		String result = null;

		// ???? ????
		MemberBean dto = memberService.searchPwd(memberBean);
		System.out.println(dto);

		if(dto != null) {
			System.out.println("1");

					String FE = memberService.concat(memberBean);
					String tempPw = UUID.randomUUID().toString().replace("-", "");// -? ??
					tempPw = tempPw.substring(0, 10);// tempPw? ????? 10?? ???
					dto.setPass(tempPw);// ?? ???? ??
					MailUtil mail = new MailUtil(); // ?? ????
					mail.sendEmail(dto, FE);
					memberService.updatePass(dto);//????? ???? ???? ???
					String securePw = encoder.encode(dto.getPass());// ?? ????? ????? dto??? ?? ??
					dto.setPass(securePw);

					result = "true";

				} else {
					result = "false";
				}

		return result;
	}
}
