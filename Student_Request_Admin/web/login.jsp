<%-- 
    Document   : login
    Created on : May 28, 2021, 8:27:47 AM
    Author     : thoai
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Login</title>
        <link href="css/style.css" rel="stylesheet" type="text/css"/>
    </head>
    <body>
        <!--container start-->
        <div class="container">
            <!--header start-->
            <jsp:include page="header.jsp"/>
            <!--header end-->

            <!--main start-->
            <div class="main">
                <!--left side start-->
                <jsp:include page="left.jsp"/>
                <!--left side end-->

                <!--right side start-->
                <div class="login">
                    <h1>Member Login</h1>
                    <p>Using your username and password.</p>
                    <c:if test="${userMessage!=null}">
                        <p class="text-danger">${userMessage}</p>
                    </c:if>
                    <c:if test="${passMessage!=null}">
                        <p class="text-danger">${passMessage}</p>
                    </c:if>
                    <form action="LoginController" method="POST">
                        <label>Username</label>
                        <input class="margin-bottom-15 ${userMessage==null?"":"invalid"}" type="text" name="username" value="${username}" required="" /><span style="margin-left: 5px;" class="color-red">(*)</span>
                        <br/><label>Password</label>
                        <input class="margin-top-15 ${passMessage==null&&userMessage==null?"":"invalid"}" type="password" name="password" value="" required=""/><span style="margin-left: 5px;" class="color-red">(*)</span>
                        <br/><input class="gradient" style="width: 80px; margin-top: 20px;" type="submit" value="Log In" />
                        <br/><p>The field <span class="color-red">(*)</span> is required</p>
                    </form>
                </div>
                <!--right side end-->
            </div>
            <!--main end-->

            <!--footer start-->
            <jsp:include page="footer.jsp"/>
            <!--footer end-->
        </div>
        <!--container end-->
    </body>
</html>
