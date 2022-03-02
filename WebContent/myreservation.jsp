<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ page import="java.util.*" %>
    <%@ page import="model.ModelHotel" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>adorable</title>
	<link rel="stylesheet" type="text/css" href="indexheaderfooter.css">
	<link rel="stylesheet" type="text/css" href="myreservation.css">
	<link href="https://fonts.googleapis.com/css2?family=Hammersmith+One&family=Playfair+Display:ital@1&family=Staatliches&display=swap" rel="stylesheet">
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/2.2.4/jquery.min.js"></script>
	<script type="text/javascript" src="indexheader.js"></script>
	<script type="text/javascript" src="order.js"></script>
	<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
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
	ArrayList<ModelHotel> arr = hotel.selectBookcode(id);
	ArrayList<ModelHotel> list = hotel.selectMyReservation(id);
	
	if (!arr.isEmpty()) {
	%>
	<section>
	<div class="bigshape">
	<form name="od">
	<div class="carttitle">MY RESERVATION</div>
	
	<div class="cartzone">
	<%
	for (int j = 0; j < arr.size(); j++) {
		ModelHotel m = arr.get(j);
		%>
	
	<table class="carttable">
	<tr>
	<th class="ordernum" colspan="6"><a href="#"> 예약번호 : <%= m.getBookcode() %></a></th>
	</tr>
	<%
	for (int i = 0; i < list.size(); i++) {
		ModelHotel mh = list.get(i);
		if (m.getBookcode().equals(mh.getBookcode())) {
		%>
	<tr>
	<td class="imagezone"><a href="roomdetail.jsp?roomname=<%= mh.getRoomname() %>"><img src="imgfile/<%= mh.getRoom_img() %>" width="150px" height="100px"></a></td>
	<td class="itemname">
	<div class="roomname"><%= mh.getRoomname() %></div>
	<%= mh.getHotelname() %>
	</td>
	<td class="peoplenumzone">
	예약자 : <%= mh.getName() %> <br>
	예약인원 : <%= mh.getBook_peoplenum() %> 명</td>
	<td class="iteminfo">
	체크인 : <%= mh.getCheckin_date() %> <br>
	체크아웃 : <%= mh.getCheckout_date() %>
	</td>
	<td class="bookdatezone">예약날짜 : <%= mh.getBook_date() %></td>
	<td class="itemprice"><%= mh.getPrice() %> 원</td>
	</tr>
		<%
		}
	}
	%>
	
	</table>
		<%
	}
	%>
	</div>
	
	<div class="btnbox">
	<input type="button" value="호텔 예약하러가기" class="goorder" onclick="location.href='hotel.jsp'">
	</div>
	</form>
	
	</div>	
	</section>
	<%
	}
	else {
		%>
		<section>
		<div class="bigshape">
		<div class="carttitle">MY RESERVATION</div>
		<div class="nocartinfo">예약하신 호텔이 없습니다.</div>
		<form>
		<div class="nocartbtn">
		<input type="button" value="호텔 예약하러가기" class="goorder" onclick="location.href='hotel.jsp'">
		</div>
		</form>
		</div>
		</section>
		<%
	}
	%>

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