<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ page import="model.ModelMypet"%>
<%@ page import="java.util.*"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>adorable</title>
<link rel="stylesheet" type="text/css" href="indexheaderfooter.css">
<link rel="stylesheet" type="text/css" href="mypetreply.css">
<link
	href="https://fonts.googleapis.com/css2?family=Gaegu:wght@700&family=Hammersmith+One&family=Playfair+Display:ital@1&family=Staatliches&display=swap"
	rel="stylesheet">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/2.2.4/jquery.min.js"></script>
<script type="text/javascript" src="indexheader.js"></script>
<script type="text/javascript" src="mypetwrite.js"></script>
</head>
<body>
	<%
	String id = (String) session.getAttribute("id");

	if (id == null) {
	%>
	<jsp:include page="indexheader.jsp" />
	<%
	} else {
	%>
	<jsp:include page="loginindexheader.jsp" />
	<%
}
%>

	<div class="bodywidth">
		<aside>
			<div class="mypagemenu">
				<ul>
					<a href="processmypage.jsp"><li class="mypagesubmenu"><div
								class="mmimg">
								<img src="image/mypageicon.png" width="30px" height="30px">
							</div>
							<div class="menutext">MYPAGE</div></li></a>
					<a href="mypet.jsp"><li class="mypagesubmenu"><div
								class="mmimg">
								<img src="image/mypeticon.png" width="30px" height="30px">
							</div>
							<div class="menutext">MYPET</div></li></a>
					<a href="selectcart.prod"><li class="mypagesubmenu"><div
								class="mmimg">
								<img src="image/carticon.png" width="30px" height="30px">
							</div>
							<div class="menutext">CART</div></li></a>
					<a href="selectmyorder.prod"><li class="mypagesubmenu"><div
								class="mmimg">
								<img src="image/ordericon.png" width="30px" height="30px">
							</div>
							<div class="menutext">ORDER</div></li></a>
					<a href="myreservation.jsp"><li class="mypagesubmenu"><div
								class="mmimg">
								<img src="image/hotelicon.png" width="30px" height="30px">
							</div>
							<div class="menutext">RESERVATION</div></li></a>
				</ul>
			</div>
		</aside>

		<jsp:useBean id="mypet" class="controller.MypetController" />
		<%
		int mypet_num = Integer.parseInt(request.getParameter("mypet_num"));
		String reply_content = request.getParameter("reply_content");
		String name = request.getParameter("name");
		int reply_ref = Integer.parseInt(request.getParameter("reply_ref"));
		int reply_lev = Integer.parseInt(request.getParameter("reply_lev"));
		int reply_seq = Integer.parseInt(request.getParameter("reply_seq"));
		%>
		<section>
			<div class="mypage">
				<div class="mypageshape">
					<form name="mp" action="processmypetre_replyinsert.jsp"
						method="post">
						<input type="hidden" name="mypet_num" value="<%=mypet_num%>">
						<input type="hidden" name="reply_ref" value="<%=reply_ref%>">
						<input type="hidden" name="reply_lev" value="<%=reply_lev%>">
						<input type="hidden" name="reply_seq" value="<%=reply_seq%>">
						<div class="mypetinfo">??????????????? ????????? ??????????????????</div>
						<div class="mypetwrite">
							<div class="mypettop">
								<div class="mypetbtn2">
									<a href="mypetreply.jsp?mypet_num=<%= mypet_num %>">
									< ?????? ??????</a>
								</div>
							</div>

							<div class="mypetreplycontent"><%=name%>&nbsp;&nbsp;<%=reply_content%></div>

							<div class="replyzone">

								<div class="writereply">
									<input type="text" name="reply_content" class="replytxt">
									<input type="submit" value="????????????" class="replybtn">
								</div>

							</div>

						</div>

					</form>
					<br>
					<div class="joinimage">
						<img src="image/dogfood.png" width="60px" height="60px"> <img
							src="image/catfoot.png" width="60px" height="60px"> <img
							src="image/dogborn.png" width="60px" height="60px"> <img
							src="image/dogtoy.png" width="60px" height="60px"> <img
							src="image/dogfoot.png" width="60px" height="60px"> <img
							src="image/catcan.png" width="60px" height="60px">
					</div>
				</div>
			</div>
		</section>
	</div>

	<footer>
		<div class="foottitle">
			<div class="ftleft">
				<div class="ft1">
					COMPANY ???adorable
					<div class="ft1_1">
						?????????. ????????? <br> tel. 010-7430-6757 <br> business no.
						123-45-6789 <br> mail. bhm01@naver.com <br> address.
						??????????????? ????????? ?????????
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
						?????? 123-1234-5678-90 <br> ???????????? 123-4567-890 <br> <br>
						????????? : ???????????????
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