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
	<link rel="stylesheet" type="text/css" href="order.css">
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
	
	ModelProduct mp = (ModelProduct)request.getAttribute("m");
	int quantity = (int)request.getAttribute("quantity");

	%>
	<section>
	<div class="bigshape">
	<form name="od" action="insertorder.prod" method="post">
	<div class="carttitle">ORDER</div>
	
	<div class="cartzone">
	<table class="carttable">
	<tr>
	<th class="imagezone">이미지</th>
	<th class="iteminfozone">상품정보</th>
	<th class="pricezone">가격</th>
	<th class="quantityzone">수량</th>
	<th class="pointzone">적립금</th>
	<th class="totalpricezone">합계</th>
	</tr>

	<input type="hidden" name="pro_code" value="<%= mp.getPro_code() %>">
	<input type="hidden" name="pro_price" value="<%= mp.getPro_price() %>" id="pro_price">
	<input type="hidden" name="quantity" value="<%= quantity %>" id="quantity">
	<tr>
	<td class="imagezone">
	<img src="imgfile/<%= mp.getPb_img1() %>" width="100px" height="100px">
	</td>
	<td class="iteminfozone">
	<div class="itemname"><%= mp.getPro_name() %></div>
	옵션 : <%= mp.getPro_color() %> / <%= mp.getPro_size() %>
	</td>
	<td class="pricezone"><%= mp.getPro_price() %> 원</td>
	<td class="quantityzone"><%= quantity %> 개</td>
	<td class="pointzone"><span id="totalpoint"></span> 원</td>
	<td class="totalpricezone"><span id="totalprice"></span> 원</td>
	</tr>

	</table>
	</div>
	
	<div class="orderzone">
	<div class="ordercustomer">주문자 정보</div>
	<div class="customerinfo">
	<%= mp.getName() %><br>
	<%= mp.getNum_front() %>-<%= mp.getNum_middle() %>-<%= mp.getNum_back() %><br>
	포인트 : <%= mp.getPoint() %> 원<br>
	<input type="hidden" name="point" value="<%= mp.getPoint() %>">
	포인트사용 <input type="text" name="order_usepoint" class="pointbox" id="usepoint">
	<span class="pointinfo">(포인트는 5000원 이상부터 사용 가능합니다.)</span>
	</div>
	<div class="ordercustomer">배송지 정보</div>
	<div class="addresszone1">
	<ul>
	<li>
	<input type="radio" name="orderaddress" checked="checked" id="addr1" value="address1"> 기본배송지
	</li>
	<li>
	<input type="radio" name="orderaddress" id="addr2" value="address2"> 새로운배송지
	</li>
	</ul>
	</div>
	<div class="addresszone2">
	<ul>
	<li>
		<div class="detailaddresszone1">
	<%= mp.getZipcode() %> <br>
	<%= mp.getAddress() %> <br>
	<%= mp.getDetailaddress() %> <br>
	<%= mp.getExtraaddress() %>
	<input type="hidden" name="zipcode" value="<%= mp.getZipcode() %>">
	<input type="hidden" name="address" value="<%= mp.getAddress()%>">
	<input type="hidden" name="detailaddress" value="<%=mp.getDetailaddress() %>">
	<input type="hidden" name="extraaddress" value="<%= mp.getExtraaddress() %>">
	</div>
	</li>
	<li>
		<div class="detailaddresszone2">
	<input type="text" size="6" name="newzipcode" class="borderline" placeholder="우편번호" id="zipcode" readonly="readonly">
	<input type="button" name="findaddr" value="주소찾기" class="bt" onclick="findpostcode()"><br>
	<input type="text" size="35" name="newaddress" class="borderline" placeholder="주소" id="address" readonly="readonly"><br>
	<input type="text" size="40" name="newdetailaddress" class="borderline" placeholder="상세주소" id="detailaddress"><br>
	<input type="text" size="20" name="newextraaddress" class="borderline" placeholder="참고항목" id="extraaddress" readonly="readonly">
	</div>
	</li>
	</ul>
	</div>
	
	</div>
	
	<div class="sumzone">
	<table class="carttable">
	<tr>
	<th class="allprice">총 상품금액</th>
	<th class="deliveryprice">배송비</th>
	<th class="usepointzone">포인트 사용</th>
	<th class="sumprice">결제금액</th>
	</tr>
	<td class="allprice"><span id="allprice"></span> 원</td>
	<td class="deliveryprice">+<span id="deliveryprice"></span> 원</td>
	<td class="usepointzone">-<span id="usepointzone"></span> 원</td>
	<td class="sumprice"><span id="sumprice"></span> 원</td>
	</table>
	</div>
	<div class="btnbox">
	<input type="submit" value="주문하기" class="goorder" onclick="return checkaddr()">
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