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
		<header class="d-flex align-items-center justify-content-between">
		</header>
		<section class="contents d-flex justify-content-center">
			<div class="input-box my-5">
				<h1 class="text-center">회원 가입</h1>
				<input type="text" placeholder="아이디(유저명)" class="form-control mt-4" id="loginIdInput">
				<input type="password" placeholder="비밀번호(영문, 숫자조합 최소 6자리)" class="form-control mt-2" id="passwordInput">
				<input type="password" placeholder="비밀번호 확인" class="form-control mt-2" id="passwordConfirmInput">
				<input type="text" placeholder="이름" class="form-control mt-2" id="nameInput">
				<input type="text" placeholder="이메일" class="form-control mt-2" id="emailInput">
				<button type="button" class="btn btn-secondary btn-block mt-3" id="joinBtn">가입</button>
			</div>
		</section>
	</div>

	<script  src="http://code.jquery.com/jquery-latest.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/popper.js@1.12.9/dist/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>
  </body>
</html>