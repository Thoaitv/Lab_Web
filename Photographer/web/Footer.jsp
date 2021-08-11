<%-- 
    Document   : Footer
    Created on : May 22, 2021, 5:26:26 PM
    Author     : thoai
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>'
<%@ taglib prefix="c"  uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <link href="css/footer.css" rel="stylesheet" type="text/css"/>
    </head>
    <body>
        <div class="footer">
            <div class="footer-link">
                <a href="#">Created with SimpleSite </a>
                <c:forEach items="${totalViews}" var="i" varStatus="loop">
                    <span class="footer-page-counter-item">${i}</span>
                </c:forEach>
            </div>
        </div>
    </body>
</html>
