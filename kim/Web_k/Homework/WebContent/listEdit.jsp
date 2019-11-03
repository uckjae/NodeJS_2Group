<%@page import="kr.or.bit.utils.Singleton_Helper"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
	/*  
		1. 관리자만 접근 가능한 페이지
		2. 로그인한 일반 회원이 주소값을 외워서 
		3. 그러면 회원에 관련된 모든 페이지 상단에는 아래 코드를 ... : sessionCheck.jsp >> include
	*/
	request.setCharacterEncoding("UTF-8");
	String id = request.getParameter("id");
	
			 
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
				 	Connection conn = null;
					PreparedStatement pstmt = null;
					ResultSet rs = null;
					try{
						conn = Singleton_Helper.getConnection("oracle");
						String sql="select id,pwd,name,age,trim(gender),email from koreamember where id=?";
						
						pstmt = conn.prepareStatement(sql);
						pstmt.setString(1,id);
						rs = pstmt.executeQuery(); 
						%>

	 <div id="wrapper">

    <!-- Sidebar -->
    <jsp:include page="/side/left.jsp"></jsp:include>


        <!-- DataTables Example -->
         <div class="card mb-3">
          <div class="card-header">
            <i class="fas fa-table"></i>
            Data Table Example</div>
          <div class="card-body">
            <div class="table-responsive">
              <table class="table table-bordered" id="dataTable" width="100%" cellspacing="0">
				<form action="listEditok.jsp" method="post">
					<tr>
						<th colspan="4">회원 리스트</th>
					</tr>
					<% while(rs.next()) { %>
					<tr>
								<td>아이디</td>
								<td>
								  	<input type="text" name="id" value="<%=rs.getString(1)%>" readonly>
								</td>
							</tr>
							<tr>
								<td>비번</td>
								<td><%= rs.getString(2) %></td>							</tr>
							<tr>
								<td>이름</td>
								<td>
									<input type="text" name="name" value="<%=rs.getString(3)%>" style="background-color: skyblue">
								</td>
							</tr>
							<tr>
								<td>나이</td>
								<td>
									<input type="text" name="age" value="<%=rs.getString(4)%>" style="background-color: skyblue">
								</td>
							</tr>
							<tr>
								<td>성별</td>
								<td>
									
									<input type="radio" name="gender" id="gender" value="여" 
									<%if (rs.getString(5).equals("여")){ %>checked<%}%>>여자
									<input type="radio" name="gender" id="gender" value="남"
									<%if (rs.getString(5).equals("남")){ %>checked<%}%>>남자
								</td>
							</tr>
							<tr>
								<td>이메일</td>
								<td>
									<input type="text" name="email" value="<%=rs.getString(6)%>" style="background-color: skyblue">
								</td>
							</tr>
							<tr>
								<td colspan="2">
								<input type="submit" value="수정 하기" class="btn btn-primary">
								<a href='list.jsp' class="btn btn-danger">수정 취소</a></td>
					<% } %>
							
		

				</form>
				</table>
			</div>
		
		</div>
	</div>
</div>


	

	<% 
						
					}catch(Exception e) {
						
					}finally{
						Singleton_Helper.close(rs);
						Singleton_Helper.close(pstmt);
					}
				 
				 %>



	<jsp:include page="/foot/footer.jsp"></jsp:include>

</body>
</html>