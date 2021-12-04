<%-- 
    Document   : product-details
    Created on : Nov 11, 2021, 3:02:02 PM
    Author     : quoch
--%>

<jsp:include page="inc/header.jsp"/>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<c:if test="${empty requestScope.product_infor}">
    <jsp:forward page="/product_controller?ac=viewsingleproduct&pid=${param.pid}"/>
    <input id="pid" type="hidden" value="${param.pid}"/>
</c:if>

<!-- Breadcrumb Begin -->
<div class="breadcrumb-option">
    <div class="container">
        <div class="row">
            <div class="col-lg-12">
                <div class="breadcrumb__links">
                    <a href="index.jsp"><i class="fa fa-home"></i> Home</a>
                    <a href="shop.jsp?${requestScope.product_infor.getpGender()}">${requestScope.product_infor.getpGender()}</a>

                </div>
            </div>
        </div>
    </div>
</div>
<!-- Breadcrumb End -->

<!-- Product Details Section Begin -->
<section class="product-details spad">
    <div class="container">
        <div class="row">
            <div class="col-lg-6">
                <div class="product__details__pic">
                    <div class="product__details__pic__left product__thumb nice-scroll">
                        <%
                            int b = 0;
                        %>
                        <c:forEach items="${product_infor.getImgs()}" var="x">
                            <a class="pt" href="#product-<% out.print(b += 1); %>">
                                <img src="${x.getImgURL()}" alt="">
                            </a>
                        </c:forEach>


                    </div>
                    <div class="product__details__slider__content">
                        <div class="product__details__pic__slider owl-carousel">
                            <%
                                int a = 0;
                            %>
                            <c:forEach items="${product_infor.getImgs()}" var="x">
                                <img data-hash="product-<% out.print(a += 1);%>" class="product__big__img"
                                     src="${x.getImgURL()}" alt="">
                            </c:forEach>
                        </div>
                    </div>
                </div>
            </div>
            <div class="col-lg-6">
                <div class="product__details__text">
                    <h3>${product_infor.getpName()}<span>Brand: ${requestScope.product_infor.getpBrand()} </span></h3>
                    <div class="rating">
                        <i class="fa fa-star"></i>
                        <i class="fa fa-star"></i>
                        <i class="fa fa-star"></i>
                        <i class="fa fa-star"></i>
                        <i class="fa fa-star"></i>
                        <span>( 138 reviews )</span>
                    </div>
                    <div class="product__details__price">$ ${requestScope.product_infor.getpPrice()} <!--<span>$ 83.0</span>--></div>
                    <p id="des">${requestScope.product_infor.getpName()} has a scent like ${requestScope.product_infor.getpIncense()}</p>
                    <div class="product__details__button">
                        <a href="cart?ac=doincr&id=${product_infor.getpID()}"  class="cart-btn"><span class="icon_bag_alt"></span> Add to cart</a>
                        <ul>
                            <a href="slos.jsp" class=" cart-btn"
                               style="background-color: rgb(127, 216, 44) ; color: #000;border-radius: 30px;">Buy
                                Now</a>
                        </ul>
                    </div>
                    <div class="product__details__widget">
                        <ul>
                            <li>
                                <span>Status: </span>

                                <p>${product_infor.getpStatus()}</p>
                            </li>
                        </ul>
                    </div>
                </div>
            </div>
            <div class="col-lg-12">
                <div class="product__details__tab">
                    <ul class="nav nav-tabs" role="tablist">
                        <li class="nav-item">
                            <a class="nav-link active" data-toggle="tab" href="#tabs-1" role="tab">Information</a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link" data-toggle="tab" href="#tabs-2" role="tab">Specification</a>
                        </li>
                    </ul>
                    <div class="tab-content">
                        <div class="tab-pane active" id="tabs-1" role="tabpanel">
                            <h6>About</h6>
                            <div class="product__details__widget">
                                <ul style="margin-left: 10px; margin-bottom: 20px;">
                                    <li>
                                        <span>Brand</span>
                                        <p>${product_infor.getpBrand()} </p>
                                    </li>
                                    <li>
                                        <span>From</span>
                                        <p>${requestScope.product_infor.getpMadeIn()} </p>
                                    </li>
                                    <li>
                                        <span>Year</span>
                                        <p>${requestScope.product_infor.getpYear()}</p>
                                    </li>
                                    <li>
                                        <span>Concentration</span>
                                        <p>${requestScope.product_infor.getCateinfo().getCateName()} </p>

                                    </li>
                                    <li>
                                        <span>
                                            Incense</span>
                                        <p>${requestScope.product_infor.getpIncense()}</p>

                                    </li>
                                    <li>
                                        <span>
                                            For Gender</span>
                                        <p>${requestScope.product_infor.getpGender()}  </p>

                                    </li>

                                </ul>
                            </div> 
                        </div>
                        <div class="tab-pane active" id="tabs-2" role="tabpanel">

                            <span>Descriptions</span>
                            <p> ${requestScope.product_infor.getpDes()} 
                            </p>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <!--Rate and comment -->
        <div class="row">
            <div class="col-lg-12 text-center">
                <div class="related__title">
                    <h3>Rate & Comment</h3>
                </div>
                <div class="justify-content-center">
                    <div class="col-xl-12 col-lg-12 col-md-12 col-12 text-center mb-5">
                        <div class="card">
                            <div class="row justify-content-left d-flex">
                                <div class="col-md-4 d-flex flex-column">
                                    <div class="rating-box" style="border-radius: 25px;">
                                        <h1 class="pt-4">4.0</h1>
                                        <p style="margin-top: 5 px; text-size-adjust: 14;">out of 5</p>
                                    </div>
                                    <div> <span class="fa fa-star star-active mx-1"></span> <span
                                            class="fa fa-star star-active mx-1"></span> <span
                                            class="fa fa-star star-active mx-1"></span> <span
                                            class="fa fa-star star-active mx-1"></span> <span
                                            class="fa fa-star star-inactive mx-1"></span> </div>
                                </div>
                                <div class="col-md-8">
                                    <div class="rating-bar0 justify-content-center">
                                        <table class="text-left mx-auto">
                                            <tr>
                                                <td class="rating-label">Excellent</td>
                                                <td class="rating-bar">
                                                    <div class="bar-container">
                                                        <div class="bar-5"></div>
                                                    </div>
                                                </td>
                                                <td class="text-right">123</td>
                                            </tr>
                                            <tr>
                                                <td class="rating-label">Good</td>
                                                <td class="rating-bar">
                                                    <div class="bar-container">
                                                        <div class="bar-4"></div>
                                                    </div>
                                                </td>
                                                <td class="text-right">23</td>
                                            </tr>
                                            <tr>
                                                <td class="rating-label">Average</td>
                                                <td class="rating-bar">
                                                    <div class="bar-container">
                                                        <div class="bar-3"></div>
                                                    </div>
                                                </td>
                                                <td class="text-right">10</td>
                                            </tr>
                                            <tr>
                                                <td class="rating-label">Poor</td>
                                                <td class="rating-bar">
                                                    <div class="bar-container">
                                                        <div class="bar-2"></div>
                                                    </div>
                                                </td>
                                                <td class="text-right">3</td>
                                            </tr>
                                            <tr>
                                                <td class="rating-label">Terrible</td>
                                                <td class="rating-bar">
                                                    <div class="bar-container">
                                                        <div class="bar-1"></div>
                                                    </div>
                                                </td>
                                                <td class="text-right">0</td>
                                            </tr>
                                        </table>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="card">
                            <div class="row d-flex">
                                <div style="margin-right: 20px;margin-top: 10px;"> <svg
                                        xmlns="http://www.w3.org/2000/svg" width="50" height="50"
                                        fill="currentColor" class="bi bi-person-circle" viewBox="0 0 16 16">
                                    <path d="M11 6a3 3 0 1 1-6 0 3 3 0 0 1 6 0z" />
                                    <path fill-rule="evenodd"
                                          d="M0 8a8 8 0 1 1 16 0A8 8 0 0 1 0 8zm8-7a7 7 0 0 0-5.468 11.37C3.242 11.226 4.805 10 8 10s4.757 1.225 5.468 2.37A7 7 0 0 0 8 1z" />
                                    </svg>
                                </div>
                                <div class="d-flex flex-column">
                                    <h3 class="mt-2 mb-0">Uchiha sasuke</h3>
                                    <div>
                                        <p class="text-left"><span class="text-muted">5.0</span> <span
                                                class="fa fa-star star-active ml-3"></span> <span
                                                class="fa fa-star star-active"></span> <span
                                                class="fa fa-star star-active"></span> <span
                                                class="fa fa-star star-active"></span> <span
                                                class="fa fa-star star-active"></span></p>
                                    </div>
                                </div>
                                <div class="ml-auto">
                                    <p class="text-muted pt-5 pt-sm-3">11 Sept</p>
                                </div>
                            </div>
                            <div class="row text-left">
                                <h4 class="blue-text mt-3">"Good"</h4>
                                <p class="content">The first i used , i be love with it
                                    Sparks of fresh and vibrant Orange immediately awaken the senses. A clear and
                                    sensual heart reveals the transparent accords of Grasse Jasmine and May Rose.
                                    The
                                    scent finally unfurls with the vibrant accents of Patchouli and Vetiver..
                                </p>
                            </div>
                        </div>
                        <div class="card">
                            <div class="row d-flex">
                                <div style="margin-right: 20px;margin-top: 10px;"> <svg
                                        xmlns="http://www.w3.org/2000/svg" width="50" height="50"
                                        fill="currentColor" class="bi bi-person-circle" viewBox="0 0 16 16">
                                    <path d="M11 6a3 3 0 1 1-6 0 3 3 0 0 1 6 0z" />
                                    <path fill-rule="evenodd"
                                          d="M0 8a8 8 0 1 1 16 0A8 8 0 0 1 0 8zm8-7a7 7 0 0 0-5.468 11.37C3.242 11.226 4.805 10 8 10s4.757 1.225 5.468 2.37A7 7 0 0 0 8 1z" />
                                    </svg>
                                </div>
                                <div class="d-flex flex-column">
                                    <h3 class="mt-2 mb-0">Mukesh Kumar</h3>
                                    <div>
                                        <p class="text-left"><span class="text-muted">4.0</span> <span
                                                class="fa fa-star star-active ml-3"></span> <span
                                                class="fa fa-star star-active"></span> <span
                                                class="fa fa-star star-active"></span> <span
                                                class="fa fa-star star-active"></span> <span
                                                class="fa fa-star star-inactive"></span></p>
                                    </div>
                                </div>
                                <div class="ml-auto">
                                    <p class="text-muted pt-5 pt-sm-3">10 Sept</p>
                                </div>
                            </div>
                            <div class="row text-left">
                                <h4 class="blue-text mt-3">"i like it "</h4>
                                <p class="content">it very attractive . Irresistibly sexy, irrepressibly spirited. A
                                    sparkling ambery fragrance that recalls
                                    a daring young Coco Chanel. An absolutely modern composition with a strong yet
                                    surprisingly fresh character.</p>
                            </div>
                        </div>
                        <div class="card">
                            <div class="row d-flex">
                                <div style="margin-right: 20px;margin-top: 10px;"> <svg
                                        xmlns="http://www.w3.org/2000/svg" width="50" height="50"
                                        fill="currentColor" class="bi bi-person-circle" viewBox="0 0 16 16">
                                    <path d="M11 6a3 3 0 1 1-6 0 3 3 0 0 1 6 0z" />
                                    <path fill-rule="evenodd"
                                          d="M0 8a8 8 0 1 1 16 0A8 8 0 0 1 0 8zm8-7a7 7 0 0 0-5.468 11.37C3.242 11.226 4.805 10 8 10s4.757 1.225 5.468 2.37A7 7 0 0 0 8 1z" />
                                    </svg>
                                </div>
                                <div class="d-flex flex-column">
                                    <h3 class="mt-2 mb-0">Mukesh Kumar</h3>
                                    <div>
                                        <p class="text-left"><span class="text-muted">4.0</span> <span
                                                class="fa fa-star star-active ml-3"></span> <span
                                                class="fa fa-star star-active"></span> <span
                                                class="fa fa-star star-active"></span> <span
                                                class="fa fa-star star-active"></span> <span
                                                class="fa fa-star star-inactive"></span></p>
                                    </div>
                                </div>
                                <div class="ml-auto">
                                    <p class="text-muted pt-5 pt-sm-3">10 Sept</p>
                                </div>
                            </div>
                            <div class="row text-left">
                                <h4 class="blue-text mt-3">"An awesome perfume"</h4>
                                <p class="content">If you really enjoy spending your vacation 'on water' or
                                    would like to try something new and exciting for the first time.</p>
                            </div>
                        </div>


                    </div>
                </div>
            </div>
        </div>
        <!--end rate and comment-->

        <!--start relate product-->

        <div class="row">
            <div class="col-lg-12 text-center">
                <div class="related__title">
                    <h5>RELATED PRODUCTS</h5>
                </div>
            </div>
            <div class="col-lg-3 col-md-4 col-sm-6">
                <div class="product__item">
                    <div class="product__item__pic set-bg" data-setbg="img/product/p1.jpg">
                        <div class="label new">New</div>
                        <ul class="product__hover">
                            <li><a href="img/product/p1.jpg" class="image-popup"><span
                                        class="arrow_expand"></span></a></li>
                            <li><a href="#"><span class="icon_heart_alt"></span></a></li>
                            <li><a href="#"><span class="icon_bag_alt"></span></a></li>
                        </ul>
                    </div>
                    <div class="product__item__text">
                        <h6><a href="#">Buttons tweed blazer</a></h6>
                        <div class="rating">
                            <i class="fa fa-star"></i>
                            <i class="fa fa-star"></i>
                            <i class="fa fa-star"></i>
                            <i class="fa fa-star"></i>
                            <i class="fa fa-star"></i>
                        </div>
                        <div class="product__price">$ 59.0</div>
                    </div>
                </div>
            </div>
            <div class="col-lg-3 col-md-4 col-sm-6">
                <div class="product__item">
                    <div class="product__item__pic set-bg" data-setbg="img/product/p2.jpg">
                        <ul class="product__hover">
                            <li><a href="img/product/p2.jpg" class="image-popup"><span
                                        class="arrow_expand"></span></a></li>
                            <li><a href="#"><span class="icon_heart_alt"></span></a></li>
                            <li><a href="#"><span class="icon_bag_alt"></span></a></li>
                        </ul>
                    </div>
                    <div class="product__item__text">
                        <h6><a href="#">Flowy striped skirt</a></h6>
                        <div class="rating">
                            <i class="fa fa-star"></i>
                            <i class="fa fa-star"></i>
                            <i class="fa fa-star"></i>
                            <i class="fa fa-star"></i>
                            <i class="fa fa-star"></i>
                        </div>
                        <div class="product__price">$ 49.0</div>
                    </div>
                </div>
            </div>
            <div class="col-lg-3 col-md-4 col-sm-6">
                <div class="product__item">
                    <div class="product__item__pic set-bg" data-setbg="img/product/p3.jpg">
                        <div class="label stockout">out of stock</div>
                        <ul class="product__hover">
                            <li><a href="img/product/p3.jpg" class="image-popup"><span
                                        class="arrow_expand"></span></a></li>
                            <li><a href="#"><span class="icon_heart_alt"></span></a></li>
                            <li><a href="#"><span class="icon_bag_alt"></span></a></li>
                        </ul>
                    </div>
                    <div class="product__item__text">
                        <h6><a href="#">Cotton T-Shirt</a></h6>
                        <div class="rating">
                            <i class="fa fa-star"></i>
                            <i class="fa fa-star"></i>
                            <i class="fa fa-star"></i>
                            <i class="fa fa-star"></i>
                            <i class="fa fa-star"></i>
                        </div>
                        <div class="product__price">$ 59.0</div>
                    </div>
                </div>
            </div>
            <div class="col-lg-3 col-md-4 col-sm-6">
                <div class="product__item">
                    <div class="product__item__pic set-bg" data-setbg="img/product/p4.jpg">
                        <ul class="product__hover">
                            <li><a href="img/product/p4.jpg" class="image-popup"><span
                                        class="arrow_expand"></span></a></li>
                            <li><a href="#"><span class="icon_heart_alt"></span></a></li>
                            <li><a href="#"><span class="icon_bag_alt"></span></a></li>
                        </ul>
                    </div>
                    <div class="product__item__text">
                        <h6><a href="#">Slim striped pocket shirt</a></h6>
                        <div class="rating">
                            <i class="fa fa-star"></i>
                            <i class="fa fa-star"></i>
                            <i class="fa fa-star"></i>
                            <i class="fa fa-star"></i>
                            <i class="fa fa-star"></i>
                        </div>
                        <div class="product__price">$ 59.0</div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</section>
<!-- Product Details Section End -->

<jsp:include page="inc/footer.jsp"/>