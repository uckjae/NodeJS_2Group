<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">

<head>
  <title>JDBC Homepage</title>
<jsp:include page="/common/head.jsp"></jsp:include>
</head>

<body id="page-top">

<!-- nav / top -->
<jsp:include page="/common/top.jsp"></jsp:include>
  <div id="wrapper">

 <!-- Sidebar -->
 <jsp:include page="/common/left.jsp"></jsp:include>

<!-- content -->
    <div id="content-wrapper">
      <div class="container-fluid">

      				<% String id = null;
					id = (String)session.getAttribute("userid");
				if(id != null){
					//회원 
					out.print(id + "회원님이 접속하셨습니다 <br>");
					if(id.equals("admin")){
						out.print("<a href='Memberlist.jsp'  class='btn btn-primary'>회원관리</a>");
					}
				}else { //로그인 하지 않은 사용자 //메인 페이지는 회원만 볼 수 있다 >> 강제 링크 추가 
					out.print("사이트 방문을 환영합니다<br>");
				}
				
				%>
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