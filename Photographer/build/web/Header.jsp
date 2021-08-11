<%-- 
    Document   : Header
    Created on : May 22, 2021, 4:04:56 PM
    Author     : thoai
--%>
<%@ taglib prefix="c"  uri="http://java.sun.com/jsp/jstl/core"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <link href="css/header.css" rel="stylesheet" type="text/css">
    </head>
    <body>
        <div class="nav">
            <div class="nav-inner">
                <ul>
                    <li>
                        <a class="${active=="0"?"actives":""}" href="HomeController"> My font page
                        </a>
                    </li>
                    <c:forEach items="${requestScope.list}" var="i" >
                        <li> <a class="${active == i.id?"actives":""}" href="GalleryController?galeryID=${i.id}">${i.name}</a>
                        </li>
                    </c:forEach>
                    <li>
                        <a class="${active=="4"?"actives":""}" href="ContactController">Contact</a>
                    </li>
                </ul>
            </div>

        </div>
        <div class="header">
            <div class="header-inner">
                <div class="img">
                </div>
                <div class="title">
                    PHOTOGRAPHER
                </div>
                <div class="subtitle">
                    Welcome to this website
                </div>
            </div>

        </div>
    </body>
</html>
