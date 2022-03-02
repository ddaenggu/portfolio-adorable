<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
        <%@ page import="com.oreilly.servlet.MultipartRequest" %>
<%@ page import="com.oreilly.servlet.multipart.DefaultFileRenamePolicy" %>
<%@ page import="java.util.*" %>
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

String uploadPath=request.getRealPath("/imgfile"); // getRealPath 안에는 만들어뒀던 저장할 폴더(/폴더명) 적으면 됨.

int size = 10*1024*1024; // 용량이 10메가 정도
String lb_img="";
String origfilename1="";
String lb_title = "";
String lb_content = "";
String [] pn_arr = null;

try{
	MultipartRequest multi=new MultipartRequest(request,
						uploadPath,
						size, 
						"UTF-8",
			new DefaultFileRenamePolicy()); // 여기서 파일 저장완료
			lb_title = multi.getParameter("lb_title");
			lb_content = multi.getParameter("lb_content");
			pn_arr = multi.getParameterValues("proname");
		
	Enumeration files=multi.getFileNames(); // Enumeration 오류나는거 java.util.* import 해주면됨.
	
	String file1 =(String)files.nextElement();
	lb_img=multi.getFilesystemName(file1);
	origfilename1= multi.getOriginalFileName(file1);
	// 파일이 두개가 저장되는 이유 : 다른사람이 같은이름의 파일을 올릴 경우 원래파일명과, 파일명1, 2, 3 이렇게 저장함.
	
	
}catch(Exception e){
	e.printStackTrace();
}

String proname = "";

for (int i = 0; i < pn_arr.length; i++) {
	if (i == (pn_arr.length-1)) {
		proname += pn_arr[i];
	}
	else {
		proname += pn_arr[i]+",";
	}
}

ModelLookbook ml = new ModelLookbook();

ml.setId(id);
ml.setLb_title(lb_title);
ml.setLb_content(lb_content);
ml.setLb_img(lb_img);
ml.setProname(proname);

boolean insertrs = lb.insertLookbook(ml);
if (insertrs) {
	boolean updaters = lb.updatePoint(ml);
	if (updaters) {
		response.sendRedirect("lookbook.jsp");
	}
}

%>

</body>
</html>