<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">

<head>

  <meta charset="utf-8">
  <meta http-equiv="X-UA-Compatible" content="IE=edge">
  <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
  <meta name="description" content="">
  <meta name="author" content="">

  <title>Login</title>

  <!-- Custom fonts for this template-->
  <link href="vendor/fontawesome-free/css/all.min.css" rel="stylesheet" type="text/css">

  <!-- Custom styles for this template-->
  <link href="css/sb-admin.css" rel="stylesheet">

</head>

<body class="bg-dark">
<!-- nav / top -->
<jsp:include page="/common/top.jsp"></jsp:include>

  <div class="container-fluid" style="padding-left:0">
   <!-- Sidebar -->
  <div id="wrapper">
 <jsp:include page="/common/left.jsp"></jsp:include>
	<div class="col-sm-10">
   <div class="card card-login mx-auto mt-5">
      <div class="card-header">Login</div>
      <div class="card-body">
        <form action="loginOK.jsp">
          <div class="form-group">
            <div class="form-label-group">
              <input type="text" id="inputid" name="id" class="form-control" placeholder="id" required="required" autofocus="autofocus">
              <label for="inputid">Id</label>
            </div>
          </div>
          <div class="form-group">
            <div class="form-label-group">
              <input type="password" id="inputPassword" name="pwd" class="form-control" placeholder="Password" required="required">
              <label for="inputPassword">Password</label>
            </div>
          </div>
          <div class="form-group">
            <div class="checkbox">
              <label>
                <input type="checkbox" value="remember-me">
                Remember Password
              </label>
            </div>
          </div>
          <input type="submit" value="Login" class="btn btn-primary btn-block">
        <!--   <a class="btn btn-primary btn-block">Login</a>--> 
        </form>
        <div class="text-center">
          <a class="d-block small mt-3" href="register.jsp">Register an Account</a>
          <a class="d-block small" href="forgot-password.html">Forgot Password?</a>
        </div>
      </div>
    </div>
    </div>
          <!-- Sticky Footer -->
<jsp:include page="/common/bottom.jsp"></jsp:include>
    </div>

 </div>
  <!-- Bootstrap core JavaScript-->
  <script src="vendor/jquery/jquery.min.js"></script>
  <script src="vendor/bootstrap/js/bootstrap.bundle.min.js"></script>

  <!-- Core plugin JavaScript-->
  <script src="vendor/jquery-easing/jquery.easing.min.js"></script>

</body>

</html>
    