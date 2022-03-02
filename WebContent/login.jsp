<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>adorable</title>
<link rel="stylesheet" type="text/css" href="login.css">
	<link rel="stylesheet" type="text/css" href="indexheaderfooter.css">
	<link href="https://fonts.googleapis.com/css2?family=Hammersmith+One&family=Playfair+Display:ital@1&family=Staatliches&display=swap" rel="stylesheet">
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/2.2.4/jquery.min.js"></script>
	<script type="text/javascript" src="indexheader.js"></script>
	<script src="https://developers.kakao.com/sdk/js/kakao.js"></script>
	<script src="https://static.nid.naver.com/js/naveridlogin_js_sdk_2.0.2.js" charset="utf-8"></script>
	<script>
	Kakao.init('ccd1ef8cceffe35106ef2c724b4a8817'); //발급받은 키 중 javascript키를 사용해준다.
	console.log(Kakao.isInitialized()); // sdk초기화여부판단
	//카카오로그인
	function kakaoLogin() {
	    Kakao.Auth.login({
	      success: function (response) {
	        Kakao.API.request({
	          url: '/v2/user/me',
	          success: function (response) {
	          	console.log(response)
	        	location.href='processkakaologin.jsp?id='+response.id+'&name='+response.properties.nickname;
	          },
	          fail: function (error) {
	            console.log(error)
	          },
	        })
	      },
	      fail: function (error) {
	        console.log(error)
	      },
	    })
	  }
	
	var naverLogin = new naver.LoginWithNaverId(
			{
				clientId: "xURu_LC7fRCunlobAu4b", //내 애플리케이션 정보에 cliendId를 입력해줍니다.
				callbackUrl: "http://localhost:8080/Adorable/naverLogin.jsp", // 내 애플리케이션 API설정의 Callback URL 을 입력해줍니다.
				isPopup: false,
				loginButton: {color: "green", type: 3, height: 60}
			}
		);	

	naverLogin.init();
	</script>
</head>
<body>
<%
String id = (String)session.getAttribute("id");

if (id == null) {
	%>
	<jsp:include page="indexheader.jsp"/>
	<%
}
else {
	%>
	<jsp:include page="loginindexheader.jsp"/>
	<%
}
%>

<section>
	<div class="login">
		<div class="detaillogin">
		<h1>LOGIN</h1>
		<form method="post">
			<input type="text" name="id" placeholder="아이디" class="textbox"> <br>
			<input type="password" name="password" placeholder="비밀번호" class="textbox"> <br>
			<div class="ck">
				<input type="checkbox" name="rememberid" value="rememberid" id="ckbox"><label for="ckbox"></label> <span class="ckboxinfo">아이디저장</span> <br>
			</div>
			<div class="btnzone">
			<input type="submit" value="LOGIN" class="btnbox loginbtn" formaction="processlogin.jsp"> <br>
			<input type="submit" value="JOIN US" class="btnbox" formaction="signup.html">
			</div>
			<div class="findid">
			<button type="button">
			<img src="image/navericon.png" width="60px" height="60px">
			</button>
			<button type="button" onclick="kakaoLogin()">
			<img src="image/kakaoicon.png" width="60px" height="60px">
			</button>
			</div>
			
		</form>
		</div>
	</div>
	</section>

	<footer>
		<div class="foottitle">
			<div class="ftleft">
				<div class="ft1">COMPANY ㈜adorable
					<div class="ft1_1">
						대표자. 백현민 <br>
						tel. 010-7430-6757 <br>
						business no. 123-45-6789 <br>
						mail. bhm01@naver.com <br>
						address. 서울특별시 관악구 관악로
					</div>
				</div>
				<div class="ft2">C/S CENTER
					<div class="ft1_1">
						<h3>070-1234-5678</h3><br>
						mon-fri am11:00-pm5:00 <br>
						lunch pm12:00-pm1:00 <br>
						sat, sun, holiday off
					</div>
				</div>
			</div>
			<div class="ftright">
				<div class="ft1">BANK ACCOUNT
					<div class="ft1_1">
						농협 123-1234-5678-90 <br>
						신한은행 123-4567-890 <br><br>
						예금주 : ㈜어도러블
					</div>
				</div>
				<div class="ft2">SOCIAL LINK
					<div class="ft1_1">
						<a href="https://www.instagram.com/ddddanggu/" target="_blank"><img src="image/instalogo.png" width="50px" height="50px"></a>
						<a href="https://www.facebook.com/" target="_blank"><img src="image/facebooklogo.png" width="50px" height="50px"></a>
					</div>
				</div>
			</div>
		</div>
	</footer>

</body>
</html>