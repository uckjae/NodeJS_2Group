<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>

<head>
<jsp:include page="/common/head.jsp"></jsp:include>
</head>

<body class="bg-dark">
<!-- nav / top -->
<jsp:include page="/common/top.jsp"></jsp:include>

   <!-- Sidebar -->
  <div id="wrapper">
 <jsp:include page="/common/left.jsp"></jsp:include>
 
  <div class="container">
    <div class="card card-register mx-auto ">
   <!--    <div class="card-header">Register an Account</div>--> 
      <div class="card-body">
        <form  action="registerOK.jsp">
          <div class="form-group">아이디
            <div class="form-label-group">
              <input type="text" id="inputid" name ="id" class="form-control" placeholder="id" required="required">
              <label for="inputid">id</label>
            </div>
          </div>
          <div class="form-group">비밀번호
            <div class="form-label-group">
              <input type="password" id="inputpwd" name ="pwd" class="form-control" placeholder="password" required="required">
              <label for="inputpwd">password</label>
            </div>
          </div>
          <div class="form-group">이름
            <div class="form-label-group">
              <input type="text" id="inputname" name ="name" class="form-control" placeholder="name" required="required">
              <label for="inputname">name</label>
            </div>
          </div>
          <div class="form-group">나이
            <div class="form-label-group">
              <input type="text" id="inputage" name ="age" class="form-control" placeholder="age" required="required">
              <label for="inputage">age</label>
            </div>
          </div>
            <div class="form-group">
            <div class="form-row">
              <div class="col-md-6">
                <div class="form-label-group">
               	 여자  <input type="radio" id="gender" name="gender" class="form-control" value="여" checked> 
                 <label for="male"></label>
                </div>
              </div>
              <div class="col-md-6">
                <div class="form-label-group">
                 	남자	<input type="radio" id="gender" name="gender" class="form-control" value="남">
                  <label for="female"></label>
                </div>
              </div>
            </div>
          </div>
          
          
          <div class="form-group">email
            <div class="form-label-group">
              <input type="email" id="inputEmail" name ="email"class="form-control" placeholder="Email address" required="required">
              <label for="inputEmail">email address</label>
            </div>
          </div>
		<div class="row">
		<div class="col-sm-6">
          <input type="submit" value="Register" class="btn btn-primary btn-block">
          </div>
          <div class="col-sm-6">
          <input type="reset" value="취소" class="btn btn-primary btn-block">
           </div>
          </div>
        </form>
        <div class="text-center">
          <a class="d-block small mt-3" href="login.jsp">Login Page</a>
   <!--     <a class="d-block small" href="forgot-password.html">Forgot Password?</a> -->   
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