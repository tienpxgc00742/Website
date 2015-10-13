<%-- 
    Document   : contact
    Created on : Sep 11, 2015, 3:43:18 PM
    Author     : YoungKaka
--%>
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
                    var CloudFlare = [{verbose: 0, p: 0, byc: 0, owlid: "cf", bag2: 1, mirage2: 0, oracle: 0, paths: {cloudflare: "/cdn-cgi/nexp/dok3v=1613a3a185/"}, atok: "ee0a5d4df12b4f792d2d4f87bbae65a0", petok: "f897d192554a95dd7841c976d371a7f35458051f-1441011894-3600", betok: "fb342d1ee543a2867b42d71c3da2bd66fa2fcba9-1441011894-120", zone: "web3canvas.com", rocket: "0", apps: {"abetterbrowser": {"ie": "7", "opera": null, "chrome": null, "safari": null, "firefox": null}, "ga_key": {"ua": "UA-38030533-1", "ga_bs": "2"}}}];
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

        <link href="css/hosting.css" rel="stylesheet">
        <link href="css/main.css" rel="stylesheet">
        <!--[if lt IE 9]>
          <script src="https://oss.maxcdn.com/html5shiv/3.7.2/html5shiv.min.js"></script>
          <script src="https://oss.maxcdn.com/respond/1.4.2/respond.min.js"></script>
        <![endif]-->
        <link href="css/other.css" rel="stylesheet">
        <script src="js/modernizr.js"></script>

        <script src="js/jquery.min.js"></script>

        <script src="js/contact_form.js"></script>
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
        <c:set var="state" value="contact" />
        <c:choose>
            <c:when test="${sessionScope.account == null}">
                <%@include file="header.jsp" %>
            </c:when>
            <c:otherwise>
                <%@include file="header_login.jsp" %>
            </c:otherwise>
        </c:choose>
       
        <div class="container" id="contact">
            <div class="row PageHead">
                <div class="col-md-12">
                    <h1>Contact Us</h1>
                    <h3>Keep in touch with us. we are here to help you</h3>
                </div>
            </div>
            <div class="row ContactUs">
                <div class="col-md-6">
                    <div class="row">
                        <div class="col-sm-6">
                            <h3> Profile </h3>
                            <address>
                                Name<br/>
                                <strong class="user-text-color">${account.name}</strong><br>
                                Email<br/>
                                <strong class="user-text-color">${account.email}</strong><br>
                            </address>
                        </div>
                        <div class="col-sm-6">
                            <h3>API</h3>
                            <address>
                                API key<br/>
                                <strong class="user-text-color">${account.apikey}</strong><br>
                            </address>
                        </div>
                    </div>
                    <div class="row">
                        <div class="col-md-12 mapwrap">
                            <iframe src="https://www.google.com/maps/embed?pb=!1m14!1m8!1m3!1d3151.835837652496!2d144.955431!3d-37.817313999999996!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x0%3A0xedc33f230d1355b1!2sEnvato+Pty+Ltd!5e0!3m2!1sen!2sin!4v1408780745585" width="100%" height="250" frameborder="0" style="border:0"></iframe>
                        </div>
                    </div>
                </div>
                <div class="col-md-6">
                    <form action="contact?action=sendMail" method="POST" class="form" >
                        <div class="form-group">
                            <input class="form-control" type="text" placeholder="Full Name" name="name" id="name" required>
                        </div>
                        <div class="form-group">
                            <input class="form-control" type="email" placeholder="Email ID" name="email" value="${account.email}" id="email" required>
                        </div>
                        <div class="form-group">
                            <input class="form-control" type="text" placeholder="Mobile Number" name="phone" id="mobile">
                        </div>
                        <div class="form-group">
                            <textarea class="form-control" rows="10" name="message" placeholder="Your Message" id="message" required></textarea>
                        </div>
                        <div class="form-group">
                            <p>
                                <input class="btn btn-success btn-lg" type="submit" value="Send Message"/>
                            </p>
                            <span class="loading"></span> </div>
                    </form>
                </div>
            </div>
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