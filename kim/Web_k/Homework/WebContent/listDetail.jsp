<%@page import="kr.or.bit.utils.Singleton_Helper"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
/*  
		회원 상세 페이지 (id 컬럼 PK)
		1.권한 검사
		2.id 값 받기 (request.getparameter("id")) >> 한글처리
		3.select id,pwd,name,age,gender,email from koreamember where id=?
		4.id primary key (데이터 1건 보장)
		5.화면 출력 UI 구성
*/	
/*  
		1.관리자만 접근 가능한 페이지
		2.로그인한 일반 회원이 주소값을 외워서 ... 접근불가 
		3.그러면  회원에 관련되 모든 페이지 상단에는 아래 코드를 ..... : sessionCheck.jsp >> include 
*/
	request.setCharacterEncoding("UTF-8");

		 
	if(session.getAttribute("userid") == null || !session.getAttribute("userid").equals("admin")) {
		out.print("<script> location.href = 'Ex02_JDBC_Login.jsp' </script>");
	}
	
%>
<jsp:include page="/common/Basic.jsp"></jsp:include>
<jsp:include page="/nav/nav_include.jsp"></jsp:include>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">

</style>
</head>
<body>

	<!-- 
					회원목록 (리스트) 출력
					목록 (select id , ip from koreaMember)
				 -->
 
	<%
		String id = request.getParameter("id");
	  
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
					try{
						conn = Singleton_Helper.getConnection("oracle");
			  			String sql = "select id,pwd,name,age,gender,email from koreamember where id=?";
			  			pstmt = conn.prepareStatement(sql);
			  			
			  			pstmt.setString(1, id);
			  			
			  			rs = pstmt.executeQuery(); 
			  			while(rs.next()){
						%>

	 <div id="wrapper">

    <!-- Sidebar -->
    <jsp:include page="/side/left.jsp"></jsp:include>


        <div class="card mb-3">
          <div class="card-header">
            <i class="fas fa-table"></i>
           	회원정보</div>
          <div class="card-body">
            <div class="table-responsive">
              <table class="table table-bordered" id="dataTable" width="100%" cellspacing="0" style="text-align: center;">
               	<tr>
				  			 		<td style="width:100px">아이디</td>
				  			 		<td style="width:100px"><%= rs.getString("id") %></td>
				  </tr>
                
                  <tr>
				  			 		<td style="width:100px">비번</td>
				  			 		<td style="width:100px"><%= rs.getString("pwd") %></td>
				  			 	</tr>
				  			 	<tr>
				  			 		<td style="width:100px">이름</td>
				  			 		<td style="width:100px"><%= rs.getString("name") %></td>
				  			 	</tr>
				  			 	<tr>
				  			 		<td style="width:100px">나이</td>
				  			 		<td style="width:100px"><%= rs.getString("age") %></td>
				  			 	</tr>
				  			 	<tr>
				  			 		<td style="width:100px">성별</td>
				  			 		<td style="width:100px"><%= rs.getString("gender") %></td>
				  			 	</tr>
				  			 	<tr>
				  			 		<td style="width:100px">이메일</td>
				  			 		<td style="width:100px"><%= rs.getString("email") %></td>
				  			 	</tr>
			
							
								<tr>
				  			 		<td colspan="2">
				  			 			<a href="list.jsp" class="btn btn-success">목록가기</a>
				  			 		</td>
				  			 	</tr>


				</table>
			</div>
		</div>
	</div>
</div>

	

	<% 
			  			}		
					}catch(Exception e) {
						
					}finally{
						Singleton_Helper.close(rs);
						Singleton_Helper.close(pstmt);
					}
				 
				 %>



	<jsp:include page="/foot/footer.jsp"></jsp:include>s

</body>
</html>