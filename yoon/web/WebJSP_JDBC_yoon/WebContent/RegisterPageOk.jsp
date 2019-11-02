<%@page import="kr.or.bit.utils.Singleton_Helper"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("UTF-8");
	
	String id = request.getParameter("id");
	String pwd = request.getParameter("pwd");
	String name = request.getParameter("name");
	int age = Integer.parseInt(request.getParameter("age"));
	String gender = request.getParameter("gender");
	String email = request.getParameter("email");
	String ip = request.getRemoteAddr();
	
	Connection conn = null;
	PreparedStatement pstmt = null;
	ResultSet rs = null;

	try{
		conn = Singleton_Helper.getConnection("oracle");
		String sql = "INSERT INTO KOREAMEMBER(ID, PWD, NAME, AGE, GENDER, EMAIL, IP) VALUES(?,?,?,?,?,?,?)";
		pstmt = conn.prepareStatement(sql);

		pstmt.setString(1, id);
		pstmt.setString(2, pwd);
		pstmt.setString(3, name);
		pstmt.setInt(4, age);
		pstmt.setString(5, gender);
		pstmt.setString(6, email);
		pstmt.setString(7, ip);

		int result = pstmt.executeUpdate();
		if (result != 0) {
			response.sendRedirect("LoginPage.jsp");
		}
	} catch (Exception ex) {
		out.print("<script>");
			out.print("alert('가입 실패');");
			out.print("location.href='RegisterPage.jsp");
		out.print("</script>");
	} finally {
		Singleton_Helper.close(rs);
		Singleton_Helper.close(pstmt);
	}
%>