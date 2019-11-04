<%@page import="java.sql.Connection"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="kr.or.bit.utils.Singleton_Helper"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%  
request.setCharacterEncoding("UTF-8");
if(session.getAttribute("userid") == null || !session.getAttribute("userid").equals("admin")){
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
			<%   
			String name = request.getParameter("search");
			Connection conn = null;
			PreparedStatement pstmt = null;
		    ResultSet rs = null;
			
		    //where 조건 
		    conn = Singleton_Helper.getConnection("oracle");
		    String sql = "select count(*) as count from koreamember where name like ?";
		    String sql2 = "select id,name,email from koreamember where name like '%" + name +"%'";
		    
		    pstmt = conn.prepareStatement(sql);
		    pstmt.setString(1, '%' + name + '%');
		    
		    rs = pstmt.executeQuery();
		    int rowcount = 0;
		    if(rs.next()){
		    	
		    	 rowcount = rs.getInt(1);//몇건이냐 >> 조회건수 	
		    }
			%>
			<table class="table table-bordered" id="inner" width="100%" cellspacing="0">
				<tr ><th colspan ='3'>회원 리스트</th></tr>
					<% if(rowcount >0){
						pstmt = conn.prepareStatement(sql2);
						rs=pstmt.executeQuery();
						while(rs.next()){
							String id = rs.getString(1);
							String mname = rs.getString(2);
							String email = rs.getString(3);
							%> 
							<tr>
								<td><%=id %></td>
								<td><%=mname %></td>
								<td><%=email %></td>
							</tr>
							<% 
						} //end while 
							out.print("<tr><td colspan='3'>");
							out.print("<b>["+ name +"] 조회결과" +rowcount+ "건 조회</b>");
							out.print("</td></tr>");
					}else { //조회된 건수가 없을 경우 
						out.print("<tr><td colspan='3'>");
						out.print("<b>["+ name +"] 조회결과가 없습니다</b>");
						out.print("</td></tr>");
				
					}
					
					
					%>
				</table>
				<a href="Memberlist.jsp" class="btn btn-primary"> 회원 목록 페이지</a>
			<% 	
				Singleton_Helper.close(rs);
				Singleton_Helper.close(pstmt);
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