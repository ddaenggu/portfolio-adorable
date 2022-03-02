<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8" %>
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
	<script type="text/javascript" src="qnaboardselect.js"></script>
</head>
<body>
<%@ page import="model.Model" %>
<jsp:useBean id="read" class="controller.Control"/>
<%
int board_num = Integer.parseInt(request.getParameter("board_num"));
String board_pw = request.getParameter("board_pw");
Model md = new Model();
md = read.readcontent(board_num); // 게시판에서 글 선택해서 가져오기
Model re = read.selectReply(board_num);
md.setBoard_num(board_num);
md.setBoard_pw(board_pw);

boolean rs = read.selectCheckpw(md);
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

<%
if (rs) {
	%>
	<section>
	<div class="boardshape">
		<div class="detailshape">
			<div class="boardtitle">
			<h2><a href="loginqnaBoard.jsp">Q&A</a></h2>
			</div>
			<div class="boardlist">
				<form name="bd" action="qnaboardupdate.jsp" method="post">
					<input type="hidden" name="board_num" value="<%= md.getBoard_num() %>">
					<input type="text" name="board_title" class="contenttitle" value="<%= md.getBoard_title() %>" readonly="readonly"><br>
					<input type="text" name="name" class="contentname" value="<%= md.getName() %>" readonly="readonly">
					<input type="text" name="board_date" class="contentdate" value="<%= md.getBoard_date() %>" readonly="readonly">
					<hr>
					<textarea class="content" name="board_content" readonly="readonly"><%= md.getBoard_content() %></textarea><br>
					<%
					if (re.getBoard_reply() != null) { // reply값이 빈값이 아니면 (=답변완료 된 상태면)
						%>
					<div class="replytitle2">답변</div>
					<textarea class="content2" name="board_reply" readonly="readonly"><%= re.getBoard_reply() %></textarea><br>
						<%
					}
					%>
					<input type="button" value="목록으로 가기" class="listbtn" onclick="location.href='loginqnaBoard.jsp'">
					<%
					if (id.equals(md.getId())) {
					%>
					<input type="submit" value="수정" class="writebtn">
					<input type="button" value="삭제" class="deletebtn" onclick="deletecontent()">
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
		<%
}
else {
	%>
	<script>
	alert("비밀번호가 일치하지 않습니다.");
	history.back();
	</script>
	<%
}
%>
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