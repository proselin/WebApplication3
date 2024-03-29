<%-- 
    Document   : footer
    Created on : Nov 10, 2021, 12:48:23 AM
    Author     : quoch
--%>

<!-- Footer Section Begin -->
        <footer class="footer">
            <div class="container">
                <div class="row">
                    <div class="col-lg-4 col-md-6 col-sm-7">
                        <div class="footer__about">
                            <div class="footer__logo">
                                <a href="./index.html"><img src="img/logo.png" alt=""></a>
                            </div>
                            <p>Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt
                                cilisis.</p>
                            <div class="footer__payment">
                                <a href="#"><img src="img/payment/payment-1.png" alt=""></a>
                                <a href="#"><img src="img/payment/payment-2.png" alt=""></a>
                                <a href="#"><img src="img/payment/payment-3.png" alt=""></a>
                                <a href="#"><img src="img/payment/payment-4.png" alt=""></a>
                                <a href="#"><img src="img/payment/payment-5.png" alt=""></a>
                            </div>
                        </div>
                    </div>
                    <div class="col-lg-2 col-md-3 col-sm-5">
                        <div class="footer__widget">
                            <h6>Quick links</h6>
                            <ul>
                                <li><a href="#">About</a></li>
                                <li><a href="#">Blogs</a></li>
                                <li><a href="#">Contact</a></li>
                                <li><a href="#">FAQ</a></li>
                            </ul>
                        </div>
                    </div>
                    <div class="col-lg-2 col-md-3 col-sm-4">
                        <div class="footer__widget">
                            <h6>Account</h6>
                            <ul>
                                <li><a href="#">My Account</a></li>
                                <li><a href="#">Orders Tracking</a></li>
                                <li><a href="#">Checkout</a></li>
                                <li><a href="#">Wishlist</a></li>
                            </ul>
                        </div>
                    </div>
                    <div class="col-lg-4 col-md-8 col-sm-8">
                        <div class="footer__newslatter">
                            <h6>NEWSLETTER</h6>
                            <form action="#">
                                <input type="text" placeholder="Email">
                                <button type="submit" class="site-btn">Subscribe</button>
                            </form>
                            <div class="footer__social">
                                <a href="#"><i class="fa fa-facebook"></i></a>
                                <a href="#"><i class="fa fa-twitter"></i></a>
                                <a href="#"><i class="fa fa-youtube-play"></i></a>
                                <a href="#"><i class="fa fa-brand"></i></a>
                                <a href="#"><i class="fa fa-pinterest"></i></a>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="row">
                    <div class="col-lg-12">
                        <!-- Link back to Colorlib can't be removed. Template is licensed under CC BY 3.0. -->
                        <div class="footer__copyright__text">
                            <p>Copyright &copy;
                                <script>document.write(new Date().getFullYear());</script> All rights reserved | This
                                template is made with <i class="bi bi-gem" aria-hidden="true"></i> by <a
                                    href="https://colorlib.com" target="_blank">Colorlib</a>
                            </p>
                        </div>
                        <!-- Link back to Colorlib can't be removed. Template is licensed under CC BY 3.0. -->
                    </div>
                </div>
            </div>
        </footer>
        <!-- Footer Section End -->

        <!-- Search Begin -->
        <div class="search-model">
            <div class="h-100 d-flex align-items-center justify-content-center">
                <div class="search-close-switch">+</div>
                <form class="search-model-form" action="product?ac=dosearch" method="GET">
                    <input type="text" id="search-input" placeholder="Enter some keyword (ex : perfume,...)">
                </form>
            </div>
        </div>
        <!-- Search End -->

        <!-- Js Plugins -->
        <script src="js/jquery-3.3.1.min.js"></script>
        <script src="js/bootstrap.min.js"></script>
        <script src="js/jquery.magnific-popup.min.js"></script>
        <script src="js/jquery-ui.min.js"></script>
        <script src="js/mixitup.min.js"></script>
        <script src="js/jquery.countdown.min.js"></script>
        <script src="js/jquery.slicknav.js"></script>
        <script src="js/owl.carousel.min.js"></script>
        <script src="js/jquery.nicescroll.min.js"></script>
        <script src="js/main.js"></script>

        <script>
                                    var container = document.getElementById('container')
                                    var slider = document.getElementById('slider');
                                    var slides = document.getElementsByClassName('slide').length;
                                    var buttons = document.getElementsByClassName('btn');


                                    var currentPosition = 0;
                                    var currentMargin = 0;
                                    var slidesPerPage = 0;
                                    var slidesCount = slides - slidesPerPage;
                                    var containerWidth = container.offsetWidth;
                                    var prevKeyActive = false;
                                    var nextKeyActive = true;

                                    window.addEventListener("resize", checkWidth);

                                    function checkWidth() {
                                        containerWidth = container.offsetWidth;
                                        setParams(containerWidth);
                                    }

                                    function setParams(w) {
                                        if (w < 551) {
                                            slidesPerPage = 1;
                                        } else {
                                            if (w < 901) {
                                                slidesPerPage = 2;
                                            } else {
                                                if (w < 1101) {
                                                    slidesPerPage = 3;
                                                } else {
                                                    slidesPerPage = 4;
                                                }
                                            }
                                        }
                                        slidesCount = slides - slidesPerPage;
                                        if (currentPosition > slidesCount) {
                                            currentPosition -= slidesPerPage;
                                        }
                                        ;
                                        currentMargin = -currentPosition * (100 / slidesPerPage);
                                        slider.style.marginLeft = currentMargin + '%';
                                        if (currentPosition > 0) {
                                            buttons[0].classList.remove('inactive');
                                        }
                                        if (currentPosition < slidesCount) {
                                            buttons[1].classList.remove('inactive');
                                        }
                                        if (currentPosition >= slidesCount) {
                                            buttons[1].classList.add('inactive');
                                        }
                                    }

                                    setParams();

                                    function slideRight() {
                                        if (currentPosition != 0) {
                                            slider.style.marginLeft = currentMargin + (100 / slidesPerPage) + '%';
                                            currentMargin += (100 / slidesPerPage);
                                            currentPosition--;
                                        }
                                        ;
                                        if (currentPosition === 0) {
                                            buttons[0].classList.add('inactive');
                                        }
                                        if (currentPosition < slidesCount) {
                                            buttons[1].classList.remove('inactive');
                                        }
                                    }
                                    ;

                                    function slideLeft() {
                                        if (currentPosition != slidesCount) {
                                            slider.style.marginLeft = currentMargin - (100 / slidesPerPage) + '%';
                                            currentMargin -= (100 / slidesPerPage);
                                            currentPosition++;
                                        }
                                        ;
                                        if (currentPosition == slidesCount) {
                                            buttons[1].classList.add('inactive');
                                        }
                                        if (currentPosition > 0) {
                                            buttons[0].classList.remove('inactive');
                                        }
                                    }
                                    ;
        </script>
    </body>

</html>