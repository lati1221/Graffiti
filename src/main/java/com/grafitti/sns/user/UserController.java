package com.grafitti.sns.user;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class UserController {
	
	@GetMapping("/user/join")
	public String Userjoin() {
		
		return "/user/join";
	}
	
	@GetMapping("/user/login")
	public String Userlogin() {
		
		return "/user/login";
	}

}
