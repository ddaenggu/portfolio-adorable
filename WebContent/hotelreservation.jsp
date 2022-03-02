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
	<link rel="stylesheet" type="text/css" href="hotelreservation.css">
	<link href="https://fonts.googleapis.com/css2?family=Hammersmith+One&family=Playfair+Display:ital@1&family=Staatliches&display=swap" rel="stylesheet">
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/2.2.4/jquery.min.js"></script>
	<script type="text/javascript" src="indexheader.js"></script>
	<script type="text/javascript" src="hotelreservation.js"></script>
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
	int hotelcode = Integer.parseInt(request.getParameter("hotelcode"));
	int roomcode = Integer.parseInt(request.getParameter("roomcode"));
	String hotelname = request.getParameter("hotelname");
	String roomname = request.getParameter("roomname");
	String room_img = request.getParameter("room_img");
	String checkin_date = request.getParameter("checkin_date");
	String checkout_date = request.getParameter("checkout_date");
	int price = Integer.parseInt(request.getParameter("price"));
	int people_num = Integer.parseInt(request.getParameter("people_num"));
	
	ModelHotel mh = hotel.selectCustomerInfo(id);
	%>
	
	<section>
	<div class="hotelshape">
	<form name="ht" action="processreservation.jsp" method="post">
	<div class="reservationtitle">HOTEL RESERVATION</div>
	<div class="reservationzone">
	<table class="reservationtable">
	<tr>
	<th class="imgzone">이미지</th>
	<th class="infozone">예약정보</th>
	<th class="checkinoutzone">체크인 체크아웃</th>
	<th class="peoplenumzone">예약인원</th>
	<th class="pointzone">적립금</th>
	<th class="pricezone">가격</th>
	</tr>
	
	<input type="hidden" name="hotelcode" value="<%= hotelcode %>">
	<input type="hidden" name="roomcode" value="<%= roomcode %>">
	<input type="hidden" name="book_peoplenum" value="<%= people_num %>">
	<input type="hidden" name="checkin_date" value="<%= checkin_date %>">
	<input type="hidden" name="checkout_date" value="<%= checkout_date%>">
	<input type="hidden" name="price" value="<%= price %>" id="price">
	<tr>
	<td class="imgzone"><img src="imgfile/<%= room_img %>" width="150px" height="100px"></td>
	<td class="infozone">
	<%= hotelname %> <br>
	<div class="roomname"><%= roomname %></div>
	</td>
	<td class="checkinoutzone">
	체크인 : <%= checkin_date %> <br>
	체크아웃 : <%= checkout_date %>
	</td>
	<td class="peoplenumzone"><%= people_num %> 명</td>
	<td class="pointzone"><span id="totalpoint"></span> 원</td>
	<td class="pricezone"><%= price %> 원</td>
	</tr>
	
	</table>
	</div>
	
	<div class="customerzone">
	<div class="customertitle">예약자 정보</div>
	<div class="customerinfo">
	성함 : <%= mh.getName() %><br>
	핸드폰번호 : <%= mh.getNum_front() %>-<%= mh.getNum_middle() %>-<%= mh.getNum_back() %><br>
	이메일 : <%= mh.getMail_front() %>@<%= mh.getMail_back() %><br>
	포인트 : <%= mh.getPoint() %> 원<br>
	<input type="hidden" name="point" value="">
	포인트사용 <input type="text" name="book_usepoint" class="pointbox" id="usepoint">
	<span class="pointinfo">(포인트는 5000원 이상부터 사용 가능합니다.)</span>
	</div>
	</div>
	
	<div class="sumzone">
	<table class="carttable">
	<tr>
	<th class="allprice">총 상품금액</th>
	<th class="usepointzone">포인트 사용</th>
	<th class="sumprice">결제금액</th>
	</tr>
	<td class="allprice"><span id="allprice"></span> 원</td>
	<td class="usepointzone">-<span id="usepointzone"></span> 원</td>
	<td class="sumprice"><span id="sumprice"></span> 원</td>
	</table>
	</div>
	<div class="btnbox">
	<input type="submit" value="예약하기" class="goorder">
	</div>
	
	</form>
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