<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">

<head>

   <jsp:include page="./common/Basic.jsp"></jsp:include>

 <title>SB Admin - Login</title>
 <script type="text/javascript">
 
 
 </script>

</head>

<body class="bg-dark">

  <div class="container">
    <div class="card card-login mx-auto mt-5">
      <div class="card-header">로그인</div>
      <div class="card-body">
        <form action="Loginok.jsp" method="post" name="loginForm"
					id="joinForm" class="form-group">
          <div class="form-group">
            <div class="form-label-group">
              <input type="text" name="id" id="id" class="form-control" placeholder="id" required="required" autofocus="autofocus">
              <label for="id">아이디</label>
            </div>
          </div>
          <div class="form-group">
            <div class="form-label-group">
              <input type="password" name="pwd" id="pwd" class="form-control" placeholder="pwd" required="required">
              <label for="pwd">비밀번호</label>
            </div>
          </div>
          <div class="form-group">
            <div class="checkbox">
              <label>
                <input type="checkbox" value="remember-me">
                비밀번호 저장
              </label>
            </div>
          </div>
          <input type="submit" value="로그인" class="btn btn-primary btn-block">
        </form>
        <div class="text-center">
          <a class="d-block small mt-3" href="register.jsp">회원가입</a>
        </div>
      </div>
    </div>
  </div>


</body>

</html>
