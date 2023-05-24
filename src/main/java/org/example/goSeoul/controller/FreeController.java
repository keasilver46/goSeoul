package org.example.goSeoul.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.example.goSeoul.model.FreeBean;
import org.example.goSeoul.model.JoinMemberBean;
import org.example.goSeoul.service.FreeService;
import org.example.goSeoul.service.MemberService;
import org.example.goSeoul.service.PagingPgm;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class FreeController {

    @Autowired
    private FreeService freeService;
    @Autowired
    private MemberService memberService;
    
    // 리스트
    @RequestMapping("freeList.do")
	public String list(String pageNum, FreeBean fb, Model model) {
		System.out.println("controller list");
		System.out.println("search:" + fb.getSearch());
		System.out.println("keyword:" + fb.getKeyword());

		final int rowPerPage = 10;
		if (pageNum == null || pageNum.equals("")) {
			pageNum = "1";
		}
		int currentPage = Integer.parseInt(pageNum);
		// int total = bs.getTotal();
		int total = freeService.getTotal(fb); // 검색
		System.out.println("total:" + total);

		int startRow = (currentPage - 1) * rowPerPage + 1;
		int endRow = startRow + rowPerPage - 1;
		PagingPgm pp = new PagingPgm(total, rowPerPage, currentPage);
		fb.setStartRow(startRow);
		fb.setEndRow(endRow);
		// List<Board> list = bs.list(startRow, endRow);
		int no = total - startRow + 1;

		List<FreeBean> list = freeService.list(fb);
		/* System.out.println("list:" + list); */

		model.addAttribute("list", list);
		model.addAttribute("no", no);
		model.addAttribute("pp", pp);
		// 검색
		model.addAttribute("search", fb.getSearch());
		model.addAttribute("keyword", fb.getKeyword());
		return "free/freeList";
	}

    // 상세페이지
    @RequestMapping("freeContent.do")
	public String freeContent(@ModelAttribute FreeBean fb, String pageNum, Model model) throws Exception {
		freeService.freeHit(fb.getFree_no());
		FreeBean freeBean = freeService.numSelect(fb.getFree_no());
		
		model.addAttribute("freeBean", freeBean);
		model.addAttribute("num", fb.getFree_no()); 
		model.addAttribute("pageNum", pageNum);
		
		System.out.println("상세내용 : "+ freeBean);
		System.out.println("글번호 : "+ fb.getFree_no());
		System.out.println("페이지번호 : "+ pageNum);
		
		return "free/freeContent";
	}
    
    // 글 작성 폼
    @RequestMapping("freeWrite.do")
    public String freeWrite(@ModelAttribute FreeBean fb, HttpSession session, Model model) throws Exception {
        System.out.println("freeWrite");
        //로그인 상태 확인
        if (session.getAttribute("id") == null) {
            // 비로그인 상태일 경우 로그인 폼으로 이동
            return "redirect:MemberLogin.do";
        } else {
            // 유저 정보 가져오기
            String id = (String)session.getAttribute("id");
            JoinMemberBean memberBean = memberService.checkLogin(id);
            model.addAttribute("user",memberBean);
            fb.setFree_nick(memberBean.getNick()); 
            fb.setFree_id(memberBean.getId()); 
            System.out.println("멤버빈 닉네임: "+memberBean.getNick());
            System.out.println("멤버빈 아이디: "+memberBean.getId());
            System.out.println("닉네임: "+fb.getFree_nick());
            System.out.println("아이디: "+fb.getFree_id());
        }
        // 로그인된 상태일 경우 글 작성 폼으로 이동
        return "free/freeWrite";
    }

    // 글 작성
    @RequestMapping("freeWriteResult.do")
    public String freeWriteResult(@ModelAttribute FreeBean fb,
						          HttpServletRequest request,
						          Model model) throws Exception {
        System.out.println("freeWriteResult");
        System.out.println("tag: "+fb.getFree_tag());
        int result = freeService.freeInsert(fb);
        model.addAttribute("result", result);

        System.out.println("글작성결과 : "+result);
        return "free/freeWriteResult";
    }
//
//    // 글 수정 폼
//	@RequestMapping("freeUpdate.do")
//	public String freeUpdate(@ModelAttribute FreeBean fb, String pageNum, 
//							HttpSession session, 
//							Model model) throws Exception {
//		FreeBean freeBean = freeService.numSelect(fb.getFree_no());
//		System.out.println("글번호 : "+fb.getFree_no());
//		System.out.println("페이지번호 : "+pageNum);
//		model.addAttribute("freeBean", freeBean);
//		model.addAttribute("pageNum", pageNum);
//		return "free/freeUpdate";
//	}
//
//	// 글 수정
//	@RequestMapping("freeUpdateResult.do")
//	public String freeUpdateResult(@ModelAttribute FreeBean fb,
//			  @PathVariable String pageNum, 
//	          HttpServletRequest request,
//	          Model model) throws Exception {
//		System.out.println("freeWriteResult");
//		System.out.println("tag: "+fb.getFree_tag());
//		int result = freeService.freeUpdate(fb);
//		model.addAttribute("result", result);
//		model.addAttribute("pageNum", pageNum);
//		System.out.println(result);
//		return "free/freeUpdateResult";
//	}

//	@RequestMapping("freeDelete.do")
//	public String freeDelete(@PathVariable int num, @PathVariable String pageNum, Model model) {
//		FreeBean fb = freeService.numSelect(num);
//		model.addAttribute("fb", fb);
//		model.addAttribute("pageNum", pageNum);
//		return "free/freeDelete";
//	}

//	@RequestMapping("freeDeleteResult.do")
//	public String freeDeleteResult(int num, String pageNum, Model model) {
//		int result = freeService.freeDelete(num);
//		model.addAttribute("result", result);
//		model.addAttribute("pageNum", pageNum);
//		return "free/freeDeleteResult";
//	}
}

