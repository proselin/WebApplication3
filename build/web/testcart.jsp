<%-- 
    Document   : testcart
    Created on : Nov 21, 2021, 10:13:32 AM
    Author     : quoch
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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

                                        <img src="${p.getImgs().get(1).getImgURL()}" alt="">
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
                                    <td class="cart__price">$ ${p.getpPrice()}</td>
                                    <td class="cart__quantity">
                                        <div class="pro-qty">
                                            <form action="testcart?ac=doincr" method="POST">
                                                <input id="incr" hidden value="${p.getpID()}"/>
                                                <span><input type="submit">+</span>
                                            </form>
                                            <span type="text" value=""><strong style="text-align: center">${p.getTake()}</strong></span>
                                            <form action="testcart?ac=dodecr" method="POST">
                                                <span>-<input type="submit" hidden /></span>
                                                <input id="decr" hidden value="${p.getpID()}"/>
                                            </form>
                                        </div>
                                    </td>
                                    <td class="cart__total">$ ${total}</td>
                                    <td class="cart__close"><a href="testcart?ac=doremove&id=${p.getpID()}"><span class="icon_close"></span></a></td>>    
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
                        <li id = "subtotal">Subtotal <span>$ ${vat}</span></li>
                        <li id = "total">Total <span>$ ${sum}</span></li>
                    </ul>
                    <a href="#" class="primary-btn">Proceed to checkout</a>
                </div>
            </div>
        </div>
    </div>
</section>
<!-- Shop Cart Section End -->



<jsp:include page="inc/footer.jsp" ></jsp:include>

</html>
