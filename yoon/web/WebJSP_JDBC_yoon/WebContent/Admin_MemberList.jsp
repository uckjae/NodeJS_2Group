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
                            <div id="dataTable_wrapper" class="dataTables_wrapper dt-bootstrap4">
                                <div class="row">
                                    <div class="col-sm-12">
                                        <table class="table table-hover">
                                         	<tr class="table-primary">
                                         		<th>ID</th><th>IP</th><th>EDIT</th><th>DELETE</th>
                                         	</tr>
                                            <% while(rs.next()){ %>
                                            <tr>
                                                <td >
                                                    <a href="Admin_MemberDetail.jsp?id=<%= rs.getString("id") %>"><%= rs.getString("id") %></a>
                                                </td>
                                                <td ><%=rs.getString("ip")%></td>
                                                 <td>
                                                    <a href="Admin_MemberEdit.jsp?id=<%= rs.getString("id") %>"><i class="fas fa-user-edit"></i></a>
                                                </td>
                                                <td>
                                                    <a href="Admin_MemberDelete.jsp?id=<%= rs.getString("id") %>"><i class="fas fa-trash-alt"></i></a>
                                                </td>
                                            </tr>
                                            <% } %>
                                        </table>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                
                <hr />
                
                <form action="Admin_MemberSearch.jsp" method="post">
                    <div class="input-group">
                        <input type="text" class="form-control" placeholder="Search for..." aria-label="Search"
                            aria-describedby="basic-addon2" name="search">
                        <div class="input-group-append">
                            <button class="btn btn-primary" type="submit">
                                <i class="fas fa-search"></i>
                            </button>
                        </div>
                    </div>
                </form>
                <hr />
                <%	
					}catch(Exception e){
						
					}finally{
						Singleton_Helper.close(rs);
						Singleton_Helper.close(pstmt);
					}
				%>
            </div>
        </div>
    </div>
</body>

</html>