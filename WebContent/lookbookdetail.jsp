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

<jsp:useBean id="lb" class="controller.LookbookController"/>
<%
int lb_num = Integer.parseInt(request.getParameter("lb_num"));

ModelLookbook ml = lb.selectDetail(lb_num);
String [] proname = ml.getProname().split(","); // proname 가져온걸 , 로 구분지어서 배열로 만들음

ModelLookbook m = new ModelLookbook();
m.setId(id);
m.setLb_num(lb_num);

boolean rs = lb.selectLike(m); // 좋아요 눌렀는지 안눌렀는지 가져오는 메소드

ArrayList<ModelLookbook> arr = lb.selectReply(lb_num);
%>

	<section>
	<div class="lookbooklogo">
	<a href="lookbook.jsp"><img src="image/lookbooklogo.jpg" width="100%"></a>
	</div>
		<div class="writeshape">
		<form name="lb" action="processlookbookreplyinsert.jsp" method="post">
		<input type="hidden" name="id" value="<%= id %>">
		<input type="hidden" name="lb_num" value="<%= lb_num %>">
		<div class="writetitle2">
		<input type="text" class="writetitle" name="lb_title" value="<%= ml.getLb_title() %>" readonly="readonly">
		</div>
		<div class="writeinfo">
		작성자 : <%= ml.getName() %> &nbsp; <%= ml.getLb_date() %>
		</div>
		<div class="writeimg">
		<img src="imgfile/<%= ml.getLb_img() %>" width="400px" height="400px">
		</div>
		<div class="writecontent2">
		<textarea name="lb_content" class="writecontent" readonly="readonly"><%= ml.getLb_content() %></textarea>
		</div>
		<div class="writeproduct">
		<%
		for (int i = 0; i < proname.length; i++) {
			%>
		<a href="loginlookitems.jsp?pb_title=<%= proname[i] %>">
		# <%= proname[i] %>
		</a>
			<%
		}
		%>
		</div>
		<div class="likezone">
		<div class="iconzone">
		<%
		if (id == null) {
			%>
		<input type="button" name="lb_like" id="likeempty" value="♡"  onclick="return loginok()" class="likebtn">
			<%
		}
		else if (rs) {
			%>
		<input type="button" name="lb_like" id="likefull" value="♥︎"  onclick="return loginok()" class="likebtn">
			<%
		}
		else {
			%>
		<input type="button" name="lb_like" id="likeempty" value="♡"  onclick="return loginok()" class="likebtn">
			<%
		}
		%>
		<span class="likenum"><%= ml.getLb_like() %></span>
		</div>
		</div>
		<div class="replyzone">
		<div class="writereply">
		<input type="text" name="reply_content" class="replytxt">
		<input type="submit" value="댓글쓰기" class="replybtn" onclick="return loginok()">
		</div>
		
		<div class="reply">댓글</div>
		
		<%
		for (int i = 0; i < arr.size(); i++) {
			ModelLookbook re = arr.get(i);
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
		<div class="re_reply"><input type="button" value="답글" class="re_replybtn" onclick="location.href='lookbookre_reply.jsp?lb_num=<%= lb_num %>&reply_content=<%= re.getReply_content() %>&reply_ref=<%= re.getReply_ref() %>&reply_lev=<%= re.getReply_lev() %>&reply_seq=<%= re.getReply_seq() %>'"></div>
		</div>
		<div class="replyinfo">
		<div class="replycontent"><%= re.getReply_content() %></div>
		<%
		if (id != null && id.equals(re.getId())) {
			%>
		<div class="upddel"><input type="button" value="수정" class="re_replybtn" onclick="location.href='lookbookreplyupdate.jsp?lb_num=<%= lb_num %>&reply_content=<%= re.getReply_content() %>&reply_num=<%= re.getReply_num() %>'"> | <input type="button" value="삭제" class="re_replybtn" onclick="location.href='processlookbookreplydelete.jsp?reply_num=<%= re.getReply_num() %>&lb_num=<%= lb_num %>'"></div>
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
		<div class="upddel"><input type="button" value="수정" class="re_replybtn" onclick="location.href='lookbookreplyupdate.jsp?lb_num=<%= lb_num %>&reply_content=<%= re.getReply_content() %>&reply_num=<%= re.getReply_num() %>'"> | <input type="button" value="삭제" class="re_replybtn" onclick="location.href='processlookbookreplydelete.jsp?reply_num=<%= re.getReply_num() %>&lb_num=<%= lb_num %>'"></div>
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
		
		</div>
		<%
		if (id != null && id.equals(ml.getId())) {
			%>
		<div class="writeok">
		<input type="button" value="수정하기" class="writebtn" onclick="location.href='updatelookbook.jsp?lb_num=<%= ml.getLb_num() %>'">
		</div>
			<%
		}
		%>
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