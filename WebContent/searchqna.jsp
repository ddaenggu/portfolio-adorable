<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8" %>
<!DOCTYPE html>
<html>
<head>
	<meta charset="utf-8">
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<title>게시판</title>
	<link rel="stylesheet" type="text/css" href="indexheaderfooter.css">
	<link rel="stylesheet" type="text/css" href="qnaBoard.css">
	<link href="https://fonts.googleapis.com/css2?family=Hammersmith+One&family=Playfair+Display:ital@1&family=Staatliches&display=swap" rel="stylesheet">
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/2.2.4/jquery.min.js"></script>
	<script type="text/javascript" src="indexheader.js"></script>
</head>
<body>
<%@ page import="model.Model" %>
<%@ page import="java.util.*" %>
<jsp:useBean id="bd" class="controller.Control"/>
<%
String search = request.getParameter("search");
Model m = new Model();
int count = bd.selectCnt(); // 총 글 갯수
String tempStart = request.getParameter("page"); // 현재 페이지를 받아옴
int countPage = 5; // 한 화면에 표시될 페이지 수
int startPage = 0; // 시작페이지
int endPage = startPage + countPage - 1;
int onePageCnt = 20; //  한 페이지당 글 수
int totalPage = (int)count / onePageCnt ; // 총 페이지의 수 = 글수/한페이지(당 글 수)
if (count % onePageCnt > 0) { // 한 페이지당 20개의 글을 보관하는데 남은 글이 생길경우 페이지 하나 더 추가
	totalPage++;
}
if (endPage > totalPage) { // 마지막페이지가 총 페이지의 수보다 많을 시 총 페이지수를 마지막페이지로 설정
	endPage = totalPage;
}
if (tempStart != null) {
	startPage = (Integer.parseInt(tempStart)-1)*onePageCnt;
}

ArrayList<Model> arr = bd.searchqnaBorad(search,startPage,onePageCnt);
%>
	<header>
		<div class="fixtitle">
			<div class="menu">
				<ul>
					<li class="menudetail"><a href="login.html">LOGIN</a></li>
					<li> | </li>
					<li class="menudetail"><a href="signup.html">JOINUS</a></li>
					<li> | </li>
					<li class="menudetail"><a href="login.html">CART</a></li>
					<li> | </li>
					<li class="menudetail"><a href="login.html">MYPAGE</a></li>
				</ul>
			</div>
			<div class="title">
				<div class="adorable"><a href="index.html">adorable</a></div>
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
						<li><a href="qnaBoard.jsp" class="ml4">COMMUNITY</a>
							<div class="triangle tri4"></div>
							<ul class="sublist sb4">
								<li><a href="qnaBoard.jsp">Q&A</a></li>
								<li><a href="#">반려동물과 함께</a></li>
							</ul>
						</li>
						<li><a href="#" class="ml5">ADORABLE NEWS</a>
							<div class="triangle tri5"></div>
							<ul class="sublist sb5">
								<li><a href="#">공지사항</a></li>
							</ul>
						</li>
						<li><a href="#"><img src="image/catfoot.png" width="50px" height="50px"></a></li>
					</ul>
				</div>
		</div>
	</header>

	<div class="bodywidth">
	<aside>
		<div class="mypagemenu">
			<ul>
				<a href="qnaBoard.jsp"><li class="mypagesubmenu"><div class="mmimg"><img src="image/mypageicon.png" width="30px" height="30px"></div><div class="menutext">Q&A</div></li></a>
				<a href="#"><li class="mypagesubmenu"><div class="mmimg"><img src="image/dogandcat.png" width="30px" height="30px"></div><div class="menutext">WITH MYPET</div></li></a>
		</ul>
		</div>
	</aside>

	<section>
	<div class="boardshape">
		<div class="detailshape">
			<div class="boardtitle">
			<h2><a href="qnaBoard.jsp">Q&A</a></h2>
			</div>
			<div class="boardlist">
				<table class="boardtable">
					<thead>
						<tr>
							<th class="th_board"></th>
							<th class="th_title">제목</th>
							<th class="th_writer">작성자</th>
							<th class="th_date">작성일</th>
							<th class="th_look">조회</th>
						</tr>
					</thead>
					<tbody>
					<%
					for (int i = 0; i < arr.size(); i++) {
					Model md = arr.get(i);
					%>
						<tr>
							<td class="th_board"><%= md.getBoard_num() %></td>
							<td class="th_title"><a href="login.html"><%= md.getBoard_title() %></a></td>
							<%-- boardselect.jsp(게시판에서 글 클릭했을때 글 보기)로 이동하면서 board_num값 가져가기. --%>
							<td class="th_writer"><%= md.getName() %></td>
							<td class="th_date"><%= md.getBoard_date() %></td>
							<td class="th_look"><%= md.getBoard_look() %></td>
						<%
					}
					%>
					</tbody>
				</table>
				<div class="boardbottom">
					<div class="boardpage">
					<ul>
					<%
					for (int i = 1; i <= totalPage; i++) { %>
					<li>
					<a href="qnaBoard.jsp?page=<%= i %>"><%= i %></a>
					</li>
						<%
					}
					%>
					</ul>
					</div>
					<div class="boardwrite">
						<button class="write" onclick="location.href='login.html'">글쓰기</button>
					</div>
				</div>
				<div class="boardsearch">
				<form action="searchqna.jsp" method="post">
				<input type="text" name="search" class="searchbox" placeholder="제목 검색">
				<input type="image" src="image/searchicon.png" value="submit" name="submit" class="searchbtn">
				</form>
				</div>
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