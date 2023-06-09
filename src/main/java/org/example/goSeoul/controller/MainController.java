package org.example.goSeoul.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class MainController {

	@RequestMapping("sel.do")
	public String main() {
		return "mainshow";
	}

	@RequestMapping("main.do")
	public String main1() {
		return "main";
	}
}
