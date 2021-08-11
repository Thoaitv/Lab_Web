<%-- 
    Document   : Contact
    Created on : May 23, 2021, 5:17:28 PM
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
        <div class="container">
            <jsp:include page="Header.jsp"/>
            <div class="main">
                <div class="left">
                    <div class="about">
                        <h3>Contact</h3>
                    </div>
                    <div class="content-contact">
                        <h4>PHOTOGRAPHER</h4>
                        <div class="country">
                            <p>Address: ${contact.address}<br>City:<span class="tab-1"></span>${contact.city}<br>Country:  ${contact.country}</p>
                        </div>
                        <div class="infor">
                            <table>
                                <tr>
                                    <td>Tel: </td>
                                    <td>${contact.phone_num}</td>
                                </tr>
                                <tr>
                                    <td>Email: </td>
                                    <td>${contact.email}</td>
                                </tr>

                            </table>
                            <label> </label> <span></span>
                        </div> 
                        <div class="map">
                            <iframe src="https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d3724.458650859533!2d105.52420231540215!3d21.014326593645716!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x31345b465a4e65fb%3A0xaae6040cfabe8fe!2zxJDhuqFpIGjhu41jIEZQVA!5e0!3m2!1svi!2s!4v1585369141317!5m2!1svi!2s" width="600" height="450" frameborder="0" style="border:0;" allowfullscreen="" aria-hidden="false" tabindex="0"></iframe>
                            
                            
                        </div>
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
