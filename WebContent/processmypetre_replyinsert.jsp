<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ page import="model.ModelMypet" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<jsp:useBean id="mypet" class="controller.MypetController"/>
<%
request.setCharacterEncoding("utf-8");

String id = (String)session.getAttribute("id");
String reply_content = request.getParameter("reply_content");
int mypet_num = Integer.parseInt(request.getParameter("mypet_num"));
int reply_ref = Integer.parseInt(request.getParameter("reply_ref"));
int reply_lev = Integer.parseInt(request.getParameter("reply_lev"));
int reply_seq = Integer.parseInt(request.getParameter("reply_seq"));

int max = mypet.selectMaxReply_seq(reply_ref);

ModelMypet mm = new ModelMypet();

mm.setId(id);
mm.setReply_content(reply_content);
mm.setMypet_num(mypet_num);
mm.setReply_ref(reply_ref);
mm.setReply_lev(reply_lev);
mm.setReply_seq(reply_seq);

boolean rs = mypet.insertRe_Reply(mm, max);

if (rs) {
	response.sendRedirect("mypetreply.jsp?mypet_num="+mypet_num);
}
%>

</body>
</html>