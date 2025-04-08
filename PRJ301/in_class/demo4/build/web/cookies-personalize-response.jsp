<%-- 
    Document   : cookies-personalize-response.jsp
    Created on : Dec 27, 2024, 8:20:24 PM
    Author     : hungs
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>

    <% 
    // read form data 
    String favLang = request.getParameter("favoriteLanguage"); 
        
    //create the cookie 
    Cookie theCookie = new Cookie("favoriteLanguage", favLang); 
        
    // set the life span total number of seconds 
    theCookie.setMaxAge(60*60*24*365); // set cookie life span for one year 
        
    // send cookie to browser 
    response.addCookie(theCookie);      
    %>
    <body>
        Thanks! We set ur favorite language to: <%=request.getParameter("favoriteLanguage")%> 
        <br> 
        <a href="cookies-homepage.jsp">Return to homepage </a> 
    </body>
</html>
