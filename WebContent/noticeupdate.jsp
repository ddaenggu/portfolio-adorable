<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8" %>
<%@page import="vo.NoticeDTO"%>
<%
	NoticeDTO article = (NoticeDTO)request.getAttribute("article");
	String nowPage = (String)request.getAttribute("page");
    %>
<!DOCTYPE html>
<html>
<head>
	<meta charset="utf-8">
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<title>adorable</title>
	<link rel="stylesheet" type="text/css" href="indexheaderfooter.css">
	<link rel="stylesheet" type="text/css" href="writetonotice.css">
	<link href="https://fonts.googleapis.com/css2?family=Hammersmith+One&family=Playfair+Display:ital@1&family=Staatliches&display=swap" rel="stylesheet">
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/2.2.4/jquery.min.js"></script>
	<script type="text/javascript" src="indexheader.js"></script>
	<script type="text/javascript" src="writetonotice.js"></script>
</head>
<body>
<%@ page import="vo.BoardBean" %>
	<header>
		<div class="fixtitle">
			<div class="menu">
				<ul>
					<li class="customerName"><a href="processmypage.jsp">${name}님</a></li>
					<li> | </li>
					<li class="menudetail"><a href="processlogout.jsp">LOGOUT</a></li>
					<li> | </li>
					<li class="menudetail"><a href="#">CART</a></li>
					<li> | </li>
					<li class="menudetail"><a href="processmypage.jsp">MYPAGE</a></li>
				</ul>
			</div>
			<div class="title">
				<div class="adorable"><a href="loginindex.jsp">adorable</a></div>
			</div>
				<div class="list">
					<ul class="mainlist">
						<li><a href="#" class="mlfirst"><img src="image/dogfoot.png" width="50px" height="50px"></a></li>
						<li><a href="#" class="ml6">BEST</a></li>
						<li><a href="#" class="ml7">RECOMMEND</a></li>
						<li><a href="#" class="ml1">WEAR</a>
							<div class="triangle tri1"></div>
							<ul class="sublist sb1">
								<li><a href="#">아우터</a></li>
								<li><a href="#">탑/티셔츠</a></li>
								<li><a href="#">올인원/원피스</a></li>
								<li><a href="#">악세사리</a></li>
							</ul>
						</li>
						<li><a href="#" class="ml2">TOY</a>
							<div class="triangle tri2"></div>
							<ul class="sublist sb2">
								<li><a href="#">봉제장난감</a></li>
								<li><a href="#">터그놀이</a></li>
								<li><a href="#">낚시대</a></li>
								<li><a href="#">스크래쳐</a></li>
							</ul>
						</li>
						<li><a href="#" class="ml3">OTHER ITEMS</a>
							<div class="triangle tri3"></div>
							<ul class="sublist sb3">
								<li><a href="#">간식</a></li>
								<li><a href="#">배변패드/모래</a></li>
								<li><a href="#">산책</a></li>
								<li><a href="#">하우스</a></li>
							</ul>
						</li>
						<li><a href="#" class="ml8">LOOKBOOK</a></li>
						<li><a href="#" class="ml9">EVENT</a></li>
						<li><a href="#" class="ml10">HOTEL</a></li>
						<li><a href="loginqnaBoard.jsp" class="ml4">COMMUNITY</a>
							<div class="triangle tri4"></div>
							<ul class="sublist sb4">
								<li><a href="loginqnaBoard.jsp">Q&A</a></li>
								<li><a href="boardListSelect.board">반려동물 일기</a></li>
							</ul>
						</li>
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

	<section>
	<div class="boardshape">
		<div class="detailshape">
			<div class="boardtitle">
			<h2><a href="noticeBoardList.board">공지사항</a></h2>
			</div>
			<div class="boardlist">
				<form name="bd" action="noticeBoardUpdatePro.board?page=<%= nowPage %>" method="post">
					<input type="hidden" name="board_num" value="<%= article.getBoard_num() %>">
					<input type="text" name="board_title" placeholder="제목을 입력하세요" class="contenttitle" value="<%= article.getBoard_title() %>"><hr>
					<textarea class="content" name="board_content"><%= article.getBoard_content() %></textarea><br>
					<input type="button" value="취소" class="cancelbtn" onclick="return cancel()">
					<input type="submit" value="수정" class="writebtn" onclick="return writeOK()">
				</form>
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