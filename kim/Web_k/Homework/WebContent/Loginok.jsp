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
	
	Connection conn = null;
	PreparedStatement pstmt = null;
	ResultSet rs = null;
	
	conn = Singleton_Helper.getConnection("oracle");
	String sql = "select id , pwd from koreamember where id = ?";
	pstmt = conn.prepareStatement(sql);
	pstmt.setString(1,id);
	rs = pstmt.executeQuery();
	
	while(rs.next()){
		if(pwd.equals(rs.getString("pwd"))){
			session.setAttribute("userid", rs.getString("id"));
			response.sendRedirect("Main.jsp");
		}else{
			out.print("<script>");
			out.print("location.href='Login.jsp'");
			out.print("</script>");
		}
	}
	out.print("<script>");
	out.print("location.href='register.jsp'");
	out.print("</script>");
%>