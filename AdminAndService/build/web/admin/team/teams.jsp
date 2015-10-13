<%-- 
    Document   : blank
    Created on : Oct 6, 2015, 1:35:17 PM
    Author     : YoungKaka
--%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page import="app.access.model.League"%>
<%@page import="app.access.model.Team"%>
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

        <title>TNA Teams</title>
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
                        <div class="col-lg-8">
                            <section class="panel">
                                <header class="panel-heading">
                                    Teams
                                </header>
                                <%@include file="../session.jsp" %>
                                <!--          <a href="/teams?action=load"><button>Load News</button></a>-->
                                <!--          <a href="/teams">Refresh or F5</a>-->
                                <%
                                    List<Team> teams = (List<Team>) request.getAttribute("teams");
                                    if (teams == null) {
                                        teams = teamManager.getAll();
                                    }

                                    int count = 0;
                                    if (teams.size() > 10) {
                                        int a = teams.size();
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
                                            teams = teams.subList(ex, ex + c);
                                        } else {
                                            teams = teams.subList(ex, ex + 10);
                                        }
                                    }

                                %>
                                <form class="form-inline" action="/admin/teams?action=search" method="POST">
                                    <div class="form-group">
                                        <div class="col-lg-8">
                                            <select class="form-control"  name="atr">
                                                <% for (String atr : Team.getAttributes()) {%>
                                                <option value="<%=atr%>" <% if (atr.equals(request.getParameter("atr"))) {%> selected <%}%>><%=atr%></option>
                                                <%}%>
                                            </select>
                                        </div>
                                    </div>
                                    <div class="form-group">
                                        <label for="cname" class="control-label sr-only">Search </label>
                                        <div class="col-lg-10">
                                            <input class="form-control" id="cname"  minlength="2" type="text" name="searchText" placeholder="Text" value="<%=request.getParameter("searchText")%>" required>
                                        </div>
                                    </div>
                                    <button type="submit" class="btn btn-shadow btn-info">Search</button>
                                </form>

                                <table class="table table-striped table-advance table-hover">
                                    <thead>
                                        <tr>
                                            <th></th>
                                            <th>ID</th>
                                            <th><i class="fa fa-bullhorn"></i> Name</th>
                                            <th>Logo</th>
                                            <th><i class="fa fa-bullhorn"></i> League</th>
                                            <th><i class=" fa fa-edit"></i> Status</th>
                                            <th></th>
                                        </tr>
                                    </thead>
                                    <tbody>
                                        <% for (Team t : teams) {%>
                                        <tr>
                                            <td></td>
                                            <td><%=t.getId()%></td>
                                            <td><a href="#"><%=t.getName()%></a></td>
                                            <td><img style="width: 30px; height: 30px;" src="./package/club/<%=t.getId()%>.png"/></td>
                                            <td>
                                                <%
                                                    League leag = leagueManager.get(t.getLeagueId());
                                                %>
                                                <%=leag.getName()%>
                                            </td>
                                            <td>
                                                <a href="team/editTeam.jsp?id=<%=t.getId()%>"><button class="btn btn-primary btn-xs"><i class="fa fa-pencil"></i></button></a>
                                                <a href="/admin/teams?action=del&id=<%=t.getId()%>"><button class="btn btn-danger btn-xs"><i class="fa fa-trash-o "></i></button></a>
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
        <script src="<%=path%>/admin/js/jquery.js"></script>
        <script src="<%=path%>/admin/js/bootstrap.min.js"></script>
        <script class="include" type="text/javascript" src="<%=path%>/admin/js/jquery.dcjqaccordion.2.7.js"></script>
        <script src="<%=path%>/admin/js/jquery.scrollTo.min.js"></script>
        <script src="<%=path%>/admin/js/jquery.nicescroll.js" type="text/javascript"></script>
        <script src="<%=path%>/admin/js/respond.min.js" ></script>

        <!--right slidebar-->
        <script src="<%=path%>/admin/js/slidebars.min.js"></script>

        <!--common script for all pages-->
        <script src="<%=path%>/admin/js/common-scripts.js"></script>

        <script type="text/javascript">
            $(function () {
                var manager = $(".manager");
                var ms = manager.attr("data-manager");
                if (ms === "right") {
                    manager.css("display", "block");
                }
            });
        </script>
    </body>
</html>
