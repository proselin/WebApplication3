<%-- Document : shop Created on : Nov 11, 2021, 5:08:40 PM Author : quoch --%>

    <%@page import="java.util.ArrayList" %>
        <%@page import="Entity.Product" %>

            <%@page contentType="text/html" pageEncoding="UTF-8" %>
                <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
                    <jsp:include page="inc/header.jsp" />

                    <!-- Breadcrumb Begin -->
                    <div class="breadcrumb-option">
                        <div class="container">
                            <div class="row">
                                <div class="col-lg-12">
                                    <div class="breadcrumb__links">
                                        <a href="./index.html"><i class="fa fa-home"></i> Home</a>
                                        <span>Shop</span>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                    <!-- Breadcrumb End -->

                    <!-- Shop Section Begin -->
                    <section class="shop spad">
                        <div class="container">
                            <div class="row">
                                <div class="col-lg-3 col-md-3">
                                    <div class="shop__sidebar">
                                        <div class="sidebar__categories">
                                            <div class="section-title">
                                                <h4>Categories</h4>
                                            </div>
                                            <div class="categories__accordion">
                                                <div class="accordion" id="accordionExample">
                                                    <div class="card">
                                                        <div class="card-heading active">
                                                            <a data-toggle="collapse" data-target="#collapseOne">Woman's
                                                                perfume</a>
                                                        </div>
                                                        <div id="collapseOne" class="collapse show"
                                                            data-parent="#accordionExample">
                                                            <div class="card-body">
                                                                <ul>
                                                                    <li><a href="#">New for her</a></li>
                                                                    <li><a href="#">Bestsellers</a></li>
                                                                    <li><a href="#">Luxury</a></li>
                                                                    <li><a href="#">Classics</a></li>
                                                                    <li><a href="#">Try it first</a></li>
                                                                    <li><a href="#">Body Mists</a></li>
                                                                    <li><a href="#">Celebrity</a></li>
                                                                    <li><a href="#">Travel Sized</a></li>
                                                                </ul>
                                                            </div>
                                                        </div>
                                                    </div>
                                                    <div class="card">
                                                        <div class="card-heading">
                                                            <a data-toggle="collapse" data-target="#collapseTwo">Men's
                                                                perfume</a>
                                                        </div>
                                                        <div id="collapseTwo" class="collapse"
                                                            data-parent="#accordionExample">
                                                            <div class="card-body">
                                                                <ul>
                                                                    <li><a href="#">New in</a></li>
                                                                    <li><a href="#">Bestsellers</a></li>
                                                                    <li><a href="#">Luxury</a></li>
                                                                    <li><a href="#">Classics</a></li>

                                                                </ul>
                                                            </div>
                                                        </div>
                                                    </div>
                                                    <div class="card">
                                                        <div class="card-heading">
                                                            <a data-toggle="collapse"
                                                                data-target="#collapseThree">Unisex</a>
                                                        </div>
                                                        <div id="collapseThree" class="collapse"
                                                            data-parent="#accordionExample">
                                                            <div class="card-body">
                                                                <ul>
                                                                    <li><a href="#">Coats</a></li>
                                                                    <li><a href="#">Jackets</a></li>
                                                                    <li><a href="#">Dresses</a></li>
                                                                    <li><a href="#">Shirts</a></li>
                                                                    <li><a href="#">T-shirts</a></li>
                                                                    <li><a href="#">Jeans</a></li>
                                                                </ul>
                                                            </div>
                                                        </div>
                                                    </div>
                                                    <div class="card">
                                                        <div class="card-heading">
                                                            <a data-toggle="collapse"
                                                                data-target="#collapseFour">Brand</a>
                                                        </div>
                                                        <div id="collapseFour" class="collapse"
                                                            data-parent="#accordionExample">
                                                            <div class="card-body">
                                                                <ul>
                                                                    <li><a href="#">Versace</a></li>
                                                                    <li><a href="#">Dolce & Gabbana</a></li>
                                                                    <li><a href="#">Burberry</a></li>
                                                                    <li><a href="#">Calvin Klein</a></li>
                                                                    <li><a href="#">Christian Dior</a></li>
                                                                    <li><a href="#">Gucci</a></li>
                                                                    <li><a href="#">See more</a></li>
                                                                </ul>
                                                            </div>
                                                        </div>
                                                    </div>
                                                    <div class="card">
                                                        <div class="card-heading">
                                                            <a data-toggle="collapse"
                                                                data-target="#collapseFive">Fragrant</a>
                                                        </div>
                                                        <div id="collapseFive" class="collapse"
                                                            data-parent="#accordionExample">
                                                            <div class="card-body">
                                                                <ul>
                                                                    <li><a href="#">Coats</a></li>
                                                                    <li><a href="#">Jackets</a></li>
                                                                    <li><a href="#">Dresses</a></li>
                                                                    <li><a href="#">Shirts</a></li>
                                                                    <li><a href="#">T-shirts</a></li>
                                                                    <li><a href="#">Jeans</a></li>
                                                                </ul>
                                                            </div>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="sidebar__filter">
                                            <div class="section-title">
                                                <h4>Shop by price</h4>
                                            </div>
                                            <div class="filter-range-wrap">
                                                <div class="price-range ui-slider ui-corner-all ui-slider-horizontal ui-widget ui-widget-content"
                                                    data-min="33" data-max="99"></div>
                                                <div class="range-slider">
                                                    <div class="price-input">
                                                        <p>Price:</p>
                                                        <input type="text" id="minamount">
                                                        <input type="text" id="maxamount">
                                                    </div>
                                                </div>
                                            </div>
                                            <a href="#">Filter</a>
                                        </div>
                                        <div class="sidebar__sizes">
                                            <div class="section-title">
                                                <h4>Shop by star</h4>
                                            </div>
                                            <div class="size__list">
                                                <label for="xxs">
                                                    5 star
                                                    <input type="checkbox" id="5star">
                                                    <span class="checkmark"></span>
                                                </label>
                                                <label for="xs">
                                                    4 star
                                                    <input type="checkbox" id="4star">
                                                    <span class="checkmark"></span>
                                                </label>
                                                <label for="xss">
                                                    3 star
                                                    <input type="checkbox" id="3star">
                                                    <span class="checkmark"></span>
                                                </label>
                                                <label for="s">
                                                    2 star
                                                    <input type="checkbox" id="2star">
                                                    <span class="checkmark"></span>
                                                </label>
                                                <label for="m">
                                                    1 star
                                                    <input type="checkbox" id="1star">
                                                    <span class="checkmark"></span>
                                                </label>

                                            </div>
                                        </div>
                                        <div class="sidebar__color">
                                            <div class="section-title">
                                                <h4>Shop by Sale</h4>
                                            </div>
                                            <div class="size__list color__list">
                                                <label for="black">
                                                    Offers For Her
                                                    <input type="checkbox" id="black">
                                                    <span class="checkmark"></span>
                                                </label>
                                                <label for="whites">
                                                    Reduced to Clear

                                                    <input type="checkbox" id="whites">
                                                    <span class="checkmark"></span>
                                                </label>
                                                <label for="reds">
                                                    Gift Set Sale
                                                    <input type="checkbox" id="reds">
                                                    <span class="checkmark"></span>
                                                </label>
                                                <label for="greys">
                                                    Brands
                                                    <input type="checkbox" id="greys">
                                                    <span class="checkmark"></span>
                                                </label>

                                            </div>
                                        </div>
                                    </div>
                                </div>
                                <div class="col-lg-9 col-md-9">
                                    <div class="row" id="prolist">
                                        <div class="col-lg-4 col-md-6">
                                            <div class="product__item">
                                                <div class="product__item__pic set-bg" data-setbg="img/shop/p1.jpg">
                                                    <div class="label new">New</div>
                                                    <ul class="product__hover">
                                                        <li><a href="img/shop/p1.jpg" class="image-popup"><span
                                                                    class="arrow_expand"></span></a></li>
                                                        <li><a href="#"><span class="icon_heart_alt"></span></a></li>
                                                        <li><a href="#"><span class="icon_bag_alt"></span></a></li>
                                                    </ul>
                                                </div>
                                                <div class="product__item__text">
                                                    <h6><a href="#">Furry hooded parka</a></h6>
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
                                        <div class="col-lg-12 text-center">
                                            <div class="pagination__option">
                                                <a href="#">1</a>
                                                <a href="#">2</a>
                                                <a href="#">3</a>
                                                <a href="#"><i class="fa fa-angle-right"></i></a>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </section>
                    <!-- Shop Section End -->

                    <!-- Instagram Begin -->
                    <div class="instagram">
                        <div class="container-fluid">
                            <div class="row">
                                <div class="col-lg-2 col-md-4 col-sm-4 p-0">
                                    <div class="instagram__item set-bg" data-setbg="img/instagram/in1.jpg">
                                        <div class="instagram__text">
                                            <i class="fa fa-instagram"></i>
                                            <a href="#">@ ashion_shop</a>
                                        </div>
                                    </div>
                                </div>
                                <div class="col-lg-2 col-md-4 col-sm-4 p-0">
                                    <div class="instagram__item set-bg" data-setbg="img/instagram/in2.jpg">
                                        <div class="instagram__text">
                                            <i class="fa fa-instagram"></i>
                                            <a href="#">@ ashion_shop</a>
                                        </div>
                                    </div>
                                </div>
                                <div class="col-lg-2 col-md-4 col-sm-4 p-0">
                                    <div class="instagram__item set-bg" data-setbg="img/instagram/in3.jpg">
                                        <div class="instagram__text">
                                            <i class="fa fa-instagram"></i>
                                            <a href="#">@ ashion_shop</a>
                                        </div>
                                    </div>
                                </div>
                                <div class="col-lg-2 col-md-4 col-sm-4 p-0">
                                    <div class="instagram__item set-bg" data-setbg="img/instagram/in4.jpg">
                                        <div class="instagram__text">
                                            <i class="fa fa-instagram"></i>
                                            <a href="#">@ ashion_shop</a>
                                        </div>
                                    </div>
                                </div>
                                <div class="col-lg-2 col-md-4 col-sm-4 p-0">
                                    <div class="instagram__item set-bg" data-setbg="img/instagram/in5.jpg">
                                        <div class="instagram__text">
                                            <i class="fa fa-instagram"></i>
                                            <a href="#">@ ashion_shop</a>
                                        </div>
                                    </div>
                                </div>
                                <div class="col-lg-2 col-md-4 col-sm-4 p-0">
                                    <div class="instagram__item set-bg" data-setbg="img/instagram/in6.jpg">
                                        <div class="instagram__text">
                                            <i class="fa fa-instagram"></i>
                                            <a href="#">@ ashion_shop</a>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                    <!-- Instagram End -->








                    <div class="container">
                        <h1 id="getid" style="display: none">
                            <%=request.getParameter("id")%>
                        </h1>
                        <table class="table table-bordered">
                            <thead>
                                <tr>
                                    <th>Date</th>
                                    <th>Room</th>
                                    <th>Topic</th>
                                    <th>Course</th>
                                    <th>Time</th>
                                    <th>Slot</th>
                                    <th>Lecture</th>
                                </tr>
                            </thead>
                            <tbody id="myTable">
                            </tbody>
                        </table>
                    </div>

                    <jsp:include page="inc/footer.jsp" />
                    <script>
                        $(document).ready(function () {
                            $.ajax({
                                url: "product_controller?ac=doshow",
                                method: "POST",
                                success: function (data) {
                                    console.log(data);
                                    let obj = $.parseJSON(data);
                                    $.each(obj, function (key, value) {
                                        $('#produclist').append(
                                            '<div class="col-lg-4 col-md-6">' 
                                            +'< div class= "col-lg-4 col-md-6" >'
                                            + '<div class="product__item">'
                                            + '<div class="product__item__pic set-bg" data-setbg="img/shop/p1.jpg">'
                                            + '<div class="label new">New</div>'
                                            + '<ul class="product__hover">'
                                            + '< li > <a href="img/shop/p1.jpg" class="image-popup">'                                
                                            + '< span class= "arrow_expand" ></span ></a ></li > '
                                            + '< li > <a href="#"><span class="icon_heart_alt"></span></a></li > '
                                            + '<li><a href="#"><span class="icon_bag_alt"></span></a></li>'
                                            + '</ul >'
                                            + ' </div >'
                                            + '<div class="product__item__text">'
                                            + ' <h6><a href="#">Furry hooded parka</a></h6>'
                                            + ' <div class="rating">'
                                            + ' <i class="fa fa-star"></i>'
                                            + ' <i class="fa fa-star"></i>'
                                            + '  <i class="fa fa-star"></i>'
                                            + '<i class="fa fa-star"></i>'
                                            + '<i class="fa fa-star"></i>'
                                            + '</div>'
                                            + '<div class="product__price">$ 59.0</div>'
                                            + '</div>'
                                            + '</div >'
                                            + '</div >'

                                        );
                                    });
                                },
                                error: function () {
                                    alert("error");
                                }

                            });
                            console.log('ok');
                            $.ajax({
                                url: "product_controller?ac=doshow",
                                method: "POST",
                                success: function (data) {
                                    console.log(data);
                                    let obj = $.parseJSON(data);
                                    $.each(obj, function (key, value) {
                                        $('#myTable').append("<tr> \n\
                 <td> " + value.pID + "</td> \n\
                  <td> " + value.pName + "</td> \n\
                   <td> " + value.pDes + "</td> \n\
                    <td> " + value.pPrice + "</td> \n\
                     <td> " + value.Address + "</td> \n\
                 <tr>");
                                    });
                                },
                                error: function () {
                                    alert("error");
                                }

                            });
                            console.log('ok')
                        });
                    </script>