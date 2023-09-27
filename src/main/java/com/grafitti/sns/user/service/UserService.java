package com.grafitti.sns.user.service;

import java.util.Optional;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.grafitti.sns.common.EncryptUtils;
import com.grafitti.sns.user.domain.User;
import com.grafitti.sns.user.repository.UserRepository;

@Service
public class UserService {
	
	@Autowired
	private UserRepository userRepository;
	
	public User getUser(String loginId, String password) {
		
		String encryptPassword = EncryptUtils.md5(password);
		
		Optional<User> optionalUser = userRepository.findByLoginIdAndPassword(loginId, encryptPassword);
		User user = optionalUser.orElse(null);
		
		return user;
	}
	
	
	public User addUser(
			String loginId
			, String password
			, String name
			, String email) {
		
		String encryptPassword = EncryptUtils.md5(password);
		
		User user = User.builder()
						.loginId(loginId)
						.password(encryptPassword)
						.name(name)
						.email(email)
						.build();
		
		return userRepository.save(user);
	}

}
