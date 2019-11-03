<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<!-- Admin이 아니면 로그인 페이지로 이동 -->
<%
	if(session.getAttribute("userid") == null || !session.getAttribute("userid").equals("admin") ){
		//강제로 페이지 이동
		out.print("<script>");
			out.print("location.href='LoginPage.jsp'");
		out.print("</script>");
		
		// Q)
		// response.sendRedirect("../LoginPage.jsp");
	}
%>