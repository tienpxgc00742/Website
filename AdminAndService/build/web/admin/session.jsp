<%@page import="app.admin.manager.NewsManager"%>
<%@page import="app.admin.manager.LeagueManager"%>
<%@page import="app.admin.manager.StatisticManager"%>
<%@page import="app.admin.manager.MatchManager"%>
<%@page import="app.admin.manager.TeamManager"%>
<%@page import="app.admin.manager.UserManager"%>
<%  UserManager userManager = (UserManager) request.getSession().getAttribute("userManager");
    if (userManager == null) {
        userManager = new UserManager();
        request.getSession().setAttribute("userManager", userManager);
    } %>

<%  TeamManager teamManager = (TeamManager) request.getSession().getAttribute("teamManager");
    if (teamManager == null) {
        teamManager = new TeamManager();
        request.getSession().setAttribute("teamManager", teamManager);
    }%>

<%  MatchManager matchManager = (MatchManager) request.getSession().getAttribute("matchManager");
    if (matchManager == null) {
        matchManager = new MatchManager();
        request.getSession().setAttribute("matchManager", matchManager);
    }%>

<%  StatisticManager statisticManager = (StatisticManager) request.getSession().getAttribute("statisticManager");
    if (statisticManager == null) {
        statisticManager = new StatisticManager();
        request.getSession().setAttribute("statisticManager", statisticManager);
    }%>
<%  LeagueManager leagueManager = (LeagueManager) request.getSession().getAttribute("leagueManager");
    if (leagueManager == null) {
        leagueManager = new LeagueManager();
        request.getSession().setAttribute("leagueManager", leagueManager);
    }%>
    <%  NewsManager newsManager = (NewsManager) request.getSession().getAttribute("newsManager");
    if (newsManager == null) {
        newsManager = new NewsManager();
        request.getSession().setAttribute("newsManager", newsManager);
    }%>