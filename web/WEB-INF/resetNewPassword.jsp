<%-- 
    Document   : resetNewPassword
    Created on : Nov 12, 2019, 5:20:12 PM
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
        <h1>Enter a new password</h1>
        <form action="reset" method="post">
            New Password: <input type="text" name="resetPassword">
            <br>
            <input type="submit" value="Submit">
            <input type="hidden" name="resetUUID" value="${resetUUID}">
        </form>
    </body>
</html>
