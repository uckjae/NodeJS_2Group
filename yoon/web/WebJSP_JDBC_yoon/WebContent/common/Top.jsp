<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> 

<%
/*
 String infoStr="";
boolean isLogin = false;
boolean isAdmin = false;
  if(session.getAttribute("userid")!=null){
	  infoStr=(String)session.getAttribute("userid");
	  isLogin=true;
	  if(infoStr.equals("admin")){
		  isAdmin=true;
	  }
	}else{
		infoStr="로그인해주세요";
	}
  */
 %>

<c:set var="userid" value="${sessionScope.userid}"/>
<c:choose>
	<c:when test="${userid != null}">
		<c:set var="isLogin" value="true"/> 
			<c:set var="infostr" value="${userid}"/>
			<c:choose>
				<c:when test="${userid == 'admin'}">
					<c:set var="isAdmin" value="true"/> 
				</c:when>
				<c:otherwise>
					<c:set var="isAdmin" value="false"/> 
				</c:otherwise>
			</c:choose>	
	</c:when>
	<c:otherwise>
		<c:set var="infostr" value="로그인해주세요."/>
		<c:set var="isLogin" value="false"/> 
	</c:otherwise>
</c:choose>


<!DOCTYPE html>
<html>
<body>
    <nav class="navbar navbar-expand navbar-dark bg-dark static-top">
    <button class="btn btn-link btn-sm text-white order-1 order-sm-0" id="sidebarToggle" href="#">
            <i class="fas fa-bars"></i>
        </button>
        <a class="navbar-brand mr-1" href="MainPage.jsp">TEAM 🤞</a>
        <!-- Navbar -->
        <ul class="navbar-nav ml-auto mr-0 mr-md-3 my-2 my-md-0">
            <li class="nav-item dropdown no-arrow">
                <a class="nav-link dropdown-toggle" href="#" id="userDropdown" role="button" data-toggle="dropdown"
                    aria-haspopup="true" aria-expanded="true">
                    <i class="fas fa-user-circle fa-fw"></i>
                    <span id="info">${infostr} </span>
                </a>
                <div class="dropdown-menu dropdown-menu-right" aria-labelledby="userDropdown">
                
                	<c:if test="${isAdmin == 'true'}">
                    <a class="dropdown-item" href="Admin_MemberList.jsp">Member</a>
                    <div class="dropdown-divider"></div>
                     </c:if>
                     
                     <c:choose>
                     	<c:when test ="${isLogin == 'true'}"> 
                     	 	<a class="dropdown-item" data-toggle="modal" data-target="#logoutModal">Logout</a>
                     	</c:when>
                     	<c:otherwise>
                     	 	<a class="dropdown-item" href="LoginPage.jsp">Login</a>
                     	</c:otherwise>                     
                     </c:choose>
                </div>
            </li>
        </ul>
    </nav>
    
    <!-- Logout Modal-->
	<jsp:include page="../LogoutModal.jsp"></jsp:include>
</body>

</html>