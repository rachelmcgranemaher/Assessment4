package com.rachel.model;

import java.util.ArrayList;
import java.util.List;

import javax.persistence.ManyToOne;

import com.rachel.entities.Product;

public class ProductModel {

	private List<Product> products;

	public ProductModel() {
		this.products = new ArrayList<Product>();
		
		
		
	}
	

	public List<Product> findAll() {
		return this.products;
	}

	public Product find(String id) {
		for (Product product : this.products) {
			if (product.getId().equalsIgnoreCase(id)) {
				return product;
			}
		}
		return null;
	}

}
