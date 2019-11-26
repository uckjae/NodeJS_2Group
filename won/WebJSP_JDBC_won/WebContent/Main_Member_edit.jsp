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
	String id = request.getParameter("email");
	
	Connection conn = null;
	PreparedStatement pstmt = null;
	ResultSet rs = null;

	try{
		conn = Singleton_Helper.getConnection("oracle");
		String sql="select email,pwd,name,age,trim(gender) from koreamember where email=?";
		pstmt = conn.prepareStatement(sql);
		pstmt.setString(1,id);
		rs = pstmt.executeQuery(); 
		
		//while(rs.next())
		rs.next(); //1건 데이터가 있다면 전제조건
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">
<meta name="description" content="">
<meta name="author" content="">
<meta charset="UTF-8">
<title>Insert title here</title>
<!-- Custom fonts for this template-->
<link href="vendor/fontawesome-free/css/all.min.css" rel="stylesheet"
	type="text/css">

<!-- Page level plugin CSS-->
<link href="vendor/datatables/dataTables.bootstrap4.css"
	rel="stylesheet">

<!-- Custom styles for this template-->
<link href="css/sb-admin.css" rel="stylesheet">

<style type="text/css">
table {
	font-family: arial, sans-serif;
	border-collapse: collapse;
	width: 100%;
}

td, th {
	border: 1px solid #dddddd;
	text-align: left;
	padding: 8px;
}

tr:nth-child(even) {
	background-color: #dddddd;
}
</style>
</head>
<body id="page-top">

	<jsp:include page="common/top.jsp"></jsp:include>

	<div id="wrapper">

		<jsp:include page="common/left.jsp"></jsp:include>

		<div id="content-wrapper">

			<div class="container-fluid">

				<!-- Breadcrumbs-->
				<ol class="breadcrumb">
					<li class="breadcrumb-item"><a href="#">회원리스트</a></li>
					<li class="breadcrumb-item active">Tables</li>
				</ol>

				<!-- DataTables Example -->
				<div class="card mb-3">
					<div class="card-header">
						<i class="fas fa-table"></i> 회원 목록
					</div>
					<div class="card-body">
						<div class="table-responsive">
							<form action="MemberEditOK.jsp" method="post">
								<table class="table table-bordered" id="inner" width="100%"
									cellspacing="0">
									<tr>
										<td>아이디</td>
										<td><input type="text" name="id"
											value="<%= rs.getString(1) %>" readonly></td>
									</tr>
									<tr>
										<td>비번</td>
										<td><%= rs.getString(2) %></td>
									</tr>
									<tr>
										<td>이름</td>
										<td><input type="text" name="name"
											value="<%= rs.getString(3) %>"></td>
									</tr>
									<tr>
										<td>나이</td>
										<td><input type="text" name="age"
											value="<%= rs.getString(4) %>"></td>
									</tr>
									<tr>
										<td>성별</td>
										<td>[<%=rs.getString(5) %>] <input type="radio"
											name="gender" id="gender" value="여"
											<%if (rs.getString(5).equals("여")){ %> checked <%}%>>여자
											<input type="radio" name="gender" id="gender" value="남"
											<%if (rs.getString(5).equals("남")){ %> checked <%}%>>남자
										</td>
									</tr>
									<tr>
										<td>이메일</td>
										<td><input type="text" name="email"
											value="<%= rs.getString(6) %>"></td>
									</tr>
									<tr>
										<td colspan="2"><input type="submit" value="수정하기"
											class="btn btn-primary"> <a href='Memberlist.jsp'
											class="btn btn-primary">리스트이동</a></td>
								</table>
							</form>
						</div>
					</div>
					<div class="card-footer small text-muted">Updated yesterday
						at 11:59 PM</div>
				</div>

				<p class="small text-center text-muted my-5">
					<em>More member coming soon...</em>
				</p>

			</div>

			<!-- /.container-fluid -->

			<jsp:include page="common/bottom.jsp"></jsp:include>

		</div>
		<!-- /.content-wrapper -->

	</div>
	<!-- /#wrapper -->

	<!-- Scroll to Top Button-->
	<a class="scroll-to-top rounded" href="#page-top"> <i
		class="fas fa-angle-up"></i>
	</a>

	<!-- Logout Modal-->
	<div class="modal fade" id="logoutModal" tabindex="-1" role="dialog"
		aria-labelledby="exampleModalLabel" aria-hidden="true">
		<div class="modal-dialog" role="document">
			<div class="modal-content">
				<div class="modal-header">
					<h5 class="modal-title" id="exampleModalLabel">Ready to Leave?</h5>
					<button class="close" type="button" data-dismiss="modal"
						aria-label="Close">
						<span aria-hidden="true">×</span>
					</button>
				</div>
				<div class="modal-body">Select "Logout" below if you are ready
					to end your current session.</div>
				<div class="modal-footer">
					<button class="btn btn-secondary" type="button"
						data-dismiss="modal">Cancel</button>
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

<%
}catch(Exception e){
		
}finally{
	Singleton_Helper.close(rs);
	Singleton_Helper.close(pstmt);
}
%>