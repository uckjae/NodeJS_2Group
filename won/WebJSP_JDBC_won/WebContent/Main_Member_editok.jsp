<%@page import="kr.or.bit.utils.Singleton_Helper"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("UTF-8");
	
	if(session.getAttribute("userid") == null || !session.getAttribute("userid").equals("admin@admin.com")){
		out.print("<script>location.href='404.html'</script>");
	}
	
	String id = request.getParameter("email");
	String name = request.getParameter("pwd");
	int age = Integer.parseInt(request.getParameter("name"));
	String email = request.getParameter("age");
	String gender = request.getParameter("gender");
	//out.print(id + " / " + name + " / " + age + " / " + email);
	Connection conn = null;
	PreparedStatement pstmt = null;
	try{
		conn = Singleton_Helper.getConnection("oracle");
		String sql = "update koreamember set name=? , age=? , gender=? where email=?";
		pstmt = conn.prepareStatement(sql);
		pstmt.setString(1, name);
		pstmt.setInt(2, age);
		pstmt.setString(3, gender);
		pstmt.setString(4, id);
		int result = pstmt.executeUpdate();
		
		if(result > 0){
			out.print("<script>");
			out.print("location.href='Main_Member_list.jsp'");
			out.print("</script>");
		}
		
	}catch(Exception e){
		e.printStackTrace();
	}finally{
		Singleton_Helper.close(pstmt);
	
	}
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

</body>
</html>