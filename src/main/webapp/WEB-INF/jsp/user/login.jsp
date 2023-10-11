<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
<link rel="stylesheet" href="/static/css/style.css" type="text/css">
<title>로그인 화면</title>
</head>
<body>

<div id="wrap">
		<header>
		</header>
		<section class="contents d-flex justify-content-center">
			<div class="input-box my-5">
				<div id="title" class="text-center"><h1>GRAFFITI</h1></div>
						<form id="loginForm">
							<input type="text" placeholder="아이디(유저명)" class="form-control mt-4" id="loginIdInput">
							<input type="password" placeholder="비밀번호" class="form-control mt-2" id="passwordInput">
							<button type="submit" class="btn btn-block mt-3 text-white" id="loginBtn">로그인</button>
						</form>
				<div class="text-center mt-3">
					<a href="/user/join">회원가입</a>
				</div>
			</div>
		</section>
		<footer></footer>
	</div>
	
<script  src="http://code.jquery.com/jquery-latest.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/popper.js@1.12.9/dist/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>
	
<script>
	$(document).ready(function() {
		
		// $("#loginBtn").on("click", function() {
		  $("#loginForm").on("submit", function(e) {
			  
			  e.preventDefault();
				
			let loginId = $("#loginIdInput").val();
			let password = $("#passwordInput").val();
			
			if(loginId == "") {
				alert("아이디를 입력하세요");
				return;
			}
			
			if(password == "") {
				alert("비밀번호를 입력하세요");
				return;
			}
			
			$.ajax({
				type:"post"
				, url:"/user/login"
				, data:{"loginId":loginId, "password":password}
				, success:function(data) {
					
					if(data.result == "success") {
						location.href = "/post/view-timeline";
					} else {
						alert("아이디, 비밀번호를 확인해주세요");
					}
				}
				, error:function() {
					alert("로그인 에러");
				}
				
			});
			
		});
		
	});





</script>

</body>
</html>