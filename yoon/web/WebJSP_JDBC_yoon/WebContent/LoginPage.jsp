<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
                        <i class="fas fa-user-check"></i>
                        로그인
                    </div>
                    <div class="card-body">
                        <div class="table-responsive">
                            <div id="dataTable_wrapper" class="dataTables_wrapper dt-bootstrap4">
                                <div class="row">
                                    <div class="col-sm-12">
                                        <form action="LoginPageOk.jsp" method="post">
                                            <div class="form-group">
                                                <div class="form-label-group">
                                                    <input type="text" id="id" name="id" class="form-control"
                                                        placeholder="ID" required="required" autofocus="autofocus">
                                                    <label for="id">ID</label>
                                                </div>
                                            </div>
                                            <div class="form-group">
                                                <div class="form-label-group">
                                                    <input type="password" id="pwd" name="pwd" class="form-control"
                                                        placeholder="Password" required="required">
                                                    <label for="pwd">Password</label>
                                                </div>
                                            </div>
                                            <div class="form-group">
                                                <div class="checkbox">
                                                    <label>
                                                        <input type="checkbox" value="remember-me"> Remember Password
                                                    </label>
                                                </div>
                                            </div>
                                            <input type="submit" value="Login" class="btn btn-primary btn-block">
                                        </form>
                                        <div class="text-center">
                                            <a class="d-block small mt-3" href="RegisterPage.jsp">Register an
                                                Account</a>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>



            <!-- Bottom -->
            <jsp:include page="./common/Bottom.jsp"></jsp:include>
        </div>
    </div>
</body>

</html>