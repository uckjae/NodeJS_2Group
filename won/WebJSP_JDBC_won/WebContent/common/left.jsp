<%@ page language="java" contentType="text/html; charset=UTF-8" 
	pageEncoding="UTF-8"%>
<!-- Sidebar -->
    <ul class="sidebar navbar-nav">
      <li class="nav-item active">
        <a class="nav-link" href="Main.jsp">
          <i class="fas fa-fw fa-tachometer-alt"></i>
          <span>Dashboard</span>
        </a>
      </li>    
      <li class="nav-item">
        <a class="nav-link" href="Main_Login.jsp">
          <i class="fas fa-fw fa-sign-in-alt"></i>
          <span>Login</span></a>
      </li>
      <li class="nav-item">
        <a class="nav-link" href="Main_register.jsp">
          <i class="fas fa-fw fa-user-plus"></i>
          <span>register</span></a>
      </li>
      <li class="nav-item">
        <a class="nav-link" href="forgot-password.html">
          <i class="fas fa-fw fa-chart-area"></i>
          <span>forgot-password</span></a>
      </li>
      <%
      	String id = null;
      	id = (String)session.getAttribute("userid");
      	
      	if(id != null){
      		if(id.equals("admin@admin.com")){
      			out.print("<li class='nav-item'>");
      			out.print("<a class='nav-link' href='Main_Member_list.jsp'>");
      			out.print("<i class='fas fa-fw fa-chart-area'></i>");
      			out.print("<span>회원관리</span></a>");
      			out.print("</li>");
      		}
      	}
      %>
    </ul>