<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">

<head>

 <jsp:include page="./common/Basic.jsp"></jsp:include>
<script type="text/javascript">
$(function() {
  	$('#joinForm').submit(function() {
	   //alert("가입");
	if ($('#id').val() == "") { // 아이디 검사
    	alert('ID를 입력해 주세요.');
    	$('#id').focus();
    return false;
   } else if ($('#pwd').val() == "") { // 비밀번호 검사
    alert('PWD를 입력해 주세요.');
    $('#pwd').focus();
    return false;
   }else if ($('#mname').val() == "") { // 이름 검사
    alert('mname를 입력해 주세요.');
    $('#mname').focus();
    return false;
   }else if ($('#age').val() == "") { // 나이 검사
    alert('age를 입력해 주세요.');
    $('#age').focus();
    return false;
   }else if ($('#email').val() == "") { // 우편번호
    alert('email를 입력해 주세요.');
    $('#email').focus();
    return false;
   }
   
  });
 });
</script>
</head>

<body class="bg-dark">

  <div class="container">
    <div class="card card-register mx-auto mt-5 " >
      <div class="card-header">회원가입</div>
      <div class="card-body">
        <form action="registerok.jsp" method="post" name="joinForm" id="joinForm" class="form-group">
          <div class="form-group">
            <div class="form-row">
              <div class="col-md-12">
                <div class="form-label-group">
                  <input type="text" name="id" id="id" class="form-control" placeholder="id" required="required" autofocus="autofocus">
                  <label for="id">아이디</label>
                </div>
              </div>
            </div>
          </div>
          <div class="form-group">
            <div class="form-label-group">
              <input type="password" name="pwd" id="pwd" class="form-control" placeholder="pwd" required="required">
              <label for="pwd">비밀번호</label>
            </div>
          </div>
        <div class="form-group">
            <div class="form-row">
              <div class="col-md-6">
                <div class="form-label-group">
                  <input type="text" id="mname" name= "mname"class="form-control" placeholder="mname" required="required">
                  <label for="mname">이름</label>
                </div>
              </div>
              <div class="col-md-6">
                <div class="form-label-group">
                  <input type="text" id="age" name="age" class="form-control" placeholder="age" required="required">
                  <label for="age">나이</label>
                </div>
              </div>
            </div>
          </div>
          <div class="form-group">
            <div class="form-label-group">
              <input type="text" name="email" id="email" class="form-control" placeholder="pwd" required="required">
              <label for="email">이메일</label>
            </div>
          </div>
           <div class="form-group">
            <div class="form-row">
              <div class="col-md-6">
                <div class="form-label-group">
                  <input type="radio" name="gender" id="gender" value="여"
									checked>여자
                </div>
              </div>
              <div class="col-md-6">
                <div class="form-label-group">
                   <input type="radio" name="gender"
									id="gender" value="남">남자
                </div>
              </div>
            </div>
          </div>
          <input type="submit" class="btn-primary btn-block" value="회원가입">
        </form>
        <div class="text-center">
          <input type="reset" class="btn-danger btn-block" value="취소" style="
    margin-top: 10px;">

        </div>
      </div>
    </div>
  </div>


</body>

</html>
