<%-- 
    Document   : shop-cart
    Created on : Nov 13, 2021, 12:21:44 AM
    Author     : quoch
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<jsp:include page="inc/header.jsp"/>
<c:if test="${empty sessionScope.prlist}">
    <h1>Cart is empty</h1>
</c:if>




<!-- Breadcrumb Begin -->
<div class="breadcrumb-option">
    <div class="container">
        <div class="row">
            <div class="col-lg-12">
                <div class="breadcrumb__links">
                    <a href="index.jsp"><i class="fa fa-home"></i> Home</a>
                    <span>Shopping cart</span>
                </div>
            </div>
        </div>
    </div>
</div>
<!-- Breadcrumb End -->

<!-- Shop Cart Section Begin -->
<section class="shop-cart spad">
    <div class="container">
        <div class="row">
            <div class="col-lg-12">
                <div class="shop__cart__table">
                    <table>
                        <thead>
                            <tr>
                                <th>Product</th>
                                <th>Price</th>
                                <th>Quantity</th>
                                <th>Total</th>
                                <th></th>
                            </tr>
                        </thead>
                        <tbody>
                            <% int a = 0 ; float total  = 0;%>
                            <c:set var="total" value="0"/>
                            <c:forEach var="x" items="${sessionScope.prlist}">
                                ${x.getpID()}
                                <tr>
                                    <td class="cart__product__item">
                                        <img src="${x.getImgs().get(1).getImgURL()}" alt="">
                                        <div class="cart__product__item__title">
                                            <h6>${x.getpName()}</h6>
                                            <div class="rating">
                                                <i class="fa fa-star"></i>
                                                <i class="fa fa-star"></i>
                                                <i class="fa fa-star"></i>
                                                <i class="fa fa-star"></i>
                                                <i class="fa fa-star"></i>
                                            </div>
                                        </div>
                                    </td>
                                    <td class="cart__price">$ ${x.getpPrice()}</td>
                                    <td class="cart__quantity">
                                        <div class="pro-qty">
                                            <input type="text" value="1" name="quantity-<% a+=1; %>">
                                        </div>
                                    </td>
                                    <td class="cart__total">$ ${x.getpPrice() * x.getTake()} 
                                    </td>
                                    
                                    <td class="cart__close"><span class="icon_close">
                                            <c:set var="total" value="${total + (x.getpPrice() * x.getTake())}"/>
                                        </span></td>
                                </tr>
                            </c:forEach>
                        </tbody>
                    </table>
                </div>
            </div>
        </div>
        <div class="row">
            <div class="col-lg-6 col-md-6 col-sm-6">
                <div class="cart__btn">
                    <a href="#">Continue Shopping</a>
                </div>
            </div>
            <div class="col-lg-6 col-md-6 col-sm-6">
                <div class="cart__btn update__btn">
                    <a href="shop-cart.jsp"><span class="icon_loading"></span> Update cart</a>
                </div>
            </div>
        </div>
        <div class="row">
            <div class="col-lg-6">
                <div class="discount__content">
                    <h6>Discount codes</h6>
                    <form action="#">
                        <input type="text" placeholder="Enter your coupon code">
                        <button type="submit" class="site-btn">Apply</button>
                    </form>
                </div>
            </div>
            <div class="col-lg-4 offset-lg-2">
                <div class="cart__total__procced">
                    <h6>Cart total</h6>
                    <ul>
                        <li>Subtotal <span>$<c:out value="${total}"/></span></li>
                        <li>Total <span>$<c:out value="${total}"/></span></li>
                    </ul>
                    <a href="#" class="primary-btn">Proceed to checkout</a>
                </div>
            </div>
        </div>
    </div>
</section>
<!-- Shop Cart Section End -->

<jsp:include page="inc/footer.jsp"/>