<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8" %>
<%@page import="vo.PageInfo"%>
<%@page import="vo.BoardBean"%>
<%@ page import="java.util.*"%>
<%@ page import="java.text.SimpleDateFormat"%>

<%
	ArrayList<BoardBean> articleList=(ArrayList<BoardBean>)request.getAttribute("articleList");
    PageInfo pageInfo = (PageInfo)request.getAttribute("pageInfo");
	int listCount=pageInfo.getListCount();
	int nowPage=pageInfo.getPage();
	int maxPage=pageInfo.getMaxPage();
	int startPage=pageInfo.getStartPage();
	int endPage=pageInfo.getEndPage();
%>

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
	
<div class="logo">
<a href="boardListSelect.board">
<img src="image/withmypetlogo.png" width="100%">
</a>
</div>
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
			<h2><a href="boardListSelect.board">MYPET DAILY</a></h2>
			</div>
			<div class="boardlist">
				<table class="boardtable">
					<thead>
						<tr>
							<th class="th_board"></th>
							<th class="th_title">??????</th>
							<th class="th_writer">?????????</th>
							<th class="th_date">?????????</th>
							<th class="th_look">??????</th>
						</tr>
					</thead>
					<tbody>
					<%
					for (int i = 0; i < articleList.size(); i++) {
					%>
						<tr>
							<td class="th_board"><%= articleList.get(i).getBoard_num() %></td>
							<td class="th_title"><a href="boardDetailSelect.board?board_num=<%= articleList.get(i).getBoard_num() %>&page=<%= nowPage %>"><%= articleList.get(i).getBoard_title() %></a></td>
							<%-- boardselect.jsp(??????????????? ??? ??????????????? ??? ??????)??? ??????????????? board_num??? ????????????. --%>
							<td class="th_writer"><%= articleList.get(i).getName() %></td>
							<td class="th_date"><%= articleList.get(i).getBoard_date() %></td>
							<td class="th_look"><%= articleList.get(i).getBoard_look() %></td>
						<%
					}
					%>
					</tbody>
				</table>
				<div class="boardbottom">
					<div class="boardpage">
					<%if(nowPage<=1){ %>
		[??????]&nbsp;
		<%}else{ %>
		<a href="boardSelectSearch.board?page=<%=nowPage-1 %>">[??????]</a>&nbsp;
		<%} %>

		<%for(int a=startPage;a<=endPage;a++){
				if(a==nowPage){%>
		[<%=a %>]
		<%}else{ %>
		<a href="boardSelectSearch.board?page=<%=a %>">[<%=a %>]
		</a>&nbsp;
		<%} %>
		<%} %>

		<%if(nowPage>=maxPage){ %>
		[??????]
		<%}else{ %>
		<a href="boardSelectSearch.board?page=<%=nowPage+1 %>">[??????]</a>
		<%} %>
					</div>
					<div class="boardwrite">
						<button class="write" onclick="location.href='boardWriteForm.board'">?????????</button>
					</div>
					<div class="boardmywriting">
						<button class="lookmywriting" onclick="location.href='boardSelectMine.board'">????????????</button>
					</div>
				</div>
				<div class="boardsearch">
				<form action="boardSelectSearch.board" method="post">
				<input type="text" name="search" class="searchbox" placeholder="?????? ??????">
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