<%@page import="kr.or.bit.utils.Singleton_Helper"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	if(session.getAttribute("userid") == null || !session.getAttribute("userid").equals("admin@admin.com")){
		out.print("<script>location.href='404.html'</script>");
	}

	String id = request.getParameter("email");
	Connection conn = null;
	PreparedStatement pstmt = null;
	ResultSet rs = null;
	
	try{
		request.getParameter("email");
		conn=Singleton_Helper.getConnection("oracle");
		// delete from koreamember where id = 'hong';
		String sql="delete from koreamember where email = '"+id+"'";
		pstmt = conn.prepareStatement(sql);
		rs = pstmt.executeQuery(); 
	}catch(Exception e){
		out.print(e.getMessage());
	}finally{
		Singleton_Helper.close(rs);
		Singleton_Helper.close(pstmt);
		response.sendRedirect("Main_Member_list.jsp");
	}
%>
