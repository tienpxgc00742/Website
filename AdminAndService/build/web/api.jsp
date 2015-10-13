<%-- 
    Document   : api
    Created on : Sep 11, 2015, 9:55:18 PM
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
        <c:set var="state" value="api" />
         <c:choose>
            <c:when test="${sessionScope.account == null}">
                <%@include file="header.jsp" %>
            </c:when>
            <c:otherwise>
                <%@include file="header_login.jsp" %>
            </c:otherwise>
        </c:choose>
         
        <div class="container">

            <div class="row PageHead">
                <div class="col-md-12">
                    <h1>API Documents</h1>
                    <h3>Latest news and updates from TNA Football</h3>
                </div>
            </div>
            <div class="row blog">
                <div class="col-md-9">
                    <div class="blogpost">
                        <h1 class="title">API Key</h1> <h3 class="subtitle"> <a href="contact"  class="btn btn-success">Find API KEY</a> Please login to get your api key! Our api are completely free.</h3>
                    </div>
                     <div class="blogpost">
                        <div class="form-group ">
                            <label class="control-label"> <a  id="btn-test"  data-apikey="${account.apikey}" class="btn btn-success" href="#" >Test</a></label>
                            <div class="col-lg-10">
                                <input class="form-control" id="text-test" name="name"  placeholder="Please type your api url" minlength="2" type="text" required>
                            </div>
                        </div>
                    </div>
                    <div class="blogpost">
                        <h1 class="title">Matches</h1>
                        <h3 class="subtitle"><b>/api/matches?league={}&mode={}&apikey={}</b></h3>
                        <p>
                            <b>JSON/XML mode</b><br/>
                            {"matches":[{"result":{"goalsHomeTeam":-1,"goalsAwayTeam":-1},"status":"TIMED","description":"","matchday":5,"youtube":"","image":"","awayTeamName":"Newcastle United FC","date":"2015-09-14T19:00:00Z","homeTeamName":"West Ham United FC"},{"result":{"goalsHomeTeam":-1,"goalsAwayTeam":-1},"status":"TIMED","description":"","matchday":6,"youtube":"","image":"","awayTeamName":"Arsenal FC","date":"2015-09-19T11:45:00Z","homeTeamName":"Chelsea FC"},{"result":{"goalsHomeTeam":-1,"goalsAwayTeam":-1}, ...
                        </p>
                        <p><a href="/api/matches?league=premier&mode=json&apikey=${account.apikey}" role="button" data-toggle="modal" class="btn btn-success">Try it</a></p>
                    </div>
                    <div class="blogpost">
                        <h1 class="title">Clubs</h1>
                        <h3 class="subtitle"><b>/api/clubs?league={}&mode={}&apikey={}</b></h3>
                        <p>
                            <b>JSON/XML mode</b><br/>
                            {"count":20,"clubs":[[],{"id":"73","squadMarketValue":"288,000,000 \u20ac","crestUrl":"http://upload.wikimedia.org/wikipedia/de/b/b4/Tottenham_Hotspur.svg","name":"Tottenham Hotspur FC","code":"THFC","shortName":"Spurs"},{"id":"1044","squadMarketValue":"3,545,000 \u20ac","crestUrl":"https://upload.wikimedia.org/wikipedia/de/4/41/Afc_bournemouth.svg","name":"AFC Bournemouth","code":"AFCB","shortName":"Bournemouth"},{"id":"58","squadMarketValue":"106,050,000 \u20ac","crestUrl":"http://upload.wikimedia.org/wikipedia/de/9/9f/Aston_Villa_logo.svg","name":"Aston Villa FC","code":"AVFC","shortName":"Aston Villa"}, ...
                        </p>
                        <p><a href="/api/clubs?league=premier&mode=json&apikey=${account.apikey}" role="button" data-toggle="modal" class="btn btn-success">Try it</a></p>
                    </div>
                    <div class="blogpost">
                        <h1 class="title">Rankings</h1>
                        <h3 class="subtitle"><b>/api/rankings?league={}&mode={}&apikey={}</b></h3>
                        <p>
                            <b>JSON/XML mode</b><br/>
                            {"ranking":[{"teamName":"Manchester City FC","position":1,"goals":11,"playedGames":5,"goalDifference":11,"goalsAgainst":0,"points":15},{"teamName":"Leicester City FC","position":2,"goals":11,"playedGames":5,"goalDifference":4,"goalsAgainst":7,"points":11},{"teamName":"Manchester United FC","position":3,"goals":6,"playedGames":5,"goalDifference":3,"goalsAgainst":3,"points":10},
                        </p>
                        <p><a href="/api/rankings?league=premier&mode=json&apikey=${account.apikey}" role="button" data-toggle="modal" class="btn btn-success">Try it</a></p>
                    </div>
                    <div class="blogpost">
                        <h1 class="title">Players</h1>
                        <h3 class="subtitle"><b>/api/players?teamId={}&mode={}&apikey={}</b></h3>
                        <p>
                            <b>JSON/XML mode</b><br/>
                            "count":25,"players":[{"dateOfBirth":"1984-08-01","position":"Central Midfield","id":16,"jerseyNumber":31,"nationality":"Germany","contractUntil":"2018-06-30","name":"Bastian Schweinsteiger","marketValue":"22,000,000 \u20ac"},{"dateOfBirth":"1990-11-07","position":"Keeper","id":409,"jerseyNumber":1,"nationality":"Spain","contractUntil":"2016-06-30","name":"David de Gea","marketValue":"30,000,000 \u20ac"},{"dateOfBirth":"1992-02-21","position":"Centre Back","id":412,"jerseyNumber":4,"nationality":"England","contractUntil":"2019-06-30","name":"Phil Jones","marketValue":"15,000,000 \u20ac"}, ...
                        </p>
                        <p><a href="/api/players?teamId=66&mode=json&apikey=${account.apikey}" role="button" data-toggle="modal" class="btn btn-success">Try it</a></p>
                    </div>
                </div>
                <div class="col-md-3 sidebar">
                    <h2>Parameters</h2>
                    <h3>league</h3>
                    <ul class="bloglist">
                        <li>- premier</li>
                        <li>- bundesliga</li>
                        <li>- laliga</li>
                        <li>- ligone</li>
                        <li>- seria</li>
                        <li>- championship</li>
                    </ul>
                    <br>
                    <h3>mode</h3>
                    <p>- xml : response xml content.</p>
                    <p>- json : response json content.</p>
                    <h3>Team/Club ID</h3>
                    <ul class="bloglist">
                        <li></li>
                        <li>- 61 : Chelsea</li>
                        <li>- 66 : Manchester United</li>
                        <li>- 57 : Arsenal</li>
                        <li>- 65 : Manchester City</li>
                        <li><p><a href="/api/clubs?league=premier&mode=xml&apikey=${account.apikey}" role="button" data-toggle="modal" class="btn btn-success">Find More</a></p></li>

                    </ul>
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
        
         <script type="text/javascript">
            $(document).ready(function() {
               $("#btn-test").mouseenter(function() {
                  var text = $("#text-test").val();
                  if(text.indexOf("apikey") >= 0){
                      $(this).attr("href",text);
                  }else {
                      var key = $(this).attr("data-apikey");
                      $(this).attr("href",text +"&apikey="+ key);
                  }
               }); 
            });
        </script>
    </body>
</html>