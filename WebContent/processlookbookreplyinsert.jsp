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
String id = (String)session.getAttribute("id");
int lb_num = Integer.parseInt(request.getParameter("lb_num"));
String reply_content = request.getParameter("reply_content");

ModelLookbook ml = new ModelLookbook();

ml.setId(id);
ml.setLb_num(lb_num);
ml.setReply_content(reply_content);

boolean rs = lb.insertReply(ml);

if (rs) {
	response.sendRedirect("lookbookdetail.jsp?lb_num="+lb_num);
}

%>
</body>
</html>