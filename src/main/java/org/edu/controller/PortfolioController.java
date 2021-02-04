package org.edu.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
public class PortfolioController {
	@RequestMapping(value="/portfolio/mywork", method=RequestMethod.GET)
	public String ready() throws Exception {
		return "portfolio/ready";
	}
	@RequestMapping(value="/portfolio/contact", method=RequestMethod.GET)
	public String contact() throws Exception {
		return "portfolio/contact";
	}
	@RequestMapping(value="/portfolio/skill", method=RequestMethod.GET)
	public String skill() throws Exception {
		return "portfolio/skill";
	}
	@RequestMapping(value="/portfolio", method=RequestMethod.GET)
	public String portfolio() throws Exception {
		return "portfolio/home";
	}
}
