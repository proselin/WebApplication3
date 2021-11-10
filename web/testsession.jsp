<%-- 
    Document   : testsession
    Created on : Nov 9, 2021, 1:31:09 AM
    Author     : quoch
--%>

<%@page import="Model.user_Model"%>
<%@page import="Entity.User"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ page session="true" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
            <h1>
                ${sessionScope.use}
                <%String usd =  session.getAttribute("use").toString();
                user_Model um = new user_Model();
                User us  = um.search_User_Data(usd);
                   request.setAttribute("uid", us.getUserID()); %>
                    
            </h1>
                   <h2>${requestScope.uid}</h2>
    </body>
</html>
