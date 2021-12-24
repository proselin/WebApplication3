<%-- 
    Document   : check
    Created on : Nov 29, 2021, 11:35:34 PM
    Author     : quoch
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<jsp:include page="inc/header.jsp"></jsp:include>
    <div class="container">

        <h2>Dynamic Tabs</h2>
        <p>To make the tabs toggleable, add the data-toggle="tab" attribute to each link. Then add a .tab-pane class with a unique ID for every tab and wrap them inside a div element with class .tab-content.</p>

        <ul class="nav nav-tabs">
            <li class="active"><a data-toggle="tab" href="#home">Home</a></li>
            <li><a data-toggle="tab" href="#menu1">Menu 1</a></li>
            <li><a data-toggle="tab" href="#menu2">Menu 2</a></li>
            <li><a data-toggle="tab" href="#menu3">Menu 3</a></li>
        </ul>

        <div class="tab-content">
            <div id="home" class="tab-pane fade in active">
                <h3>HOME</h3>
                <p>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.</p>
            </div>
            <div id="menu1" class="tab-pane fade">
                <h3>Menu 1</h3>
                <p>Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat.</p>
            </div>
            <div id="menu2" class="tab-pane fade">
                <h3>Menu 2</h3>
                <p>Sed ut perspiciatis unde omnis iste natus error sit voluptatem accusantium doloremque laudantium, totam rem aperiam.</p>
            </div>
            <div id="menu3" class="tab-pane fade">
                <h3>Menu 3</h3>
                <p>Eaque ipsa quae ab illo inventore veritatis et quasi architecto beatae vitae dicta sunt explicabo.</p>
            </div>
        </div>
    </div>
    <div class="container">
        <!-- Trigger the modal with a button -->
        <button type="button" class="btn btn-info btn-lg" data-toggle="modal" data-target="#myModal">Open Modal</button>

        <!-- Modal -->
        <div class="modal fade" id="myModal" role="dialog">
            <div class="modal-dialog">

                <!-- Modal content-->
                <div class="modal-content">
                    <div class="modal-header">
                        <button type="button" class="close" data-dismiss="modal">&times;</button>
                        <h4 class="modal-title">Modal Header</h4>
                    </div>
                    <div class="modal-body">



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
                                        <h6>Description</h6>
                                        <div class="product__details__widget">
                                            <ul style="margin-left: 10px; margin-bottom: 20px;">
                                                <li>
                                                    <span>Brand</span>
                                                    <p>Chanel </p>
                                                </li>
                                                <li>
                                                    <span>From</span>
                                                    <p>France </p>
                                                </li>
                                                <li>
                                                    <span>Fragrance</span>
                                                    <p>Close </p>
                                                </li>
                                                <li>
                                                    <span>Date</span>
                                                    <p>2019 </p>
                                                </li>
                                                <li>
                                                    <span>
                                                        Concentration</span>
                                                    <p>eau de parfum </p>

                                                </li>
                                                <li>
                                                    <span>
                                                        Incense</span>
                                                    <p>7 to 12 hours </p>

                                                </li>
                                                <li>
                                                    <span>
                                                        Sex</span>
                                                    <p>Woman </p>

                                                </li>

                                            </ul>
                                        </div>
                                        <p> Irresistibly sexy, irrepressibly spirited. A sparkling ambery fragrance that recalls
                                            a daring young Coco Chanel. An absolutely modern composition with a strong yet
                                            surprisingly fresh character.
                                        </p>

                                        <p></p>
                                    </div>
                                    <div class="tab-pane" id="tabs-2" role="tabpanel">
                                        <form>
                                            <div class="form-group">
                                                <label for="email">Email:</label>
                                                <input type="email" class="form-control" id="email" name="username" placeholder="Enter email">
                                            </div>
                                            <div class="form-group">
                                                <label for="pwd">Password:</label>
                                                <input type="password" class="form-control" id="pwd" placeholder="Enter password">
                                            </div>
                                            <div class="checkbox">
                                                <label><input type="checkbox"> Remember me</label>
                                            </div>
                                            <button type="submit" class="btn btn-default">Submit</button>
                                        </form>

                                    </div>

                                </div>
                            </div>
                        </div>
                    </div>                    

                    <div class="modal-footer">
                        <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
                    </div>
                </div>

            </div>
        </div>

    </div>
<jsp:include page="inc/footer.jsp"></jsp:include>
<script>
    $(document).ready(function () {
        $("#myBtn").click(function () {
            $("#myModal").modal();
        });
    });
</script>