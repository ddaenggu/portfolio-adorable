<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8" %>
<%@ page import="model.ModelMypet" %>
<%@ page import="java.util.*" %>
<!DOCTYPE html>
<html>
<head>
	<meta charset="utf-8">
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<title>adorable</title>
	<link rel="stylesheet" type="text/css" href="indexheaderfooter.css">
	<link rel="stylesheet" type="text/css" href="mypetreply.css">
	<link href="https://fonts.googleapis.com/css2?family=Gaegu:wght@700&family=Hammersmith+One&family=Playfair+Display:ital@1&family=Staatliches&display=swap" rel="stylesheet">
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/2.2.4/jquery.min.js"></script>
	<script type="text/javascript" src="indexheader.js"></script>
	<script type="text/javascript" src="mypetwrite.js"></script>
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

	<div class="bodywidth">
	<aside>
		<div class="mypagemenu">
			<ul>
				<a href="processmypage.jsp"><li class="mypagesubmenu"><div class="mmimg"><img src="image/mypageicon.png" width="30px" height="30px"></div><div class="menutext">MYPAGE</div></li></a>
				<a href="mypet.jsp"><li class="mypagesubmenu"><div class="mmimg"><img src="image/mypeticon.png" width="30px" height="30px"></div><div class="menutext">MYPET</div></li></a>
				<a href="selectcart.prod"><li class="mypagesubmenu"><div class="mmimg"><img src="image/carticon.png" width="30px" height="30px"></div><div class="menutext">CART</div></li></a>
				<a href="selectmyorder.prod"><li class="mypagesubmenu"><div class="mmimg"><img src="image/ordericon.png" width="30px" height="30px"></div><div class="menutext">ORDER</div></li></a>
				<a href="myreservation.jsp"><li class="mypagesubmenu"><div class="mmimg"><img src="image/hotelicon.png" width="30px" height="30px"></div><div class="menutext">RESERVATION</div></li></a>
		</ul>
		</div>
	</aside>
	
	<jsp:useBean id="mypet" class="controller.MypetController"/>
	<%
	int mypet_num = Integer.parseInt(request.getParameter("mypet_num"));
	ModelMypet mm = new ModelMypet();
	mm.setMypet_num(mypet_num);
	
	ModelMypet m = mypet.selectContent(mm);
	ArrayList<ModelMypet> arr = mypet.selectReply(mypet_num);
	%>
	<section>
	<div class="mypage">
		<div class="mypageshape">
			<form name="mp">
			<input type="hidden" name="mypet_num" value="<%= m.getMypet_num() %>">
			<div class="mypetinfo">반려동물의 일상을 기록해보아요</div>
			<div class="mypetwrite">
			
				<div class="mypettop">
				<div class="mypetbtn2">
			<a href="mypetdetail.jsp?mypet_num=<%= m.getMypet_num() %>">< 게시글 보기</a>
				</div>
				</div>
		
			
			<div class="mypetid"><%= m.getId() %>
			<span class="mypetcontent">
			<%= m.getMypet_content() %>
			</span>
			</div>
			<div class="mypetdate"><%= m.getMypet_date() %></div>
			
			<div class="replyzone">
			
			<%
		for (int i = 0; i < arr.size(); i++) {
			ModelMypet re = arr.get(i);
			if (re.getReply_lev() == 0) {
				%>
				<input type="hidden" name="reply_ref" value="<%= re.getReply_ref() %>">
		<input type="hidden" name="reply_lev" value="<%= re.getReply_lev() %>">
		<input type="hidden" name="reply_seq" value="<%= re.getReply_seq() %>">
		<input type="hidden" name="reply_num" value="<%= re.getReply_num() %>">
			<div class="replyshape" id="box">
		<ul>
		<li>
		<div class="replyimg">
		<img src="image/IMG_5288.JPG" width="50px" height="50px" class="replyimg2">
		</div>
		</li>
		<li>
		<div class="replyinfo">
		<div class="writerdate">
		<span class="replywriter"><%= re.getName() %></span>
		<span class="replydate"><%= re.getReply_date() %></span>
		</div>
		<div class="re_reply"><input type="button" value="답글" class="re_replybtn" onclick="location.href='mypetre_reply.jsp?mypet_num=<%= m.getMypet_num() %>&reply_content=<%= re.getReply_content() %>&name=<%= re.getName() %>&reply_ref=<%= re.getReply_ref() %>&reply_lev=<%= re.getReply_lev() %>&reply_seq=<%= re.getReply_seq() %>'"></div>
		</div>
		<div class="replyinfo">
		<div class="replycontent"><%= re.getReply_content() %></div>
		<%
		if (id != null && id.equals(re.getId())) {
			%>
		<div class="upddel"><input type="button" value="삭제" class="re_replybtn" onclick="location.href='processmypetreplydelete.jsp?reply_num=<%= re.getReply_num() %>&mypet_num=<%= m.getMypet_num() %>'"></div>
			<%
		}
		%>
		</div>
		</li>
		</ul>
		</div>
		<%
			}
			else {
				%>
				<input type="hidden" name="reply_ref" value="<%= re.getReply_ref() %>">
		<input type="hidden" name="reply_lev" value="<%= re.getReply_lev() %>">
		<input type="hidden" name="reply_seq" value="<%= re.getReply_seq() %>">
		<input type="hidden" name="reply_num" value="<%= re.getReply_num() %>">
		<div class="replyshape" id="box">
		<ul>
		<li>
		<div class="re_replyimg">
		<img src="image/IMG_5288.JPG" width="50px" height="50px" class="replyimg2">
		</div>
		</li>
		<li>
		<div class="replyinfo2">
		<div class="writerdate">
		<span class="replywriter"><%= re.getName() %></span>
		<span class="replydate"><%= re.getReply_date() %></span>
		</div>
		</div>
		<div class="replyinfo2">
		<div class="re_replycontent"><%= re.getReply_content() %></div>
		<%
		if (id != null && id.equals(re.getId())) {
			%>
		<div class="upddel"><input type="button" value="삭제" class="re_replybtn" onclick="location.href='processmypetreplydelete.jsp?reply_num=<%= re.getReply_num() %>&mypet_num=<%= m.getMypet_num() %>'"></div>
			<%
		}
		%>
		</div>
		</li>
		</ul>
		</div>
					<%
			}
		}
		%>
			<div class="writereply">
			<input type="text" name="reply_content" class="replytxt">
			<input type="submit" value="댓글쓰기" class="replybtn" formaction="processmypetreplyinsert.jsp" formmethod="post">
			</div>
			
			</div>
			
			</div>
			
			</form>
			<br>
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