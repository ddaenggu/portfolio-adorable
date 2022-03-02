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
	ArrayList<ModelLookbook> arr = lb.selectList(); // lookbook 게시글 전체 출력
	ArrayList<ModelLookbook> best = lb.selectBest();
	%>
	<section>
	<div class="lookbooklogo">
	<a href="noticeBoardSelect.board?board_num=3&page=1"><img src="image/lookbooklogo.jpg" width="100%"></a>
	<div class="logoinfo">▴ 클릭 시 적립금에 관한 자세한 설명을 보실 수 있습니다 ▴</div>
	</div>
		<div class="lookbookshape">
		<form action="writelookbook.jsp" method="post" name="lb">
		<input type="hidden" name="id" value="<%= id %>">
		<div class="writezone"><input type="submit" value="작성하기" class="writebtn" onclick="return loginok()"></div>
		<div class="besttitle">BEST</div>
		
		<div class="bestzone">
		<ul>
		<%
		for (int i = 0; i < best.size(); i++) {
			ModelLookbook bestml = best.get(i);
			%>
		<li>
		<div class="bestimg">
		<a href="lookbookdetail.jsp?lb_num=<%= bestml.getLb_num() %>">
		<img src="image/besticon.png" width="100px" height="100px" class="besticon">
		<img src="imgfile/<%= bestml.getLb_img() %>" width="400px" height="400px">
		</a>
		</div>
		<div class="bestwriter"><img src="image/catfoot.png" width="30px" height="30px" class="dogfoot"><%= bestml.getName() %>
		<span class="likezone"><img src="image/fullhearts.PNG" width="30px" height="30px" class="dogfoot"><%= bestml.getLb_like() %></span></div>
		</li>
			<%
		}
		%>
		</ul>
		</div>
		
		<div class="lookbookzone">
		<ul>
		<%
		for (int i = 0; i < arr.size(); i++) {
			ModelLookbook ml = arr.get(i);
			%>
		<li>
		<div class="imgzone">
		<a href="lookbookdetail.jsp?lb_num=<%= ml.getLb_num() %>">
		<img src="imgfile/<%= ml.getLb_img() %>" width="300px" height="300px">
		</a>
		</div>
		<div class="writer"><img src="image/dogfoot.png" width="30px" height="30px" class="dogfoot"><%= ml.getName() %>
		<span class="likezone"><img src="image/fullhearts.PNG" width="30px" height="30px" class="dogfoot"><%= ml.getLb_like() %></span></div>
		</li>
			<%
		}
		%>
		</ul>
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