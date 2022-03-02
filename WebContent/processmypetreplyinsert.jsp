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
int mypet_num = Integer.parseInt(request.getParameter("mypet_num"));
String reply_content = request.getParameter("reply_content");

ModelMypet mm = new ModelMypet();

mm.setId(id);
mm.setMypet_num(mypet_num);
mm.setReply_content(reply_content);

boolean rs = mypet.insertReply(mm);
if (rs) {
	response.sendRedirect("mypetreply.jsp?mypet_num="+mypet_num);
}

%>
</body>
</html>