package org.example.goSeoul.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class QuestionController {

    @RequestMapping("q_writeForm.do")
    public String q_writeForm() {

        System.out.println("q_writeForm");
        return "question/q_writeForm";
    }
}
