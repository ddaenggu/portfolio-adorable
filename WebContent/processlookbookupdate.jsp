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
String lb_title = request.getParameter("lb_title");
String lb_content = request.getParameter("lb_content");

ModelLookbook ml = new ModelLookbook();
ml.setLb_num(lb_num);
ml.setLb_title(lb_title);
ml.setLb_content(lb_content);

boolean rs = lb.updateLookbook(ml);
if (rs) {
	response.sendRedirect("lookbookdetail.jsp?lb_num="+lb_num);
}
%>

</body>
</html>