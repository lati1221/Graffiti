package com.grafitti.sns.post.service;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import com.grafitti.sns.comment.dto.CommentDetail;
import com.grafitti.sns.comment.service.CommentService;
import com.grafitti.sns.common.FileManager;
import com.grafitti.sns.like.service.LikeService;
import com.grafitti.sns.post.domain.Post;
import com.grafitti.sns.post.dto.PostDetail;
import com.grafitti.sns.post.repository.PostRepository;
import com.grafitti.sns.user.domain.User;
import com.grafitti.sns.user.service.UserService;

@Service
public class PostService {
	
	@Autowired
	private PostRepository postRepository;
	
	@Autowired
	private UserService userService;
	
	@Autowired
	private LikeService likeService;
	
	@Autowired
	private CommentService commentService;
	
	public int addPost(int userId, String content, MultipartFile file) {
		
		String imagePath = FileManager.saveFile(userId, file);
		
		return postRepository.insertPost(userId, content, imagePath);
		
	}
	
	public List<PostDetail> getPostList(int loginUserId) {
	
		List<Post> postList = postRepository.selectPostList();
		List<PostDetail> postDetailList = new ArrayList<>();
		for(Post post:postList) {
			
			int userId = post.getUserId();
			User user = userService.getUserById(userId);
			
			int likeCount = likeService.countLike(post.getId());
			boolean isLike = likeService.isLike(post.getId(), loginUserId);
			
			List<CommentDetail> commentList = commentService.getCommentList(post.getId());
			
			PostDetail postDetail = PostDetail.builder()
									.id(post.getId())
									.userId(userId)
									.content(post.getContent())
									.imagePath(post.getImagePath())
									.loginId(user.getLoginId())
									.likeCount(likeCount)
									.isLike(isLike)
									.commentList(commentList)
									.build();
			
			postDetailList.add(postDetail);
		}
		
		return postDetailList;
		
	}

}
