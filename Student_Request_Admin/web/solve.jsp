<%-- 
    Document   : test
    Created on : May 28, 2021, 5:26:10 PM
    Author     : thoai
--%>
<%@page import="java.util.Date"%>
<%@page import="java.text.SimpleDateFormat"%>
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

                <div class="solve-request">
                    <c:if test="${sessionScope.account == null}">
                        <div class="requestLogin">
                            <h1>Please <a href="login.jsp" style="text-decoration: underline;">Login</a> before performing this action</h1>
                        </div>
                    </c:if>
                    <c:if test="${sessionScope.account != null}">
                        <h1 style="margin-bottom: 5px;" >Request ID:${request.id}</h1>
                        <form action="AddSolveController" method="GET">
                            <input type="hidden" name="requestID" value="${request.id}"/>
                            <input type="hidden" name="account" value="${sessionScope.account.id}"/>
                            <h3 class="text-center"><span class="text-bold color-green">${mesage}</span></h3>
                            <table >
                                <tbody>
                                    <tr>
                                        <td class="width-30 text-right padding-right-5">Request to department</td>
                                        <td class="width-70"><input class="boder-radius-5 readonly" type="text" name="department" value="${request.toDepartment}" readonly=""/></td>
                                    </tr>
                                    <tr>
                                        <td class="width-30 text-right padding-right-5">Student ID</td>
                                        <td class="width-70"><input class="boder-radius-5 readonly" type="text" name="studentID" value="${request.studentID}" readonly=""/></td>
                                    </tr>
                                    <tr>
                                        <td class="width-30 text-right padding-right-5">Student name</td>
                                        <td class="width-70"><input class="boder-radius-5 readonly" type="text" name="studentName" value="${request.studentName}" readonly=""/></td>
                                    </tr>
                                    <tr>
                                        <td class="width-30 text-right padding-right-5">Date created</td>
                                        <td class="width-70"><input class="boder-radius-5 readonly" type="text" name="dateCreated" value="${request.dateCreated}" readonly=""/></td>
                                    </tr>
                                    <tr>
                                        <td class="width-30 text-right padding-right-5">Request title</td>
                                        <td class="width-70"><input class="boder-radius-5 readonly" type="text" name="title" value="${request.title}" readonly=""/></td>
                                    </tr>
                                    <tr>
                                        <td class="width-30 text-right padding-right-5"> <span class="top-right">Request content</span></td>
                                        <td class="width-70"><textarea class="boder-radius-5 readonly" name="content" rows="5" cols="50" readonly="">${request.content}</textarea></td>
                                    </tr>
                                    <tr>
                                        <td class="width-30 text-right padding-right-5">Request state</td>
                                        <td class="width-70" >
                                            <input style="width: 20px;" type="radio" name="requestState" value="Approved" ${status =='Approved'?"checked":""} ${checkSolved!=null?"disabled":""} ${requestID==null?"disabled":""}/>
                                            <span class="color-blue">Approved</span>
                                            <input style="width: 20px"  type="radio" name="requestState" value="Rejected" ${status =='Rejected'?"checked":""} ${checkSolved!=null?"disabled":""} ${requestID==null?"disabled":""}/>
                                            <span class="color-red">Rejected</span>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td class="width-30 text-right padding-right-5">Close date</td>
                                        <% SimpleDateFormat formater = new SimpleDateFormat("dd/MM/yyyy");
                                            Date now = new Date();
                                            String today = formater.format(now);%>
                                        <td class="width-70">
                                            <c:if test="${request.getDateCloseFormat() == 'N/A'}">
                                                <input class="boder-radius-5 readonly" type="text" name="closeDate" value="<% out.print(today);%>" readonly=""/>
                                            </c:if>
                                            <c:if test="${request.getDateCloseFormat() != 'N/A'}">
                                                <input class="boder-radius-5 readonly" type="text" name="closeDate" value="${request.getDateCloseFormat()}" readonly=""/>
                                            </c:if>  
                                        </td>

                                    </tr>
                                    <tr>
                                        <td class="width-30 text-right padding-right-5">Solve by</td>
                                        <td class="width-70"><input class="boder-radius-5 readonly" type="text" value="${sessionScope.account.username}" /></td>
                                    </tr>
                                    <tr>
                                        <td class="width-30 text-right padding-right-5"> <span class="top-right">School's solution</span></td>
                                        <td class="width-70"><textarea class="boder-radius-5 ${solution!=null?"readonly":""}" name="solution" rows="5" cols="50" ${solution!=null?"readonly":""} ${requestID==null?"disabled":""}>${solution}</textarea></td>
                                    </tr>
                                    <tr>
                                        <td class="width-30 text-right padding-right-5"></td>
                                        <td class="width-70 "><input class="${checkSolved!=null?"disable":"boder-radius-5 gradient2"}" style="width: 55px; height: 30px;margin-left: 120px;" type="submit" value="Save" ${checkSolved!=null?"disabled":""} ${requestID==null?"disabled":""}/></td>
                                    </tr>
                                </tbody>
                            </table>

                        </form>
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
