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
		if(session.getAttribute("userid") == null || !session.getAttribute("userid").equals("admin")) {
			out.print("<script>alert('권한이 없습니다.') </script>");
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
				 	Connection conn = null;
					PreparedStatement pstmt = null;
					ResultSet rs = null;
					try{
						conn = Singleton_Helper.getConnection("oracle");
						String sql="select id, ip from koreamember";
						pstmt = conn.prepareStatement(sql);
						rs = pstmt.executeQuery(); 
						%>

	 <div id="wrapper">

    <!-- Sidebar -->
    <jsp:include page="/side/left.jsp"></jsp:include>


        <div class="card mb-3">
          <div class="card-header">
            <i class="fas fa-table"></i>
           회원리스트</div>
          <div class="card-body">
            <div class="table-responsive">
              <table class="table table-bordered" id="dataTable" width="100%" cellspacing="0" style="text-align: center;">
               	<thead>
                  <tr>
                    <th>아이디</th>
                    <th>IP</th>
                    <th colspan="2" >메뉴</th>
                  </tr>
                </thead>   
                <% while(rs.next()) { %> 
                  <tr>
                    <td width="100px"> <a href = "listDetail.jsp?id=<%=rs.getString("id") %>"> <%=rs.getString("id")%></a></td>
                    <td width="100px"><%=rs.getString("ip") %></td>
                    <td width="100px"><a href="listEdit.jsp?id=<%=rs.getString("id") %>"><img alt="" src="img/writing.png" width="20px"></a></td>
                    <td width="100px"><a href="listDelete.jsp?id=<%=rs.getString("id") %>"><img alt="" src="img/clear.png" width="20px"></a></td>
                  </tr>
			<% } %>
							
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