<%-- 
    Document   : testsession
    Created on : Nov 13, 2021, 12:08:06 AM
    Author     : quoch
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page import="java.io.*,java.util.*, javax.servlet.*" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <h1>${sessionScope.prlist}</h1>
        <h1>${sessionScope.use}</h1>
        <% Date date = new Date();
        out.print(date.toString());
        %>
        <c:set var="s" value="2002" />
        <c:out value="${sessionScope.fullname}" />
        <c:set var="s" value="${s + 100000}" />
         <c:out value="${s}" />
        <h1></h1>
    </body>
</html>
