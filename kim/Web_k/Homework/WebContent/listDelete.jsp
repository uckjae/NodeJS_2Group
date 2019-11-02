<%@page import="java.sql.ResultSet"%>
<%@page import="kr.or.bit.utils.Singleton_Helper"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	/* 
			1.권한 검사
			2.id 값 받기
			3. DB > delete from koreamember where id=?
			4. 이동처리 >> 삭제 완료시  목록 페이지로 이동
	*/
	request.setCharacterEncoding("UTF-8");

	 
	if(session.getAttribute("userid") == null || !session.getAttribute("userid").equals("admin")) {
		out.print("<script> location.href = 'Login.jsp' </script>");
	}

	String id = request.getParameter("id");
	Connection conn = null;
	PreparedStatement pstmt = null;
	ResultSet rs = null;
	try{
		conn = Singleton_Helper.getConnection("oracle");
		String sql="delete from koreamember where id=?";
		pstmt = conn.prepareStatement(sql);
		pstmt.setString(1, id);
		rs = pstmt.executeQuery(); 
		response.sendRedirect("list.jsp");
	}catch(Exception e) {
		
	}finally{
		Singleton_Helper.close(rs);
		Singleton_Helper.close(pstmt);
	}
%>
					

					


