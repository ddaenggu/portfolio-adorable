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
	<link rel="stylesheet" type="text/css" href="cart.css">
	<link href="https://fonts.googleapis.com/css2?family=Hammersmith+One&family=Playfair+Display:ital@1&family=Staatliches&display=swap" rel="stylesheet">
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/2.2.4/jquery.min.js"></script>
	<script type="text/javascript" src="indexheader.js"></script>
	<script type="text/javascript" src="cart.js"></script>
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
	List<ModelProduct> arr = (List<ModelProduct>)request.getAttribute("LIST");
	if (!arr.isEmpty()) { // list null값 비교하는법
		%>

	<section>
	<div class="bigshape">
	<form name="cart" action="selectallproduct.prod" method="post">
	<div class="carttitle">CART</div>
	
	<div class="cartzone">
	<table class="carttable">
	<tr>
	<th class="imagezone">이미지</th>
	<th class="iteminfozone">상품정보</th>
	<th class="pricezone">가격</th>
	<th class="quantityzone">수량</th>
	<th class="pointzone">적립금</th>
	<th class="totalpricezone">합계</th>
	<th class="selectzone">선택</th>
	</tr>
		<%
	for (int i = 0; i < arr.size(); i++) {
		ModelProduct mp = arr.get(i);
		%>
		
	<tr>
		<input type="hidden" name="cart_num" value="<%= mp.getCart_num() %>" id="cart_num" class="each_class">
		<input type="hidden" name="pro_code" value="<%= mp.getPro_code() %>" id="pro_code" class="each_class">
		<input type="hidden" name="pro_name" value="<%= mp.getPro_name() %>" id="pro_name" class="each_class">
		<input type="hidden" name="pro_price" value="<%= mp.getPro_price() %>" id="pro_price" class="each_class pro_price">
	<td class="imagezone">
	<a href="loginlookitems.jsp?pb_title=<%= mp.getPb_title() %>"><img src="imgfile/<%= mp.getPb_img1() %>" width="100px" height="100px"></a>
	</td>
	<td class="iteminfozone">
	<div class="itemname"><a href="loginlookitems.jsp?pb_title=<%= mp.getPb_title() %>"><%= mp.getPro_name() %></a></div>
	옵션 : <%= mp.getPro_color() %> / <%= mp.getPro_size() %>
	</td>
	<td class="pricezone"><%= mp.getPro_price() %> 원</td>
	<td class="quantityzone">
	<input type="number" name="cart_quantity" value="<%= mp.getCart_quantity() %>" min="1" id="cart_quantity" class="quantitybox each_class" onfocus="this.blur()"><br>
	<input type="submit" value="변경" class="updatebox" formaction="updatecartquantity.prod" formmethod="post">
	</td>
	<td class="pointzone"><span class="totalpoint"></span> 원</td>
	<td class="totalpricezone"><span class="totalprice"></span> 원</td>
	<td class="selectzone"><input type="button" value="삭제" class="deletebtn" onclick="location.href='deletecart.prod?cart_num=<%= mp.getCart_num() %>'"></td>
	</tr>
		<%
	}
	%>
	</table>
	</div>
	
	<div class="sumzone">
	<table class="carttable">
	<tr>
	<th class="allprice">총 상품금액</th>
	<th class="deliveryprice">배송비</th>
	<th class="sumprice">결제예상금액</th>
	</tr>
	<td class="allprice"><span id="allprice"></span> 원</td>
	<td class="deliveryprice"><span id="deliveryprice"></span> 원</td>
	<td class="sumprice"><span id="sumprice"></span> 원</td>
	</table>
	</div>
	<div class="btnbox">
	<input type="button" value="쇼핑하러가기" class="goshopping" onclick="location.href='selectallwear.prod'">
	<input type="submit" value="주문하러가기" class="goorder">
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
		<div class="carttitle">CART</div>
		<div class="nocartinfo">CART에 담긴 상품이 없습니다.</div>
		<form>
		<div class="nocartbtn">
		<input type="button" value="쇼핑하러가기" class="goshopping" onclick="location.href='selectallwear.prod'">
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