<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="model.ModelHotel" %>
<%@ page import="java.util.Date" %>
<%@ page import="java.text.SimpleDateFormat" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<jsp:useBean id="hotel" class="controller.HotelController"/>
<%
request.setCharacterEncoding("utf-8");
int hotelcode = Integer.parseInt(request.getParameter("hotelcode"));
int roomcode = Integer.parseInt(request.getParameter("roomcode"));
String id = (String)session.getAttribute("id");
String checkin_date = request.getParameter("checkin_date");
String checkout_date = request.getParameter("checkout_date");
int book_peoplenum = Integer.parseInt(request.getParameter("book_peoplenum"));
int price = Integer.parseInt(request.getParameter("price"));
int point = price / 100; // 적립금
int book_usepoint = 0;
if (request.getParameter("book_usepoint") == "") { // book_usepoint == null 이면 사용한 포인트 0
	book_usepoint = 0;
}
else {
	book_usepoint = Integer.parseInt(request.getParameter("book_usepoint"));
	point = point - book_usepoint; // 포인트 사용했으면 적립금 = 이번에 적립될 적립금 - 사용한 포인트 금액
}

int maxNum = hotel.selectMaxBookNum();

Date nowTime = new Date();
SimpleDateFormat sf = new SimpleDateFormat("yyyyMMdd");

String bookcode = sf.format(nowTime)+""+maxNum;

ModelHotel mh = new ModelHotel();

mh.setHotelcode(hotelcode);
mh.setRoomcode(roomcode);
mh.setId(id);
mh.setCheckin_date(checkin_date);
mh.setCheckout_date(checkout_date);
mh.setBook_peoplenum(book_peoplenum);
mh.setPrice(price);
mh.setBook_usepoint(book_usepoint);
mh.setBookcode(bookcode);
mh.setPoint(point);

boolean insertrs = hotel.insertHotelBook(mh);

if (insertrs) {
	boolean updaters = hotel.updatePoint(mh);
	if (updaters) {
		response.sendRedirect("reservationcomplete.jsp");
	}
}



%>

</body>
</html>