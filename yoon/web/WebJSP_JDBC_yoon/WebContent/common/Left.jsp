<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	boolean isLogin=false;
	boolean isAdmin=false;
	if(session.getAttribute("userid")!=null ){
		isLogin=true;
		if(session.getAttribute("userid").equals("admin"))
			isAdmin = true ;
	}
%>
<!DOCTYPE html>
<html>

<head>
    <meta charset="UTF-8">
        <jsp:include page="HeadTag.jsp"></jsp:include>
</head>

<body>
    <!-- Sidebar -->
    <ul class="sidebar navbar-nav">
        <li class="nav-item active">
            <a class="nav-link" href="MainPage.jsp">
                <i class="fas fa-fw fa-tachometer-alt"></i>
                <span>Main</span>
            </a>
        </li>
        <%if(isLogin){ %>
        <li class="nav-item">
            <a class="nav-link" href="Logout.jsp">
                <i class="fas fa-fw fa-chart-area"></i>
                <span>Logout</span></a>
        </li>
        <%} else{%>
         <li class="nav-item">
            <a class="nav-link" href="LoginPage.jsp">
                <i class="fas fa-fw fa-chart-area"></i>
                <span>Login</span></a>
        </li>
        <li class="nav-item">
            <a class="nav-link" href="RegisterPage.jsp">
                <i class="fas fa-fw fa-table"></i>
                <span>Register</span></a>
        </li>
        <%}%>
        
        <%if(isAdmin){%>
        <li class="nav-item dropdown">
            <a class="nav-link dropdown-toggle" href="#" id="pagesDropdown" role="button" data-toggle="dropdown"
                aria-haspopup="true" aria-expanded="false">
                <i class="fas fa-fw fa-folder"></i>
                <span>Admin</span>
            </a>
            <div class="dropdown-menu" aria-labelledby="pagesDropdown">
                <h6 class="dropdown-header">Login Screens:</h6>
                <a class="dropdown-item" href="Admin_MemberList.jsp">Member</a>
            </div>
        </li>
        <%}%>
    </ul>
</body>
</html>