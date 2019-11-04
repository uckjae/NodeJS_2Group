<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="kr.or.bit.utils.Singleton_Helper"%>
<%@page import="java.sql.ResultSet"%>

<%

	request.setCharacterEncoding("UTF-8");
	

	String id = request.getParameter("id");
	String pwd = request.getParameter("pwd");
	
	Connection conn = null;
	PreparedStatement pstmt = null;
	ResultSet rs = null;
	
	try{
		
		conn = Singleton_Helper.getConnection("oracle");
		String sql="select id, pwd from koreamember where id=?";
		pstmt = conn.prepareStatement(sql);
		pstmt.setString(1,id);
		rs = pstmt.executeQuery(); 
		
		while(rs.next()){
			//데이터가 있다 (id 존재한다)
			
			//id존재 
			if(pwd.equals(rs.getString("pwd"))){ //아이디가 존재하고 비번도 존재 //정상회원 
				session.setAttribute("userid",rs.getString("id"));
			
				//top.jsp 정보 로그인 상태 
				//이동처리 
				response.sendRedirect("index.jsp ");
			}else{  //비밀번호가 틀림 
				out.print("<script>");
				out.print("location.href='login.jsp'");
				out.print("</script>");
			}
		}
		//while을 타지 않는 경우		
		out.print("<script>");
		out.print("location.href='register.jsp'");
		out.print("</script>");
		
	}catch(Exception e){
		System.out.println(e.getMessage());
	}finally{
		Singleton_Helper.close(rs);
		Singleton_Helper.close(pstmt);
	} 
%>