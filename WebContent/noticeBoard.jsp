<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8" %>
<%@page import="vo.PageInfo"%>
<%@page import="vo.NoticeDTO"%>
<%@ page import="java.util.*"%>
<%@ page import="java.text.SimpleDateFormat"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="utf-8">
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<title>adorable</title>
	<link rel="stylesheet" type="text/css" href="indexheaderfooter.css">
	<link rel="stylesheet" type="text/css" href="noticeBoard.css">
	<link href="https://fonts.googleapis.com/css2?family=Hammersmith+One&family=Playfair+Display:ital@1&family=Staatliches&display=swap" rel="stylesheet">
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/2.2.4/jquery.min.js"></script>
	<script type="text/javascript" src="indexheader.js"></script>
</head>
<body>

<%
	ArrayList<NoticeDTO> articleList=(ArrayList<NoticeDTO>)request.getAttribute("articleList");
    PageInfo pageInfo = (PageInfo)request.getAttribute("pageInfo");
	int listCount=pageInfo.getListCount();
	int nowPage=pageInfo.getPage();
	int maxPage=pageInfo.getMaxPage();
	int startPage=pageInfo.getStartPage();
	int endPage=pageInfo.getEndPage();
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

	<section>
	<div class="boardshape">
		<div class="detailshape">
			<div class="boardtitle">
			<h2><a href="noticeBoardList.board">공지사항</a></h2>
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
					for (int i = 0; i < articleList.size(); i++) {
					%>
						<tr>
							<td class="th_board"><%= articleList.get(i).getBoard_num() %></td>
							<td class="th_title"><a href="noticeBoardSelect.board?board_num=<%= articleList.get(i).getBoard_num() %>&page=<%= nowPage %>"><%= articleList.get(i).getBoard_title() %></a></td>
							<%-- boardselect.jsp(게시판에서 글 클릭했을때 글 보기)로 이동하면서 board_num값 가져가기. --%>
							<td class="th_writer"><%= articleList.get(i).getAdmin_name() %></td>
							<td class="th_date"><%= articleList.get(i).getBoard_date() %></td>
							<td class="th_look"><%= articleList.get(i).getBoard_look() %></td>
					</tr>
					<%
					}
					%>
					</tbody>
				</table>
				<div class="boardbottom">
					<div class="boardpage">
									<%if(nowPage<=1){ %>
		[이전]&nbsp;
		<%}else{ %>
		<a href="noticeBoardList.board?page=<%=nowPage-1 %>">[이전]</a>&nbsp;
		<%} %>

		<%for(int a=startPage;a<=endPage;a++){
				if(a==nowPage){%>
		[<%=a %>]
		<%}else{ %>
		<a href="noticeBoardList.board?page=<%=a %>">[<%=a %>]
		</a>&nbsp;
		<%} %>
		<%} %>

		<%if(nowPage>=maxPage){ %>
		[다음]
		<%}else{ %>
		<a href="noticeBoardList.board?page=<%=nowPage+1 %>">[다음]</a>
		<%} %>
					</div>
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