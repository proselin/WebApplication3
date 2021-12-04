<%-- 
    Document   : shop-cart
    Created on : Nov 13, 2021, 12:21:44 AM
    Author     : quoch
--%>


<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<jsp:include page="inc/header.jsp" ></jsp:include>

    <!-- Breadcrumb Begin -->
    <div class="breadcrumb-option">
        <div class="container">
            <div class="row">
                <div class="col-lg-12">
                    <div class="breadcrumb__links">
                        <a href="./index.html"><i class="fa fa-home"></i> Home</a>
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
            <c:if test="${sessionScope.use == null}">
                <div class="col-lg-12">
                    <h6 class="coupon__link"><span class="icon_tag_alt"></span> Have a voucher?<a href="login"> Click here to login.</a></h6>
                </div>
            </c:if>
        </div>
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
                            <c:forEach var="p" items="${list}">
                                <tr>
                                    <td class="cart__product__item">

                                        <img src="${p.getImgs().get(1).getImgURL()}" alt="" style="width: 100px; height: 100px">
                                        <div class="cart__product__item__title">

                                            <h6>${p.getpName()}</h6>
                                            <div class="rating">
                                                <i class="fa fa-star"></i>
                                                <i class="fa fa-star"></i>
                                                <i class="fa fa-star"></i>
                                                <i class="fa fa-star"></i>
                                                <i class="fa fa-star"></i>
                                            </div>
                                        </div>
                                    </td>
                                    <td class="cart__price">$ <fmt:formatNumber type="number" maxFractionDigits="3" value="${p.getpPrice()}" /></td>
                                    <td class="cart__quantity">
                                        <div class="pro-qty">
                                            <a  href="cart?ac=doincr&id=${p.getpID()}">+</a>
                                            <span type="text" value=""><strong style="text-align: center">${p.getTake()}</strong></span>
                                            <a  href="cart?ac=dodecr&id=${p.getpID()}">-</a>
                                        </div>
                                    </td>
                                    <td class="cart__total">$ <fmt:formatNumber type="number" maxFractionDigits="3" value="${p.getpPrice() * p.getTake()}" /></td>
                                    <td class="cart__close"><a href="cart?ac=doremove&id=${p.getpID()}"><span class="icon_close"></span></a></td>>    
                                </tr>
                            </c:forEach>
                        <script type="text/javascript" >
                        </script>
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
                    <a href="#"><span class="icon_loading"></span> Update cart</a>
                </div>
            </div>
        </div>
        <div class="row">
            <div class="col-lg-6">
                <div class="discount__content">
                    <h6>Discount</h6>
                    <c:choose>
                        <c:when test="${sessionScope.use == null}">
                            <a href="login">Please login to using the voucher</a>
                        </c:when>
                        <c:otherwise>
                            <form action="cart?ac=doshow" method="POST">
                                <select class="form-select" name="svou">
                                    <option selected>Unchoosing voucher</option>
                                    <c:forEach items="${listv}" var="x">
                                        <option value="${x.getVoucher_info().getVouID()}">${x.getVoucher_info().getVouName()} Values: ${x.getVoucher_info().getVouValues()} </option>
                                    </c:forEach>
                                </select>
                                <button type="submit" class="btn btn-danger">Apply</button>
                            </form>
                        </c:otherwise>
                    </c:choose>

                </div>
            </div>
            <div class="col-lg-4 offset-lg-2">
                <div class="cart__total__procced">
                    <h6>Cart total</h6>
                    <ul>
                        <c:if test="${reduce !=null}">
                            <li>Voucher <span>$ <fmt:formatNumber type="number" maxFractionDigits="3" value="${reduce}" /></span></li>
                            </c:if>  
                        <li>VAT <span>$ <fmt:formatNumber type="number" maxFractionDigits="3" value="${vat}" /></span></li>
                        <li>Total <span>$ <fmt:formatNumber type="number" maxFractionDigits="3" value="${sum}" /></span></li>
                    </ul>
                    <form action="test" method="POST">
                        <input type="hidden" name="vouid" value="${vouid}">
                        <button type="submit"class="primary-btn">Proceed to checkout</button>
                    </form>

                </div>
            </div>
        </div>
    </div>
</section>
<!-- Shop Cart Section End -->



<jsp:include page="inc/footer.jsp" ></jsp:include>