package com.rachel.entities;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.ManyToOne;

@Entity
public class Product {
	
	@ManyToOne 
	private Cart cart;

	@Id
	@GeneratedValue(strategy=GenerationType.AUTO)
	private int primaryID;
	
	
	private String id;
	private String name;
	private String photo;
	private double price;

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getPhoto() {
		return photo;
	}

	public void setPhoto(String photo) {
		this.photo = photo;
	}

	public double getPrice() {
		return price;
	}

	public void setPrice(double price) {
		this.price = price;
	}

	public Product() {
	}

	public Product(String id, String name, String photo, double price) {
		this.id = id;
		this.name = name;
		this.photo = photo;
		this.price = price;
	}

	public Cart getCart() {
		return cart;
	}

	public void setCart(Cart cart) {
		this.cart = cart;
	}

	public int getPrimaryID() {
		return primaryID;
	}

	public void setPrimaryID(int primaryID) {
		this.primaryID = primaryID;
	}
	
	

}