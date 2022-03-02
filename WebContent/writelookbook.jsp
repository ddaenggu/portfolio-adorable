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
	<link rel="stylesheet" type="text/css" href="lookbook.css">
	<link href="https://fonts.googleapis.com/css2?family=Hammersmith+One&family=Playfair+Display:ital@1&family=Staatliches&display=swap" rel="stylesheet">
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

<jsp:useBean id="lb" class="controller.LookbookController"/>
<%
ArrayList<ModelLookbook> arr = lb.selectProduct(id);

if (!arr.isEmpty()) {
	%>
	
	<section>
	<div class="lookbooklogo">
	<a href="lookbook.jsp"><img src="image/lookbooklogo.jpg" width="100%"></a>
	</div>
		<div class="writeshape">
		<form name="lb" enctype="multipart/form-data" action="processlookbookinsert.jsp" method="post">
		<div class="writetitle2">
		<input type="text" class="writetitle" placeholder="제목을 입력해주세요" name="lb_title">
		</div>
		<div class="writecontent2">
		<textarea name="lb_content" class="writecontent" placeholder="내용을 입력해주세요"></textarea>
		</div>
		<div class="writefile">
		<input type="file" name="lb_img">
		</div>
		<div class="writeproduct">
		룩북에서 착용한 제품을 선택해주세요 <br><br>
		<%
		for (int i = 0; i < arr.size(); i++) {
			ModelLookbook ml = arr.get(i);
			%>
			<span class="ck">
		<input type="checkbox" name="proname" class="proname" value="<%= ml.getPro_name() %>"> <%= ml.getPro_name() %>
			</span>
			<%
		}
		%>
		</div>
		<div class="writeok">
		<input type="submit" value="작성하기" class="writebtn" onclick="return writeok()">
		</div>
		</form>
		</div>
	</section>
		<%
}
else {
	%>
	<section>
	<div class="lookbooklogo">
	<a href="lookbook.jsp"><img src="image/lookbooklogo.jpg" width="100%"></a>
	</div>
	<div class="writeshape">
	<form action="lookbook.jsp" method="post">
	<div class="noiteminfo">
	주문하신 제품이 없어서 글을 작성하실 수 없습니다.
	</div>
	<div class="writeok">
	<input type="submit" value="게시판으로 이동하기" class="writebtn">
	</div>
	</form>
	</div>
	</section>
	<%
}
%>

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