<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<% 
request.setCharacterEncoding("UTF-8");

String id = request.getParameter("id");
String pwd = request.getParameter("pwd");
String name = request.getParameter("mname");
int age = Integer.parseInt(request.getParameter("age"));
String gender = request.getParameter("gender");
String email = request.getParameter("email");


Class.forName("oracle.jdbc.OracleDriver");
Connection conn = null;
PreparedStatement pstmt = null;

try {
	conn = DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:XE","bituser","1004");
	
	String sql = " insert into koreaMember (id,pwd,name,age,gender,email,ip) values(?,?,?,?,?,?,?)";
	pstmt = conn.prepareStatement(sql);
	
	pstmt.setString(1,id);
	pstmt.setString(2,pwd);
	pstmt.setString(3,name);
	pstmt.setInt(4,age);
	pstmt.setString(5,gender);
	pstmt.setString(6,email);
	pstmt.setString(7,request.getRemoteAddr());

	int result = pstmt.executeUpdate();

	if(result !=0) { //회원가입 완료 
		out.print("<script>");
		out.print("location.href='Login.jsp'");
		out.print("</script>");
	}else { //실행 될 확률 없음
		out.print("<script>");
		out.print("alert('가입실패');");
		out.print("</script>");
	}
}catch(Exception e) {
	//pstmt.executeUpdate(); 실행시 PK 위반 예외 발생  if를 타지 않고 ... 
	out.print("<script>");
	out.print("alert('가입실패');");
	out.print("</script>");
}finally{
	if(pstmt != null) {try{pstmt.close();}catch(Exception e){} }
	if(conn != null) {try{conn.close();}catch(Exception e){} }
}


%>