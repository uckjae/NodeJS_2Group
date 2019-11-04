<%@page import="kr.or.bit.utils.Singleton_Helper"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("UTF-8");

	if(session.getAttribute("userid") == null || !session.getAttribute("userid").equals("admin@admin.com")){
		out.print("<script>location.href='404.html'</script>");
	}
%>
<!DOCTYPE html>
<html>
<<head>

  <meta charset="utf-8">
  <meta http-equiv="X-UA-Compatible" content="IE=edge">
  <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
  <meta name="description" content="">
  <meta name="author" content="">

  <title>Team2</title>

  <!-- Custom fonts for this template-->
  <link href="vendor/fontawesome-free/css/all.min.css" rel="stylesheet" type="text/css">

  <!-- Page level plugin CSS-->
  <link href="vendor/datatables/dataTables.bootstrap4.css" rel="stylesheet">

  <!-- Custom styles for this template-->
  <link href="css/sb-admin.css" rel="stylesheet">

</head>

<body id="page-top">

  <jsp:include page="common/top.jsp"></jsp:include>

  <div id="wrapper">

    <jsp:include page="common/left.jsp"></jsp:include>

    <div id="content-wrapper">

      <div class="container-fluid">

        <!-- Breadcrumbs-->
        <%
        	String name = request.getParameter("search");
        	
       	 	Connection conn = null;
			PreparedStatement pstmt = null;
			ResultSet rs = null;
        	
			conn = Singleton_Helper.getConnection("oracle");
			String sql="select count(*) from Team2member where name like ?";
			String sql2 ="select email, name, age from Team2member where name like '%"+name+"%'";
			
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, '%'+name+'%');
			rs= pstmt.executeQuery();
			int rowcount=0;
			if(rs.next()){
				rowcount = rs.getInt(1);
			}
        %>
       		<table style="width: 400px; height: 100px; margin-left: auto; margin-right: auto;">
				<tr><th colspan="4">회원  리스트</th></tr>
			<%
				if(rowcount > 0){
					pstmt = conn.prepareStatement(sql2); 
					rs = pstmt.executeQuery();
					while(rs.next()){
						String email = rs.getString(1);
						String mname = rs.getString(2);
						String age = rs.getString(3);
			%>
				<tr>
					<td><%=email%></td>
					<td><%=mname%></td>
					<td><%=age %></td>
				</tr>
			<%
					}
					out.print("<tr><td colspan='3'>");
					out.print("<b>[" + name + "] 조회결과" + rowcount + "건 조회</b>");
					out.print("</td></tr>");	
				}else{ //조회된 건수가 없는 경우
					out.print("<tr><td colspan='3'>");
					out.print("<b>[" + name + "]의 조회결과가 없습니다</b>");
					out.print("</td></tr>");	
				}
			%>
        
      <!-- /.container-fluid -->

      <jsp:include page="common/bottom.jsp"></jsp:include>

    </div>
    <!-- /.content-wrapper -->

  </div>
  <!-- /#wrapper -->

  <!-- Scroll to Top Button-->
  <a class="scroll-to-top rounded" href="#page-top">
    <i class="fas fa-angle-up"></i>
  </a>

  <!-- Logout Modal-->
  <div class="modal fade" id="logoutModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
    <div class="modal-dialog" role="document">
      <div class="modal-content">
        <div class="modal-header">
          <h5 class="modal-title" id="exampleModalLabel">Ready to Leave?</h5>
          <button class="close" type="button" data-dismiss="modal" aria-label="Close">
            <span aria-hidden="true">×</span>
          </button>
        </div>
        <div class="modal-body">Select "Logout" below if you are ready to end your current session.</div>
        <div class="modal-footer">
          <button class="btn btn-secondary" type="button" data-dismiss="modal">Cancel</button>
          <a class="btn btn-primary" href="Main_Login.jsp">Logout</a>
        </div>
      </div>
    </div>
  </div>

  <!-- Bootstrap core JavaScript-->
  <script src="vendor/jquery/jquery.min.js"></script>
  <script src="vendor/bootstrap/js/bootstrap.bundle.min.js"></script>

  <!-- Core plugin JavaScript-->
  <script src="vendor/jquery-easing/jquery.easing.min.js"></script>

  <!-- Page level plugin JavaScript-->
  <script src="vendor/chart.js/Chart.min.js"></script>
  <script src="vendor/datatables/jquery.dataTables.js"></script>
  <script src="vendor/datatables/dataTables.bootstrap4.js"></script>

  <!-- Custom scripts for all pages-->
  <script src="js/sb-admin.min.js"></script>

  <!-- Demo scripts for this page-->
  <script src="js/demo/datatables-demo.js"></script>
  <script src="js/demo/chart-area-demo.js"></script>

</body>
</html>