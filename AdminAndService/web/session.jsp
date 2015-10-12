<%@page import="app.data.DataManager"%>
<% 
    if(request.getSession().getAttribute("dataManager") == null)  {
    request.getSession().setAttribute("dataManager", DataManager.getInstance());
} 
    DataManager dataManager = (DataManager)request.getSession().getAttribute("dataManager");
%>
