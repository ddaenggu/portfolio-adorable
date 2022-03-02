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
<jsp:useBean id="update" class="controller.Control" />
<%
Model md = new Model();

request.setCharacterEncoding("utf-8");
String board_title = request.getParameter("board_title");
String board_content = request.getParameter("board_content");
int board_num = Integer.parseInt(request.getParameter("board_num"));

md.setBoard_title(board_title);
md.setBoard_content(board_content);
md.setBoard_num(board_num);

boolean rs = update.updateBoard(md);
rs = true;

if(rs) {
	response.sendRedirect("loginqnaBoard.jsp");
}
%>

</body>
</html>