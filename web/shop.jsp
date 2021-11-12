<%-- 
    Document   : shop
    Created on : Nov 11, 2021, 5:08:40 PM
    Author     : quoch
--%>

<%@page import="java.util.ArrayList"%>
<%@page import="Entity.Product"%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page import="Model.product_model"%>
<jsp:include page="inc/header.jsp"/>
<c:if test="${empty requestScope.product_list}">
    <jsp:forward page="/product_controller?ac=viewallproduct"/>
</c:if>
<c:forEach items="${requestScope.product_list}" var="x" >
    <h1>1 : ${x.getpName()} </h1>
</c:forEach>
<jsp:include page="inc/footer.jsp"/>




