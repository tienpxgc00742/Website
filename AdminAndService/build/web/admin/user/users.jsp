<%-- 
    Document   : blank
    Created on : Oct 6, 2015, 1:35:17 PM
    Author     : YoungKaka
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page import="app.access.model.User"%>
<%@page import="java.util.List"%>
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

        <title>TNA Users</title>

        <!-- Bootstrap core CSS -->
        <link href="./css/bootstrap.min.css" rel="stylesheet">
        <link href="./css/bootstrap-reset.css" rel="stylesheet">
        <!--external css-->
        <link href="./assets/font-awesome/css/font-awesome.css" rel="stylesheet" />
        <!--right slidebar-->
        <link href="./css/slidebars.css" rel="stylesheet">
        <!-- Custom styles for this template -->
        <link href="./css/style.css" rel="stylesheet">
        <link href="./css/style-responsive.css" rel="stylesheet" />
        <!--toastr-->
        <link href="./assets/toastr-master/toastr.css" rel="stylesheet" type="text/css" />
        <!-- HTML5 shim and Respond.js IE8 support of HTML5 tooltipss and media queries -->
        <!--[if lt IE 9]>
          <script src="./js/html5shiv.js"></script>
          <script src="./js/respond.min.js"></script>
        <![endif]-->
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
                    <!--              insert coincard here...-->
                    <div class="row">
                        <div class="col-lg-12">
                            <section class="panel">
                                <header class="panel-heading">
                                    Users
                                </header>

                                <%@include file="../session.jsp" %>
                                <%
                                    List<User> users = (List<User>) request.getAttribute("users");
                                    if (users == null) {
                                        users = userManager.getAll();
                                    }
                                    int count = 0;
                                    if (users.size() > 10) {
                                        int a = users.size();
                                        int b = 10;
                                        count = a / b;
                                        int c = a - (count * b);
                                        if (c > 0) {
                                            count += 1;
                                        }
                                        String index = request.getParameter("index");
                                        int ex = 0;

                                        if (index != null) {
                                            ex = Integer.parseInt(index);
                                            if (ex >= 0) {
                                                ex = ex * 10;
                                            }
                                        }
                                        if (ex / 10 == count - 1) {
                                            users = users.subList(ex, ex + c);
                                        } else {
                                            users = users.subList(ex, ex + 10);
                                        }
                                    }

                                %>
                                <form  class="form-inline" action="/admin/users?action=search" method="POST">
                                    <div class="form-group">
                                        <div class="col-lg-10">
                                            <select class="form-control" name="atr">
                                                <% for (String atr : User.getAttributes()) {%>
                                                <option value="<%=atr%>" <% if (atr.equals(request.getParameter("atr"))) {%> selected <%}%>><%=atr%></option>
                                                <%}%>
                                            </select>
                                        </div>
                                    </div>
                                    <div class="form-group">
                                        <label for="cname" class="control-label sr-only">Search </label>
                                        <div class="col-lg-10">
                                            <input class="form-control" id="cname"  minlength="2" type="text" name="searchText" placeholder="Text" value="<%=request.getParameter("searchText") == null ? "" : request.getParameter("searchText")%>" required>
                                        </div>
                                    </div>
                                    <button type="submit" class="btn btn-shadow btn-info">Search</button>
                                </form>

                                <table class="table table-striped table-advance table-hover">
                                    <thead>
                                        <tr>
                                            <th></th>
                                            <th>ID</th>
                                            <th><i class="fa fa-bullhorn"></i> Email</th>
                                            <th><i class="fa fa-check"></i> Name</th>
                                            <th class="hidden-phone"><i class="fa fa-question-circle"></i> API KEY</th>
                                            <th><i class="fa fa-check"></i> Role</th>
                                            <th><i class=" fa fa-edit"></i> Status</th>
                                            <th></th>
                                        </tr>
                                    </thead>
                                    <tbody>
                                        <% for (User u : users) {%>
                                        <tr>
                                            <td></td>
                                            <td><%=u.getId()%></td>
                                            <td><a href="#"><%=u.getEmail()%></a></td>
                                            <td><%=u.getName()%></td>
                                            <td><%=u.getApikey()%></td>
                                            <td><%=u.getRole()%></td>
                                            <td>
                                                <a href="/admin/users?action=edit&id=<%=u.getId()%>"><button class="btn btn-primary btn-xs"><i class="fa fa-pencil"></i></button></a>
                                                <a class="showtoast" href="/admin/users?action=del&id=<%=u.getId()%>"><button class="btn btn-danger btn-xs"><i class="fa fa-trash-o "></i></button></a>
                                            </td>
                                        </tr>
                                        <%}%>
                                    </tbody>
                                </table>

                                <div >
                                    <ul class="pagination pagination-sm pull-right">
                                        <li><a href="#">«</a></li>
                                            <% for (int i = 0; i < count; i++) {%>
                                        <li><a href="?index=<%=i%>"><%=(i + 1)%></a></li>
                                            <%}%>
                                        <li><a href="#">»</a></li>
                                    </ul>
                                </div>
                            </section>
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
        <script src="./js/jquery.nicescroll.js" type="text/javascript"></script>
        <script src="./js/respond.min.js" ></script>

        <!--right slidebar-->
        <script src="./js/slidebars.min.js"></script>

        <!--common script for all pages-->
        <script src="./js/common-scripts.js"></script>
        <!--toastr-->
        <script src="./assets/toastr-master/toastr.js"></script>

        <script type="text/javascript">
            $(function () {


                var i = -1;
                var toastCount = 0;
                var $toastlast;
                var successToast = "success";
                var infoToast = "info";
                var warningToast = "warning";
                var errorToast = "error";



                $('.showtoast').click(function () {
                    show(warningToast, "Warning ....", "Please check statistics before delete this user");

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
