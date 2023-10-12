package com.grafitti.sns.comment.dto;

import lombok.Builder;
import lombok.Getter;

@Builder
@Getter
public class CommentDetail {
	
	private int id;
	private int userId;
	private String content;
	private String loginId;

}
