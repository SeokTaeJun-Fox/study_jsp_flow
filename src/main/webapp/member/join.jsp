<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원가입</title>
</head>
<body>
	<form action="/flow/join-ok.member" method="post">
		<div>
			<p>이메일</p>
			<input name="memberEmail" placeholder="이메일을 입력하세요." />
		</div>
		<div>
			<p>비밀번호</p>
			<input name="memberPassword" placeholder="비밀번호를 입력하세요." type="password"/>
		</div>
		<div>
			<p>이름</p>
			<input name="memberName" placeholder="이름을 입력하세요." />
		</div>
		<button>회원가입</button>
	</form>
</body>
</html>