<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ page import="model.Model" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<jsp:useBean id="write" class="controller.Control"/>
<%
Model md = new Model();

request.setCharacterEncoding("utf-8");
String board_title = request.getParameter("board_title");
String board_content = request.getParameter("board_content");
String id = (String)session.getAttribute("id");

md.setBoard_title(board_title);
md.setBoard_content(board_content);
md.setId(id);

boolean rs = write.insertdailyBoard(md);
rs = true;

if(rs) {
	response.sendRedirect("logindailyBoard.jsp");
}
%>

</body>
</html>