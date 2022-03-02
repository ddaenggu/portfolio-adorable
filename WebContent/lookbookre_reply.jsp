<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8" %>
<%@ page import="java.util.*" %>
<%@ page import="model.ModelLookbook" %>

<!DOCTYPE html>
<html>
<head>
	<meta charset="utf-8">
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<title>adorable</title>
	<link rel="stylesheet" type="text/css" href="indexheaderfooter.css">
	<link rel="stylesheet" type="text/css" href="lookbookdetail.css">
	<link href="https://fonts.googleapis.com/css2?family=Gaegu:wght@700&family=Hammersmith+One&family=Playfair+Display:ital@1&family=Staatliches&display=swap" rel="stylesheet">
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/2.2.4/jquery.min.js"></script>
	<script type="text/javascript" src="lookbook.js"></script>
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

<%
int lb_num = Integer.parseInt(request.getParameter("lb_num"));
String reply_content = request.getParameter("reply_content");
int reply_ref = Integer.parseInt(request.getParameter("reply_ref"));
int reply_lev = Integer.parseInt(request.getParameter("reply_lev"));
int reply_seq = Integer.parseInt(request.getParameter("reply_seq"));
%>

	<section>
	<div class="lookbooklogo">
	<a href="lookbook.jsp"><img src="image/lookbooklogo.jpg" width="100%"></a>
	</div>
		<div class="writeshape">
		<form name="lb" action="processlookbookre_replyinsert.jsp" method="post">
		<input type="hidden" name="id" value="<%= id %>">
		<input type="hidden" name="lb_num" value="<%= lb_num %>">
		<input type="hidden" name="reply_ref" value="<%= reply_ref %>">
		<input type="hidden" name="reply_lev" value="<%= reply_lev %>">
		<input type="hidden" name="reply_seq" value="<%= reply_seq %>">
		<div class="updatereplyzone">
		댓글 : <%= reply_content %> <br>
		<input type="text" name="re_reply_content" placeholder="댓글을 입력해주세요" class="replytxt">
		<input type="submit" value="답댓글쓰기" class="replybtn">
		</div>
		</form>
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