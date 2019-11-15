<%-- 
    Document   : reset
    Created on : Nov 12, 2019, 5:18:54 PM
    Author     : 794471
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Reset Password</title>
    </head>
    <body>
        <h1>Reset Password</h1>
        <p>Please enter your email address to reset your password.</p>
        
        <form action="reset" method="post">
            Email Address: <input type="text" name="resetEmail">
            <br>
            <input type="submit" value="Submit">
        </form>
        <br>
        ${message}
    </body>
</html>
