package com.grafitti.sns.post.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import com.grafitti.sns.common.FileManager;
import com.grafitti.sns.post.domain.Post;
import com.grafitti.sns.post.repository.PostRepository;

@Service
public class PostService {
	
	@Autowired
	private PostRepository postRepository;
	
	public int addPost(int userId, String title, String content, MultipartFile file) {
		
		
		String imagePath = FileManager.saveFile(userId, file);
		
		
		return postRepository.insertPost(userId, title, content, imagePath);
		
	}
	
	public List<Post> getPostList(int userId) {
		
		return postRepository.selectPostList(userId);
		
	}
	
	public Post getPost(int id) {
		
		return postRepository.selectPost(id);
		
		
		
	}
	


}
