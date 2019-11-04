<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<script type="text/javascript">
	$(function() {
		$('#send').submit(function() {
			//alert("가입");
			if ($('#email').val() == "") { // 아이디 검사
				alert('E-amil을 입력해 주세요.');
				$('#email').focus();
				return false;
			} else if ($('#pwd').val() == "") { // 비밀번호 검사
				alert('비밀번호를 입력해 주세요.');
				$('#pwd').focus();
				return false;
			} else if ($('#name').val() == "") { // 이름 검사
				alert('이름을 입력해 주세요.');
				$('#name').focus();
				return false;
			} else if ($('#age').val() == "") { // 나이 검사
				alert('나이를 입력해 주세요.');
				$('#age').focus();
				return false;
			}

		});
	});
</script><head>

<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">
<meta name="description" content="">
<meta name="author" content="">

<title>Team2</title>

<!-- Custom fonts for this template-->
<link href="vendor/fontawesome-free/css/all.min.css" rel="stylesheet"
	type="text/css">

<!-- Page level plugin CSS-->
<link href="vendor/datatables/dataTables.bootstrap4.css"
	rel="stylesheet">

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
				<div class="container">
					<div class="card card-register mx-auto mt-5">
						<div class="card-header">Register an Account</div>
						<div class="card-body">
							<form action="Main_register_ok.jsp" method="post">
								<div class="form-group">
									<div class="form-label-group">
										<input type="email" id="email" name="email" class="form-control"
											placeholder="Email address" required="required"> 
										<label for="email">Email Address</label>
									</div>
								</div>
								<div class="form-group">
									<div class="form-label-group">
										<input type="password" id="password" name="password" class="form-control"
											placeholder="Password" required="required"> 
										<label for="password">Password</label>
									</div>
								</div>
								<div class="form-group">
									<div class="form-label-group">
										<input type="password" id="chpwd" class="form-control"
											placeholder="Check Password" required="required"> 
											<label for="chpwd">Check Password</label>
									</div>
								</div>
								<div class="form-group">
									<div class="form-label-group">
										<input type="text" id="name" name="name" class="form-control"
											placeholder="Name" required="required"> 
											<label for="name">Name</label>
									</div>
								</div>
								<div class="form-group">
									<div class="form-label-group">
										<input type="text" id="age" name="age" class="form-control"
											placeholder="age" required="required"> 
											<label for="age">Age</label>
									</div>
								</div>
								<div class="form-group">
									<div class="form-label-group">
										<select class="form=control" id="gender" name="gender">
											<option value="M" selected>남</option>
											<option value="F">여</option>
										</select>
									</div>
								</div>
								<input type="submit" value="register" id="send" class="btn btn-primary btn-block">
							</form>
							<div class="text-center">
								<a class="d-block small mt-3" href="MainLogin.jsp">Login Page</a> 
								<a class="d-block small" href="forgot-password.html">Forgot Password?</a>
							</div>
						</div>
					</div>
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
						<h5 class="modal-title" id="exampleModalLabel">Ready to
							Leave?</h5>
						<button class="close" type="button" data-dismiss="modal"
							aria-label="Close">
							<span aria-hidden="true">×</span>
						</button>
					</div>
					<div class="modal-body">Select "Logout" below if you are
						ready to end your current session.</div>
					<div class="modal-footer">
						<button class="btn btn-secondary" type="button"
							data-dismiss="modal">Cancel</button>
						<a class="btn btn-primary" href="login.html">Logout</a>
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
