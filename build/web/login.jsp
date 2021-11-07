<%-- 
    Document   : index.jsp
    Created on : Oct 28, 2021, 11:02:59 AM
    Author     : quoch
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Login man</title>
    </head>
    <body>
        <div class="container">
            <h1>Login</h1>
        </div>
        ${error}
        <form action="login_controller" method="POST">
            <div class="form-group">
                <label for="Username">Username:</label> 
                <input type="text" class="form-control" placeholder="Enter Username" id="Username" name="txtUsn"/>
            </div>
            <div class="form-group">
                <label for="pwd">Password:</label>
                <input type="password" class="form-control" placeholder="Enter password" id="pwd" name="txtPw">
            </div>
            <div style="text-align: center">
                <button type="submit" class="btn btn-primary"><i class="fas fa-sign-in-alt"> Login</i></button>
            </div>
    </body>
</html>
