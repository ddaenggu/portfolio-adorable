<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>adorable</title>
<link rel="stylesheet" type="text/css" href="indexheaderfooter.css">
<link rel="stylesheet" type="text/css" href="loginlookitems.css">
<link
	href="https://fonts.googleapis.com/css2?family=Hammersmith+One&family=Playfair+Display:ital@1&family=Staatliches&display=swap"
	rel="stylesheet">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/2.2.4/jquery.min.js"></script>
<script type="text/javascript" src="indexheader.js"></script>
<script type="text/javascript" src="loginlookitems.js"></script>
</head>
<body>
	<jsp:useBean id="prod" class="controller.Control" />
	<%@ page import="model.ModelProduct"%>
	<%@ page import="java.util.*"%>
	<%
String pb_title = request.getParameter("pb_title");

ModelProduct mp = new ModelProduct();
ModelProduct price = new ModelProduct();
mp = prod.selectProductBoard(pb_title);
ArrayList<ModelProduct> arrcolor = prod.selectProductColor(pb_title);
ArrayList<ModelProduct> arrsize = prod.selectProductSize(pb_title);
price = prod.selectProductPrice(pb_title);

%>
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

	<section>
		<div class="itemstitle">
			<div class="itemsimg">
				<img src="imgfile/<%=mp.pb_img1%>" width="500px" height="500px"
					class="titleimg1"> <img src="imgfile/<%=mp.pb_img2%>"
					width="500px" height="500px" class="titleimg2">
			</div>
			<div class="itemsselect">
				<div class="itemname">
					<%=mp.pb_title%>
				</div>
				<form name="prod">
				<input type="hidden" name="id" value="<%= id %>">
					<div class="selectitem">
						<ul>
							<li>
								<div class="selectitem_1">판매가</div>
								<div class="selectitem_1">배송비</div>
								<div class="selectitem_1">적립금</div>
								<div class="selectitem_1">SIZE</div>
								<div class="selectitem_1">COLOR</div>
							</li>
							<li>
								<div class="selectitem_2"><%=price.pro_price%> 원</div>
								<div class="selectitem_2">2,500원 (50,000원 이상 구매 시 배송비 무료)</div>
								<div class="selectitem_2"><span id="pointzone"></span> 원</div>
								<div class="selectitem_2">
									<select class="sizecolorbox" name="pro_size" id="sizeID">
										<option value="none">- [필수] 옵션을 선택해 주세요 -</option>
										<%
										for (int i = 0; i < arrsize.size(); i++) {
											ModelProduct m = arrsize.get(i);
										%>
										<option value="<%=m.pro_size%>"><%=m.pro_size%></option>
										<%
										}
										%>
									</select>
								</div>
								<div class="selectitem_2">
									<select class="sizecolorbox" name="pro_color" id="colorID">

										<option value="none">- [필수] 옵션을 선택해 주세요 -</option>
										<%
										for (int i = 0; i < arrcolor.size(); i++) {
											ModelProduct m = arrcolor.get(i);
										%>
										<option value="<%=m.pro_color%>"><%=m.pro_color%></option>
										<%
										}
										%>
									</select>
								</div>
							</li>
						</ul>
					</div>
					<div class="selecteditem">
						<div class="selecteditem_1">
							<%=mp.pb_title%>
							<br> -SIZE : <span id="sizetext"></span>, -COLOR : <span
								id="colortext"></span>
						</div>
						<div class="selecteditem_2">
							<input type="hidden"
								name="pro_name" value="<%=price.pro_name%>">
								<input type="hidden" name="pro_price" value="<%= price.pro_price %>" id="pro_price"> <input
								type="number" name="quantity" value="1" min="1"
								class="quantitybox" id="quantitybox" onfocus="this.blur()">
						</div>
					</div>
					<div class="totalprice">
						<ul>
							<li><span class="tp_1">Total Price : </span></li>
							<li><span class="tp_2"><span id=quantitytext></span> 원</span>
								(<span id="quantitytext2"></span>개)</li>
						</ul>
					</div>
					<div class="selectbtn">
						<input type="submit" value="ADD TO CART" class="cartbtn" onclick="return checkcart()" formaction="insertcart.prod" formmethod="post">
						<input type="submit" value="BUY IT NOW" class="buybtn" onclick="return checkcart()" formaction="selectoneproduct.prod" formmethod="post">
					</div>
				</form>
			</div>
		</div>
		<div class="iteminfo">
			<img src="imgfile/<%=mp.pb_info1%>"><br>
			<%
			if (mp.pb_info2 != null) {
				%>
			 <img src="imgfile/<%=mp.pb_info2%>"><br>
				<%
			}
			%>
			<%
			if (mp.pb_info3 != null) {
				%>
			 <img src="imgfile/<%=mp.pb_info3%>"><br>
				<%
			}
			%>
			<%
			if (mp.pb_info4 != null) {
				%>
			 <img src="imgfile/<%=mp.pb_info4%>"><br>
				<%
			}
			%>
			<%
			if (mp.pb_info5 != null) {
				%>
			 <img src="imgfile/<%=mp.pb_info5%>">
				<%
			}
			%>
		
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