package com.rachel.services;

import java.util.ArrayList;
import java.util.List;
import java.util.Optional;

import javax.transaction.Transactional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.rachel.entities.Cart;
import com.rachel.entities.Item;
import com.rachel.repository.CartRepository;


@Service
public class CartService {
	
	@Autowired
	private CartRepository cartRepository;
	
	
    public void save(Cart cart) {
		cartRepository.save(cart);
	}

	
	
//	public CartService(CartRepository cartRepository) {
//		this.cartRepository=cartRepository;
//	}
	
    public void addToCart(Integer cartId, Item item) {
        Optional<Cart> cartOptional = cartRepository.findById(cartId);
        if (cartOptional.isPresent()) {
            cartOptional.get().add(item);
            cartRepository.save(cartOptional.get());
        } else {
            throw new RuntimeException("Cart not found with Id: " + cartId);
        }
    }

	
	public Cart getCartById(int cartId ) {
		return cartRepository.findOneById(cartId);
	
	}
    
    public List<Cart> showAllCarts(){	
		List<Cart> carts = new ArrayList<Cart>();
		for(Cart cart:cartRepository.findAll()) {
			carts.add(cart);
		}
		
	
		return carts;
}

}
