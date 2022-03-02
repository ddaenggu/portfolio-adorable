<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<%
request.setCharacterEncoding("utf-8");
String kakaoid = request.getParameter("id");
String name = request.getParameter("name");

session.setAttribute("kakaoid", kakaoid);
session.setAttribute("name", name);

response.sendRedirect("index.jsp");
%>
</body>
</html>