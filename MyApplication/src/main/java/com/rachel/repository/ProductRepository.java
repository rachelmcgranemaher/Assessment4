package com.rachel.repository;

import java.util.Iterator;

import org.springframework.data.repository.CrudRepository;
import org.springframework.stereotype.Component;
import org.springframework.stereotype.Service;

import com.rachel.entities.Cart;
import com.rachel.entities.Product;


public interface ProductRepository extends CrudRepository <Product, Integer>  {

}
