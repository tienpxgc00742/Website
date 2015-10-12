<%-- 
    Document   : contact
    Created on : Sep 11, 2015, 3:43:18 PM
    Author     : YoungKaka
--%>
<%@page import="app.MatchMerge"%>
<%@page import="app.Manager"%>
<%@page import="app.models.Match"%>
<%@page import="java.util.List"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="utf-8">
        <title>TNA Football - Responsive Hosting Template</title>
        <meta name="viewport" content="width=device-width, initial-scale=1.0">

        <script type="text/javascript">
            //<![CDATA[
            try {
                if (!window.CloudFlare) {
                    var CloudFlare = [{verbose: 0, p: 0, byc: 0, owlid: "cf", bag2: 1, mirage2: 0, oracle: 0, paths: {cloudflare: "/cdn-cgi/nexp/dok3v=1613a3a185/"}, atok: "ee0a5d4df12b4f792d2d4f87bbae65a0", petok: "aa50fc821fd88d55be3d8ffd6f51d7e5e7786b18-1441011893-3600", betok: "a3cab7392cb6f89f6069756c02b56ebb207a7684-1441011893-120", zone: "web3canvas.com", rocket: "0", apps: {"abetterbrowser": {"ie": "7", "opera": null, "chrome": null, "safari": null, "firefox": null}, "ga_key": {"ua": "UA-38030533-1", "ga_bs": "2"}}}];
                    !function (a, b) {
                        a = document.createElement("script"), b = document.getElementsByTagName("script")[0], a.async = !0, a.src = "//ajax.cloudflare.com/cdn-cgi/nexp/dok3v=e9627cd26a/cloudflare.min.js", b.parentNode.insertBefore(a, b)
                    }()
                }
            } catch (e) {
            }
            ;
            //]]>
        </script>
        <link href="css/bootstrap.min.css" rel="stylesheet">

        <link href="http://fonts.googleapis.com/css?family=Montserrat:400,700" rel="stylesheet" type="text/css">

        <link href="css/font-awesome.css" rel="stylesheet">

        <link href="css/hosting.css" rel="stylesheet" media="all">
        <link href="css/main.css" rel="stylesheet">
        
         <%=MatchMerge.getMergeCSS()%>
        <!--[if lt IE 9]>
          <script src="https://oss.maxcdn.com/html5shiv/3.7.2/html5shiv.min.js"></script>
          <script src="https://oss.maxcdn.com/respond/1.4.2/respond.min.js"></script>
        <![endif]-->
        <link href="css/other.css" rel="stylesheet">
        <script src="js/modernizr.js"></script>

        <script src="js/jquery.min.js"></script>
        <script type="text/javascript">
            /* <![CDATA[ */
            var _gaq = _gaq || [];
            _gaq.push(['_setAccount', 'UA-38030533-1']);
            _gaq.push(['_trackPageview']);

            (function () {
                var ga = document.createElement('script');
                ga.type = 'text/javascript';
                ga.async = true;
                ga.src = ('https:' == document.location.protocol ? 'https://ssl' : 'http://www') + '.google-analytics.com/ga.js';
                var s = document.getElementsByTagName('script')[0];
                s.parentNode.insertBefore(ga, s);
            })();

            (function (b) {
                (function (a) {
                    "__CF"in b && "DJS"in b.__CF ? b.__CF.DJS.push(a) : "addEventListener"in b ? b.addEventListener("load", a, !1) : b.attachEvent("onload", a)
                })(function () {
                    "FB"in b && "Event"in FB && "subscribe"in FB.Event && (FB.Event.subscribe("edge.create", function (a) {
                        _gaq.push(["_trackSocial", "facebook", "like", a])
                    }), FB.Event.subscribe("edge.remove", function (a) {
                        _gaq.push(["_trackSocial", "facebook", "unlike", a])
                    }), FB.Event.subscribe("message.send", function (a) {
                        _gaq.push(["_trackSocial", "facebook", "send", a])
                    }));
                    "twttr"in b && "events"in twttr && "bind"in twttr.events && twttr.events.bind("tweet", function (a) {
                        if (a) {
                            var b;
                            if (a.target && a.target.nodeName == "IFRAME")
                                a:{
                                    if (a = a.target.src) {
                                        a = a.split("#")[0].match(/[^?=&]+=([^&]*)?/g);
                                        b = 0;
                                        for (var c; c = a[b]; ++b)
                                            if (c.indexOf("url") === 0) {
                                                b = unescape(c.split("=")[1]);
                                                break a
                                            }
                                    }
                                    b = void 0
                                }
                            _gaq.push(["_trackSocial", "twitter", "tweet", b])
                        }
                    })
                })
            })(window);
            /* ]]> */
        </script>
    </head>
    <body><script type="text/javascript">
        //<![CDATA[
        try {
            (function (a) {
                var b = "http://", c = "demo.web3canvas.com", d = "/cdn-cgi/cl/", e = "img.gif", f = new a;
                f.src = [b, c, d, e].join("")
            })(Image)
        } catch (e) {
        }
        //]]>
        </script>
        <c:set var="state" value="videos" />
        <c:choose>
            <c:when test="${sessionScope.account == null}">
                <%@include file="header.jsp" %>
            </c:when>
            <c:otherwise>
                <%@include file="header_login.jsp" %>
            </c:otherwise>
        </c:choose>
        <%@include file="session.jsp" %>

   <% MatchMerge.BackgroundMerge bg = new MatchMerge().new BackgroundMerge();%>
        <div class="container">

            <div class="row PageHead" id="testimonials">
                <div class="col-md-12">
                    <% String league = request.getParameter("league");
                        String dl = "Premier League";
                        List<Match> list = dataManager.getPremierMatches().getMatches().subList(0, 8);
                        if (league != null && !"".equals(league)) {
                            if (league.equals("ligone")) {
                                dl = "Lig One";
                                list = dataManager.getLigoneMatches().getMatches().subList(0, 8);
                            } else if (league.equals("bundesliga")) {
                                dl = "Bundesliga";
                                list = dataManager.getBundesligaMatches().getMatches().subList(0, 8);
                            } else if (league.equals("seria")) {
                                dl = "Serie A";
                                list = dataManager.getSeriaMatches().getMatches().subList(0, 8);
                            } else if (league.equals("uefa")) {
                                dl = "Champions League";
                                list = dataManager.getUefaMatches().getMatches().subList(0, 8);
                            } else if (league.equals("laliga")) {
                                dl = "Laliga";
                                list = dataManager.getLaligaMatches().getMatches().subList(0, 8);
                            }

                        }
                    %>
                    <h1><%=dl%></h1> 

                    <h3><a href="?league=premier">Premier </a> | <a href="?league=laliga">Laliga</a> | <a href="?league=bundesliga">Bundesliga</a> | <a href="?league=ligone">Ligone </a> | <a href="?league=seria"> Serie A</a> | <a href="?league=uefa">Champions League</a></h3>
                </div>
            </div>

            <div class="row Testimonials">
                <% for (Match ma : list.subList(0, 4)) {%>
                <div class="col-sm-6 col-md-3 tm-data">

                    <div>  <a href="home?yId=<%=ma.getYoutube()%>">
                        <% String leftImg = Manager.getClubImageById(ma.getHomeId());
                                                 String rightImg =  Manager.getClubImageById(ma.getAwayId());%>
                                             
                                                <%=MatchMerge.getMergeHTML(leftImg,rightImg,bg.getBackgroundImage())%>

                        </a>
                        <div class="caption">
                            <h5><%=ma.getHomeTeamName()%> vs <%=ma.getAwayTeamName()%> </h5>
                            <p><%=ma.getDescription()%></p>
                        </div>
                    </div>
                </div>
                <%}%>
            </div>

            <div class="row Testimonials">
                <% for (Match ma : list.subList(4, 8)) {%>
                <div class="col-sm-6 col-md-3 tm-data">

                    <div>  <a href="home?yId=<%=ma.getYoutube()%>">
                           <% String leftImg = Manager.getClubImageById(ma.getHomeId());
                                                 String rightImg =  Manager.getClubImageById(ma.getAwayId());%>
                                             
                                                <%=MatchMerge.getMergeHTML(leftImg,rightImg,bg.getBackgroundImage())%>
                        </a>
                        <div class="caption">
                            <h5><%=ma.getHomeTeamName()%> vs <%=ma.getAwayTeamName()%> </h5>
                            <p><%=ma.getDescription()%></p>
                        </div>
                    </div>
                </div>
                <%}%>
            </div>

            <div class="row PartnersList"> <img src="images/logo1.jpg" alt="logo"> <img src="images/logo2.jpg" alt="logo"> <img src="images/logo3.jpg" alt="logo"> <img src="images/logo4.jpg" alt="logo"> <img src="images/logo5.jpg" alt="logo"> </div>
        </div>

        <%@include file="footer.jsp" %>


        <script src="js/bootstrap.min.js"></script>
        <script type="text/javascript">
        /* <![CDATA[ */
        (function () {
            try {
                var s, a, i, j, r, c, l = document.getElementsByTagName("a"), t = document.createElement("textarea");
                for (i = 0; l.length - i; i++) {
                    try {
                        a = l[i].getAttribute("href");
                        if (a && a.indexOf("/cdn-cgi/l/email-protection") > -1 && (a.length > 28)) {
                            s = '';
                            j = 27 + 1 + a.indexOf("/cdn-cgi/l/email-protection");
                            if (a.length > j) {
                                r = parseInt(a.substr(j, 2), 16);
                                for (j += 2; a.length > j && a.substr(j, 1) != 'X'; j += 2) {
                                    c = parseInt(a.substr(j, 2), 16) ^ r;
                                    s += String.fromCharCode(c);
                                }
                                j += 1;
                                s += a.substr(j, a.length - j);
                            }
                            t.innerHTML = s.replace(/</g, "&lt;").replace(/>/g, "&gt;");
                            l[i].setAttribute("href", "mailto:" + t.value);
                        }
                    } catch (e) {
                    }
                }
            } catch (e) {
            }
        })();
        /* ]]> */
        </script>
    </body>
</html>