<%-- 
    Document   : newjsp
    Created on : Nov 10, 2021, 9:22:45 PM
    Author     : quoch
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <<c:if test="${empty requestScope['listProduct']}">
            <jsp:forward page="test?ac=viewProduct"/>
        </c:if>
        <c:forEach items="${requestScope['listProduct']}" var="x">

            <div class="col-lg-3 col-md-4 col-sm-6 mix ${x.getpGender()}  ">
                <div class="product__item">
                    <div class="product__item__text">
                        <h6><a href="product-details.jsp?pid-${x.getpID()}">asdawds${x.getpName()}</a></h6>

                        <div class="product__price">sdadawd ${x.getPrice()}</div>
                    </div>
                </div>
            </div>
        </c:forEach>
    </div>
</div>
</section>
</body>
</html>
