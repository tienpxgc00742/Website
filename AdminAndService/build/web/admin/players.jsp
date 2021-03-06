<%-- 
    Document   : index
    Created on : Sep 5, 2015, 9:35:02 AM
    Author     : MrTien
--%>
<%@page import="app.access.base.PlayerAccess"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <meta name="description" content="">
        <meta name="author" content="Mosaddek">
        <meta name="keyword" content="FlatLab, Dashboard, Bootstrap, Admin, Template, Theme, Responsive, Fluid, Retina">
        <link rel="shortcut icon" href="img/favicon.png">

        <title>TNA Players</title>
    

        <link href="./css/bootstrap.min.css" rel="stylesheet">
        <link href="./css/bootstrap-reset.css" rel="stylesheet">
        <link href="./css/font-awesome.css" rel="stylesheet" />
        <link href="./css/slidebars.css" rel="stylesheet">
        <link href="./css/style.css" rel="stylesheet">
        <link href="./css/style-responsive.css" rel="stylesheet" />
        <link href="./css/tpxcss.css" rel="stylesheet">
        <link href="./css/toastr.css" rel="stylesheet">
        <link href="./css/tpxcss.css" rel="stylesheet">
        <link rel="stylesheet" href="./css/owl.carousel.css" type="text/css">
    </head>

    <body>
        <section id="container" class="">
            <!--header start-->
            <%@include file="./header.jsp" %>
            <!--header end-->
            <!--sidebar start-->
            <%@include file="./aside.jsp" %>
            <!--sidebar end-->
            <!--main content start-->
            <section id="main-content">
                <section class="wrapper">
                    <!-- page start-->

                    <section class="panel">
                        <header class="panel-heading">
                            All projects List
                            <span class="pull-right">
                                <button type="button" id="loading-btn" class="btn btn-warning btn-xs"><i class="fa fa-refresh"></i> Refresh</button>
                                <a href="#" class=" btn btn-success btn-xs"> Create New Project</a>
                            </span>
                        </header>
                        <div class="panel-body">
                            <div class="row">

                                <div class="col-md-12">
                                    <div class="input-group"><input type="text" placeholder="Search Here" class="input-sm form-control"> <span class="input-group-btn">
                                            <button type="button" class="btn btn-sm btn-success"> Go!</button> </span></div>
                                </div>
                            </div>
                        </div>
                        <table class="table table-hover p-table">
                            <thead>
                                <tr>
                                    <th>Project Name</th>
                                    <th>Team Member</th>
                                    <th>Project Progress</th>
                                    <th>Project Status</th>
                                    <th>Custom</th>
                                </tr>
                            </thead>
                            <tbody id="tablebody">
                            </tbody>
                        </table>
                        <div id="pagi"></div>
                        <script src="//ajax.googleapis.com/ajax/libs/jquery/1.9.1/jquery.min.js"></script>
                        <script src="//netdna.bootstrapcdn.com/twitter-bootstrap/2.3.1/js/bootstrap.min.js"></script>
                        <script src="./js/bootstrap-paginator.js"></script>
                        <script type='text/javascript'>

                            var options = {
                                currentPage: 1,
                                totalPages: <% PlayerAccess acess = PlayerAccess.getInstance();%> <%=acess.getTotalPlayer()%> / 10 + 1,
                                onPageClicked: function (e, originalEvent, type, page) {
                                    $.ajax({
                                        url: 'getPlayers?page=' + page,
                                        beforeSend: function () {
                                            $('#tablebody').empty();
                                            $('#tablebody').append("<div class=\"spinner\"> <div class=\"rect1\"></div> <div class=\"rect2\"></div> <div class=\"rect3\"></div> <div class=\"rect4\"></div> <div class=\"rect5\"></div> </div>");
                                            $('.spinner').show();
                                        },
                                        complete: function () {
                                            $('.spinner').hide();
                                        },
                                        success: function (responseText) {
                                            $('#tablebody').append(responseText);
                                        }
                                    });
                                }
                            };
                            $('#pagi').bootstrapPaginator(options);
                        </script>
                    </section>
                    <!-- page end-->
                </section>
            </section>
            <!--main content end-->

            <!-- Right Slidebar start -->
            <%@include file="./slidebar.jsp" %>
            <!-- Right Slidebar end -->
            <!--footer start-->
            <%@include file="./footer.jsp" %>
            <!--footer end-->
        </section>
<!--        <script src="./js/jquery.js"></script>-->
        <script class="include" type="text/javascript" src="./js/jquery.dcjqaccordion.2.7.js"></script>
        <script src="./js/jquery.scrollTo.min.js"></script>
        <script src="./js/slidebars.min.js"></script>
        <script src="./js/jquery.nicescroll.js" type="text/javascript"></script>
        <script src="./js/respond.min.js" ></script>
        <script src="./js/common-scripts.js"></script>
        <script src="./js/toastr.js"></script>
        <script src="./js/jquery.sparkline.js" type="text/javascript"></script>
        <script src="./assets/jquery-easy-pie-chart/jquery.easy-pie-chart.js"></script>
        <script src="./js/owl.carousel.js" ></script>
        <script src="./js/jquery.customSelect.min.js" ></script>
        <script src="./js/slidebars.min.js"></script>
        <script src="./js/common-scripts.js"></script>
        <script src="./js/sparkline-chart.js"></script>
        <script src="./js/easy-pie-chart.js"></script>
        <script src="./js/count.js"></script>
        <script src="./js/tpxjs.js"></script>
        <!--flot-->
        <script type="text/javascript" src="./js/flot/jquery.flot.min.js"></script>
        <script type="text/javascript" src="./js/flot/jquery.flot.time.js"></script>
        <script type="text/javascript" src="./js/flot/jshashtable-2.1.js"></script>
        <script type="text/javascript" src="./js/flot/jquery.numberformatter-1.2.3.min.js"></script>
        <script type="text/javascript" src="./js/flot/jquery.flot.symbol.js"></script>
        <script type="text/javascript" src="./js/flot/jquery.flot.axislabels.js"></script>
        <script type="text/javascript" src="./js/tpxjs.js"></script>

      
    </body>
</html>
