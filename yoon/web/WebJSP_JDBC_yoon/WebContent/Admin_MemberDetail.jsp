<%@page import="kr.or.bit.utils.Singleton_Helper"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<jsp:include page="./common/CheckAdmin.jsp"></jsp:include>
<%
	request.setCharacterEncoding("UTF-8");
	String id= request.getParameter("id");

	Connection conn = null;
	PreparedStatement pstmt = null;
	ResultSet rs = null;
	
	try {
		conn = Singleton_Helper.getConnection("oracle");
		String sql = "select id, pwd, name, age, trim(gender), email from koreamember where id=?";
		pstmt = conn.prepareStatement(sql);
		pstmt.setString(1, id);
		
		rs = pstmt.executeQuery();
		rs.next(); // 1건의 데이터가 있다는 전제
%>
<!DOCTYPE html>
<html>

<head>
    <meta charset="UTF-8">
    <jsp:include page="./common/HeadTag.jsp"></jsp:include>
</head>

<body id="page-top">
    <!-- Top -->
    <jsp:include page="./common/Top.jsp"></jsp:include>
    <div id="wrapper">
        <!-- Left Menu -->
        <jsp:include page="./common/Left.jsp"></jsp:include>

        <div id="content-wrapper">
            <!-- !! Content !! -->
            <div class="container-fluid">
                <div class="card mb-3">
                    <div class="card-header">
                      <i class="fas fa-user-edit"></i>
                        회원 정보 수정 [<b><%=rs.getString("id") %></b>]
                    </div>
                    <div class="card-body">
                        <div class="table-responsive">
                            <div id="dataTable_wrapper" class="dataTables_wrapper dt-bootstrap4">
                                <div class="row">
                                    <div class="col-sm-12">
                                        <form action="Admin_MemberEditOk.jsp" method="post">
                                            <div class="form-group">
                                                <div class="form-label-group">
                                                    <input type="text" id="id" name="id" class="form-control" value="<%= rs.getString("id")%>"
                                                        placeholder="ID" required="required" readonly>
                                                    <label for="id">ID</label>
                                                </div>
                                            </div>
                                            <div class="form-group">
                                                <div class="form-label-group">
                                                    <input type="password" id="pwd" name="pwd" class="form-control"
                                                   		 value="<%= rs.getString("pwd")%>" readonly
                                                        placeholder="Password" required="required">
                                                    <label for="pwd">Password</label>
                                                </div>
                                            </div>
                                            <div class="form-group">
                                                <div class="form-label-group">
                                                    <input type="text" id="name" name="name" class="form-control" readonly
                                                    	value="<%= rs.getString("name")%>"
                                                        placeholder="Name" required="required">
                                                    <label for="name">Name</label>
                                                </div>
                                            </div>
                                            <div class="form-group">
                                                <div class="form-label-group">
                                                    <input type="number" id="age" name="age" class="form-control"
                                                    	value="<%= rs.getString("age")%>" readonly
                                                        placeholder="Age" required="required">
                                                    <label for="age">Age</label>
                                                </div>
                                            </div>
                                            <div class="form-group">
                                                <div class="form-label-group">
                                                    <input type="email" id="email" name="email" class="form-control"
                                                    	value="<%= rs.getString("email")%>" readonly
                                                        placeholder="Email" required="required">
                                                    <label for="email">Email</label>
                                                </div>
                                            </div>
                                            <div class="form-group">
                                                <label>
                                                    Gender :
                                                        <input type="radio" id="gender" name="gender" value="남" disabled
                                                        <%  if(rs.getString(5).equals("남")){ %>
                                                        	checked
                                                        <%} %>
                                                        > 남
                                                        <input type="radio" id="gender" name="gender" value="여" disabled
                                                        <%  if(rs.getString(5).equals("여")){ %>
                                                        	checked
                                                        <%} %>
                                                        > 여
                                                </label>
                                            </div>
                                           <input type="button" class="btn btn-primary btn-block" value="Ok"
                                                    		  onClick="location.href='Admin_MemberList.jsp'"> 
                                        </form>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</body>
<%
	} catch (Exception ex) {

	}finally{
		Singleton_Helper.close(rs);
		Singleton_Helper.close(pstmt);
	}
%>

</html>