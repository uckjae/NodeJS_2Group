<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
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
  %>
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
                    <span id="info"><%=infoStr %></span>
                </a>
                <div class="dropdown-menu dropdown-menu-right" aria-labelledby="userDropdown">
                	<%if(isAdmin){ %>
                    <a class="dropdown-item" href="Admin_MemberList.jsp">Member</a>
                    <div class="dropdown-divider"></div>
                     <%} %>
                     <%if(isLogin){ %>
                    <a class="dropdown-item" data-toggle="modal" data-target="#logoutModal">Logout</a>
                      <%}else{%>
                      <a class="dropdown-item" href="LoginPage.jsp">Login</a>
                      <%} %>
                </div>
            </li>
        </ul>
    </nav>
    
    <!-- Logout Modal-->
	<jsp:include page="../LogoutModal.jsp"></jsp:include>
</body>

</html>