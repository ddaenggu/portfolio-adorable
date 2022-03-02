<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>adorable</title>
	<link href="https://fonts.googleapis.com/css2?family=Hammersmith+One&family=Playfair+Display:ital@1&family=Staatliches&display=swap" rel="stylesheet">
	<link rel="stylesheet" type="text/css" href="indexheaderfooter.css">
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/2.2.4/jquery.min.js"></script>
	<script type="text/javascript" src="indexheader.js"></script>
</head>
<body>
<header>
		<div class="fixtitle">
			<div class="menu">
				<ul>
					<li class="customerName"><a href="processmypage.jsp">${name}님</a></li>
					<li> | </li>
					<li class="menudetail"><a href="processlogout.jsp">LOGOUT</a></li>
					<li> | </li>
					<li class="menudetail"><a href="selectcart.prod">CART</a></li>
					<li> | </li>
					<li class="menudetail"><a href="processmypage.jsp">MYPAGE</a></li>
				</ul>
			</div>
			<div class="title">
				<div class="adorable"><a href="index.jsp">adorable</a></div>
			</div>
				<div class="list">
					<ul class="mainlist">
						<li><a href="#" class="mlfirst"><img src="image/dogfoot.png" width="50px" height="50px"></a></li>
						<li><a href="#" class="ml6">BEST</a></li>
						<li><a href="selectrecommend.prod" class="ml7">RECOMMEND</a></li>
						<li><a href="selectallwear.prod" class="ml1">WEAR</a>
							<div class="triangle tri1"></div>
							<ul class="sublist sb1">
								<li><a href="selectouter.prod">아우터</a></li>
								<li><a href="selecttop.prod">탑/티셔츠</a></li>
								<li><a href="selectdress.prod">올인원/원피스</a></li>
								<li><a href="selectadd.prod">악세사리</a></li>
							</ul>
						</li>
						<li><a href="selectalltoy.prod" class="ml2">TOY</a>
							<div class="triangle tri2"></div>
							<ul class="sublist sb2">
								<li><a href="#">봉제장난감</a></li>
								<li><a href="#">낚시대</a></li>
								<li><a href="#">스크래쳐</a></li>
							</ul>
						</li>
						<li><a href="#" class="ml3">OTHER ITEMS</a>
							<div class="triangle tri3"></div>
							<ul class="sublist sb3">
								<li><a href="#">간식</a></li>
								<li><a href="#">하우스</a></li>
							</ul>
						</li>
						<li><a href="lookbook.jsp" class="ml8">LOOKBOOK</a></li>
						<li><a href="loginqnaBoard.jsp" class="ml4">COMMUNITY</a>
							<div class="triangle tri4"></div>
							<ul class="sublist sb4">
								<li><a href="loginqnaBoard.jsp">Q&A</a></li>
								<li><a href="boardListSelect.board">반려동물과 함께</a></li>
							</ul>
						</li>
						<li><a href="hotel.jsp" class="ml9">HOTEL</a></li>
						<li><a href="event.jsp" class="ml10">EVENT</a></li>
						<li><a href="noticeBoardList.board" class="ml5">ADORABLE NEWS</a>
							<div class="triangle tri5"></div>
							<ul class="sublist sb5">
								<li><a href="noticeBoardList.board">공지사항</a></li>
							</ul>
						</li>
						<li><a href="#"><img src="image/catfoot.png" width="50px" height="50px"></a></li>
					</ul>
				</div>
		</div>
	</header>

</body>
</html>