package org.example.goSeoul.controller;

import org.example.goSeoul.model.FreeBean;
import org.example.goSeoul.service.FreeService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class FreeController {

    @Autowired
    private FreeService freeService;

    // 동행글 작성 폼
    @RequestMapping("freeWrite.do")
    public String freeWrite() {
//        System.out.println("freeWrite");
        return "free/freeWrite";
    }

    // 동행글 작성
    @RequestMapping("freeWriteResult.do")
    public String freeWriteResult(@ModelAttribute FreeBean fb, Model model) throws Exception {
//        System.out.println("freeWriteResult");
        System.out.println("tag: "+fb.getFree_tag());
        int result = freeService.insertCheck(fb);
        model.addAttribute("result", result);

        System.out.println(result);
        return "free/freeWriteResult";
    }
}