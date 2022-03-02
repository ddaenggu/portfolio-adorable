<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8" %>
<%@ page import="java.sql.*" %>
<%
request.setCharacterEncoding("utf-8");
String id = request.getParameter("id");
String pw = request.getParameter("pw");
String name = request.getParameter("name");
String num_front = request.getParameter("num_front");
String num_middle = request.getParameter("num_middle");
String num_back = request.getParameter("num_back");
String zipcode = request.getParameter("zipcode");
String address = request.getParameter("address");
String detailaddress = request.getParameter("detailaddress");
String extraaddress = request.getParameter("extraaddress");
String mail_front = request.getParameter("mail_front");
String mail_back = request.getParameter("mail_back");
String gender = request.getParameter("gender");
String petskind = request.getParameter("petskind");

Connection conn = null;
Statement stmt = null;
try {
	Class.forName("com.mysql.jdbc.Driver");
	conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/adorable?characterEncoding=utf-8", "root", "0609");
	if (conn == null)
	throw new Exception("데이터베이스에 연결할 수 없습니다.");
	stmt = conn.createStatement();
	String command = String.format("insert into customer"+"(id,pw,name,num_front,num_middle,num_back,zipcode,address,detailaddress,extraaddress,mail_front,mail_back,gender,petskind,point)values('%s','%s','%s','%s','%s','%s','%s','%s','%s','%s','%s','%s','%s','%s',0);",id,pw,name,num_front,num_middle,num_back,zipcode,address,detailaddress,extraaddress,mail_front,mail_back,gender,petskind);
	int rowNum = stmt.executeUpdate(command);
	if (rowNum < 1)
	throw new Exception("데이터를 DB에 입력할 수 없습니다.");
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
response.sendRedirect("signupcomplete.jsp");
%>