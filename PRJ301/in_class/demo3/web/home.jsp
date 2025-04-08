<%-- 
    Document   : home
    Created on : Dec 26, 2024, 9:47:40 PM
    Author     : hungs
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.util.*"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>To-do List</title>
    </head>
    <body>
        <!--        create html form--> 
        <form action="home.jsp">
            Add new item: <input type="text" name="theItem" value="" />
            <input type="submit" value="Submit" />
        </form>
        <%
        // get to-do items from session 
        List <String> items = (List<String>) session.getAttribute("myToDoList"); 
        // dat ten la myToDoList 
        // tra ve kieu oject nen phai cast lai la kieu List<String> 
        
        // if the to do items does not exist, the create a new one 
        if (items  == null){
            items = new ArrayList<String>(); 
            session.setAttribute("myToDoList", items); 
            }
            // check whether todo list exists, if not then create new list 
            
            // see if there is form data to add 
            String theItem = request.getParameter("theItem"); 
            if (theItem != null){
                items.add(theItem); 
            }
            
        %>
        
        <!--step 3: display all to do items from session--> 
        <hr> 
        <b> To List Items: </b> <br> 
        <ol>
            <% 
            for (String item : items)
            out.println("<li>"+ item + "</li>"); 
            %>
        </ol>
    
    </body>  
</html>
