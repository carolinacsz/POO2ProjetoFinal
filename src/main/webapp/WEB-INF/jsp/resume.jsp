<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Resume Game</title>

<style type="text/css">
	body{
        background-color:#FFFF99;
    }
	h2{
      color: 663300;
    }
</style>

</head>
<body>

<h2>Retomar o jogo</h2>

<h3>Por favor, clique no link para retomar o jogo</h3>

<table border="1">
	<tr><th>Hora de início do jogo</th><th>Hora de salvamento</th><th>Posição salva</th><th>Retomar</th>
	<c:forEach items="${savedGameList}" var="savedGame">
		<tr>
			<td>${savedGame.startTime}</td>
			<td>${savedGame.saveTime}</td>
			<td>${savedGame.position}</td>
			<td><a href="resumeSingleGame.html?id=${savedGame.id}">resume</a></td>
		</tr>
	</c:forEach>
</table>

<p><a href="gameBoard.html">Tabuleiro</a></p>

</body>
</html>