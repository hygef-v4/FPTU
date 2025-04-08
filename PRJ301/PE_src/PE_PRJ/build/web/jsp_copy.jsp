<%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core" %>

// drop down list
<tr>
    <td>Choose an option:</td>
    <td><select name="option">
            <option value="vowel">Vowel characters</option>
            <option value="length">Length of string</option>
        </select></td>
</tr>

// table model 
<table border="1">
            <thead>
                <tr>
                    <th>Number 1</th>
                    <th>Number 2</th>
                    <th>Number 3</th>
                    <th>Number 4</th>
                </tr>
            </thead>
            <tbody>
                <c:forEach items="${list}" var="obj">
                <tr>
                    <td>${obj.a}</td>
                    <td>${obj.b}</td>
                    <td>${obj.c}</td>
                    <td>${obj.result}</td>
                </tr>
            </c:forEach>

        </tbody>
    </table>


