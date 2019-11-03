<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
 <div id="wrapper">

    <!-- Sidebar -->
    <ul class="sidebar navbar-nav">   
      <li class="nav-item dropdown">
        <a class="nav-link dropdown-toggle" href="#" id="pagesDropdown" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
          <i class="fas fa-fw fa-folder"></i>
          <span>Pages</span>
        </a>
        <div id="content-wrapper">
		<div id="container-fluid"></div>
	</div>
        <div class="dropdown-menu" aria-labelledby="pagesDropdown">
          <h6 class="dropdown-header">Login Screens:</h6>
          <a class="dropdown-item" href="Login.jsp">로그인</a>
          <a class="dropdown-item" href="register.jsp">회원가입</a>
          <%
			String id = null;
			id = (String)session.getAttribute("userid"); 
			if(id !=null) {
			if(id.equals("admin")){ %>
          <a class="dropdown-item" href="list.jsp">회원관리</a>
         <%	} 
			}else {} %>
          <div class="dropdown-divider"></div>
          <h6 class="dropdown-header">Other Pages:</h6>
          <a class="dropdown-item" href="404.html">404 Page</a>
        </div>
      </li>
    
      
    </ul>
   </div>
   
   