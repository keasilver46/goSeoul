package org.example.goSeoul.controller;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.example.goSeoul.model.FreeBean;
import org.example.goSeoul.model.MemberBean;
import org.example.goSeoul.model.WithBean;
import org.example.goSeoul.service.InfoService;
import org.example.goSeoul.service.MemberService;
import org.example.goSeoul.service.WithService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

@Controller
public class InfoController {

	@Autowired
	private InfoService service;
	@Autowired
	private MemberService mb;
	@Autowired
	private WithService wb;

	// 회원 정보
	@GetMapping("memberInfo.do")
	public String getInfo(HttpSession session, Model model) {
		String id = (String) session.getAttribute("id");
		MemberBean dto = service.getInfo(id);
		// List<MemberBean> list = service.getInfo();
		model.addAttribute("info", dto);

		return "member/memberInfo";
	}

	// 회원탈퇴 폼
	@RequestMapping("member_delete.do")
	public String member_delete(HttpSession session, Model model) throws Exception {

		// 유저 정보 가져오기
		String id = (String) session.getAttribute("id");
		model.addAttribute("id", id);

		return "member/member_delete";
	}

	// 회원삭제
	@RequestMapping("member_delete_ok.do")
	public String member_delete_ok(@RequestParam("pass") String pass, HttpSession session) {

		String id = (String) session.getAttribute("id");
		MemberBean dto = service.userCheck(id);

		// 비번 틀리면
		if (!dto.getPass().equals(pass)) {
			return "member/deleteResult";

		} else { // 비번 같으면

			service.delete(id);
			session.invalidate();
			System.out.println("삭제성공");
			return "member/memberLogin";
		}
	}

	// 회원 수정 폼
	@GetMapping("/memberEdit.do")
	public String getEdit(String id, Model model) {
		MemberBean dto = service.getInfo(id);
		model.addAttribute("edit", dto);

		return "member/memberEdit";
	}

	// 회원 정보 수정
	@PostMapping("/memberEdit.do")
	public String postEdit(MemberBean dto, HttpSession session, Model model) {
		service.postEdit(dto);

		String id = (String) session.getAttribute("id");

		dto = service.getInfo(id);
		model.addAttribute("info", dto);
		return "member/memberInfo";
	}

	// 글목록
	@GetMapping("/getMyList.do")
	public String getMyList(String pageNum, HttpSession session, Model model) throws Exception {
		String id = (String) session.getAttribute("id");
		int page = 1;
		int limit = 8;
		int listcount = 0;
		List<FreeBean> list = mb.getMyList(id);

		int maxpage = listcount / limit + ((listcount % limit == 0) ? 0 : 1);

		int startpage = ((page - 1) / 10) * 10 + 1; // 1, 11, 21..
		int endpage = startpage + 10 - 1; // 10, 20, 30..

		if (endpage > maxpage)
			endpage = maxpage;

		model.addAttribute("page", page);
		model.addAttribute("startpage", startpage);
		model.addAttribute("endpage", endpage);
		model.addAttribute("maxpage", maxpage);
		model.addAttribute("listcount", listcount);
		model.addAttribute("list", list);

		return "member/getMyList";
	}

	// 예약목록
	@GetMapping("/getMyReserve.do")
	public String getMyReserve(String pageNum, HttpSession session, Model model) throws Exception {
		String id = (String) session.getAttribute("id");
		System.out.println(pageNum);
		int page = 1;
		if (pageNum != null) {
			page = Integer.parseInt(pageNum);
		}
		int limit = 8;
		List<Integer> intArray = service.getMyReserve(id);
		List<WithBean> rb = new ArrayList<>();
		for (int i = 0; i < intArray.size(); i++) {
			rb.add(wb.getWithGo(intArray.get(i)));
		}
		int listcount = rb.size();

		int maxpage = listcount / limit + ((listcount % limit == 0) ? 0 : 1);

		int startpage = ((page - 1) / 10) * 10 + 1; // 1, 11, 21..
		int endpage = startpage + 10 - 1; // 10, 20, 30..

		if (endpage > maxpage)
			endpage = maxpage;

		model.addAttribute("rb", rb);
		model.addAttribute("page", page);
		model.addAttribute("startpage", startpage);
		model.addAttribute("endpage", endpage);
		model.addAttribute("maxpage", maxpage);
		model.addAttribute("listcount", listcount);

		return "member/getMyReserve";
	}

}