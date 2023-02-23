<%@ Application Language="C#"%>
<%@ Import Namespace="System.Linq" %>
<%@ Import Namespace="System.Collections.Generic" %>
<%@ Import Namespace="System.Web" %>
<%@ Import Namespace="System.Threading" %>
<%@ Import Namespace="System.Globalization" %>
<%@ Import Namespace="System.Web.Routing" %>
<%@ Import Namespace="System.Web.Security" %>
<%@ Import Namespace="System.Web.SessionState" %>
<script runat="server">

    void Application_Start(object sender, EventArgs e)
    {
        // Register the default hubs route: ~/signalr/hubs
        RouteTable.Routes.MapHubs();
        //RouteTable.Routes.MapPageRoute();
    }
    void Application_BeginRequest(object sender, EventArgs e)
    {
        

    }
    void Application_End(object sender, EventArgs e)
    {
        //  Code that runs on application shutdown<%@ Application Language="C#" Inherits="GlobalGZip"%>

    }

    void Application_Error(object sender, EventArgs e)
    {

    }
    void Session_Start(object sender, EventArgs e)
    {
        
    }

    void Session_End(object sender, EventArgs e)
    {
       
    }

</script>
