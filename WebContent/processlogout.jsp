<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
    <script src="https://developers.kakao.com/sdk/js/kakao.js"></script>
<body>
<%
String id = (String)session.getAttribute("id");
String kakaoid = (String)session.getAttribute("kakaoid");
if (kakaoid != null) {
	%>
		<script>
		Kakao.init('ccd1ef8cceffe35106ef2c724b4a8817'); //발급받은 키 중 javascript키를 사용해준다.
		console.log(Kakao.isInitialized()); // sdk초기화여부판단
	//카카오로그아웃  
	function kakaoLogout() {
	    if (Kakao.Auth.getAccessToken()) {
	      Kakao.API.request({
	        url: '/v1/user/unlink',
	        success: function (response) {
	        	console.log(response)
	        },
	        fail: function (error) {
	          console.log(error)
	        },
	      })
	      Kakao.Auth.setAccessToken(undefined)
	    }
	}
	</script>
	<%
}

	session.invalidate();
	response.sendRedirect("login.jsp");


%>
</body>
</html>
