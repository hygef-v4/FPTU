<%-- 
    Document   : TINH
    Created on : Dec 30, 2024, 1:52:53 PM
    Author     : hungs
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <link rel="stylesheet" href="css/styles.css"/>
    </head>
    <body>
        <div class="bg">
            <h1>A Simple Calculator</h1>
            <hr> 
            <form>
                <table>
                    <tr>
                        <td class="label">Enter operand 1: </td> 
                        <td><input type="text" name="num1" value="" /></td>
                    </tr>

                    <tr>
                        <td class="label">Enter operand 2: </td> 
                        <td><input type="text" name="num2" value="" /></td>
                    </tr>

                    <tr>
                        <td class="label">Select operation: </td> 
                        <td>
                            <select name="op">
                                <option value="+">+</option>
                                <option value="-">-</option>
                                <option value="*">*</option>
                                <option value="/">/</option>
                            </select>
                        </td>
                    </tr>

                    <tr class="submit">
                        <td></td>
                        <td><input type="submit" value="Calculate" /></td>
                    </tr>
                </table>
            </form>
            <hr> 
            <h1>
                <jsp:useBean id="c" class="model.Math"/>
                <jsp:setProperty name="c" property="*"/>
                <jsp:getProperty name="c" property="num1" />
                <jsp:getProperty name="c" property="op" />
                <jsp:getProperty name="c" property="num2" />
                
                
                <jsp:getProperty name="c" property="result" />
            </h1>
        </div>
    </body>
</html>
