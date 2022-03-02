<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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

int reply_num = Integer.parseInt(request.getParameter("reply_num"));
int mypet_num = Integer.parseInt(request.getParameter("mypet_num"));

boolean rs = mypet.deleteReply(reply_num);

if (rs) {
	response.sendRedirect("mypetreply.jsp?mypet_num="+mypet_num);
}
%>

</body>
</html>