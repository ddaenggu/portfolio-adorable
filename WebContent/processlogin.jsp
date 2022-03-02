<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@page import="java.io.*"%>
<%@ page import="java.sql.*"%>
<%
String id = request.getParameter("id");
String password = request.getParameter("password");

Connection conn = null;
Statement stmt = null;

if (id.equals("admin")) {
	try {
		Class.forName("com.mysql.jdbc.Driver");
		conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/adorable", "root", "0609");
		if (conn == null)
	throw new Exception("데이터베이스에 연결할 수 없습니다.<br>");
		stmt = conn.createStatement();
		ResultSet rs = stmt
		.executeQuery("select admin_id,admin_password,admin_name from admin where admin_id = '" + id + "';");

		if (rs.next()) {
	if (rs.getString("admin_password").equals(password)) {
		String admin_id = rs.getString("admin_id");
		String admin_password = rs.getString("admin_password");
		String admin_name = rs.getString("admin_name");
		session.setAttribute("admin_id", admin_id);
		session.setAttribute("admin_password", admin_password);
		session.setAttribute("admin_name", admin_name);
		response.sendRedirect("adminindex.jsp?admin_name" + admin_name);
	} else
		response.sendRedirect("loginfail.jsp");
		} else {
	response.sendRedirect("loginfail.jsp");
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
}

else {
	if (id == null || password == null)
		throw new Exception("아이디나 비밀번호를 입력해주세요.");

	try {
		Class.forName("com.mysql.jdbc.Driver");
		conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/adorable", "root", "0609");
		if (conn == null)
	throw new Exception("데이터베이스에 연결할 수 없습니다.<br>");
		stmt = conn.createStatement();
		ResultSet rs = stmt.executeQuery("select pw,name from customer where id = '" + id + "';");

		if (rs.next()) {
	if (rs.getString("pw").equals(password)) {
		String name = rs.getString("name");
		session.setAttribute("id", id);
		session.setAttribute("name", name);
		response.sendRedirect("index.jsp");
	} else
		response.sendRedirect("loginfail.jsp");
		} else {
	response.sendRedirect("loginfail.jsp");
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

}
%>
