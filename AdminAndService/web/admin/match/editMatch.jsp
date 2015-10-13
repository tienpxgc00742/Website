<%-- 
    Document   : blank
    Created on : Oct 6, 2015, 1:35:17 PM
    Author     : YoungKaka
--%>


<%@page import="app.access.model.League"%>
<%@page import="app.access.model.Match"%>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <meta name="description" content="">
        <meta name="author" content="Mosaddek">
        <meta name="keyword" content="FlatLab, Dashboard, Bootstrap, Admin, Template, Theme, Responsive, Fluid, Retina">
        <link rel="shortcut icon" href="http://thevectorlab.net/flatlab/img/favicon.png">

        <title>TNA Matches</title>
   
        <!-- Bootstrap core CSS -->
        <link href="./css/bootstrap.min.css" rel="stylesheet">
        <link href="./css/bootstrap-reset.css" rel="stylesheet">
        <!--external css-->
        <link  href="./assets/font-awesome/css/font-awesome.css" rel="stylesheet" />

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
        <!-- Custom styles for this template -->
        <link href="./css/style.css" rel="stylesheet">
        <link href="./css/style-responsive.css" rel="stylesheet" />

        <!-- HTML5 shim and Respond.js IE8 support of HTML5 tooltipss and media queries -->
        <!--[if lt IE 9]>
          <script src="./js/html5shiv.js"></script>
          <script src="./js/respond.min.js"></script>
        <![endif]-->
    </head>

    <body>
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
                                    Edit Match
                                </header>
                                <div class="panel-body">
                                    <div class=" form">
                                        <%@include file="../session.jsp" %>
                                        <% String id = request.getParameter("id");
                                            if (id != null) {
                                                Match match = matchManager.get(Integer.parseInt(id));
                                        %>
                                        <form class="cmxform form-horizontal tasi-form" action="/admin/matches?action=edit" method="POST" novalidate="novalidate">
                                            <input type="text" name="id" value="<%=match.getId()%>" hidden="true"/>
                                            <div class="form-group ">
                                                <label for="cdate" class="control-label col-lg-2">Date </label>
                                                <div class="col-md-4">
                                                    <div data-date="2012-12-21T15:25:00Z" class="input-group date form_datetime-meridian">
                                                        <input type="text" class="form-control" name="date"  value="<%=match.getDate()%>" readonly size="16">
                                                        <div class="input-group-btn">
                                                            <button type="button" class="btn btn-danger date-reset"><i class="fa fa-times"></i></button>
                                                            <button type="button" class="btn btn-info date-set"><i class="fa fa-calendar"></i></button>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="form-group ">
                                                <label for="cname" class="control-label col-lg-2">Title </label>
                                                <div class="col-lg-10">
                                                    <input class="form-control" id="cemail" type="text" name="title" value="<%=match.getTitle()%>" required>
                                                </div>
                                            </div>
                                            <div class="form-group ">
                                                <label for="cname" class="control-label col-lg-2">Home Team </label>
                                                <div class="col-lg-10">
                                                    <input class="form-control" id="cemail" type="text" name="homeId" value="<%=match.getHomeId()%>" required>
                                                </div>
                                            </div>
                                            <div class="form-group ">
                                                <label for="cname" class="control-label col-lg-2">Away Team </label>
                                                <div class="col-lg-10">
                                                    <input class="form-control" id="cemail" type="text" name="awayId" value="<%=match.getAwayId()%>" required>
                                                </div>
                                            </div>
                                            <div class="form-group ">
                                                <label for="cname" class="control-label col-lg-2">Home Goals </label>
                                                <div class="col-lg-5">
                                                    <div class="spinner4">
                                                        <div class="input-group" style="width:150px;">
                                                            <div class="spinner-buttons input-group-btn">
                                                                <button type="button" class="btn spinner-up btn-warning">
                                                                    <i class="fa fa-plus"></i>
                                                                </button>
                                                            </div>
                                                            <input type="text" class="spinner-input form-control" maxlength="3" name="homeGoals" value="<%=match.getHomeGoals()%>" readonly required>
                                                            <div class="spinner-buttons input-group-btn">
                                                                <button type="button" class="btn spinner-down btn-danger">
                                                                    <i class="fa fa-minus"></i>
                                                                </button>
                                                            </div>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="form-group ">
                                                <label for="cname" class="control-label col-lg-2">Away Goals </label>
                                                <div class="col-lg-5">
                                                    <div class="spinner4">
                                                        <div class="input-group" style="width:150px;">
                                                            <div class="spinner-buttons input-group-btn">
                                                                <button type="button" class="btn spinner-up btn-warning">
                                                                    <i class="fa fa-plus"></i>
                                                                </button>
                                                            </div>
                                                            <input type="text" class="spinner-input form-control" maxlength="3" name="awayGoals" value="<%=match.getAwayGoals()%>" readonly required>
                                                            <div class="spinner-buttons input-group-btn">
                                                                <button type="button" class="btn spinner-down btn-danger">
                                                                    <i class="fa fa-minus"></i>
                                                                </button>
                                                            </div>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="form-group ">
                                                <label for="cname" class="control-label col-lg-2">League </label>
                                                <div class="col-lg-10">
                                                    <select class="form-control"  name="lId">
                                                        <% for (League leag : leagueManager.getAll()) {%>
                                                        <option value="<%=leag.getId()%>" <% if (leag.getId() == match.getlId()) {%> selected <%}%>><%=leag.getName()%></option>
                                                        <%}%>
                                                    </select>
                                                </div>
                                            </div>
                                            <div class="form-group ">
                                                <label for="cname" class="control-label col-lg-2">Home Squad </label>
                                                <div class="col-lg-10">
                                                    <input class="form-control" id="cemail" type="text" name="homeSquad" value="<%=match.getHomeSquad()%>" >
                                                </div>
                                            </div>
                                            <div class="form-group ">
                                                <label for="cname" class="control-label col-lg-2">Away Squad </label>
                                                <div class="col-lg-10">
                                                    <input class="form-control" id="cemail" type="text" name="awaySquad" value="<%=match.getAwaySquad()%>">
                                                </div>
                                            </div>
                                            <div class="form-group ">
                                                <label for="curl" class="control-label col-lg-2">Url</label>
                                                <div class="col-lg-10">
                                                    <input class="form-control" id="curl" type="url" name="url" value="<%=match.getUrl()%>"  >
                                                </div>
                                            </div>
                                            <div class="form-group ">
                                                <label for="cname" class="control-label col-lg-2">Youtube </label>
                                                <div class="col-lg-10">
                                                    <input class="form-control" id="cemail" type="text" name="youtube" value="<%=match.getYoutube()%>" >
                                                </div>
                                            </div>
                                            <div class="form-group ">
                                                <label for="cname" class="control-label col-lg-2">Description </label>
                                                <div class="col-lg-10">
                                                    <input class="form-control" id="cemail" type="text" name="description" value="<%=match.getDescription()%>" >
                                                </div>
                                            </div>           
                                            <div class="form-group">
                                                <div class="col-lg-offset-2 col-lg-10">
                                                    <input value="Save" class="btn btn-danger" type="submit"/>
                                                    <a href="/admin/matches"><button class="btn btn-default" type="button">Cancel</button></a>
                                                </div>
                                            </div>
                                        </form>
                                        <% }%>
                                    </div>

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
        <script type="text/javascript" src="./js/jquery.validate.min.js"></script>
        <script src="./js/respond.min.js" ></script>

        <!--right slidebar-->
        <script src="./js/slidebars.min.js"></script>

        <!--common script for all pages-->
        <script src="./js/common-scripts.js"></script>

        <!--script for this page-->
        <script src="./js/form-validation-script.js"></script>



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


        <!--summernote-->
        <script src="./assets/summernote/dist/summernote.min.js"></script>

        <!--this page  script only-->
        <script src="./js/advanced-form-components.js"></script>

    </body>
</html>
