<%@page import="kr.or.bit.utils.Singleton_Helper"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<jsp:include page="./common/CheckAdmin.jsp"></jsp:include>
<%
request.setCharacterEncoding("UTF-8");
String name = request.getParameter("search");
Connection conn = null;
PreparedStatement pstmt = null;
ResultSet rs = null;
try {
	conn = Singleton_Helper.getConnection("oracle");
	String sql = "select count(*) from koreamember where name like ? ";
	String sql2 = "select id, name, email from koreamember where name like('%" + name + "%')";
	pstmt = conn.prepareStatement(sql);
	pstmt.setString(1, '%' + name + '%');

	rs = pstmt.executeQuery();
	int rowcount =0;
	if (rs.next()) {
		rowcount= rs.getInt(1); // 조회 건 수 
	}
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
                                                <th>ID</th>
                                                <th>NAME</th>
                                                <th>EMAIL</th>
                                            </tr>
                                            <%
											 	if(rowcount > 0){
											 		pstmt = conn.prepareStatement(sql2);
											 		rs=pstmt.executeQuery();
											 		while(rs.next()){
											 			String id= rs.getString("id");
											 			String mname= rs.getString("name");
											 			String email= rs.getString("email");
			 								%>
	                                            <tr>
	                                                <td><%=id %></td>
	                                                <td><%=mname %></td>
	                                                <td><%=email %></td>
	                                            </tr>
                                            <%
										 		}
										 		out.print("<tr>");
													out.print("<td colspan='3'>");
														out.print("<b>["+name+"] 조회결과 "+rowcount+"건 조회</b>");
													out.print("</td>");
												out.print("</tr>");
										 	}else{ // 조회된 건 수가 없을 경우
										 		out.print("<tr>");
													out.print("<td colspan='3'>");
														out.print("<b>["+name+"] 조회결과가 없습니다.");
													out.print("</td>");
												out.print("</tr>");
										 	}
										%>
                                        </table>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>

                <table style="width: 400px;height: 100px;margin-left: auto;margin-right: auto">

                </table>
                <a href="Admin_MemberList.jsp">회원 목록 페이지</a>
                <%
					} catch (Exception ex) {
				
					} finally {
						Singleton_Helper.close(rs);
						Singleton_Helper.close(pstmt);
					}
				%>
            </div>
        </div>
    </div>
</body>

</html>