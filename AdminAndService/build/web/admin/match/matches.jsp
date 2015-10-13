<%-- 
    Document   : blank
    Created on : Oct 6, 2015, 1:35:17 PM
    Author     : YoungKaka
--%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="app.access.model.Match"%>
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

        <title>TNA Matches</title>
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
                                    Matches
                                </header>
                                <%@include file="../session.jsp" %>
                                <!--        <a href="/matches?action=load"><button>Load News</button></a> -->
                                <!--        <a href="/matches">Refresh or F5</a>-->
                                <%
                                    List<Match> matches = (List<Match>) request.getAttribute("matches");
                                    if (matches == null) {
                                        matches = matchManager.getAll();
                                    }
                                    int count = 0;
                                    if (matches.size() > 10) {
                                        int a = matches.size();
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
                                            matches = matches.subList(ex, ex + c);
                                        } else {
                                            matches = matches.subList(ex, ex + 10);
                                        }
                                    }

                                %>
                                <form  class="form-inline" action="/admin/matches?action=search" method="POST">
                                    <div class="form-group">
                                        <div class="col-lg-10">
                                            <select class="form-control"  name="atr">
                                                <% for (String atr : Match.getAttributes()) {%>
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
                                            <th>Date</th>
                                            <th><i class="fa fa-bullhorn"></i> Title</th>
                                            <th>Home Goals</th>
                                            <th>Away Goals</th>
                                            <th>Home Squad</th>
                                            <th>Away Squad</th>

                                            <th>League</th>
                                            <th><i class=" fa fa-edit"></i> Status</th>
                                            <th></th>
                                        </tr>
                                    </thead>
                                    <tbody>
                                        <% for (Match m : matches) {%>
                                        <tr>
                                            <td></td>
                                            <td> <%=m.getId()%> </td>
                                            <td>  <%
                                                SimpleDateFormat sdf = new SimpleDateFormat("dd/MM/yyyy HH:mm:ss");
                                                String date = sdf.format(m.getDate());
                                                %>
                                                <%=date%></td>
                                            <td><a href="#"><%=m.getTitle()%></a></td>
                                            <td><%=m.getHomeGoals()%></td>
                                            <td><%=m.getAwayGoals()%></td>

                                            <td><%=m.getHomeSquad()%></td>
                                            <td><%=m.getAwaySquad()%></td>
                                            <td> <%
                                                String league = leagueManager.get(m.getlId()).getName();
                                                %>
                                                <%=league%></td>

                                            <td>
                                                <a href="match/editMatch.jsp?id=<%=m.getId()%>"><button class="btn btn-primary btn-xs"><i class="fa fa-pencil"></i></button></a>
                                                <a href="/admin/matches?action=del&id=<%=m.getId()%>"><button class="btn btn-danger btn-xs"><i class="fa fa-trash-o "></i></button></a>
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
