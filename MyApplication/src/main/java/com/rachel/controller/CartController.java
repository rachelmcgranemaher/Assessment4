
package com.rachel.controller;

import com.rachel.entities.Cart;
import com.rachel.entities.Item;
import com.rachel.entities.Product;
import com.rachel.entities.User;
import com.rachel.services.ProductService;
import com.rachel.services.CartService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.util.Optional;


@Controller

public class CartController {

    @Autowired
    ProductService productService;

    @Autowired
    CartService cartService;

    @RequestMapping(value = "/cart/index", method = RequestMethod.GET)
    public String
    index(HttpSession session) {
        User user = isUserLoggedIn(session);
        if (null == user)
        {
            System.out.println("User not found is session, redirecting to welcomepage");
            return "redirect:/welcome";
        }
        session.setAttribute("cart", user.getCart());
        return "cart";
    }

    @RequestMapping(value = "/cart/add/{id}", method = RequestMethod.GET)
    public String buy(@PathVariable("id") Integer id, HttpSession session) {
        Cart cart = null;
        if (session.getAttribute("user") != null) 
        {
        	User user = (User)session.getAttribute("user");
            cart = user.getCart();
        }
        else if (session.getAttribute("cart") == null) {
            cart = new Cart("cart");
        } else {
            cart = (Cart) session.getAttribute("cart");
        }
        Optional<Product> optionalProduct = productService.get(id);
        if (optionalProduct.isPresent()) {
            Item item = new Item(optionalProduct.get(), 1);
            cart.add(item);
            cartService.save(cart);
        }
        session.setAttribute("cart", cart);

        return "cart";
    }

    @RequestMapping(value = "/cart/remove/{id}", method = RequestMethod.GET)
    public String remove(@PathVariable("id") Integer id, HttpSession session) {
        Cart cart = (Cart) session.getAttribute("cart");
        Item item = cart.getByProductId(id);
        cart.remove(id);
        session.setAttribute("cart", cart);
        cartService.save(cart);

        return "cart";
    }

    @RequestMapping("/show-cart")
    public String shop(HttpServletRequest request) {
        request.setAttribute("mode", "MODE_SHOP");
        return "cart/index";

    }

    private User isUserLoggedIn(HttpSession session)
    {
        return (User)session.getAttribute("user");
    }

}
