<%@page import="kr.or.bit.utils.Singleton_Helper"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<jsp:include page="./common/CheckAdmin.jsp"></jsp:include>
<%
	request.setCharacterEncoding("UTF-8");
	String id = request.getParameter("id");
	String name = request.getParameter("name");
	int age = Integer.parseInt(request.getParameter("age"));
	String email = request.getParameter("email");
	String gender = request.getParameter("gender");

	Connection conn = null;
	PreparedStatement pstmt = null;

	try {
		conn = Singleton_Helper.getConnection("oracle");
		String sql = "update koreamember set name=? , age=? , email=? , gender=? where id=?";
		pstmt = conn.prepareStatement(sql);
		pstmt.setString(1, name);
		pstmt.setInt(2, age);
		pstmt.setString(3, email);
		pstmt.setString(4, gender);
		pstmt.setString(5, id);
		int result = pstmt.executeUpdate();
		if(result > 0){
			response.sendRedirect("Admin_MemberList.jsp");
		}
	}catch(Exception e){
		e.printStackTrace();
	}finally{
		Singleton_Helper.close(pstmt);
	}
%>