<%@page import="kr.or.bit.utils.Singleton_Helper"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("UTF-8");

	String email = request.getParameter("email");
	String pwd = request.getParameter("pwd");
	
	Connection conn = null;
	PreparedStatement pstmt = null;
	ResultSet rs = null;
	
	try{
		conn=Singleton_Helper.getConnection("oracle");
		String sql="select email, pwd from Team2member where email=?";
		pstmt = conn.prepareStatement(sql);
		pstmt.setString(1,email);
		rs = pstmt.executeQuery(); 
		while(rs.next()){
			out.print("while");
			if(pwd.equals(rs.getString("pwd"))){
				session.setAttribute("userid", rs.getString("email"));
				response.sendRedirect("Main.jsp");
			}else{
				// ID(O), PWD(X)
				out.print("<script>");
				out.print("location.href='Main_Login.jsp'");
				out.print("</script>");
			}
		}
	}catch(Exception e){
		System.out.println(e.getMessage());
	}finally{
		Singleton_Helper.close(rs);
		Singleton_Helper.close(pstmt);
	}
%>