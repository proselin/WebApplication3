<%-- 
    Document   : product_inf
    Created on : Nov 10, 2021, 8:35:16 PM
    Author     : quoch
--%>

<%@page import="Model.product_model"%>
<%@page import="Entity.Product"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <<c:if test="${empty requestScope['listProduct']}">
            <jsp:forward page="/test?ac=viewProduct"/>
        </c:if>
        <c:forEach var="x" items="${requestScope['listProduct']}">
            <h1>${x.getpName()}hjediuaohjwuifshbig</h1>
            <div>
                <p> asdawds${x.getpDes()}</p>
            </div>

        </c:forEach>
    </body>
</html>
