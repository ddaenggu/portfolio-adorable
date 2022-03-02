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
	<link rel="stylesheet" type="text/css" href="roomdetail.css">
	<link href="https://fonts.googleapis.com/css2?family=Hammersmith+One&family=Playfair+Display:ital@1&family=Staatliches&display=swap" rel="stylesheet">
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/2.2.4/jquery.min.js"></script>
	<script type="text/javascript" src="indexheader.js"></script>
	<script type="text/javascript" src="hotelroom.js"></script>
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
	request.setCharacterEncoding("utf-8");
	String roomname = request.getParameter("roomname");
	ModelHotel m = new ModelHotel();
	m.setRoomname(roomname);
	
	ModelHotel mh = hotel.selectRoomInfo(m);
	%>
	<section>
	<div class="hotelshape">
	<div class="roomtitle">
	<%= mh.getRoomname() %>
	<div class="hoteltitle"><%= mh.getHotelname() %></div>
	</div>
	
	<div class="infozone">
	<img src="imgfile/<%= mh.getRoom_info1() %>" width="1280px">
	<%
	if (mh.room_info2 != null) {
		%>
		<img src="imgfile/<%= mh.getRoom_info2() %>" width="1280px">
		<%
	}
	%>
	<%
	if (mh.room_info3 != null) {
		%>
		<img src="imgfile/<%= mh.getRoom_info3() %>" width="1280px">
		<%
	}
	%>
	<%
	if (mh.room_info4 != null) {
		%>
		<img src="imgfile/<%= mh.getRoom_info4() %>" width="1280px">
		<%
	}
	%>
	<%
	if (mh.room_info5 != null) {
		%>
		<img src="imgfile/<%= mh.getRoom_info5() %>" width="1280px">
		<%
	}
	%>
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