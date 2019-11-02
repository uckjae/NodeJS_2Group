<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <body id="page-top">
	
<nav class="navbar navbar-expand navbar-dark bg-dark static-top">

    <a class="navbar-brand mr-1" href="Main.jsp">Team 2</a>

    <button class="btn btn-link btn-sm text-white order-1 order-sm-0" id="sidebarToggle" href="#">
      <i class="fas fa-bars"></i>
    </button>
    
 <!-- Navbar Search -->
  <form class="d-none d-md-inline-block form-inline ml-auto mr-0 mr-md-3 my-2 my-md-0">
      <div class="input-group">
        <%
					String id = null;
					id = (String)session.getAttribute("userid");
					
					if(id !=null) {
						//회원
						out.print( "<p style='color:white';>" + id + "회원님 방가방가 ^^7 <br></p> "  );
					
					}else{
						//로그인 하지 않은 사용자
						//메인 페이지는 회원만 볼 수 있다.
						out.print("<p style='color:white';>사이트 방문을 환영합니다. ^^7 <br> 회원가입좀 하지</p> ");
						
					}
				%>
        <div class="input-group-append">
          
          
        </div>
      </div>
    </form>

   

  </nav>