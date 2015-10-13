
<%@page import="app.models.Account"%>
<% Account account = (Account)request.getSession().getAttribute("account"); %>
<nav class="navbar navbar-default navbar-fixed-top" role="navigation">

    <div class="container">
        <div class="navbar-header">
            <button type="button" class="navbar-toggle" data-toggle="collapse" data-target=".navbar-ex1-collapse"> <span class="sr-only">Toggle navigation</span> <span class="icon-bar"></span> <span class="icon-bar"></span> <span class="icon-bar"></span> </button>
            <a class="navbar-brand" href="home"> <img src="images/flathost-logo.png" alt="logo"></a> </div>

        <div class="collapse navbar-collapse navbar-ex1-collapse">
            <ul class="nav navbar-nav navbar-right">
             <li class="${state == "index" ? "active" :""}"><a href="home">HOME</a></li>
<li class="${state == "videos" ? "active" :""} hidden-sm"><a href="videos">Videos</a></li>
<li class="${state == "api" ? "active" :""} hidden-sm"><a href="api">API</a></li>
<li class="${state == "contact" ? "active" :""}"><a href="contact">CONTACT</a></li>
                <li>
                    <table style="margin-left: 10px;" border="0">
                        <tr>
                            <td><img class="avatar" src="<%=account.getAvatar()%>" alt="avatar" /></td>
                            <td>
                                <div class="account">
                                    <ul>
                                        <li class="account_name"><a href="#"><%=account.getName()%></a>
                                            <ul>
                                                <% if(account.getRole().equals("admin")) {%>
                                                <li><a href="/admin">Go Admin</a></li>
                                                <%}%>
                                                <li><a href="/contact">Profile</a></li>
                                                <li><a href="/logout">Logout</a></li>
                                            </ul>
                                        </li>
                                    </ul> 
                                </div>
                            </td>
                        </tr>
                    </table>
                </li>
        </div>

    </div>
</nav>