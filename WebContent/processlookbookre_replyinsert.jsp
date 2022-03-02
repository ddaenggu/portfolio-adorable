<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ page import="model.ModelLookbook" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<jsp:useBean id="lb" class="controller.LookbookController"/>
<%
request.setCharacterEncoding("utf-8");

String id = (String)session.getAttribute("id");
String reply_content = request.getParameter("re_reply_content");
int lb_num = Integer.parseInt(request.getParameter("lb_num"));
int reply_ref = Integer.parseInt(request.getParameter("reply_ref"));
int reply_lev = Integer.parseInt(request.getParameter("reply_lev"));
int reply_seq = Integer.parseInt(request.getParameter("reply_seq"));

int max = lb.selectMaxReply_seq(reply_ref);

ModelLookbook ml = new ModelLookbook();

ml.setId(id);
ml.setReply_content(reply_content);
ml.setLb_num(lb_num);
ml.setReply_ref(reply_ref);
ml.setReply_lev(reply_lev);
ml.setReply_seq(reply_seq);

boolean rs = lb.insertRe_Reply(ml, max);

if (rs) {
	response.sendRedirect("lookbookdetail.jsp?lb_num="+lb_num);
}
%>

</body>
</html>