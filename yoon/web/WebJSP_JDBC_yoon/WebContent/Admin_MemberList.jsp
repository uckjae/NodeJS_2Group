<%@page import="kr.or.bit.utils.Singleton_Helper"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	
<jsp:include page="./common/CheckAdmin.jsp"></jsp:include>

<!DOCTYPE html>
<html>

<head>
    <meta charset="UTF-8">
    <jsp:include page="./common/HeadTag.jsp"></jsp:include>
    <jsp:include page="./common/DataTableScript.jsp"></jsp:include>
    <style type="text/css">
		.iconColumn {
			width: 100px;
			text-align: center;
		}
</style>
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
                <%
					Connection conn = null;
					PreparedStatement pstmt = null;
					ResultSet rs = null;
					try{
						conn = Singleton_Helper.getConnection("oracle");
						String sql="select id, ip from koreamember";
						pstmt = conn.prepareStatement(sql);
						rs = pstmt.executeQuery(); 
				%>
                <div class="card mb-3">
                    <div class="card-header">
                        <i class="fas fa-user-cog"></i>
                       		회원리스트
                    </div>
                        <div class="card-body">
                            <div class="table-responsive">
                                <table class="table table-bordered" id="dataTable">
                                    <thead>
                                        <tr>
                                            <th>ID</th>
                                            <th>IP</th>
                                            <th class="iconColumn" data-orderable="false">EDIT</th>
                                            <th class="iconColumn" data-orderable="false">DELETE</th>
                                        </tr>
                                    </thead>
                                    <tbody>
                                        <% while(rs.next()){%>
                                        <tr>
                                            <td class="sorting_1">
                                                <a
                                                    href="Admin_MemberDetail.jsp?id=<%= rs.getString("id") %>"><%= rs.getString("id") %></a>
                                            </td>
                                            <td><%=rs.getString("ip")%></td>
                                            <td class="iconColumn">
                                                <a href="Admin_MemberEdit.jsp?id=<%= rs.getString("id") %>"><i
                                                        class="fas fa-user-edit"></i></a>
                                            </td>
                                            <td class="iconColumn">
                                                <a href="#" data-toggle="modal" data-target="#deleteModal" data-delete-id="<%= rs.getString("id") %>" >
                                                <i class="fas fa-trash-alt"></i></a>
                                            </td>
                                        </tr>
                                        <% } %>
                                    </tbody>
                                </table>
                            </div>
                        </div>
                    </div>
                </div>
                <%	
					}catch(Exception e){
						
					}finally{
						Singleton_Helper.close(rs);
						Singleton_Helper.close(pstmt);
					}
				%>
            </div>
        </div>
        
 	<!-- Delete Modal-->
	<jsp:include page="/MemberDeleteModal.jsp"></jsp:include>
</body>

</html>