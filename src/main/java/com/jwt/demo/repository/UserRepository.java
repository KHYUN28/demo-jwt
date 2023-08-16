package com.jwt.demo.repository;

import java.util.Optional;

import org.springframework.data.repository.Repository;

import com.jwt.demo.User;


public interface UserRepository extends Repository<User, Long> {

	Optional<User> findById(Long id);
	User save(User user);	
	Optional<User> findOneWithAuthoritiesByUsername(String username);
	void delete(User user);
}
