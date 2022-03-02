<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ page import="com.oreilly.servlet.MultipartRequest" %>
<%@ page import="com.oreilly.servlet.multipart.DefaultFileRenamePolicy" %>
<%@ page import="java.util.*" %>
<!-- file처리할 때 3, 4번째 줄 import해야함. 그리고 lib폴더안에 cos.jar 넣어야함. 파일처리하는데 가장 간단한 라이브러리  -->
<!DOCTYPE html>
<%
	String uploadPath=request.getRealPath("/imgfile"); // getRealPath 안에는 만들어뒀던 저장할 폴더(/폴더명) 적으면 됨.
	
	int size = 10*1024*1024; // 용량이 10메가 정도
	String filename1="";
	String origfilename1="";
	
	try{
		MultipartRequest multi=new MultipartRequest(request,
							uploadPath,
							size, 
							"UTF-8",
				new DefaultFileRenamePolicy()); // 여기서 파일 저장완료
		
		Enumeration files=multi.getFileNames(); // Enumeration 오류나는거 java.util.* import 해주면됨.
		
		String file1 =(String)files.nextElement();
		filename1=multi.getFilesystemName(file1);
		origfilename1= multi.getOriginalFileName(file1);
		// 파일이 두개가 저장되는 이유 : 다른사람이 같은이름의 파일을 올릴 경우 원래파일명과, 파일명1, 2, 3 이렇게 저장함.
		
		
	}catch(Exception e){
		e.printStackTrace();
	}
%>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<form name="filecheck" action="" method="post">
	<input type="hidden" name="filename1" value="<%=filename1%>">
	<input type="hidden" name="origfilename1" value="<%=origfilename1%>">

</form>
<a href="#" onclick="javascript:filecheck.submit()">업로드 확인 및 다운로드 페이지 이동</a>

</body>
</html>