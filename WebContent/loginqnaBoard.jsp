<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8" %>
<!DOCTYPE html>
<html>
<head>
	<meta charset="utf-8">
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<title>adorable</title>
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
Model m = new Model();

ArrayList<Model> arr = bd.selectboard(); // 게시판목록에 글들 select해서 나타냄
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
	

	<div class="bodywidth">
	<aside>
		<div class="mypagemenu">
			<ul>
				<a href="loginqnaBoard.jsp"><li class="mypagesubmenu"><div class="mmimg"><img src="image/mypageicon.png" width="30px" height="30px"></div><div class="menutext">Q&A</div></li></a>
				<a href="boardListSelect.board"><li class="mypagesubmenu"><div class="mmimg"><img src="image/dogandcat.png" width="30px" height="30px"></div><div class="menutext">WITH MYPET</div></li></a>
		</ul>
		</div>
	</aside>

	<section>
	<div class="boardshape">
		<div class="detailshape">
			<div class="boardtitle">
			<h2><a href="loginqnaBoard.jsp">Q&A</a></h2>
			</div>
			<div class="boardlist">
				<table class="boardtable">
					<thead>
						<tr>
							<th class="th_board"></th>
							<th class="th_title">제목</th>
							<th class="th_writer">작성자</th>
							<th class="th_date">작성일</th>
							<th class="th_look">답변</th>
						</tr>
					</thead>
					<tbody>
					<%
					for (int i = 0; i < arr.size(); i++) {
					Model md = arr.get(i);
					%>
						<tr>
							<td class="th_board"><%= md.getBoard_num() %></td>
							<%
							if (id == null) {
								%>
							<td class="th_title"><a href="login.jsp"><%= md.getBoard_title() %></a></td>
								<%
							}
							else {
								%>
							<td class="th_title"><a href="qnacheckpw.jsp?board_num=<%= md.getBoard_num() %>"><%= md.getBoard_title() %></a></td>
								<%
							}
							%>
							<%-- boardselect.jsp(게시판에서 글 클릭했을때 글 보기)로 이동하면서 board_num값 가져가기. --%>
							<td class="th_writer"><%= md.getName() %></td>
							<td class="th_date"><%= md.getBoard_date() %></td>
							<td class="th_look"><%= md.getBoard_result() %></td>
						<%
					}
					%>
					</tbody>
				</table>
				<div class="boardbottom">
					<div class="boardpage">
					
					</div>
					<%
					if (id != null) {
						%>
					<div class="boardwrite">
						<button class="write" onclick="location.href='writetoQnA.jsp'">글쓰기</button>
					</div>
					<div class="boardmywriting">
						<button class="lookmywriting" onclick="location.href='lookmycontent.jsp'">내글보기</button>
					</div>
						<%
					}
					%>
				</div>
				<div class="boardsearch">
				<form action="loginSearchqna.jsp" method="post">
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