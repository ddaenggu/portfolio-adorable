<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8" %>
<%@page import="vo.BoardBean"%>
<%@ page import="java.util.*"%>
<%
	BoardBean article = (BoardBean)request.getAttribute("article");
    String nowPage = (String)request.getAttribute("page");
    ArrayList<BoardBean> articleList=(ArrayList<BoardBean>)request.getAttribute("articleList");
    %>
<!DOCTYPE html>
<html>
<head>
	<meta charset="utf-8">
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<title>adorable</title>
	<link rel="stylesheet" type="text/css" href="indexheaderfooter.css">
	<link rel="stylesheet" type="text/css" href="qnaboardselect.css">
	<link href="https://fonts.googleapis.com/css2?family=Hammersmith+One&family=Playfair+Display:ital@1&family=Staatliches&display=swap" rel="stylesheet">
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/2.2.4/jquery.min.js"></script>
	<script type="text/javascript" src="indexheader.js"></script>
	<script type="text/javascript" src="withmypetselect.js"></script>
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
			<h2><a href="boardListSelect.board">WITH MYPET</a></h2>
			</div>
			<div class="boardlist">
				<form name="bd" action="replyWritePro.board" method="post">
					<input type="hidden" name="page" value="<%= nowPage %>">
					<input type="hidden" name="board_num" value="<%= article.getBoard_num() %>">
					<input type="text" name="board_title" class="contenttitle" value="<%= article.getBoard_title() %>" readonly="readonly"><br>
					<input type="text" name="name" class="contentname" value="<%= article.getName() %>" readonly="readonly">
					<input type="text" name="board_look" class="contentlook" value="조회 <%= article.getBoard_look() %>" readonly="readonly">
					<input type="text" name="board_date" class="contentdate" value="<%= article.getBoard_date() %>" readonly="readonly">
					<hr>
					<div class="content">
					<%
					if (!(article.getBoard_img() == null)) {
						%>
					<img src="imgfile/<%= article.getBoard_img() %>"><br>
						<%
					}
					%>
					<%= article.getBoard_content() %>
					</div><br>
					<div class="replyzone">
					<div class="replytitle">댓글</div>
					<input type="hidden" name="page" value="<%= nowPage %>">
					<%
					for (int i = 0; i < articleList.size(); i++) {
					%>
					<div class="reply">
					<input type="hidden" name="reply_num" value="<%= articleList.get(i).getReply_num() %>">
					<input type="hidden" name="reply_ref" value="<%= articleList.get(i).getReply_ref() %>">
					<input type="hidden" name="reply_lev" value="<%= articleList.get(i).getReply_lev() %>">
					<input type="hidden" name="reply_seq" value="<%= articleList.get(i).getReply_seq() %>">
					<div class="replywriter">
					<%
					if (articleList.get(i).getReply_lev()!=0) {
						for(int a=0;a<=articleList.get(i).getReply_lev()*2;a++){
							%>
							&nbsp; <%} %> ㄴ <%}else{ %>  <%} %> 
					<%= articleList.get(i).getName() %>
					</div>
					<div class="replydate"><%= articleList.get(i).getReply_date() %> | <input type="button" value="댓글달기" class="replybtn2" onclick="location.href='re_replyWriteForm.board?board_num=<%= article.getBoard_num()%>&reply_num=<%= articleList.get(i).getReply_num() %>&page=<%= nowPage %>'"></div><br>
					<div class="replycontent"><%= articleList.get(i).getReply_content() %></div>
					<%
					if (id.equals(articleList.get(i).getId())) {
					%>
					<div class="replyupdate">
					<input type="button" value="수정" class="replybtn2" onclick="location.href='replyUpdateForm.board?board_num=<%= article.getBoard_num() %>&reply_num=<%= articleList.get(i).getReply_num() %>&page=<%= nowPage %>'"> | <input type="button" value="삭제" class="replybtn2" onclick="location.href='replyDeletePro.board?board_num=<%= article.getBoard_num() %>&reply_num=<%= articleList.get(i).getReply_num() %>&page=<%= nowPage %>'">
					</div>
					<%
					}
					%>
					</div>
						<%
					}
					%>
					
					<div class="writereply">
					<input type="text" name="reply_content" class="replybox" maxlength="100">
					<input type="submit" class="replybtn" value="댓글입력">
					</div>
					</div>
					<input type="button" value="목록으로 가기" class="listbtn" onclick="location.href='boardListSelect.board?page=<%=nowPage%>'">
					<%
					if (id.equals(article.getId())) {
					%>
					<input type="button" value="수정" class="writebtn" onclick="location.href='boardUpdateForm.board?board_num=<%= article.getBoard_num() %>&page=<%= nowPage %>'">
					<input type="button" value="삭제" class="deletebtn" onclick="location.href='boardDeletePro.board?board_num=<%= article.getBoard_num() %>&page=<%= nowPage %>'">
					<%-- 세션에 저장된 id의 값과 글쓴사람의 id가 같을 경우에만 수정버튼이 뜸 --%>
					<%
					}
					%>
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