<%-- 
    Document   : header
    Created on : Nov 10, 2021, 12:48:07 AM
    Author     : quoch
--%>

<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="zxx">

    <head>
        <meta charset="UTF-8">
        <meta name="description" content="Ashion Template">
        <meta name="keywords" content="Ashion, unica, creative, html">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <meta http-equiv="X-UA-Compatible" content="ie=edge">
        <title>Ashion | Perfume</title>

        <!-- Google Font -->
        <link href="https://fonts.googleapis.com/css2?family=Cookie&display=swap" rel="stylesheet">
        <link href="https://fonts.googleapis.com/css2?family=Montserrat:wght@400;500;600;700;800;900&display=swap"
              rel="stylesheet">

        <!-- Css Styles -->
        <link rel="stylesheet" href="css/bootstrap.min.css" type="text/css">
        <link rel="stylesheet" href="css/font-awesome.min.css" type="text/css">
        <link rel="stylesheet" href="css/elegant-icons.css" type="text/css">
        <link rel="stylesheet" href="css/jquery-ui.min.css" type="text/css">
        <link rel="stylesheet" href="css/magnific-popup.css" type="text/css">
        <link rel="stylesheet" href="css/owl.carousel.min.css" type="text/css">
        <link rel="stylesheet" href="css/slicknav.min.css" type="text/css">
        <link rel="stylesheet" href="css/style.css" type="text/css">
        <!--<link rel="stylesheet" href="css/slide.css" type="text/css">-->
        <!-- icon -->
        <meta name='viewport' content='width=device-width, initial-scale=1'>
        <script src='https://kit.fontawesome.com/a076d05399.js' crossorigin='anonymous'></script>
    <body>
        <!-- Page Preloder -->
        <div id="preloder">
            <div class="loader"></div>
        </div>

        <!-- Offcanvas Menu Begin -->
        <div class="offcanvas-menu-overlay"></div>
        <div class="offcanvas-menu-wrapper">
            <div class="offcanvas__close">+</div>
            <ul class="offcanvas__widget">
                <li><span class="icon_search search-switch"></span></li>
                <li><a href="checkout.jsp"><span class="icon_bag_alt"></span>
                        <div class="tip">0</div>
                    </a></li>
            </ul>
            <div class="offcanvas__logo">
                <a href="./index.html"><img src="img/logo.png" alt=""></a>
            </div>
            <div id="mobile-menu-wrap"></div>
            <c:choose>
                <c:when test="${sessionScope.use != null}">
                    <div class="offcanvas__auth">
                        <a href="profile.jsp">${sessionScope.fullname}<span class="icon_genius"></span></a>
                    </div>
                </c:when>
                <c:otherwise>
                    <div class="offcanvas__auth">
                        <a href="login.jsp">Login</a>
                        <a href="#">Register</a>
                    </div>
                </c:otherwise>
            </c:choose>


        </div>
        <!-- Offcanvas Menu End -->

        <!-- Header Section Begin -->
        <header class="header">
            <div class="container-fluid">
                <div class="row">
                    <div class="col-xl-3 col-lg-2">
                        <div class="header__logo ">
                            <a href="./index.html"><img src="img/logo.png" alt=""></a>
                        </div>
                    </div>
                    <div class="col-xl-6 col-lg-7">
                        <nav class="header__menu">
                            <ul>
                                <li class="active"><a href="index.jsp">Home</a></li>
                                <li><a href="shop.jsp">Women</a></li>
                                <li><a href="shop.jsp">Men</a></li>
                                <li><a href="shop.jsp">Shop</a></li>
                                <li><a href="blog.html">News</a>
                                    <c:if test="${sessionScope.use != null}">
                                    <li><a href="vou?ac=doshow">Voucher</a>
                                    </c:if>
                                    <!--    <ul class="dropdown">
                                            <li><a href="./product-details.jsp">Product Details</a></li>
                                            <li><a href="cart?ac=doshow">Shop Cart</a></li>
                                            <li><a href="checkout">Checkout</a></li>
                                            <li><a href="blog?ac=doshow">Blog Details</a></li>
                                        </ul>-->
                                </li>
                                <li><a href="./contact.html">Contact</a></li>
                            </ul>
                        </nav>
                    </div>
                    <div class="col-lg-3">

                        <div class="header__right">
                            <c:choose>
                                <c:when test="${sessionScope.use != null}">
                                    <div class="header__right__auth">
                                        <a style="font-size: 20px" href="profile.jsp"><span class="icon_genius"></span>     ${sessionScope.fullname}</a>
                                    </div>
                                </c:when>
                                <c:otherwise>
                                    <div class="header__right__auth">
                                        <a href="login">Login</a>
                                        <a href="#">Register</a>
                                    </div>
                                </c:otherwise>
                            </c:choose>
                            <ul class="header__right__widget">
                                <li><a  href="cart?ac=doshow"><span class="icon_bag_alt"></span>
                                    </a></li>
                            </ul>
                        </div>
                    </div>
                </div>
                <div class="canvas__open">
                    <i class="fa fa-bars"></i>
                </div>
            </div>
        </header>
        <!-- Header Section End -->