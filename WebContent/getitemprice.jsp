<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ page import="java.sql.*"%>
<%
request.setCharacterEncoding("utf-8");
String pro_name = request.getParameter("pro_name");
Connection conn = null;
Statement stmt = null;

try {
	Class.forName("com.mysql.jdbc.Driver");
	conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/adorable?characterEncoding=utf-8", "root", "0609");
	if (conn == null)
		throw new Exception("데이터베이스에 연결할 수 없습니다.<br>");
	stmt = conn.createStatement();
	/* ResultSet rs = stmt.executeQuery("select distinct pro_price from product where pro_name = '" +pro_name+ "';"); */
	ResultSet rs = stmt.executeQuery("select distinct pro_price from product where pro_name = '" +pro_name+ "' limit 1;");
	if (rs.next()) {
		int pro_price = rs.getInt("pro_price");
		out.print(pro_price);
	}
} finally {
	try {
		stmt.close();
	} catch (Exception ignored) {
	}
	try {
		conn.close();
	} catch (Exception ignored) {

	}
}
%>
