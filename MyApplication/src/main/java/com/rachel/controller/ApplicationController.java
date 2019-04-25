package com.rachel.controller;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.rachel.entities.Cart;
import com.rachel.entities.Product;
import com.rachel.entities.User;
import com.rachel.services.ProductService;
import com.rachel.services.UserService;

@Controller 
public class ApplicationController {
	
	
	@Autowired
	private UserService userService;
	@Autowired
	private ProductService productService;
	@RequestMapping("/welcome")
	public String Welcome(HttpServletRequest request) {
		request.setAttribute("mode", "MODE_HOME");
		return "welcomepage";
	}
	
	@RequestMapping("/register")
	public String registration(HttpServletRequest request) {
		request.setAttribute("mode", "MODE_REGISTER");
		return"welcomepage";
	}

	@PostMapping("/save-user")
	public String registerUser(@ModelAttribute User user, BindingResult bindingResult,HttpServletRequest request) {
		userService.saveMyUser(user);
		request.setAttribute("mode", "MODE_HOME");
		return "welcomepage";
	}
	
	@GetMapping("/show-users")
	public String showAllUsers(HttpServletRequest request) {
		request.setAttribute("users",userService.showAllUsers());
		request.setAttribute("mode", "ALL_USERS");
		return "welcomepage";
	}
	
	@RequestMapping("/delete-user")
	public String deleteUser(@RequestParam int id, HttpServletRequest request){
		userService.deleteMyUser(id);
		request.setAttribute("users",userService.showAllUsers());
		request.setAttribute("mode", "ALL_USERS");
		return "welcomepage";
		
	}
	
	@RequestMapping("/edit-user")
	public String editUser(@RequestParam int id, HttpServletRequest request) {
		request.setAttribute("user",userService.editUser(id));
		request.setAttribute("mode", "MODE_UPDATE");
		return "welcomepage";
		
	}
	
	@RequestMapping("/product")
	public String product(HttpServletRequest request) {
		request.setAttribute("mode", "MODE_PRODUCT");
		return "index";
		
	}
	
	
	@RequestMapping("/products")
	public String products(HttpServletRequest request) {
		request.setAttribute("mode", "MODE_ADDPRODUCT");
		return "products";
		
	}
	
	
    @RequestMapping("/save-product")
    public String save(@RequestParam String id, @RequestParam String name, @RequestParam String photo, @RequestParam double price, HttpServletRequest request) {
        Product product = new Product(id, name, photo, price);
        System.out.println("SAVE PRODUCT: " + product.toString());
        productService.save(product);
        request.setAttribute("mode", "MODE_ALLPRODUCTS");
        return "shop";
    }
	

	
	
    @RequestMapping("/shop")
    public String shop(HttpServletRequest request) {
        request.setAttribute("mode", "MODE_SHOP");
        request.setAttribute("products", productService.list());
        return "purchase";

    }

	
	@RequestMapping("/login")
	public String login(HttpServletRequest request) {
		request.setAttribute("mode", "MODE_LOGIN");
		return "welcomepage";
		
	}
	
	

	
	@RequestMapping("/login-user")
	public String loginUser(@ModelAttribute User user,HttpServletRequest request) {
		if(userService.findByUsernameAndPassword(user.getUsername(), user.getPassword())!=null) {
			return "homepage";
		}
		else {
			request.setAttribute("error","Invalid Username or Password");
			request.setAttribute("mode", "MODE_LOGIN");
			return "welcomepage";
			
		}
		
	}
	
	
}
