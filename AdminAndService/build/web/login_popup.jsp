<%@page import="app.api.APIManager"%>
<%@page import="org.connections.FaceBookConnection"%>
<%@page import="org.connections.LinkedInConnection"%>
<%@page import="org.connections.TwitterConnection"%>
<%@page import="org.connections.GoogleConnection" %>
<div class="modal fade LoginSignup" id="Login" tabindex="-1" role="dialog" aria-labelledby="LoginLabel" aria-hidden="true">
<div class="modal-dialog">
<div class="modal-content">
<div class="modal-header">
<button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
<h3 class="modal-title">Login</h3>
</div>
<div class="modal-body">

<div class="center">
    <a href="<%=GoogleConnection.getInstance().getAuthUrl(APIManager.CALLBACK_GOOGLE)%>"><button class="btn-center"><img src="images/login_google.png" class="btn-center img-google"/></button></a>
</div>
<div class="center">
	<a href="<%=TwitterConnection.getInstance().getAuthUrl(APIManager.CALLBACK_TWITTER)%>"><button class="btn-center"><img src="images/login_twitter.png" class="btn-center img-google"/></button></a>
</div>
<div class="center">
	<a href="<%=FaceBookConnection.getInstance().getAuthUrl(APIManager.CALLBACK_FACEBOOK)%>"><button class="btn-center"><img src="images/login-facebook.png" class="btn-center img-google"/></button></a>
</div>
<div class="center">
	<a href="<%=LinkedInConnection.getInstance().getAuthUrl(APIManager.CALLBACK_LINKEDIN)%>"><button class="btn-center"><img src="images/login-linkedin.png" class="btn-center img-google"/></button></a>
</div>
</div>
</div>
 
</div>
 
</div>