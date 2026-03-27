<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %> 
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>로그인</title>
</head>
<body>
<!-- 
	param: 쿼리스트링, form
	requestScore: setAttribute
 -->
	<h1>${param.flag}</h1>
	<c:if test="${not empty param.flag}">
		<script>
			const flag = `${param.flag}`;
			let message = "";
			
			if(flag === "memberEmail"){
				message = "회원이 존재하지 않습니다."
			} else if(flag === "memberPassword"){
				message = "비밀번호가 틀렸습니다.";
			}
			
			alert(message);
		</script>
	</c:if>

	<form action="/flow/login-ok.member" method="post">
		<div>
			<p>이메일</p>
			<input name="memberEmail" placeholder="이메일을 입력하세요." />
		</div>
		<div>
			<p>비밀번호</p>
			<input name="memberPassword" placeholder="비밀번호를 입력하세요." type="password"/>
		</div>
		<button>로그인</button>
	</form>
</body>
</html>