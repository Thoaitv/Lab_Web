<%-- 
    Document   : viewRequest
    Created on : May 28, 2021, 8:39:49 AM
    Author     : thoai
--%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
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
                <div class="view-request">
                    <c:if test="${sessionScope.account == null}">
                        <div class="requestLogin">
                            <h1>Please <a href="login.jsp" style="text-decoration: underline;">Login</a> before performing this action</h1>
                        </div>
                    </c:if>
                    <c:if test="${sessionScope.account != null}">
                        <h1 style="margin-bottom: 5px;">View request</h1>
                        <div class="wrap-view-request">
                            <!--search start-->
                            <form action="ViewController">
                                <div class="search">
                                    <label class="margin-top-5 text-bold">Select department</label>
                                    <jsp:useBean id="c" class="dao.DAO"/> 
                                    <select class="margin-bottom-20 margin-top-5 select" name="departmentID">
                                        <c:forEach var="o" items="${c.allDepartment}">
                                            <option ${o.id == departmentID?"selected":""} value="${o.id}">${o.name}</option>
                                        </c:forEach>
                                    </select>
                                    <br><label class="margin-bottom-20 text-bold">or Enter request title</label>
                                    <input class="margin-bottom-20" style="width: 192px;" type="text" name="requestTitle" value="${title}" />
                                    <input type="hidden" name="date" value=""/>
                                    <input style="width: 50px;" type="submit" value="View" />
                                </div>
                            </form>
                            <!--search end-->
                            <div class="list-request">
                                <c:if test="${listRequest == null}">
                                    <div class="not-found"><h2>Not Found</h2></div>
                                </c:if>
                                <c:if test="${listRequest != null}">
                                    ${check}
                                    <table border="1">
                                        <thead>
                                            <tr>
                                                <th style="width: 138.4px;">Request title</th>
                                                <th style="width: 138.4px;">Date created</th>
                                                <th style="width: 138.4px;">Close created</th>
                                                <th>Status</th>
                                                <th style="width: 138.4px;">Report to</th>
                                                <th>Detail</th>
                                            </tr>
                                        </thead>
                                        <tbody>
                                            <c:forEach var="o" items="${listRequest}">
                                                <tr>
                                                    <td class="departName">${o.title}</td>
                                                    <td>${o.dateCreated}</td>
                                                    <td>${o.getDateCloseFormat()}</td>
                                                    <td class="text-center">
                                                        <c:choose>
                                                            <c:when test="${o.status =='Approved'}">
                                                                <span class="color-blue text-bold">${o.status}</span>
                                                            </c:when> 
                                                            <c:when test="${o.status =='Rejected'}">
                                                                <span class="color-red text-bold">${o.status}</span>
                                                            </c:when> 
                                                            <c:otherwise>${o.status}</c:otherwise>
                                                        </c:choose>
                                                    <td class="text-center">${o.toDepartment}</td>
                                                    <td class="text-bold"><a href="SolveController?requestID=${o.id}">${o.status!="in progress"?"View":"Solve"}</a></td>

                                                    </td>
                                                </tr>
                                            </c:forEach>
                                        </tbody>
                                    </table>
                                </c:if>
                            </div>
                        </div>
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
