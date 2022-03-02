<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8" %>
<%@ page import="java.util.*" %>
<%@ page import="model.ModelProduct" %>
<!DOCTYPE html>
<html>
<head>
	<meta charset="utf-8">
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<title>adorable</title>
	<link rel="stylesheet" type="text/css" href="indexheaderfooter.css">
	<link rel="stylesheet" type="text/css" href="wear.css">
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
	
	<section>
		<div class="productbanner1">
				<div class="bp"><a href="selectallwear.prod">WEAR</a></div>
				<div class="bp_1">
				<ul>
					<li class="podetail"><a href="selectouter.prod">아우터</a></li>
					<li> | </li>
					<li class="podetail"><a href="selecttop.prod">탑/티셔츠</a></li>
					<li> | </li>
					<li class="podetail"><a href="selectdress.prod">올인원/원피스</a></li>
					<li> | </li>
					<li class="podetail"><a href="selectacc.prod">악세사리</a></li>
				</ul>
				</div>
				<div class="productinfo">
				<div class="productcount">
				<%
				List<ModelProduct> arr = (List<ModelProduct>)request.getAttribute("LIST");
				%>
				<ul>
					<li class="podetail"><a href="selectallwear.prod">WEAR</a></li>
					<li> > </li>
					<li class="podetail"><a href="selecttop.prod">TOP / T-SHIRT</a></li>
					<li> > </li>
					<li class="podetail">총 <%= arr.size() %> 제품</li>
				</ul>
				</div>
				<div class="productorder">
				<ul>
					<li class="podetail"><a href="selecttop.prod">신상품</a></li>
					<li> | </li>
					<li class="podetail"><a href="selecttoporderbyname.prod">상품명</a></li>
					<li> | </li>
					<li class="podetail"><a href="selecttoporderbypricedesc.prod">높은가격순</a></li>
					<li> | </li>
					<li class="podetail"><a href="selecttoporderbyprice.prod">낮은가격순</a></li>
				</ul>
				</div>
				</div>
				<div class="productlist">
				<ul>
				<%
				for (int i = 0; i < arr.size(); i++) {
					ModelProduct mp = arr.get(i);
					%>
					<li>
						<div class="pb1">
						<a href="loginlookitems.jsp?pb_title=<%= mp.getPb_title() %>">
							<img src="imgfile/<%= mp.getPb_img1() %>" class="pbimg1" width="300px" height="300px">
							<img src="imgfile/<%= mp.getPb_img2() %>" class="pbimg2" width="300px" height="300px">
						</a>
						</div>
						<div class="pb2"><a href="loginlookitems.jsp?pb_title=<%= mp.getPb_title() %>"><%= mp.getPb_title() %></a></div>
						<div class="pb3"><%= mp.getPro_price() %> 원</div>
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