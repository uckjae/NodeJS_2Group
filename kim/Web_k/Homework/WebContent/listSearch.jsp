<%@page import="kr.or.bit.utils.Singleton_Helper"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	<%
			if(session.getAttribute("userid") == null || !session.getAttribute("userid").equals("admin")) {
			out.print("<script> location.href = 'Login.jsp' </script>");
		}
request.setCharacterEncoding("UTF-8");
	
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
			String name=request.getParameter("search");	
			 
		 	Connection conn = null;
			PreparedStatement pstmt = null;
			ResultSet rs = null;
					try{
						conn = Singleton_Helper.getConnection("oracle");
						String sql="select count(*) from koreamember where name like ?";
						String sql2 ="select id, name, email , age from koreamember where name like '%"+name+"%'";
						pstmt = conn.prepareStatement(sql);
						pstmt.setString(1, '%'+name+'%');
						rs= pstmt.executeQuery();
						int rowcount=0;
						if(rs.next()){
							rowcount = rs.getInt(1); //조회건수
						}
						%>

	 <div id="wrapper">

    <!-- Sidebar -->
    <jsp:include page="/side/left.jsp"></jsp:include>


        <div class="card mb-3">
          <div class="card-header">
            <i class="fas fa-table"></i>
            Data Table Example</div>
          <div class="card-body">
            <div class="table-responsive">
              <table class="table table-bordered" id="dataTable" width="100%" cellspacing="0" style="text-align: center;">
               	<%
								if(rowcount > 0){
									pstmt = conn.prepareStatement(sql2); 
									rs = pstmt.executeQuery();
									while(rs.next()){
										String id = rs.getString(1);
										String mname = rs.getString(2);
										String email = rs.getString(3);
										int age = rs.getInt(4);
							%>
               	<thead>
                  <tr>
                    <th width="100px">아이디</th>
                    <th width="100px">이름</th>
                    <th width="100px">이메일</th>
                    <th width="100px">나이</th>
                  </tr>
                </thead>   
               
                  <tr>
                    <td width="100px"><%=id%></td>
                    <td width="100px"><%=mname%></td>
                    <td width="100px"><%=email%></td>
                    <td width="100px"><%=age%></td>
                  </tr>
			<%			
									} //end while
									out.print("<tr><td colspan='3'>");
									out.print("<b>[" + name + "] 조회결과" + rowcount + "건 조회</b>");
									out.print("</td></tr>");	
								}else{ //조회된 건수가 없는 경우
									out.print("<tr><td colspan='3'>");
									out.print("<b>[" + name + "] 조회결과가 없습니다</b>");
									out.print("</td></tr>");	
								}
							%>
							
		<form action="listSearch.jsp" method="post">
		회원명:<input type="text" name="search"> <input type="submit" value="이름 검색"  class="btn-primary">
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



	<jsp:include page="/foot/footer.jsp"></jsp:include>s

</body>
</html>