<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<%@ page import="model.Model" %>
<jsp:useBean id="delete" class="controller.Control"/>
<%
int board_num = Integer.parseInt(request.getParameter("board_num"));
Model md = new Model();
md.setBoard_num(board_num);

boolean rs = delete.deleteBoard(md);
rs = true;

if(rs) {
	response.sendRedirect("loginqnaBoard.jsp");
}
%>


</body>
</html>