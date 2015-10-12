<%-- 
    Document   : blank
    Created on : Oct 6, 2015, 1:35:17 PM
    Author     : YoungKaka
--%>

<%@page import="app.access.model.User"%>
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
 <% String path = request.getContextPath();%>
    <!-- Bootstrap core CSS -->
    <link href="<%=path%>/admin/css/bootstrap.min.css" rel="stylesheet">
    <link href="<%=path%>/admin/css/bootstrap-reset.css" rel="stylesheet">
    <!--external css-->
    <link href="<%=path%>/admin/assets/font-awesome/css/font-awesome.css" rel="stylesheet" />
      <!--right slidebar-->
      <link href="<%=path%>/admin/css/slidebars.css" rel="stylesheet">
    <!-- Custom styles for this template -->
    <link href="<%=path%>/admin/css/style.css" rel="stylesheet">
    <link href="<%=path%>/admin/css/style-responsive.css" rel="stylesheet" />

    <!-- HTML5 shim and Respond.js IE8 support of HTML5 tooltipss and media queries -->
    <!--[if lt IE 9]>
      <script src="<%=path%>/admin/js/html5shiv.js"></script>
      <script src="<%=path%>/admin/js/respond.min.js"></script>
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
                             Advanced Form validations
                          </header>
                          <div class="panel-body">
                              <div class="form">
                                     <%@include file="../session.jsp" %>
        <% String id = request.getParameter("id");
            if (id != null) {
            User user = userManager.get(Integer.parseInt(id));
        %>
                                  <form class="cmxform form-horizontal tasi-form" action="/admin/users?action=edit" method="POST">
                                      <input type="text" name="id" value="<%=user.getId()%>" hidden="true"/>
                                      <div class="form-group ">
                                          <label for="cname" class="control-label col-lg-2">Name </label>
                                          <div class="col-lg-10">
                                              <input class="form-control" id="cname" name="name" value="<%=user.getName()%>" minlength="2" type="text" required>
                                          </div>
                                      </div>
                                      <div class="form-group ">
                                          <label for="cemail" class="control-label col-lg-2">E-Mail </label>
                                          <div class="col-lg-10">
                                              <input class="form-control" id="cemail" type="email" name="email" value="<%=user.getEmail()%>" required>
                                          </div>
                                      </div>
                                      <div class="form-group ">
                                          <label for="curl" class="control-label col-lg-2">API Key</label>
                                          <div class="col-lg-10">
                                              <input class="form-control" id="curl" type="text" name="apikey" value="<%=user.getApikey()%>" required>
                                          </div>
                                      </div>
                                          <div class="form-group ">
                                          <label for="curl" class="control-label col-lg-2">Role</label>
                                          <div class="col-lg-10">
                                              <select class="form-control" name="role"> 
                                                  <option value="user">User / Developer</option>
                                                  <option value="admin">Admin</option>
                                              </select>
                                          </div>
                                      </div>
                                   
                                      <div class="form-group">
                                          <div class="col-lg-offset-2 col-lg-10">
                                              <input value="Save" class="btn btn-danger" type="submit"/>
                                              <a href="/admin/users"><button class="btn btn-default" type="button">Cancel</button></a>
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
    <script src="<%=path%>/admin/js/jquery.js"></script>
    <script src="<%=path%>/admin/js/bootstrap.min.js"></script>
    <script class="include" type="text/javascript" src="<%=path%>/admin/js/jquery.dcjqaccordion.2.7.js"></script>
    <script src="<%=path%>/admin/js/jquery.scrollTo.min.js"></script>
    <script src="<%=path%>/admin/js/jquery.nicescroll.js" type="text/javascript"></script>
    <script type="text/javascript" src="<%=path%>/admin/js/jquery.validate.min.js"></script>
    <script src="<%=path%>/admin/js/respond.min.js" ></script>

  <!--right slidebar-->
  <script src="<%=path%>/admin/js/slidebars.min.js"></script>

    <!--common script for all pages-->
    <script src="<%=path%>/admin/js/common-scripts.js"></script>

    <!--script for this page-->
    <script src="<%=path%>/admin/js/form-validation-script.js"></script>


  </body>
</html>
