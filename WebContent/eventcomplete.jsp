<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	<%@ page import="vo.EventDTO" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>adorable</title>
<link rel="stylesheet" type="text/css" href="indexheaderfooter.css">
<link rel="stylesheet" type="text/css" href="signupcomplete.css">
<link
	href="https://fonts.googleapis.com/css2?family=Hammersmith+One&family=Playfair+Display:ital@1&family=Staatliches&display=swap"
	rel="stylesheet">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/2.2.4/jquery.min.js"></script>
<script type="text/javascript" src="indexheader.js"></script>
<script type="text/javascript" src="loginlookitems.js"></script>
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
	
	<%
	EventDTO eventdto = (EventDTO)request.getAttribute("coupon");
	%>

	<section>
	<div class="loginok">
		<form action="index.jsp" method="post">
			<div class="loginokinfo"><%= eventdto.getCoupon_sum() %>원이 당첨 되셨습니다!</div>
			<br>
			<input type="button" value="마이페이지 가기" class="loginbox" onclick="location.href='processmypage.jsp'"><br>
			<input type="submit" value="홈으로 가기" class="homebox">
			<div class="joinimage">
				<img src="image/dogfood.png" width="60px" height="60px">
				<img src="image/catfoot.png" width="60px" height="60px">
				<img src="image/dogborn.png" width="60px" height="60px">
				<img src="image/dogtoy.png" width="60px" height="60px">
				<img src="image/dogfoot.png" width="60px" height="60px">
				<img src="image/catcan.png" width="60px" height="60px">
			</div>
		</form>
	</div>
	</section>

	<footer>
		<div class="foottitle">
			<div class="ftleft">
				<div class="ft1">
					COMPANY ㈜adorable
					<div class="ft1_1">
						대표자. 백현민 <br> tel. 010-7430-6757 <br> business no.
						123-45-6789 <br> mail. bhm01@naver.com <br> address.
						서울특별시 관악구 관악로
					</div>
				</div>
				<div class="ft2">
					C/S CENTER
					<div class="ft1_1">
						<h3>070-1234-5678</h3>
						<br> mon-fri am11:00-pm5:00 <br> lunch pm12:00-pm1:00 <br>
						sat, sun, holiday off
					</div>
				</div>
			</div>
			<div class="ftright">
				<div class="ft1">
					BANK ACCOUNT
					<div class="ft1_1">
						농협 123-1234-5678-90 <br> 신한은행 123-4567-890 <br>
						<br> 예금주 : ㈜어도러블
					</div>
				</div>
				<div class="ft2">
					SOCIAL LINK
					<div class="ft1_1">
						<a href="https://www.instagram.com/ddddanggu/" target="_blank"><img
							src="image/instalogo.png" width="50px" height="50px"></a> <a
							href="https://www.facebook.com/" target="_blank"><img
							src="image/facebooklogo.png" width="50px" height="50px"></a>
					</div>
				</div>
			</div>
		</div>
	</footer>

</body>
</html>