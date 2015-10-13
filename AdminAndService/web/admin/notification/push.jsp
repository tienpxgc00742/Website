<%-- 
    Document   : push
    Created on : Oct 7, 2015, 8:46:28 PM
    Author     : YoungKaka
--%>
<%@page import="app.models.Match"%>
<%@page import="java.util.List"%>
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
        <!-- Bootstrap core CSS -->
        <link href="./css/bootstrap.min.css" rel="stylesheet">
        <link href="./css/bootstrap-reset.css" rel="stylesheet">
        <!--external css-->
        <link href="./assets/font-awesome/css/font-awesome.css" rel="stylesheet" />

        <link rel="stylesheet" type="text/css" href="./assets/bootstrap-fileupload/bootstrap-fileupload.css" />
        <link rel="stylesheet" type="text/css" href="./assets/bootstrap-wysihtml5/bootstrap-wysihtml5.css" />
        <link rel="stylesheet" type="text/css" href="./assets/bootstrap-datepicker/css/datepicker.css" />
        <link rel="stylesheet" type="text/css" href="./assets/bootstrap-timepicker/compiled/timepicker.css" />
        <link rel="stylesheet" type="text/css" href="./assets/bootstrap-colorpicker/css/colorpicker.css" />
        <link rel="stylesheet" type="text/css" href="./assets/bootstrap-daterangepicker/daterangepicker-bs3.css" />
        <link rel="stylesheet" type="text/css" href="./assets/bootstrap-datetimepicker/css/datetimepicker.css" />
        <link rel="stylesheet" type="text/css" href="./assets/jquery-multi-select/css/multi-select.css" />
        <!--right slidebar-->
        <link href="./css/slidebars.css" rel="stylesheet">

        <!--toastr-->
        <link href="./assets/toastr-master/toastr.css" rel="stylesheet" type="text/css" />

        <!-- Custom styles for this template -->
        <link href="./css/style.css" rel="stylesheet">
        <link href="./css/style-responsive.css" rel="stylesheet" />

        <!-- HTML5 shim and Respond.js IE8 support of HTML5 tooltipss and media queries -->
        <!--[if lt IE 9]>
          <script src="./js/html5shiv.js"></script>
          <script src="./js/respond.min.js"></script>
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
                                    <div class="form-group" >
                                        <label>Leagues</label>
                                        <select class="form-control" id="league" name="league" >
                                            <%for (League l : leagueManager.getAll()) {%>
                                            <option value="<%=l.getId()%>"><%=l.getName()%></option>
                                            <%}%>
                                        </select>
                                    </div>
                                    <div class="form-group">
                                        <label class="control-label" for="title">Title</label>
                                        <!--                                    <input id="title" type="text" class="form-control" name="title"  placeholder="Enter a title ... "  required>-->
                                        <select class="form-control" id="title" name="title" >

                                        </select>
                                    </div>
                                    <div class="form-group">
                                        <label class="control-label" for="message">Message</label>
                                        <textarea class="form-control" id="message" type="text" name="message" placeholder="message" rows="3" placeholder="Enter a message ..." required>Let's watch this match now !</textarea>
                                    </div>

                                </div>
                                          
                                <div class="col-md-4">
                                
                                    <div class="form-group">
                                        <label>Video / News</label>
                                        <select class="form-control" id="type" name="type">
                                            <option value="videos">Video</option>
                                            <option value="news">News</option>
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
        <script src="./js/jquery.js"></script>
        <script src="./js/bootstrap.min.js"></script>
        <script class="include" type="text/javascript" src="./js/jquery.dcjqaccordion.2.7.js"></script>
        <script src="./js/jquery.scrollTo.min.js"></script>
        <script src="./js/slidebars.min.js"></script>
        <script src="./js/jquery.nicescroll.js" type="text/javascript"></script>
        <script src="./js/respond.min.js" ></script>

        <!-- this page -->
         <script type="text/javascript" src="./assets/fuelux/js/spinner.min.js"></script>
        <script type="text/javascript" src="./assets/bootstrap-fileupload/bootstrap-fileupload.js"></script>
        <script type="text/javascript" src="./assets/bootstrap-wysihtml5/wysihtml5-0.3.0.js"></script>
        <script type="text/javascript" src="./assets/bootstrap-wysihtml5/bootstrap-wysihtml5.js"></script>
        <script type="text/javascript" src="./assets/bootstrap-datepicker/js/bootstrap-datepicker.js"></script>
        <script type="text/javascript" src="./assets/bootstrap-datetimepicker/js/bootstrap-datetimepicker.js"></script>
        <script type="text/javascript" src="./assets/bootstrap-daterangepicker/moment.min.js"></script>
        <script type="text/javascript" src="./assets/bootstrap-daterangepicker/daterangepicker.js"></script>
        <script type="text/javascript" src="./assets/bootstrap-colorpicker/js/bootstrap-colorpicker.js"></script>
        <script type="text/javascript" src="./assets/bootstrap-timepicker/js/bootstrap-timepicker.js"></script>
        <script type="text/javascript" src="./assets/jquery-multi-select/js/jquery.multi-select.js"></script>
        <script type="text/javascript" src="./assets/jquery-multi-select/js/jquery.quicksearch.js"></script>
        <!--toastr-->
        <script src="./assets/toastr-master/toastr.js"></script>

        <!--common script for all pages-->
        <script src="./js/common-scripts.js"></script>
<!--this page  script only-->
        <script src="./js/advanced-form-components.js"></script>
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
                    var tp = $("#type").val();

                    Parse.Push.send({
                        where: new Parse.Query(Parse.Installation),
                        data: {
                            alert: title,
                            des: msg,
                            league: leag,
                            type: tp
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

                $("#league").change(function () {
                    var sid =$(this).val();
                    $.ajax({
                        type: "POST",
                        url: "/admin/notification",
                        data: {id:sid},
                        success: function (res) {
                          $("#title").html(res);
                        }
                    });
                });
                 
            });
        </script>


    </body>
</html>

