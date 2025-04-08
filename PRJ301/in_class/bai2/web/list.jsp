<%-- 
    Document   : list
    Created on : Dec 24, 2024, 8:48:54 PM
    Author     : hungs
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.util.List" %> 
<%@page import="model.Student" %> 

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <h1>List of students</h1>
        <table border="1">
            <thead>
                <tr>
                    <th>ID</th>
                    <th>Name</th>
                    <th>Date Of Birth</th>
                    <th>Gender</th>
                </tr>
            </thead>


            <%
            List<Student> list = (List<Student>) request.getAttribute("data"); 
                    
            %>


        </table>


    </body>
</html>
