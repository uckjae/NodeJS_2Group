<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<% request.setCharacterEncoding("UTF-8");
String id = request.getParameter("id");
String pwd = request.getParameter("pwd");
String name = request.getParameter("name");
int age = Integer.parseInt(request.getParameter("age"));   //int로 바꿔도 된다 
String gender = request.getParameter("gender");
String email = request.getParameter("email");


	Class.forName("oracle.jdbc.OracleDriver");
	Connection conn = null;
	PreparedStatement pstmt = null;
	try {
		conn = DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:XE","bituser","1004");
		
		String sql = "insert into KOREAMEMBER (id,pwd,name,age,gender,email,ip) values(?,?,?,?,?,?,?)";
		pstmt = conn.prepareStatement(sql);
		pstmt.setString(1, id);
		pstmt.setString(2, pwd);
		pstmt.setString(3, name);
		pstmt.setInt(4, age);
		pstmt.setString(5, gender);
		pstmt.setString(6, email);
		pstmt.setString(7, request.getRemoteAddr());
		
		int result = pstmt.executeUpdate();
		if(result != 0 ){
			out.print("<script>");
				out.print("location.href='login.jsp'");
			out.print("</script>");
		} else {  //실행될 확률은 거의 없다 
			out.print("<script>");
			out.print("alert('가입실패');");
		out.print("</script>");
		}
		
	}catch(Exception e){
		// pstmt.executeUpdate(); 실행 시 pk 위반으로 예외 발생 
		out.print("<script>");
		out.print("alert('가입실패');");
		out.print("location.href='login.jsp'");
		out.print("</script>");
	}finally{
		if(pstmt != null ){ try{} catch(Exception e){}}
		if(conn != null ){ try{} catch(Exception e){}}
	}

%>
   