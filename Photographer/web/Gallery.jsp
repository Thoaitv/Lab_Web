<%-- 
    Document   : Galery.jsp
    Created on : May 22, 2021, 5:22:09 PM
    Author     : thoai
--%>
<%@ taglib prefix="c"  uri="http://java.sun.com/jsp/jstl/core"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <link href="css/home.css" rel="stylesheet" type="text/css"/>
    </head>
    <body>
        <div class="container-fluid" style="padding:0px; background-color: #aa4043; background-image: url('image/kaleidoscope.png');">
            <jsp:include page="Header.jsp"/>
            <div class="main">
                <div class="left">
                    <div class="about">
                        <h3>${gallery.name}</h3>
                    </div>
                    <jsp:include page="SliderShow.jsp"/>

                    <br>
                    <br>
                    <br>
                    <div class="contentGalery">
                        <c:if test="${error == null}">
                            <ul >
                                <c:forEach items="${listImg}" var="i" varStatus="loop">
                                    <li class="span4">
                                        <a href="ImageDetailController?galeryID=${i.gallery_id}&&img=${i.image}"><img src="${i.image}"></a>
                                    </li>
                                </c:forEach>
                            </ul>

                        </c:if>    
                    </div>

                </div>
                <div class="main-right" style="background-color: #aa4043;height: 150px">
                    <jsp:include page="Right.jsp"/>
                </div>
            </div>
        </div>
        <jsp:include page="Footer.jsp"/>
    </body>
</html>
