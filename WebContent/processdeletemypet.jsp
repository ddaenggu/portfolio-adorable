<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<%@ page import="model.ModelMypet" %>
<jsp:useBean id="mypet" class="controller.MypetController"/>
<%
request.setCharacterEncoding("utf-8");
ModelMypet mm = new ModelMypet();

int mypet_num = Integer.parseInt(request.getParameter("mypet_num"));

mm.setMypet_num(mypet_num);

boolean result = mypet.deleteMypetReply(mm);
boolean rs = mypet.deleteMypet(mm);

if (result) {
	if (rs) {
		response.sendRedirect("mypet.jsp");
	}
}
%>

</body>
</html>