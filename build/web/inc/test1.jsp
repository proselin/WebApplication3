<%-- 
    Document   : test1
    Created on : Nov 10, 2021, 9:50:56 AM
    Author     : quoch
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <!-- Product Section Begin -->
<c:if test="${empty requestScope['listProduct']}">
    <jsp:forward page="/home?ac=viewProduct"/>
</c:if>
<c:forEach items="$listProduct" var="x">
    <h1>${x.getpName()}</h1>
</c:forEach>
    </body>
</html>
