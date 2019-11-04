<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("UTF-8");

	String email = request.getParameter("email");
	String pwd = request.getParameter("password");
	String name = request.getParameter("name");
	int age = Integer.parseInt(request.getParameter("age"));
	String gender = request.getParameter("gender");
	
	//out.print(email + "/"+pwd + "/"+name + "/"+gender + "/"+age);
	
	Class.forName("oracle.jdbc.OracleDriver");
	Connection conn = null;
	PreparedStatement pstmt=null;
	
	try{
		conn = DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:XE","bituser","1004");
		String sql="insert into Team2member(email,pwd,name,age,gender) values(?,?,?,?,?)";
		pstmt = conn.prepareStatement(sql);
		
		pstmt.setString(1, email);
		pstmt.setString(2, pwd);
		pstmt.setString(3, name);
		pstmt.setInt(4, age);
		pstmt.setString(5, gender);
		
		int result = pstmt.executeUpdate();
		if(result !=0){
			out.print("<script>location.href='Main_Login.jsp'</script>");
/* 				out.print("location.href='Main_Login.jsp'");	
			out.print("</script>"); */
		}else{ //실행될 확률 거의없다 ...
			out.print("<script>");
				out.print("alert('가입실패');");	
			out.print("</script>");		
		}
		
	}catch(Exception e){
		// pstmt.executeUpdate(); 실행시  PK 위반 예외 발생    if 타지 않고 ....
		out.print("<script>");
			out.print("alert('가입실패');");	
			out.print("location.href='Main_register.jsp'");	
		out.print("</script>");
	}finally{
		if(pstmt != null){ try{pstmt.close();}catch(Exception e){} }
		if(conn != null){ try{conn.close();}catch(Exception e){} }
	}
%>