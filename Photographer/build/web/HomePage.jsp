<%-- 
    Document   : HomePage
    Created on : May 23, 2021, 9:52:11 AM
    Author     : thoai
--%>
<%@ taglib prefix="c"  uri="http://java.sun.com/jsp/jstl/core"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <link href="css/home.css" rel="stylesheet" type="text/css">

    </head>
    <body>

        <div class="container">
            <jsp:include page="Header.jsp"/>
            <div class="main">
                <div class="left">
                    <div class="image">
                        <img src="${requestScope.contact.image_main}" alt="First">
                    </div>
                    <div class="description">
                        Lorem ipsum dolor sit amet
                    </div>
                    <div class="content">
                        <ul>
                            <c:forEach items="${list}" var="i" >
                                <li class="span4">
                                    <div class="image">
                                        <img src="${i.image}">
                                    </div>
                                    <h4>
                                        <a href="GalleryController?galeryID=${i.id}">${i.title}</a>
                                    </h4>
                                    <p>${i.description}</p>
                                </li>

                            </c:forEach>
                        </ul>
                    </div>
                    <div class="about">
                        <h3>About me</h3>
                    </div>
                    <div class="about-detail">
                        ${requestScope.contact.about}
                    </div>
                </div>
                <div class="main-right">
                    <jsp:include page="Right.jsp"/>
                </div>
            </div>
        </div>
        <jsp:include page="Footer.jsp"/>
    </body>
</html>
