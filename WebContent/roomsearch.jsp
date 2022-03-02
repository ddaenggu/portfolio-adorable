<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8" %>
<%@ page import="model.ModelHotel" %>
<%@ page import="java.util.*" %>
<%@ page import="java.time.*" %>
<%@ page import="java.text.SimpleDateFormat" %>
<%@ page import="java.text.DateFormat" %>
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
	<script type="text/javascript" src="roomsearch.js"></script>
	
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
	
	<jsp:useBean id="hotel" class="controller.HotelController" />
	<%
	request.setCharacterEncoding("utf-8");
	int hotelcode =Integer.parseInt(request.getParameter("hotelcode"));
	String hotelname = request.getParameter("hotelname");
	String checkin_date = request.getParameter("checkin_date");
	String checkout_date = request.getParameter("checkout_date");
	int people_num = Integer.parseInt(request.getParameter("people_num"));
	
	ModelHotel m = new ModelHotel();
	
	m.setHotelcode(hotelcode);
	m.setHotelname(hotelname);
	m.setCheckin_date(checkin_date);
	m.setCheckout_date(checkout_date);
	m.setPeople_num(people_num);
	
	ArrayList<ModelHotel> arr = hotel.selectRoom(m);
	ModelHotel mh2 = hotel.selectHotelInfo(m);

	%>
	<section>
	<form name="hotel">
	<div class="hotelshape">
	<div class="roomtitle">
	날짜, 인원 선택
	<div class="roomsubtitle">SELECT DATE, NUMBER OF PEOPLE</div>
	</div>
	<div class="selectzone">
	<ul>
	<li>
	<div class="selecttitle">체크 인</div>
	<input type="date" name="checkin_date" class="datebox1" id="checkin" value="<%= checkin_date %>">
	</li>
	<li>
	<div class="selecttitle">체크 아웃</div>
	<input type="date" name="checkout_date" class="datebox2" id="checkout" value="<%= checkout_date %>">
	</li>
	<li>
	<div class="selecttitle">인원</div>
	<select name="people_num" class="peoplebox">
	<option value="1" <% if (people_num == 1) { %> selected="selected" <% } %>>1</option>
	<option value="2" <% if (people_num == 2) { %> selected="selected" <% } %>>2</option>
	<option value="3" <% if (people_num == 3) { %> selected="selected" <% } %>>3</option>
	<option value="4" <% if (people_num == 4) { %> selected="selected" <% } %>>4</option>
	</select></li>
	</ul>
	</div>
	<div class="searchzone">
	<input type="submit" value="검색" class="searchbtn" formaction="roomsearch.jsp" formmethod="post" onclick="return checkdate()">
	</div>
	
	<div class="roominfo">
	<div class="roomnuminfo">객실 > <%= arr.size() %> 개</div>
	<%
	for (int i = 0; i < arr.size(); i++) {
		ModelHotel mh = arr.get(i);
		%>
	<table class="roomtable">
	<tr>
	<td class="td_img" rowspan="2"><img src="imgfile/<%= mh.getRoom_img() %>" width="300px" height="200px"></td>
	<td class="td_info1">
	<div class="roomname"><%= mh.getRoomname() %></div>
	<div class="roomname"><input type="button" value="객실 상세 안내 →" class="infobtn" onclick="location.href='roomdetail.jsp?roomname=<%= mh.getRoomname() %>'"></div>
	</td>
	<td class="td_info2">
	<div class="roomnumber">객실 예약 연락처 : <%= mh2.getHotelnum() %></div>
	<%
	int dayNum = 0;
    int price = 0; // 기본가격 변수 선언 & 0 초기화
	Date format1 = new SimpleDateFormat("yyyy-MM-dd").parse(checkin_date);
    Date format2 = new SimpleDateFormat("yyyy-MM-dd").parse(checkout_date); // 체크인 체크아웃 날짜 구하는 문장
    long diffSec = (format2.getTime() - format1.getTime()) / 1000; // 초 차이
    long diffDays = diffSec / (24*60*60); // 일 차이
    
    if (diffDays == 1) { // 체크아웃 - 체크인 날짜가 1일 경우
		Date date = new SimpleDateFormat("yyyy-MM-dd").parse(checkin_date);
		Calendar calendar = Calendar.getInstance();
		calendar.setTime(date);
		calendar.add(Calendar.MONTH, 1); // 월은 0부터 시작해서 1더해줌
		dayNum = calendar.get(Calendar.DAY_OF_WEEK);
		
		if (dayNum == 1 || dayNum == 2 || dayNum == 3 || dayNum == 4 || dayNum == 5) {
			// 체크인 요일이 일,월,화,수,목 일 경우 평일날짜
			price = mh.getWeekday_price();
		}
		else { // 체크인 요일이 금,토(주말)일 경우 주말날짜
			price = mh.getWeekend_price();
		}
		
    }
    else {
    	for (int j = 0; j < diffDays; j++) { // 체크아웃-체크인 일 차이만큼 반복
    		Date date = new SimpleDateFormat("yyyy-MM-dd").parse(checkin_date);
			Calendar calendar = Calendar.getInstance();
			calendar.setTime(date);
			calendar.add(Calendar.MONTH, 1); // 월은 0부터 시작해서 1더해줌
			calendar.add(Calendar.DATE, j); // 반복문 돌릴때마다 체크인날짜+j 만큼 일 더해줌
			dayNum = calendar.get(Calendar.DAY_OF_WEEK);
			
			if (dayNum == 1 || dayNum == 2 || dayNum == 3 || dayNum == 4 || dayNum == 5) {
				price += mh.getWeekday_price();
			}
			else {
				price += mh.getWeekend_price();
			}
    	}
		
    }
	
	%>
	<div class="roomprice"><%= price %> 원 ~</div>
	</td>
	</tr>
	<tr>
	<td colspan="2" class="td_btn">
	<div class="selectroom">
	<input type="button" value="선택하기" class="searchbtn" onclick="location.href='hotelreservation.jsp?checkin_date=<%= checkin_date %>&checkout_date=<%= checkout_date %>&people_num=<%= people_num %>&hotelcode=<%= mh.getHotelcode() %>&hotelname=<%= hotelname %>&roomcode=<%= mh.getRoomcode() %>&roomname=<%= mh.getRoomname() %>&room_img=<%= mh.getRoom_img() %>&price=<%= price %>'"></div></td>
	</tr>
	</table>
	<input type="hidden" name="hotelcode" value="<%= mh.getHotelcode() %>">
	<input type="hidden" name="hotelname" value="<%= hotelname %>">
	<input type="hidden" name="roomcode" value="<%= mh.getRoomcode() %>">
	<input type="hidden" name="roomname" value="<%= mh.getRoomname() %>">
	<input type="hidden" name="room_img" value="<%= mh.getRoom_img() %>">
	<input type="hidden" name="price" value="<%= price %>">
		<%
	}
	%>
	</div>
	</div>
	</form>
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