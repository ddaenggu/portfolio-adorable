<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8" %>
<%@page import="java.io.*"%>
<%@ page import="java.sql.*" %>
<%
	String id = (String)session.getAttribute("id");


	Connection conn = null;
	Statement stmt = null;

try {
	Class.forName("com.mysql.jdbc.Driver");
	conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/adorable", "root", "0609");
	if (conn == null)
	throw new Exception("데이터베이스에 연결할 수 없습니다.<br>");
	stmt = conn.createStatement();
	ResultSet rs = stmt.executeQuery("select * from customer where id = '" +id+ "';");

	if (rs.next()) {
		String name = rs.getString("name");
		int point = rs.getInt("point");
		String numfront = rs.getString("num_front");
		String nummiddle = rs.getString("num_middle");
		String numback = rs.getString("num_back");
		String address = rs.getString("address");
		String detailaddress = rs.getString("detailaddress");
		request.setAttribute("id",id);
		request.setAttribute("name",name);
		request.setAttribute("point",point);
		request.setAttribute("num_front",numfront);
		request.setAttribute("num_middle",nummiddle);
		request.setAttribute("num_back",numback);
		request.setAttribute("address",address);
		request.setAttribute("detailaddress",detailaddress);
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
RequestDispatcher dispatcher = request.getRequestDispatcher("mypage.jsp");
dispatcher.forward(request, response);
%>
