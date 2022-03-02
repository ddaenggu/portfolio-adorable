<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ page import="model.ModelLookbook" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<jsp:useBean id="lb" class="controller.LookbookController"/>
<%
request.setCharacterEncoding("utf-8");
int lb_num = Integer.parseInt(request.getParameter("lb_num"));
int reply_num = Integer.parseInt(request.getParameter("reply_num"));

ModelLookbook ml = new ModelLookbook();
ml.setReply_num(reply_num);

boolean rs = lb.deleteReply(ml);
if (rs) {
	response.sendRedirect("lookbookdetail.jsp?lb_num="+lb_num);
}
%>

</body>
</html>