<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8" %>
<%@ page import="java.util.*" %>
<!DOCTYPE html>
<html>
<head>
	<meta charset="utf-8">
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<title>adorable</title>
	<link rel="stylesheet" type="text/css" href="indexheaderfooter.css">
	<link rel="stylesheet" type="text/css" href="mypetSearch.css">
	<link href="https://fonts.googleapis.com/css2?family=Gaegu:wght@700&family=Hammersmith+One&family=Playfair+Display:ital@1&family=Staatliches&display=swap" rel="stylesheet">
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

	<div class="bodywidth">
	<aside>
		<div class="mypagemenu">
			<ul>
				<a href="processmypage.jsp"><li class="mypagesubmenu"><div class="mmimg"><img src="image/mypageicon.png" width="30px" height="30px"></div><div class="menutext">MYPAGE</div></li></a>
				<a href="mypet.jsp"><li class="mypagesubmenu"><div class="mmimg"><img src="image/mypeticon.png" width="30px" height="30px"></div><div class="menutext">MYPET</div></li></a>
				<a href="selectcart.prod"><li class="mypagesubmenu"><div class="mmimg"><img src="image/carticon.png" width="30px" height="30px"></div><div class="menutext">CART</div></li></a>
				<a href="selectmyorder.prod"><li class="mypagesubmenu"><div class="mmimg"><img src="image/ordericon.png" width="30px" height="30px"></div><div class="menutext">ORDER</div></li></a>
				<a href="myreservation.jsp"><li class="mypagesubmenu"><div class="mmimg"><img src="image/hotelicon.png" width="30px" height="30px"></div><div class="menutext">RESERVATION</div></li></a>
		</ul>
		</div>
	</aside>

<%@ page import="model.ModelMypet" %>
<jsp:useBean id="mypet" class="controller.MypetController"/>
	<section>
	<div class="mypage">
		<div class="mypageshape">
			<form action="mypetSearch.jsp" method="post" name="mp">
				<div class="mypetinfo">??????????????? ????????? ??????????????????</div>
			<%
			
			ArrayList<ModelMypet> arr = mypet.selectRequest(id);
			
			if (!arr.isEmpty()) {
				%>
		
			<div class="subshape">
			<div class="subtop">
			?????? ?????? (<%= arr.size() %> ???)
			</div>
			<div class="searchlist">
			<ul>
			<%
			for (int i = 0; i < arr.size(); i++) {
				ModelMypet m = arr.get(i);
				%>
			<li>
			<div class="idzone">
			<img src="image/IMG_5288.JPG" width="50px" height="50px" class="custimg">
			<span class="custid"><%= m.getId() %></span>
			<span class="custname"><%= m.getName() %></span>
			</div>
			<div class="addzone">
			
			<input type="button" value="????????????" class="getbtn" onclick="location.href='processgetfriend2.jsp?friendid=<%= m.getId() %>'">
		
			</div>
			</li>
				<%
			}
			%>
			</ul>
			</div>
			</div>
					<%
			}
			else {
				%>
				<div class="subshape">
			<div class="subtop">
			?????? ??????
			</div>
			<div class="nothing">??????????????? ??????</div>
			</div>
				<%
			}
			%>
			<div class="mypetwrite">
			<div class="writeleft">
			<input type="button" value="?????? mypet" class="writebtn" onclick="location.href='mypet.jsp'">
			</div>
			</div>
			<br>
			<div class="joinimage">
				<img src="image/dogfood.png" width="60px" height="60px">
				<img src="image/catfoot.png" width="60px" height="60px">
				<img src="image/dogborn.png" width="60px" height="60px">
				<img src="image/dogtoy.png" width="60px" height="60px">
				<img src="image/dogfoot.png" width="60px" height="60px">
				<img src="image/catcan.png" width="60px" height="60px">
			</div>
			</form>
		</div>
	</div>
	</section>
	</div>

	<footer>
		<div class="foottitle">
			<div class="ftleft">
				<div class="ft1">COMPANY ???adorable
					<div class="ft1_1">
						?????????. ????????? <br>
						tel. 010-7430-6757 <br>
						business no. 123-45-6789 <br>
						mail. bhm01@naver.com <br>
						address. ??????????????? ????????? ?????????
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
						?????? 123-1234-5678-90 <br>
						???????????? 123-4567-890 <br><br>
						????????? : ???????????????
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