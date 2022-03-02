<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8" %>
<%@ page import="java.util.*" %>
<%@ page import="model.ModelProduct" %>
<!DOCTYPE html>
<html>
<head>
	<meta charset="utf-8">
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<title>adorable</title>
	<link rel="stylesheet" type="text/css" href="index.css">
	<link rel="stylesheet" type="text/css" href="loginindex.css">
	<link href="https://fonts.googleapis.com/css2?family=Hammersmith+One&family=Playfair+Display:ital@1&family=Staatliches&display=swap" rel="stylesheet">
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/2.2.4/jquery.min.js"></script>
	<script type="text/javascript" src="indexheader.js"></script>
</head>
<body>
<%
String id = (String)session.getAttribute("id");
String kakaoid = (String)session.getAttribute("kakaoid");

if (id == null && kakaoid == null) {
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
	<jsp:useBean id="index" class="controller.IndexController"/>
	<%
	ArrayList<ModelProduct> proname = index.selectBestProname();
	ArrayList<ModelProduct> bestArr = index.selectBestProduct(proname);
	ArrayList<ModelProduct> recommend = index.selectRecommend(id);
	%>
	<section>
		<div class="mainbanner">
			<figure>
				<img src="image/mainbanner1.JPEG">
				<img src="image/mainbanner2.JPEG">
				<img src="image/mainbanner3.JPEG">
				<img src="image/mainbanner4.JPEG">
				<img src="image/mainbanner1.JPEG">
			</figure>
		</div>
			<div class="sec">
			<div class="circlebanner">
				<div class="cbleft">
					<a href="selectallwear.prod">
					<div class="cb1">
						<div class="cbimg">
							<img src="image/wear.PNG">
						</div>
					</div>
					</a>
					<a href="selectalltoy.prod">
					<div class="cb2">
						<div class="cbimg">
							<img src="image/toy.PNG">
						</div>
					</div>
					</a>
				</div>
				<div class="cbright">
					<a href="#">
					<div class="cb3">
						<div class="cbimg">
							<img src="image/items.PNG">
						</div>
					</div>
					</a>
					<a href="event.jsp">
					<div class="cb4">
						<div class="cbimg">
							<img src="image/event.PNG">
						</div>
					</div>
					</a>
				</div>
			</div>
			</div>
			
			<div class="lookbookbanner">
			<a href="lookbook.jsp"><img src="image/lookbooklogo.jpg" width="100%"></a>
			</div>
			<div class="sec">
			<div class="hotelbanner">
				<h2>HOTEL</h2>
				<div class="hb">
					<div class="hbimg">
						<a href="hotel.jsp"><img src="image/hotelbanner1.jpeg" width="640px" height="400px"><img src="image/hotelbanner2.png" width="640px" height="400px"></a>
						<div class="hbmessage">
						<a href="hotel.jsp">HOTEL 구경하러가기</a>
						</div>
					</div>
				</div>
			</div>
			<div class="newsbanner">
				<div class="nb1">
					<a href="#" class="nb1_2 nbtitle">NOTICE & NEWS</a>
					<div class="nb1_1">
						<div class="nbleft">
							<a href="#" class="nb1_2">오늘의 공지사항입니다.</a><br>
							<a href="#" class="nb1_2">오늘의 공지사항입니다.</a><br>
							<a href="#" class="nb1_2">오늘의 공지사항입니다.</a><br>
							<a href="#" class="nb1_2">오늘의 공지사항입니다.</a><br>
							<a href="#" class="nb1_2">오늘의 공지사항입니다.</a><br>
							<a href="#" class="nb1_2">오늘의 공지사항입니다.</a><br>
						</div>
						<div class="nbright">
							<a href="#" class="nb1_2">2021-12-02</a><br>
							<a href="#" class="nb1_2">2021-12-02</a><br>
							<a href="#" class="nb1_2">2021-12-02</a><br>
							<a href="#" class="nb1_2">2021-12-02</a><br>
							<a href="#" class="nb1_2">2021-12-02</a><br>
							<a href="#" class="nb1_2">2021-12-02</a><br>
						</div>
					</div>
				</div>
				<div class="nb1">
					<a href="#" class="nb1_2 nbtitle">COMMUNITY</a>
					<div class="nb1_1">
						<div class="nbleft">
							<a href="#" class="nb1_2">우리집강아지사진 올리고가요~</a><br>
							<a href="#" class="nb1_2">반려동물 동반식당 추천해요</a><br>
							<a href="#" class="nb1_2">강아지놀이터 다녀왔어요!</a><br>
							<a href="#" class="nb1_2">주인님 자는중 zzZ</a><br>
							<a href="#" class="nb1_2">집사님들 캣타워 추천해주세요</a><br>
							<a href="#" class="nb1_2">주인님 사진 올리고갑니다!!</a><br>
						</div>
						<div class="nbright">
							<a href="#" class="nb1_2">2021-12-02</a><br>
							<a href="#" class="nb1_2">2021-12-02</a><br>
							<a href="#" class="nb1_2">2021-12-02</a><br>
							<a href="#" class="nb1_2">2021-12-02</a><br>
							<a href="#" class="nb1_2">2021-12-02</a><br>
							<a href="#" class="nb1_2">2021-12-02</a><br>
						</div>
					</div>
				</div>
				<%
				if (id != null) {
					%>
				<div class="nb2">
					<a href="mypet.jsp" class="nb1_2 nbtitle">MY PET</a>
					<div class="nb2_1">
						<a href="mypet.jsp"><img src="image/lookbook1.JPEG" width="200px" height="180px"><img src="image/lookbook2.JPEG" width="200px" height="180px"></a>
					</div>
				</div>
					<%
				}
				else {
					%>
					<div class="nb2">
					<a href="login.jsp" class="nb1_2 nbtitle">MY PET</a>
					<div class="nb2_1">
						<a href="login.jsp"><img src="image/lookbook1.JPEG" width="200px" height="180px"><img src="image/lookbook2.JPEG" width="200px" height="180px"></a>
					</div>
				</div>
					<%
				}
				%>
			</div>
			<div class="productbanner1">
				<div class="bp">RECOMMEND PRODUCT</div>
				<ul>
				<%
				for (int i = 0; i < recommend.size(); i++) {
					ModelProduct rec = recommend.get(i);
					%>
					<li>
						<div class="pb1">
						<a href="loginlookitems.jsp?pb_title=<%= rec.getPro_name() %>">
							<img src="imgfile/<%= rec.getPb_img1() %>" class="pbimg1" width="300px" height="300px">
							<img src="imgfile/<%= rec.getPb_img2() %>" class="pbimg2" width="300px" height="300px">
						</a>
						</div>
						<div class="pb2"><a href="loginlookitems.jsp?pb_title=<%= rec.getPro_name() %>"><%= rec.getPro_name() %></a></div>
						<div class="pb3"><%= rec.getPro_price() %> 원</div>
					</li>
						<%
				}
				%>
					
				</ul>
			</div>
			<div class="productbanner2">
				<div class="bp">BEST PRODUCT</div>
				<ul>
			<%
				for (int i = 0; i < bestArr.size(); i++) {
					ModelProduct mp = bestArr.get(i);
					%>
				
					<li>
						<div class="pb1">
						<a href="loginlookitems.jsp?pb_title=<%= mp.getPro_name() %>">
							<img src="imgfile/<%= mp.getPb_img1() %>" class="pbimg1" width="300px" height="300px">
							<img src="imgfile/<%= mp.getPb_img2() %>" class="pbimg2" width="300px" height="300px">
						</a>
						</div>
						<div class="pb2"><a href="loginlookitems.jsp?pb_title=<%= mp.getPro_name() %>"><%= mp.getPro_name() %></a></div>
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