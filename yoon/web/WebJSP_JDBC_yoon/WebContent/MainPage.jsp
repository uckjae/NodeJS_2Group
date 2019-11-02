<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>

<head>
    <meta charset="UTF-8">
    <jsp:include page="./common/HeadTag.jsp"></jsp:include>
    <style type="text/css">
        .main {
            background-image: url(images/main.gif);
            background-repeat: no-repeat;
            height: 100%;
            background-size: cover;
        }

        .headLine {
            font-weight: 700;
            text-align: center;

            color: white;
            padding-top: 18%;
            padding-top: 150px;
            padding-bottom: 100px;
            font-style: italic;
            font-family: 'Droid Serif', -apple-system, BlinkMacSystemFont, 'Segoe UI', Roboto, 'Helvetica Neue', Arial, sans-serif, 'Apple Color Emoji', 'Segoe UI Emoji', 'Segoe UI Symbol', 'Noto Color Emoji';

        }
    </style>
</head>

<body id="page-top">
    <!-- Top -->
    <jsp:include page="./common/Top.jsp"></jsp:include>
    <div id="wrapper">
        <!-- Left Menu -->
        <jsp:include page="./common/Left.jsp"></jsp:include>

        <div id="content-main">
            <div class="container-fluid main">
                <h1 class="headLine">Welcome Team2 World</h1>
            </div>

            <!-- Bottom -->
            <jsp:include page="./common/Bottom.jsp"></jsp:include>
        </div>
    </div>
</body>

</html>