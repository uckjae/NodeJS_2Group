<%@page import="java.sql.Connection"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="kr.or.bit.utils.Singleton_Helper"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%  if(session.getAttribute("userid") == null || !session.getAttribute("userid").equals("admin")){
		//강제로 페이지 이동 
		out.print("<script>location.href='login.jsp'</script>");		
	}
	
	%>
<!DOCTYPE html>
<html>
<head>
  <title>회원관리</title>
<jsp:include page="/common/head.jsp"></jsp:include>
</head>

<body id="page-top">

<jsp:include page="/common/top.jsp"></jsp:include>

  <div id="wrapper">
<jsp:include page="/common/left.jsp"></jsp:include>

    <div id="content-wrapper">

      <div class="container-fluid">

        <!-- Breadcrumbs-->
        <ol class="breadcrumb">
          <li class="breadcrumb-item">
            <a href="#">회원리스트</a>
          </li>
          <li class="breadcrumb-item active">Tables</li>
        </ol>

        <!-- DataTables Example -->
        <div class="card mb-3">
          <div class="card-header">
            <i class="fas fa-table"></i>
            	회원 목록</div>
          <div class="card-body">
            <div class="table-responsive">				
			<% 	Connection conn = null;
			PreparedStatement pstmt = null;
			ResultSet rs = null;
			
			try {
				conn = Singleton_Helper.getConnection("oracle");
				String sql="select id, ip from koreamember";
				pstmt = conn.prepareStatement(sql);
				rs = pstmt.executeQuery(); 
				%>	  
				<table class="table table-bordered" id="inner" width="100%" cellspacing="0">
					<tr><th colspan="4">회원리스트</th><tr>
					<tr>
	                    <th>아이디</th>
	                    <th>IP</th>
	                    <th>삭제</th>
	                    <th>수정</th>
                  </tr>
			<% 	while(rs.next()){ %>
					<tr>
						<td >
							<a href='MemberDetail.jsp?id=<%=rs.getString("id") %>'><%=rs.getString("id") %></a>
							
						</td>
						<td><%=rs.getString("ip") %></td>
						<td>
							<a href= "MemberDelete.jsp?id=<%=rs.getString("id") %>">[삭제]</a>							
						</td>
						<td>
							<a href= "MemberEdit.jsp?id=<%=rs.getString("id") %>">[수정]</a>
						</td>
					</tr>
					
			<%	}%> 
				</table>
				<hr>
					<form action="MemberSearch.jsp" method="post">
						회원명: <input type="text" name="search">
						<input type="submit" value="이름검색하기" class="btn btn-primary">
					</form>
				<hr>
				<%
			}catch(Exception e){
				
			}finally{
				Singleton_Helper.close(rs);
				Singleton_Helper.close(pstmt);
			}
			 %>
			
            </div>
          </div>
          <div class="card-footer small text-muted">Updated yesterday at 11:59 PM</div>
        </div>

        <p class="small text-center text-muted my-5">
          <em>More member coming soon...</em>
        </p>

      </div>
      <!-- /.container-fluid -->

      <!-- Sticky Footer -->
<jsp:include page="/common/bottom.jsp"></jsp:include>

    </div>
    <!-- /.content-wrapper -->

  </div>
  <!-- /#wrapper -->

  <!-- Scroll to Top Button-->
  <a class="scroll-to-top rounded" href="#page-top">
    <i class="fas fa-angle-up"></i>
  </a>


  <!-- Bootstrap core JavaScript-->
  <script src="vendor/jquery/jquery.min.js"></script>
  <script src="vendor/bootstrap/js/bootstrap.bundle.min.js"></script>

  <!-- Core plugin JavaScript-->
  <script src="vendor/jquery-easing/jquery.easing.min.js"></script>

  <!-- Page level plugin JavaScript-->
  <script src="vendor/datatables/jquery.dataTables.js"></script>
  <script src="vendor/datatables/dataTables.bootstrap4.js"></script>

  <!-- Custom scripts for all pages-->
  <script src="js/sb-admin.min.js"></script>

  <!-- Demo scripts for this page-->
  <script src="js/demo/datatables-demo.js"></script>

</body>

</html>