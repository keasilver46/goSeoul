package org.example.goSeoul.controller;

import java.util.UUID;

import org.examle.util.MailUtil;
import org.example.DTO.dto;
import org.example.service.ServiceImpl;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.MediaType;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

@Controller
public class MainController {
	@Autowired
	ServiceImpl service;
	dto dto;
	
	@RequestMapping("sel.do")
	public String main() {
		return "main";
	}
	
	@RequestMapping("cal.do")
	public String cal() {
		return "Calendar";
	}

	@RequestMapping("result.do")
	public String result(@RequestParam("name") String name, @RequestParam("email") String email, Model model) {
		
		if ((dto = service.findMemberId(name, email)) == null) {
			return "case1";
		} else {
			model.addAttribute("bonobono", dto);
			return "case2";
		}
	}
	@RequestMapping("finduserpwd.do")
	public String findpw() {
		return "FindPwd";
	}
	// @ResponseBody를 사용하면 해당 메소드가 반환하는
	// 데이터를 뷰를 통해 출력하는 것이 아니라, HTTP 응답 데이터에 직접 쓰여지게 됩니다.
	// 보통 JSON, XML, 문자열, 파일 등의 형태로 데이터를 반환할 때 사용됩니다.
		@RequestMapping(value = "find.do", method = {RequestMethod.GET, RequestMethod.POST}, produces = MediaType.APPLICATION_JSON_VALUE)
		@ResponseBody
		public String findPw(@RequestParam("id") String id,@RequestParam("email") String email,@RequestParam("domain") String domain	) throws Exception {
			BCryptPasswordEncoder encoder = new BCryptPasswordEncoder();
			String result = null;
			
			if((dto = service.searchId(id))!=null)
				if((dto = service.searchEmail(email))!=null)
					if((dto = service.searchDomain(domain))!=null) 
					{
				String FE = service.concat(id);
				String tempPw = UUID.randomUUID().toString().replace("-", "");// -를 제거
				tempPw = tempPw.substring(0, 10);// tempPw를 앞에서부터 10자리 잘라줌
				dto.setPass(tempPw);// 임시 비밀번호 담기
				MailUtil mail = new MailUtil(); // 메일 전송하기
				mail.sendEmail(dto,FE);
				service.updatePass(dto,email);//이메일이랑 도메인을 더해주는 서비스
				String securePw = encoder.encode(dto.getPass());// 회원 비밀번호를 암호화하면 dto객체에 다시 저장
				dto.setPass(securePw);

				result = "true";

			} else {
				result = "false";
			}
			return result;
		}

	}


