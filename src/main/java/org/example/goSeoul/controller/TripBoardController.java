package org.example.goSeoul.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class TripBoardController {

	//	여행 게시판 이동
	@RequestMapping("tripBoard_form.do")
	private String tripBoard_form() {
		return "tripBoard/tripBoard_form";
	}
}
