<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8" %>
<%@ page import="model.ModelHotel" %>
<%@ page import="java.util.*" %>
<!DOCTYPE html>
<html>
<head>
	<meta charset="utf-8">
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<title>adorable</title>
	<link rel="stylesheet" type="text/css" href="indexheaderfooter.css">
	<link rel="stylesheet" type="text/css" href="hotel.css">
	<link href="https://fonts.googleapis.com/css2?family=Hammersmith+One&family=Playfair+Display:ital@1&family=Staatliches&display=swap" rel="stylesheet">
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/2.2.4/jquery.min.js"></script>
	<script type="text/javascript" src="indexheader.js"></script>
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
	
	<jsp:useBean id="hotel" class="controller.HotelController"/>
	<%
	ArrayList<ModelHotel> arr = hotel.selectHotel();
	%>
	<section>
	<div class="hotelshape">
	<div class="hoteltitle">
	HOTEL
	<div class="hotelsubtitle">반려동물 동반 호텔</div>
	</div>
	<div class="hotelinfo">
	<ul>
	<%
	for (int i = 0; i < arr.size(); i++) {
		ModelHotel mh = arr.get(i);
		%>
	<li>
	<div class="hotelname"><%= mh.getHotelname() %></div>
	<div class="hotelimg">
	<a href="<%= mh.getHotelpage() %>" target="_blank">
	<img src="imgfile/<%= mh.getHotel_img() %>" width="620px" height="400px">
	</a>
	<div class="hotelgo">
	<a href="hoteldetail.jsp?hotelname=<%= mh.getHotelname() %>&hotelcode=<%= mh.getHotelcode() %>">호텔 정보 보러가기</a>
	</div>
	</div>
	<div class="hotelname">
	<%
	if (id == null) {
	%>
		<a href="login.jsp">예약하러가기 ></a>
	<%
}
else {
	%>
	<a href="hotelroom.jsp?hotelname=<%= mh.getHotelname() %>&hotelcode=<%= mh.getHotelcode() %>">예약하러가기 ></a>
	<%
}
%>
	</div>
	</li>
		<%
	}
	%>
	</ul>
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