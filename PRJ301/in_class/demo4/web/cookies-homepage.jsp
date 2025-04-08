<%-- 
    Document   : cookies-homepage
    Created on : Dec 27, 2024, 8:34:29 PM
    Author     : hungs
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <% 
            // if there is no cookies -> set default language to Java 
            String favLang = "Java"; 

            // get cookies from the browser requests 
            Cookie [] theCookies = request.getCookies(); 
            
            // find our favorite language cookie 
            if (theCookies != null) {
                for (Cookie tempCookie : theCookies){
                    if ("favoriteLanguage".equals(tempCookie.getName())){
                        favLang = tempCookie.getValue(); 
                        break; 
                    }
                }
            }
        %> 

        <h4>New Books for <%= favLang %> </h4> 
        <ul> 
            <li> bla bla bla </li>
            <li> bla bla bla </li>

            <li> bla bla bla </li>

        </ul> 
        <a href="index.html">Peronalize this page </a>
    </body>
</html>
