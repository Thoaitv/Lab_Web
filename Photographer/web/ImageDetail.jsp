<%-- 
    Document   : ImageDetail
    Created on : May 24, 2021, 9:18:36 AM
    Author     : thoai
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <link href="css/home.css" rel="stylesheet" type="text/css"/>
    </head>
    <body>
        <div class="container">
            <jsp:include page="Header.jsp"/>
            <div class="main">
                <div class="left">
                    <div class="about">
                        <a href="GalleryController?galeryID=${id}">
                            <i class="fa fa-backward">Back To the Album</i>
                        </a>
                    </div>
                    <div class="imageGaler">
                        <img src="${image}" alt="First">
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
