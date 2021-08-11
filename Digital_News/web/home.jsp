<%-- 
   Document   : home
   Created on : May 13, 2021, 11:59:21 PM
   Author     : thoai
--%><%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <!--<meta name="viewport" content="width=device-width, initial-scale=1.0">-->
                <link href="css/Style.css" rel="stylesheet" type="text/css"/>

    </head>
    <body>
        <!--header-->
        
        <header>
            <div class="pre-header">
                <img src=../img/preheader.jpg alt="ttt">
                
            </div>
            <div class="banner">
                <div class="container">
                    <p class="logo">My Digital News</p>
                </div>
            </div>
            <div class="navigation">
                <div class="container">
                    <ul class="nav-list">
                        <li><a href="HomeController" class="nav-link">News</a></li>
                    </ul>
                </div>
            </div>
        </header>
        <div class="body">
            <div class="container">

                <!--LEFT-->
                <div class="left">
                    
                    <h1>${requestScope.error}</h1>
                    <h3 class="article">${requestScope.top1.article}</h3>
                    <img src="${requestScope.top1.image}" class="article-img" alt="" />
                    <p class="line-height-fix content">${requestScope.top1.content}</p>

                    <c:forEach items="${requestScope.listSearch}" var="o">
                        <div class="perArticle">
                            <div class="article">
                                <a href="DetailController?id=${o.id}">${o.article}</a>
                            </div>
                            <div class="s-image">
                                <img src="${o.image}" alt=""/>
                                <p> ${o.shortContent}
                                </p>
                            </div>
                        </div>
                    </c:forEach>

                    <div class="pagging">
                        <c:if test="${endPage>=1 }">
                            <c:forEach begin="1" end="${endPage}" var="i">
                                <a class="${i==index?"active":"" }" href="SearchController?index=${i}&search=${txt}">${i}</a>
                            </c:forEach>
                        </c:if>
                    </div>

                    <c:if test="${top1!=null}">
                        <div class="meta-info">
                            <img style="width: 1%;" src="img/timeicon.gif" alt="" />
                            <img style="width: 1%;" src="img/comment.gif" alt="" />
                            <span>
                                By: 
                                ${requestScope.top1.author}
                                |${requestScope.top1.time}
                            </span>
                        </div>
                    </c:if>
                    <h3>${requestScope.totalPages}</h3>
                </div>

                <!--RIGHT-->
                <div class="right">
                    <div class="block">
                        <h3 class="article">Digital News</h3>
                        <p class="content">${requestScope.top1.shortContent}</p>
                    </div>
                    <div class="block">
                        <h3 class="article">Search</h3>
                        <form action="SearchController" method="get" id="search-form">
                            <input type="text" name="search" id="search-input" value="" />
                            <input type="submit" value="Go" id="search-btn" />
                        </form>
                    </div>
                    <div class="block">
                        <h3 class="article">Last Articles</h3>
                        <ul class="list-unstyled newest-article">
                            <c:forEach items="${requestScope.top5}" var="o">
                                <li><a href="DetailController?id=${o.id}">${o.article}</a></li>
                                </c:forEach>
                        </ul>
                    </div>
                </div>

            </div>
        </div>
        <footer></footer>

    </body>
    
</html>
