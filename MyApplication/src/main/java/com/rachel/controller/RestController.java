package com.rachel.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.rachel.entities.User;
import com.rachel.services.CartService;
import com.rachel.services.UserService;

@Controller
public class RestController {
	
	
	@Autowired
	private UserService userService;
	
	@Autowired
	private CartService cartService;
	
	@GetMapping("/")
	public String hello() {
		return "Home page";
	}
	
	@GetMapping("/saveuser")
	public String saveUser(@RequestParam String username,@RequestParam String firstname,@RequestParam String lastname,@RequestParam int age,@RequestParam String password ) {
		User user = new User(username,firstname,lastname,age,password);
		userService.saveMyUser(user);
		
		return "This user has been successfully saved ";
	}

}
