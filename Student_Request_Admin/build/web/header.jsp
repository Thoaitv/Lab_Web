<%-- 
    Document   : header
    Created on : May 28, 2021, 8:27:13 AM
    Author     : thoai
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<div class="header">
    <div class="head-name">
        <p class="university">FPT Education System</p>
        <c:if test="${requestID == null}">
            <p class="teacher">Teacher Control Panel</p>
        </c:if>
        <c:if test="${requestID != null}">
            <p class="teacher">Student Control Panel</p>
        </c:if>
    </div>
</div>

