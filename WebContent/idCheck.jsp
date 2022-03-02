<link rel="stylesheet" type="text/css" href="idCheck.css">
<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8" %>
<%@ page import="java.sql.*" %>
<%
String id = request.getParameter("id");

Connection conn = null;
Statement stmt = null;

try {
	Class.forName("com.mysql.jdbc.Driver");
	conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/adorable", "root", "0609");
	if (conn == null)
	throw new Exception("데이터베이스에 연결할 수 없습니다.<br>");
	stmt = conn.createStatement();
	ResultSet rs = stmt.executeQuery("select * from customer where id = '" +id+ "';");
	if (rs.next()) { %>
		<span class="notuse">이미 사용중인 아이디입니다.</span>
		<%
	}
	else if (id.length() < 4) { %>
		<span class="notuse">아이디는 4~16자만 사용가능합니다.</span>
	<%
	}
	else if (id.equals("admin")) { %>
		<span class="notuse">사용할 수 없는 아이디입니다.</span>
	<%	
	}
	else { %>
		<span class="useok">사용 가능한 아이디 입니다.</span>
		<%
	}
}
finally {
	try {
		stmt.close();
	}
	catch (Exception ignored) {
	}
	try {
		conn.close();
	}
	catch (Exception ignored) {

	}
}
%>
