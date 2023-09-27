package com.grafitti.sns.post;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.grafitti.sns.post.domain.Post;
import com.grafitti.sns.post.service.PostService;

@RequestMapping("/post")
@Controller
public class PostController {

	@Autowired
	private PostService postService;

	
	@GetMapping("/view-detail")
	public String postDetail(@RequestParam("id") int id, Model model) {
		
		Post post = postService.getPost(id);
		
		model.addAttribute("post", post);
		
		return "post/detail";
	}

	
	@GetMapping("/view-list")
	public String postList(
			Model model
			, HttpSession session) {
		
		int userId = (Integer)session.getAttribute("userId");
		
		List<Post> postList = postService.getPostList(userId);
		
		model.addAttribute("postList", postList);
		
		return "post/list";
	}
	
	@GetMapping("/view-create")
	public String postInput() {
		return "post/input";
	}
	
		
		
	

	
}
