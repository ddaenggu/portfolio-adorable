<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
        <%@ page import="com.oreilly.servlet.MultipartRequest" %>
<%@ page import="com.oreilly.servlet.multipart.DefaultFileRenamePolicy" %>
<%@ page import="java.util.*" %>
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

String id = (String)session.getAttribute("id");

String uploadPath=request.getRealPath("/imgfile"); // getRealPath 안에는 만들어뒀던 저장할 폴더(/폴더명) 적으면 됨.

int size = 10*1024*1024; // 용량이 10메가 정도
String mypet_img="";
String origfilename1="";
String mypet_content="";

try{
	MultipartRequest multi=new MultipartRequest(request,
						uploadPath,
						size, 
						"UTF-8",
			new DefaultFileRenamePolicy()); // 여기서 파일 저장완료
	
	Enumeration files=multi.getFileNames(); // Enumeration 오류나는거 java.util.* import 해주면됨.
	
	mypet_content = multi.getParameter("mypet_content");
	String file1 =(String)files.nextElement();
	mypet_img=multi.getFilesystemName(file1);
	origfilename1= multi.getOriginalFileName(file1);
	// 파일이 두개가 저장되는 이유 : 다른사람이 같은이름의 파일을 올릴 경우 원래파일명과, 파일명1, 2, 3 이렇게 저장함.
	
	
}catch(Exception e){
	e.printStackTrace();
}

mm.setId(id);
mm.setMypet_content(mypet_content);
mm.setMypet_img(mypet_img);

boolean rs = mypet.insertMypet(mm);

if (rs) {
	response.sendRedirect("mypet.jsp");
}
%>


</body>
</html>