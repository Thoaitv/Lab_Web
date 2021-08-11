<%-- 
    Document   : Right
    Created on : May 22, 2021, 5:26:11 PM
    Author     : thoai
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <link href="css/right.css" rel="stylesheet" type="text/css"/>
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">

    </head>
    <body>
        <div class="header-right">
            <h4>Share this page</h4>
        </div>
        <div class="social">
            <ul>
                <li><i class="fa fa-facebook-square"><a href="${requestScope.contact.fb}"><span>Share on Facebook</span></a></i></li>
                <li><i class="fa fa-twitter"><a href="${requestScope.contact.twitter}"><span>Share on Twitter</span></a></i></li>
                <li><i class="fa fa-google"><a href="${requestScope.contact.gg}"><span>Share on Google</span></a></i></li>
            </ul>
        </div>
    </body>
</html>
