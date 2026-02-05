<%@ page import="com.tictactoe.Sign" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<!DOCTYPE html>
<html>
<head>
    <title>Tic-Tac-Toe</title>
    <link href="static/main.css" rel="stylesheet">
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    <script src="<c:url value="/static/jquery-3.6.0.min.js"/>"></script>
</head>

<body>
<h1>Tic-Tac-Toe</h1>

<table>
    <tr>
        <td onclick="window.location='/logic?click=0'" class="${data.get(0).getSign() eq CROSSES ? 'x' : (data.get(0).getSign() eq NOUGHTS ? 'o' : '')}">${data.get(0).getSign()}</td>
        <td onclick="window.location='/logic?click=1'" class="${data.get(1).getSign() eq CROSSES ? 'x' : (data.get(1).getSign() eq NOUGHTS ? 'o' : '')}">${data.get(1).getSign()}</td>
        <td onclick="window.location='/logic?click=2'" class="${data.get(2).getSign() eq CROSSES ? 'x' : (data.get(2).getSign() eq NOUGHTS ? 'o' : '')}">${data.get(2).getSign()}</td>
    </tr>
    <tr>
        <td onclick="window.location='/logic?click=3'" class="${data.get(3).getSign() eq CROSSES ? 'x' : (data.get(3).getSign() eq NOUGHTS ? 'o' : '')}">${data.get(3).getSign()}</td>
        <td onclick="window.location='/logic?click=4'" class="${data.get(4).getSign() eq CROSSES ? 'x' : (data.get(4).getSign() eq NOUGHTS ? 'o' : '')}">${data.get(4).getSign()}</td>
        <td onclick="window.location='/logic?click=5'" class="${data.get(5).getSign() eq CROSSES ? 'x' : (data.get(5).getSign() eq NOUGHTS ? 'o' : '')}">${data.get(5).getSign()}</td>
    </tr>
    <tr>
        <td onclick="window.location='/logic?click=6'" class="${data.get(6).getSign() eq CROSSES ? 'x' : (data.get(6).getSign() eq NOUGHTS ? 'o' : '')}">${data.get(6).getSign()}</td>
        <td onclick="window.location='/logic?click=7'" class="${data.get(7).getSign() eq CROSSES ? 'x' : (data.get(7).getSign() eq NOUGHTS ? 'o' : '')}">${data.get(7).getSign()}</td>
        <td onclick="window.location='/logic?click=8'" class="${data.get(8).getSign() eq CROSSES ? 'x' : (data.get(8).getSign() eq NOUGHTS ? 'o' : '')}">${data.get(8).getSign()}</td>
    </tr>
</table>

<hr>
<c:set var="CROSSES" value="<%=Sign.CROSS%>"/>
<c:set var="NOUGHTS" value="<%=Sign.NOUGHT%>"/>

<c:if test="${winner eq CROSSES}">
    <h1 class="win-message">CROSSES WIN!</h1>
    <button onclick="restart()">Start again</button>
</c:if>
<c:if test="${winner eq NOUGHTS}">
    <h1 class="win-message">NOUGHTS WIN!</h1>
    <button onclick="restart()">Start again</button>
</c:if>
<c:if test="${draw}">
    <h1 class="win-message">IT'S A DRAW</h1>
    <br>
    <button onclick="restart()">Start again</button>
</c:if>

<script>
    function restart() {
        $.ajax({
            url: '/restart',
            type: 'POST',
            contentType: 'application/json;charset=UTF-8',
            async: false,
            success: function () {
                location.reload();
            }
        });
    }
</script>

</body>
</html>