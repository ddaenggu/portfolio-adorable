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
String friendid = request.getParameter("friendid");
String search = request.getParameter("search");

ModelMypet mm = new ModelMypet();

mm.setRequest_id(friendid);
mm.setGet_id(id);

boolean rs = mypet.insertGetFriend(mm);

if(rs) {
	response.sendRedirect("mypetSearch.jsp?search="+search);
}

%>
</body>
</html>