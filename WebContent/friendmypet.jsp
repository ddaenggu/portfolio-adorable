<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8" %>
<%@ page import="java.util.*" %>
<!DOCTYPE html>
<html>
<head>
	<meta charset="utf-8">
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<title>adorable</title>
	<link rel="stylesheet" type="text/css" href="indexheaderfooter.css">
	<link rel="stylesheet" type="text/css" href="mypet.css">
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
				<div class="mypetinfo">반려동물의 일상을 기록해보아요</div>
			<%
			String friendid = request.getParameter("friendid");
			ModelMypet mm = new ModelMypet();
			mm.setFriendid(friendid);
			
			ArrayList<ModelMypet> arr = mypet.selectFriendMypet(mm);
			ModelMypet info = mypet.selectInfo(mm);
			if (!arr.isEmpty()) {
				%>
		
			<div class="subshape">
			<div class="subtop">
			<%= info.getId() %> &nbsp; <%= info.getName() %>
			</div>
			<ul>
			<%
			for (int i = 0; i < arr.size(); i++) {
				ModelMypet m = arr.get(i);
				%>
			<li><a href="mypetdetail.jsp?mypet_num=<%= m.getMypet_num() %>"><img src="imgfile/<%= m.getMypet_img() %>" width="150px" height="150px"></a></li>
				<%
			}
			%>
			</ul>
			</div>
					<%
			}
			else {
				%>
				<div class="subshape">
			<div class="subtop">
			<%= info.getId() %>
			</div>
			<div class="nothing">게시물 없음</div>
			</div>
				<%
			}
			%>
			<div class="mypetwrite">
			<form action="mypetSearch.jsp" method="post">
			<div class="writeleft">
			<input type="button" value="나의 MYPET" class="writebtn" onclick="location.href='mypet.jsp'">
			</div>
			<div class="searchright">
			<input type="text" name="search" class="searchbox" placeholder="아이디 검색">
			<input type="image" src="image/searchicon.png" value="submit" class="searchbtn">
			</div>
			</form>
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
		</div>
	</div>
	</section>
	</div>

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