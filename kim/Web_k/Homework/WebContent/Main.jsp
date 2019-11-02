<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
 <jsp:include page="./common/Basic.jsp"></jsp:include>
<title>Insert title here</title>
</head>
<body>
<!-- nav 바 -->

<jsp:include page="./nav/nav_include.jsp"></jsp:include>

<!-- side 바 -->
<jsp:include page="./side/left.jsp"></jsp:include>
	
 <!-- footer -->
 <jsp:include page="./foot/footer.jsp"></jsp:include>    

 <!-- modal  --> 
 <jsp:include page="./modal/Logout.jsp"></jsp:include>
</body>
</html>