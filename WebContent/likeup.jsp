<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8" %>
<%@ page import="java.sql.*" %>
<%
String id = request.getParameter("id");
int lb_num = Integer.parseInt(request.getParameter("lb_num"));

Connection conn = null;
Statement stmt = null;

try {
	Class.forName("com.mysql.jdbc.Driver");
	conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/adorable", "root", "0609");
	if (conn == null)
	throw new Exception("데이터베이스에 연결할 수 없습니다.<br>");
	stmt = conn.createStatement();
	int st = stmt.executeUpdate("update lookbook set lb_like = lb_like + 1 where lb_num = "+lb_num);
	if (st > 0) {
		int ins = stmt.executeUpdate("insert into lookbookLike values(default,'"+id+"',"+lb_num+")");
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
