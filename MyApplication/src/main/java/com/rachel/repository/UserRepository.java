package com.rachel.repository;

import org.springframework.data.repository.CrudRepository;

import com.rachel.entities.User;

public interface UserRepository extends CrudRepository<User, Integer> {	
	
	public User findByUsernameAndPassword(String username, String password);
}