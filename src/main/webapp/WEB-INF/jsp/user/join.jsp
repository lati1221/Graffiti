<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원가입 화면</title>
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
<link rel="stylesheet" href="/static/css/style.css" type="text/css">
</head>
<body>

	<div id="wrap">
		<header>
		</header>
		<section class="contents d-flex justify-content-center">
			<div class="input-box my-5">
				<h1 class="text-center">회원 가입</h1>
					<div class="d-flex  mt-3">
						<input type="text" id="loginIdInput" class="form-control" placeholder="아이디(유저명)">
						<button type="button" class="btn btn-info btn-sm ml-2" id="DuplicateBtn">중복확인</button>
					</div>
						<div class="small text-success d-none" id="avaliableText">사용가능한 아이디 입니다</div>
						<div class="small text-danger d-none" id="dupText">중복된 아이디 입니다</div>
					
						<input type="password" id="passwordInput" class="form-control mt-3" placeholder="비밀번호">
						<input type="password" id="passwordConfirm" class="form-control mt-3" placeholder="비밀번호 확인">
						
						<input type="text" id="nameInput" class="form-control mt-3" placeholder="이름">
						<input type="text" id="emailInput" class="form-control mt-3" placeholder="이메일">
				<button type="submit" class="btn btn-secondary btn-block mt-3" id="joinBtn">가입</button>
			</div>
		</section>
		<footer>
		</footer>
	</div>
	
	
	<script  src="http://code.jquery.com/jquery-latest.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/popper.js@1.12.9/dist/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>
	
	<script>
  		$(document).ready(function() {
  		// 유효성 검사(중복여부)
			var isCheckDuplicate = false;
			var isDuplicate = true;
			
			$("#loginIdInput").on("input", function() {
				isCheckDuplicate = false;
				isDuplicate = true;
				
				$("#avaliableText").addClass("d-none");
				$("#dupText").addClass("d-none");
				
			});
			
			$("#DuplicateBtn").on("click", function() {
				
				let id = $("#loginIdInput").val();
				
				if(id == "") {
					alert("아이디를 입력하세요");
					return ;
				}
				
				$.ajax({
					type:"get"
					, url:"/user/duplicate-id"
					, data:{"loginId":id}
					, success:function(data) {
						
						isCheckDuplicate = true;
						
						if(data.isDuplicate) {
							// 중복되는 경우
							$("#dupText").removeClass("d-none");
							$("#avaliableText").addClass("d-none");
							
							isDuplicate = true;
						} else {
							// 중복이 아닌 경우
							$("#avaliableText").removeClass("d-none");
							$("#dupText").addClass("d-none");
							
							isDuplicate = false;
						}
					}
					, error:function() {
						alert("중복확인을 해주세요");
					}
					
				});
				
				
				
			});
  			
  			
  			$("#joinBtn").on("click", function() {
  				let loginId = $("#loginIdInput").val();
  				let password = $("#passwordInput").val();
  				let passwordConfirm = $("#passwordConfirm").val();
  				let name = $("#nameInput").val();
  				let email = $("#emailInput").val();
  				
  				if(loginId == "") {
  					alert("아이디를 입력하세요");
  					return ;
  				}
  				
  				if(password == "") {
  					alert("비밀번호를 입력하세요");
  					return ;
  				}
  				
  				if(password != passwordConfirm) {
  					alert("비밀번호가 일치하지 않습니다");
  					return;
  				}
  				
  				if(name == "") {
  					alert("이름을 입력하세요");
  					return;
  				}
  				
  				if(email == "") {
  					alert("이메일을 입력하세요");
  					return;
  				}
  				
  				$.ajax({
  					type:"post"
  					, url:"/user/join"
  					, data:{"loginId":loginId, "password":password, "name":name, "email":email}
  					, success:function(data) {
  						
  						if(data.result == "success") {
  							alert("회원가입 성공!!");
  							location.href = "/user/login";
  							
  						} else {
  							alert("회원가입 실패!!");
  						}
  					}
  					, error:function() {
  						alert("회원가입 에러!!");
  					}
  				});
  				
  			});
  			
  			
  			
  		});
  	
  	
  	</script>
  	
  	

	
  </body>
</html>