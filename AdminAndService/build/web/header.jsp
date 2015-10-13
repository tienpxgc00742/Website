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
<li><a href="index.jsp#" role="button" data-toggle="modal" data-target="#Login" class="btn btn-success">Login</a></li>

</ul>
</li>
</ul>
</div>
 
</div>
</nav>