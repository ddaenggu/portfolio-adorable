<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ page import="java.util.*" %>
    <%@ page import="model.ModelProduct" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>adorable</title>
	<link rel="stylesheet" type="text/css" href="indexheaderfooter.css">
	<link rel="stylesheet" type="text/css" href="myorder.css">
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

	<%
	List<ModelProduct> list = (List<ModelProduct>)request.getAttribute("LIST");
	List<ModelProduct> arr = (List<ModelProduct>)request.getAttribute("arr");
	
	if (!arr.isEmpty()) {
	%>
	<section>
	<div class="bigshape">
	<form name="od">
	<div class="carttitle">MY ORDER</div>
	
	<div class="cartzone">
	<%
	for (int j = 0; j < arr.size(); j++) {
		ModelProduct m = arr.get(j);
		%>
	
	<table class="carttable">
	<tr>
	<th class="ordernum" colspan="4">[<%= m.getOrder_date() %>]<a href="#"> 주문번호 : <%= m.getOrdercode() %></a></th>
	</tr>
	<%
	for (int i = 0; i < list.size(); i++) {
		ModelProduct mp = list.get(i);
		if (m.getOrdercode().equals(mp.getOrdercode())) {
		%>
	<tr>
	<td class="imagezone"><a href="loginlookitems.jsp?pb_title=<%= mp.getPb_title() %>"><img src="imgfile/<%= mp.getPb_img1() %>" width="100px" height="100px"></a></td>
	<td class="itemname"><a href="loginlookitems.jsp?pb_title=<%= mp.getPb_title() %>"><%= mp.getPro_name() %></a></td>
	<td class="iteminfo">옵션 : <%= mp.getPro_color() %> / <%= mp.getPro_size() %> / 수량 <%= mp.getOrder_quantity() %> 개</td>
	<td class="itemprice"><%= mp.getPro_price() %> 원</td>
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
	<input type="button" value="쇼핑하러가기" class="goorder" onclick="location.href='index.jsp'">
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
		<div class="carttitle">MY ORDER</div>
		<div class="nocartinfo">주문하신 상품이 없습니다.</div>
		<form>
		<div class="nocartbtn">
		<input type="button" value="쇼핑하러가기" class="goorder" onclick="location.href='index.jsp'">
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