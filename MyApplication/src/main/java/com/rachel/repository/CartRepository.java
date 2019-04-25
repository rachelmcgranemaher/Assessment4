package com.rachel.repository;

import org.springframework.data.repository.CrudRepository;

import com.rachel.entities.Cart;

public interface CartRepository extends CrudRepository <Cart, Integer> {
	
	public Cart findByid(int id);

}
