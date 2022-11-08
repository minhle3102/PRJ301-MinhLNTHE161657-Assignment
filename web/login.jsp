<%-- 
    Document   : login
    Created on : Oct 17, 2022, 11:33:20 AM
    Author     : sonnt
--%>

<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" href="css/reset.css">
        <link rel="stylesheet" href="css/app.css">
        <link rel="stylesheet" href="https://pro.fontawesome.com/releases/v5.10.0/css/all.css">
        <title>JSP Page</title>
    </head>
    <body>
        <div id="wrapper">
            <form action="login" method="POST" id="form-login">
                <h1 class="form-heading">FAP Login</h1>
                <c:if test="${sessionScope.error ne null}">
                    <span style="color: red">${sessionScope.error}</span>
                    <c:remove var="error" scope="session"/>
                </c:if>
                <div class="form-group">
                    <i class="far fa-user"></i>
                    <input type="text"  class="form-input" placeholder="Username" name="username" /> <br/>
                </div>
                <div class="form-group">
                    <i class="fas fa-key"></i>
                    <input type="password" class="form-input" placeholder="Password" name="password" /> <br/>
                    <div id="eye">
                        <i class="far fa-eye"></i>
                    </div>
                </div>
                <input type="submit" value="Login" class="form-submit" /> 
            </form>
        </div>

    </body>
    <script src="https://code.jquery.com/jquery-3.6.0.js"></script>
    <script src="js/app.js"></script>
</html>
