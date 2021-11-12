<%-- 
    Document   : user_list.jsp
    Created on : Nov 11, 2021, 11:19:13 PM
    Author     : quoch
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <table border="1" cellpadding="10">
            <thead>
                <tr>
                    <th>UserID</th>
                    <th>Name</th>
                    <th>Address</th>
                    <th>Gender</th>
                    <th>Phone</th>
                    <th>Email</th>
                    <th>Date of birth</th>
                    <th>Username</th>
                    <th>Password</th>
                    <th>Point</th>
                    <th>RoleID</th>
                    <th></th>
                    <th></th>
                </tr>
            </thead>
            <c:if test="${empty requestScope.uslist}">
                <jsp:forward page="../admin_user?ac=viewuserlist"/>
                <h1>ok</h1>
            </c:if>

            <c:forEach var="x" items="${requestScope.uslist}">
                <tbody>
                <td>${x.getUserID()}</td>
                <td>${x.getFullName()}</td>
                <td>${x.getAddress()}</td>
                <td>${x.getGender()}</td>
                <td>${x.getPhone()}</td>
                <td>${x.getEmail()}</td>
                <td></td>
                <td>${x.getUserName()}</td>
                <td>${x.getPassword()}</td>
                <td>${x.getPoint()}</td>

            </tbody>

        </c:forEach>

    </table>

</body>
</html>
