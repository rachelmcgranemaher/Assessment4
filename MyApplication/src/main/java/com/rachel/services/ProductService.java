package com.rachel.services;

import com.rachel.entities.Product;
import com.rachel.repository.ProductRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.Optional;

@Service
public class ProductService {

	@Autowired
	ProductRepository productRepository;
	
	public void save(Product product) {
		productRepository.save(product);
	}

	public void delete(Integer productId) {
		Optional<Product> producoptionalProduct = productRepository.findById(productId);
		if (producoptionalProduct.isPresent()) {
			productRepository.delete(producoptionalProduct.get());
		}

	}

	public Iterable<Product> list()
	{
		return productRepository.findAll();
	}

	public Optional<Product> get(Integer id) {
		return productRepository.findById(id);
	}
}
