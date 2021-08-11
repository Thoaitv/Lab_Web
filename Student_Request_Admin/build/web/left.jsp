<%-- 
    Document   : left
    Created on : May 28, 2021, 8:27:56 AM
    Author     : thoai
--%>

<%@page import="java.util.Date"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<div class="left">
    <div class="option">
        <c:if test="${sessionScope.account == null}">
            <p><a href="login.jsp">Login</a></p>
        </c:if>
        <c:if test="${sessionScope.account != null}">
            <p><span style="color: #575758;">Welcome ${sessionScope.account.username}</span>, <a href="LogoutController">Log out</a></p>
        </c:if>
    </div>
    <div class="option">
        <p><a href="HomeController">Home</a></p>
    </div>
    <div class="option">
        <p><a href="ViewController?departmentID=1&requestTitle=&date=">View requests</a></p> 
    </div>
    <div class="option">
        <p><a href="solve.jsp">Solve requests</a></p>
    </div>
    <div class="option">
        <p>
            <% SimpleDateFormat formater = new SimpleDateFormat("EEEE dd/MM/yyyy");
                Date now = new Date();
                String dateWeekDay = formater.format(now); %>
            Today is: <% out.print(dateWeekDay);%>
        </p>
    </div>
</div>