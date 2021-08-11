<%-- 
    Document   : home
    Created on : May 28, 2021, 8:27:01 AM
    Author     : thoai
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Home</title>
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
                <div class="right">
                    <c:if test="${sessionScope.account == null}">  
                        <div class="requestLogin">
                            <h1>Please <a href="login.jsp" style="text-decoration: underline;">Login</a> before performing this action</h1>
                        </div>
                    </c:if>

                    <c:if test="${sessionScope.account != null}">
                        <h3>Request received by today - ${dateNow}</h3>
                        <table border="1">
                            <thead>
                                <tr>
                                    <th>Department name</th>
                                    <th>Number of request</th>
                                    <th>View detail</th>
                                </tr>
                            </thead>
                           <tbody>
                                <c:forEach var="o" items="${listCurrentDate}">
                                    <tr>
                                        <td class="departName" >${o.departmentName}</td>
                                        <td>${o.numberOfRequest}</td>
                                        <td><a href="ViewController?departmentID=${o.departmentId}&requestTitle&date=${dateNow}">View</a></td>
                                    </tr>  
                                </c:forEach>

                            </tbody>
                            
                            
                        </table>

                        <h3>Request received by last 2 days</h3>
                        <table border="1">
                            <thead>
                                <tr>
                                    <th>Department name</th>
                                    <th>Number of request</th>
                                    <th>View detail</th>
                                </tr>
                            </thead>
                            <tbody>
                                <c:forEach var="o" items="${list2LastDate}">
                                    <tr>
                                        <td class="departName" >${o.departmentName}</td>
                                        <td>${o.numberOfRequest}</td>
                                        <td><a href="ViewController?departmentID=${o.departmentId}&last1day=${last1day}&last2day=${last2day}">View</a></td>
                                    </tr>  
                                </c:forEach>
                            </tbody>
                        </table>
                    </c:if>
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
