package org.example.goSeoul;

import java.text.DateFormat;
import java.util.Date;
import java.util.Locale;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.client.RestTemplate;

/**
 * Handles requests for the application home page.
 */
@Controller
public class EventController {
	
	private static final Logger logger = LoggerFactory.getLogger(EventController.class);
	
	/**
	 * Simply selects the home view to render by returning its name.
	 */
	
	@RequestMapping(value = "/eventList.do", method = RequestMethod.GET)
	public String eventList() {
		return "eventList";
	}
	
	@RequestMapping(value = "/eventDetail.do", method = RequestMethod.GET)
	public String eventDetail() {
		return "eventDetail";
	}
//	@RequestMapping(value = "/kakaomap.do", method = RequestMethod.GET)
//	public String kakaomap() {
//		return "kakaomap";
//	}
}
