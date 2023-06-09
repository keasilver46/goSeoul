package org.example.goSeoul.controller;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.example.goSeoul.model.MemberBean;
import org.example.goSeoul.model.WithBean;
import org.example.goSeoul.model.WithReplyBean;
import org.example.goSeoul.service.MemberService;
import org.example.goSeoul.service.WithReplyService;
import org.example.goSeoul.service.WithService;
import org.springframework.beans.factory.annotation.Autowired;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;


@Controller
public class WithReplyController {
	
	@Autowired
	private WithReplyService service;
	@Autowired
	private WithService withService;
	@Autowired
    private MemberService memberService;
	
	@RequestMapping("withReply.do")
	public String withReplyInsert(@ModelAttribute WithReplyBean wrb, HttpSession session, Model model) throws Exception {
		String id = (String)session.getAttribute("id");
		if (id == null) {
            // 비로그인 상태일 경우 로그인 폼으로 이동
            return "redirect:MemberLogin.do";
        } else {
        	MemberBean mb = memberService.checkLogin(id);
        	
        	wrb.setUser_no(mb.getUser_no());
            wrb.setWithreply_id(mb.getId());
            wrb.setWithreply_nick(mb.getNick());
        	
        	service.withReplyInsert(wrb);
        	
        	return "redirect:replyList.do?with_no=" + wrb.getWith_no();
        }
	}
	
	@RequestMapping("replyList.do")
	public String replyList(int with_no, Model model) throws Exception {
		WithBean with = withService.getWithDetail(with_no);
		List<WithReplyBean> replyList = service.getList(with_no);

		model.addAttribute("with", with);
		model.addAttribute("replyList", replyList);
		
		return "with/withReplyList";
	}
	
	@RequestMapping("replyUpdate.do")
	public String replyUpdate(@ModelAttribute WithReplyBean wrb) throws Exception {
		service.withReplyUpdate(wrb);
		
		return "redirect:replyList.do?with_no=" + wrb.getWith_no();
		
	}
	
	@RequestMapping("replyDelete.do")
	public String replyDelete(@ModelAttribute WithReplyBean wrb) throws Exception {
		service.withReplyDelete(wrb);
		
		return "redirect:replyList.do?with_no=" + wrb.getWith_no();
	}
}