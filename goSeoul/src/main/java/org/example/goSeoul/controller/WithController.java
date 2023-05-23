package org.example.goSeoul.controller;

import org.example.goSeoul.model.WithBean;
import org.example.goSeoul.service.WithService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.servlet.http.HttpServletRequest;
import java.util.ArrayList;
import java.util.List;

@Controller
public class WithController {

    @Autowired
    private WithService withService;

    // 동행 리스트
    @RequestMapping("with_list.do")
    public String list(HttpServletRequest request, Model model) throws Exception {
        List<WithBean> withlist = new ArrayList<WithBean>();

        int page = 1;
        int limit = 8;

        if (request.getParameter("page") != null) {
            page = Integer.parseInt(request.getParameter("page"));
        }

        // 게시물 총 개수 구하기
        int listcount = withService.getListCount();

        withlist = withService.getWithList(page);

        // 총 페이지
        int maxpage = listcount / limit + ((listcount % limit == 0) ? 0 : 1);

        int startpage = ((page - 1) / 8) * limit + 1; 		// 1, 9, 17..
        int endpage = startpage + 8 - 1; 			   		// 8, 16, 24..

        if (endpage > maxpage)
            endpage = maxpage;

        model.addAttribute("page", page);
        model.addAttribute("startpage", startpage);
        model.addAttribute("endpage", endpage);
        model.addAttribute("maxpage", maxpage);
        model.addAttribute("listcount", listcount);
        model.addAttribute("withlist", withlist);

        return "with/withList";
    }

    // 동행 상세페이지
    @RequestMapping("with_detail.do")
    public String with_detail(int with_no, int page, String state, Model model) throws Exception{
        if (state.equals("detail")) {
            withService.hit(with_no);
        }

        WithBean with = withService.getWithDetail(with_no);

        model.addAttribute("with", with);
        model.addAttribute("page", page);

        return "with/withDetail";
    }
}
