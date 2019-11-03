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

            <!-- Content -->
            <div class="container-fluid">
                <div class="card mb-3">
                    <div class="card-header">
                        <i class="fas fa-user-plus"></i>
                        회원가입
                    </div>
                    <div class="card-body">
                        <div class="table-responsive">
                            <div id="dataTable_wrapper" class="dataTables_wrapper dt-bootstrap4">
                                <div class="row">
                                    <div class="col-sm-12">
                                        <form action="RegisterPageOk.jsp" method="post">
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
                                                <div class="form-label-group">
                                                    <input type="text" id="name" name="name" class="form-control"
                                                        placeholder="Name" required="required">
                                                    <label for="name">Name</label>
                                                </div>
                                            </div>
                                            <div class="form-group">
                                                <div class="form-label-group">
                                                    <input type="email" id="email" name="email" class="form-control"
                                                        placeholder="Email" required="required">
                                                    <label for="email">Email</label>
                                                </div>
                                            </div>
                                            <div class="form-group">
                                                <div class="form-row">
                                                    <div class="col-md-6">
                                                        <div class="form-label-group">
                                                            <input type="number" id="age" name="age" class="form-control"
                                                        placeholder="Age11" required="required">
                                                    <label for="age">Age</label>
                                                        </div>
                                                    </div>
                                                    <div class="col-md-6" >
                                                        <div class="form-radio">
                                                            Gender : &nbsp;
                                                            <div
                                                                class="custom-control custom-radio custom-control-inline">
                                                                <input type="radio" class="custom-control-input"
                                                                    id="gender" name="gender" value="남">
                                                                <label class="custom-control-label"
                                                                    for="gender">남</label>
                                                            </div>
                                                            <div
                                                                class="custom-control custom-radio custom-control-inline">
                                                                <input type="radio" class="custom-control-input"
                                                                    id="gender2" name="gender" value="여">
                                                                <label class="custom-control-label"
                                                                    for="gender2">여</label>
                                                            </div>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="form-row">
                                            	<div class="col-md-6">
                                                    <input type="reset" class="btn btn-danger btn-block" value="Cancel">
                                                </div>
                                                <div class="col-md-6">
                                                    <input type="submit" class="btn btn-primary btn-block"
                                                        value="Register">
                                                </div>
                                            </div>
                                        </form>
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