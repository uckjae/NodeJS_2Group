  <%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
  <nav class="navbar navbar-expand navbar-dark bg-dark static-top">

    <a class="navbar-brand mr-1" href="index.jsp">Homepage</a>

    <button class="btn btn-link btn-sm text-white order-1 order-sm-0" id="sidebarToggle" href="#">
      <i class="fas fa-bars"></i>
    </button>

    <!-- Navbar -->
    <ul class="navbar-nav ml-auto ml-md-0">
		<li > <a class="dropdown-item" href="#" style="color:white">Main</a></li>
		<li > <a class="dropdown-item" href="login.jsp" style="color:white">Login</a></li>
		<li > <a class="dropdown-item" href="register.jsp" style="color:white">Register</a></li>
		<li > <a class="dropdown-item" href="#" style="color:white">Intro</a></li>
		<li > <a class="dropdown-item" href="#" style="color:white">Intro</a></li>
    

 <% if(session.getAttribute("userid") != null){
	out.print("<li class='dropdown-item' style='color:white;'>["+session.getAttribute("userid") +"]님 로그인 상태입니다 </li>");
	out.print("&nbsp;&nbsp;");
	out.print("<li ><a class='dropdown-item' href='logout.jsp' style='color:white'>[로그아웃]</a></li>");
}else {
	out.print("<li > <a class='dropdown-item' style='color:white'>[로그인하지 않으셨습니다]</a></li>");
	out.print("&nbsp;&nbsp;");
	out.print("<li ><a class='dropdown-item' href='login.jsp' style='color:white'>[로그인]</a></li>");
}
%>
</ul>
    </nav>