package org.example.goSeoul.controller;

import org.example.goSeoul.model.WithBean;
import org.example.goSeoul.service.WithService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class WithController {

    @Autowired
    private WithService withService;

    // 동행글 작성 폼
    @RequestMapping("withWrite.do")
    public String withWrite() {
        System.out.println("withWrite");
        return "with/withWrite";
    }

    // 동행글 작성
    @RequestMapping("withWriteResult.do")
    public String withWriteResult(@ModelAttribute WithBean wb) throws Exception {

        System.out.println("withWriteResult");


        withService.insert(wb);
        // model.addAttribute("result", result);

        return "redirect:/with/withWriteResult";
    }
}