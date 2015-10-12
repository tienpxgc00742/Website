<%-- 
    Document   : index
    Created on : Sep 11, 2015, 3:26:25 PM
    Author     : YoungKaka
--%>

<%@page import="app.Manager"%>
<%@page import="app.MatchMerge"%>
<%@page import="app.models.Match"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="utf-8">
        <title>TNA Football Videos</title>
        <meta name="viewport" content="width=device-width, initial-scale=1.0">

        <script type="text/javascript">
            //<![CDATA[
            try {
                if (!window.CloudFlare) {
                    var CloudFlare = [{verbose: 0, p: 0, byc: 0, owlid: "cf", bag2: 1, mirage2: 0, oracle: 0, paths: {cloudflare: "/cdn-cgi/nexp/dok3v=1613a3a185/"}, atok: "ee0a5d4df12b4f792d2d4f87bbae65a0", petok: "2bd180182f0a686f6680f0cfe8aa86829b4e1c81-1441011888-3600", betok: "10b799098ea49ac180e020586490628188d28094-1441011888-120", zone: "web3canvas.com", rocket: "0", apps: {"abetterbrowser": {"ie": "7", "opera": null, "chrome": null, "safari": null, "firefox": null}, "ga_key": {"ua": "UA-38030533-1", "ga_bs": "2"}}}];
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

        <script src="js/modernizr.js"></script>

        <link rel="stylesheet" href="css/flexslider.css"/>
        <script src="js/jquery.min.js"></script>
        <script src="js/jquery.flexslider.js"></script>
        <script type="text/javascript">
            $(window).load(function () {
                $('.flexslider').flexslider({
                    animation: "slide",
                    useCSS: Modernizr.touch
                });
            });
        </script>

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
    <body class="home"><script type="text/javascript">
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
        <c:set var="state" value="index" />
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
        <div class="jumbotron masthead">
            <div class="container">

                <div class="flexslider">
                    <ul class="slides">

                        <li>
                            <div class="slide2">
                                <iframe width="80%" height="450" src="https://www.youtube.com/embed/${param.yId == null ? "s56Ieozj0SU" : param.yId}" frameborder="0" allowfullscreen></iframe>
                            </div>
                        </li>

                        <li>
                            <div class="slide2">
                                <h2>Prominent Matches</h2>

                                <div class="container">
                                    <div class="row">
                                        <% for (Match ma : dataManager.getPromentMatches().subList(0, 4)) {%>
                                        <div class="col-sm-6 col-md-3 features">
                                            <a href="home?yId=<%=ma.getYoutube()%>" >
                                                <% String leftImg = Manager.getClubImageById(ma.getHomeId());
                                                    String rightImg = Manager.getClubImageById(ma.getAwayId());%>

                                                <%=MatchMerge.getMergeHTML(leftImg, rightImg,bg.getBackgroundImage())%>
                                                <h4><%=ma.getHomeTeamName()%> vs <%=ma.getAwayTeamName()%></h4>
                                            </a>
                                        </div>
                                        <%}%>
                                    </div>
                                    <div class="row">
                                        <% for (Match ma : dataManager.getPromentMatches().subList(4, 8)) {%>
                                        <div class="col-sm-6 col-md-3  features">
                                            <a href="home?yId=<%=ma.getYoutube()%>" >
                                                <% String leftImg = Manager.getClubImageById(ma.getHomeId());
                                                    String rightImg = Manager.getClubImageById(ma.getAwayId());%>

                                                <%=MatchMerge.getMergeHTML(leftImg, rightImg,bg.getBackgroundImage())%>
                                                <h4><%=ma.getHomeTeamName()%> vs <%=ma.getAwayTeamName()%></h4>
                                            </a>
                                        </div>
                                        <%}%>
                                    </div>
                                </div>
                            </div>
                        </li>

                    </ul>
                </div>
            </div>
        </div>


    <%@include file="footer.jsp" %>




    <script src="js/bootstrap.min.js"></script>

    <script type="text/javascript">
        var $_Tawk_API = {}, $_Tawk_LoadStart = new Date();
        (function () {
            var s1 = document.createElement("script"), s0 = document.getElementsByTagName("script")[0];
            s1.async = true;
            s1.src = 'https://embed.tawk.to/54b4d389f7d9f97ff805cbad/default';
            s1.charset = 'UTF-8';
            s1.setAttribute('crossorigin', '*');
            s0.parentNode.insertBefore(s1, s0);
        })();
    </script>

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
