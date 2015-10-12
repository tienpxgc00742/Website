<%-- 
    Document   : push
    Created on : Oct 7, 2015, 8:46:28 PM
    Author     : YoungKaka
--%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page import="app.access.model.League"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <meta name="description" content="">
        <meta name="author" content="Mosaddek">
        <meta name="keyword" content="FlatLab, Dashboard, Bootstrap, Admin, Template, Theme, Responsive, Fluid, Retina">
        <link rel="shortcut icon" href="http://thevectorlab.net/flatlab/img/favicon.png">

        <title>TNA Notification</title>
        <% String path = request.getContextPath();%>
        <!-- Bootstrap core CSS -->
        <link href="<%=path%>/admin/css/bootstrap.min.css" rel="stylesheet">
        <link href="<%=path%>/admin/css/bootstrap-reset.css" rel="stylesheet">
        <!--external css-->
        <link href="<%=path%>/admin/assets/font-awesome/css/font-awesome.css" rel="stylesheet" />

        <!--right slidebar-->
        <link href="<%=path%>/admin/css/slidebars.css" rel="stylesheet">

        <!--toastr-->
        <link href="<%=path%>/admin/assets/toastr-master/toastr.css" rel="stylesheet" type="text/css" />

        <!-- Custom styles for this template -->
        <link href="<%=path%>/admin/css/style.css" rel="stylesheet">
        <link href="<%=path%>/admin/css/style-responsive.css" rel="stylesheet" />

        <!-- HTML5 shim and Respond.js IE8 support of HTML5 tooltipss and media queries -->
        <!--[if lt IE 9]>
          <script src="<%=path%>/admin/js/html5shiv.js"></script>
          <script src="<%=path%>/admin/js/respond.min.js"></script>
        <![endif]-->
        <script type="text/javascript" src="http://ajax.googleapis.com/ajax/libs/jquery/1.7.2/jquery.min.js"></script>
        <script type="text/javascript" src="http://www.parsecdn.com/js/parse-latest.js"></script>
    </head>

    <body>
    <c:set var="ms" value="right"/>
    <section id="container" class="">
        <!--header start-->
        <%@include file="../header.jsp" %>
        <!--header end-->
        <!--sidebar start-->
        <%@include file="../aside.jsp" %>
        <!--sidebar end-->
        <!--main content start-->
        <section id="main-content">
            <section class="wrapper site-min-height">
                <!-- page start-->
                <div class="panel">
                    <header class="panel-heading">
                        Notification
                    </header>
                    <%@include file="../session.jsp" %>
                    <div class="panel-body">
                        <div class="row toastr-row">
                            <div class="col-md-4">
                                <div class="form-group">
                                    <label class="control-label" for="title">Title</label>
                                    <input id="title" type="text" class="form-control" name="title"  placeholder="Enter a title ... "  required>
                                </div>
                                <div class="form-group">
                                    <label class="control-label" for="message">Message</label>
                                    <textarea class="form-control" id="message" type="text" name="message" placeholder="message" rows="3" placeholder="Enter a message ..."  required></textarea>
                                </div>

                            </div>
                            <div class="col-md-2">
                                <div class="form-group" id="toastTypeGroup">
                                    <label>Leagues</label>
                                    <select class="form-control" id="league" name="league" >
                                        <%for (League l : leagueManager.getAll()) {%>
                                        <option value="<%=l.getShortName()%>"><%=l.getName()%></option>
                                        <%}%>
                                    </select>
                                </div>
                                <div class="form-group" id="toastTypeGroup">
                                    <label>Video / News</label>
                                    <select class="form-control" id="type" name="type">
                                        <option>Video</option>
                                        <option>News</option>
                                    </select>
                                </div>
                            </div>

                        </div>
                        <div class="row">
                            <div class="col-md-12">
                                <button type="button" class="btn btn-success" id="showtoast">Push Notification</button>
                            </div>
                        </div>

                    </div>
                </div>
                <!-- page end-->
            </section>
        </section>
        <!--main content end-->

        <!-- Right Slidebar start -->
        <%@include file="../slidebar.jsp" %>
        <!-- Right Slidebar end -->

        <!--footer start-->
        <%@include file="../footer.jsp" %>
        <!--footer end-->
    </section>

    <!-- js placed at the end of the document so the pages load faster -->
    <script src="<%=path%>/admin/js/jquery.js"></script>
    <script src="<%=path%>/admin/js/bootstrap.min.js"></script>
    <script class="include" type="text/javascript" src="<%=path%>/admin/js/jquery.dcjqaccordion.2.7.js"></script>
    <script src="<%=path%>/admin/js/jquery.scrollTo.min.js"></script>
    <script src="<%=path%>/admin/js/slidebars.min.js"></script>
    <script src="<%=path%>/admin/js/jquery.nicescroll.js" type="text/javascript"></script>
    <script src="<%=path%>/admin/js/respond.min.js" ></script>

    <!--toastr-->
    <script src="<%=path%>/admin/assets/toastr-master/toastr.js"></script>

    <!--common script for all pages-->
    <script src="<%=path%>/admin/js/common-scripts.js"></script>

    <script type="text/javascript">
        $(function () {
            Parse.initialize("pdYK0WsHAeH1LZjkYJHvzjizTFPexV15rmNkDaqM", "iArj7ofWqyvtpqOPXGDd6AkD5jnZSTuFFPZQf8Nk");



            var i = -1;
            var toastCount = 0;
            var $toastlast;
            var successToast = "success";
            var infoToast = "info";
            var warningToast = "warning";
            var errorToast = "error";



            $('#showtoast').click(function () {
                show(infoToast, "Please wait a few secconds ...", "");
                $(this).attr("disabled", true);
                push();
            });

            function show(type, title, msg) {

                var toastIndex = toastCount++;

                toastr.options = {
                    closeButton: true,
                    progressBar: true,
                    positionClass: 'toast-top-right',
                    onclick: null
                };


                toastr.options.onclick = function () {
                    alert('You can perform some custom action after a toast goes away');
                };



                toastr.options.showDuration = 500;



                toastr.options.hideDuration = 1000;



                toastr.options.timeOut = 5000;



                toastr.options.extendedTimeOut = 1000;


                toastr.options.showEasing = "swing";


                toastr.options.hideEasing = "linear";

                toastr.options.showMethod = "fadeIn";



                toastr.options.hideMethod = "fadeOut";



                var $toast = toastr[type](msg, title); // Wire up an event handler to a button in the toast, if it exists
                $toastlast = $toast;
                if ($toast.find('#okBtn').length) {
                    $toast.delegate('#okBtn', 'click', function () {
                        alert('you clicked me. i was toast #' + toastIndex + '. goodbye!');
                        $toast.remove();
                    });
                }
                if ($toast.find('#surpriseBtn').length) {
                    $toast.delegate('#surpriseBtn', 'click', function () {
                        alert('Surprise! you clicked me. i was toast #' + toastIndex + '. You could perform an action here.');
                    });
                }
            }

            function getLastToast() {
                return $toastlast;
            }
//                $('#clearlasttoast').click(function () {
//                    toastr.clear(getLastToast());
//                });
//                $('#cleartoasts').click(function () {
//                    toastr.clear();
//                });

            function push() {
                var title = $("#title").val();
                var msg = $("#message").val();
                var leag = $("#league").val();


                Parse.Push.send({
                    where: new Parse.Query(Parse.Installation),
                    data: {
                        alert: title,
                        des: msg,
                        league: leag
                    }
                }, {
                    success: function (object) {
                        show(successToast, title, msg);
                        $('#showtoast').attr("disabled", false);
                    },
                    error: function (model, error) {
                        show(errorToast, "Push Error !", msg);
                        $('#showtoast').attr("disabled", false);
                    }
                });
            }
        });

         $(document).ready(function () {
                var manager = $(".manager");
                var ms = manager.attr("data-manager");
                if (ms === "right") {
                    manager.css("display", "block");
                }
            });
    </script>


</body>
</html>

