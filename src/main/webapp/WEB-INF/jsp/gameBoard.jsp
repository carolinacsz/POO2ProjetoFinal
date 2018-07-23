<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<%@ taglib prefix="security" uri="http://www.springframework.org/security/tags" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Tabuleiro</title>

</head>
<body>

<h2>Jogo da Velha</h2>

	<c:if test="${game.outcome == 'unfinish'}">
		<p>Hora de início: ${game.startTime}</p>
		<p>Por favor, faça sua jogada.</p>
	</c:if>
	
	<c:if test="${game.outcome == 'win'}">
		<p>Hora de início: ${game.startTime}</p>
		<p>Hora de término: ${game.endTime}</p>
		<h3>Você venceu!</h3>
	</c:if>
	
	<c:if test="${game.outcome == 'loss'}">
		<p>Hora de início: ${game.startTime}</p>
		<p>Hora de término: ${game.endTime}</p>
		<h3>Eu venci!</h3>
	</c:if>
	
	<c:if test="${game.outcome == 'tie'}">
		<p>Hora de início: ${game.startTime}</p>
		<p>Hora de término: ${game.endTime}</p>
		<h3>Jogo empatado!</h3>
	</c:if>
	
	<table border="1">
		<tr>
			<c:forEach begin="0" end="2" step="1" var="i">
				<td><a href="playBoard.html?pos=${i}">${game.positions[i]}</a></td>
			</c:forEach>
		</tr>
		<tr>
			<c:forEach begin="3" end="5" step="1" var="i">
				<td><a href="playBoard.html?pos=${i}">${game.positions[i]}</a></td>
			</c:forEach>
		</tr>
		<tr>
			<c:forEach begin="6" end="8" step="1" var="i">
				<td><a href="playBoard.html?pos=${i}">${game.positions[i]}</a></td>
			</c:forEach>
		</tr>
	</table>
<form action="newGame.html" method="get">	
	<p><input type="submit" name="newGame" value="Novo Jogo"/></p>
</form>

<security:authorize access="hasRole('ROLE_USER')">
<form action="saveGame.html" method="get">
	<p><input type="submit" name="saveGame" value="Save Game"/></p>
</form>

<form action="resumeGame.html" method="get">
	<p><input type="submit" name="resumeGame" value="Resume Game"/></p>
</form>

<form action="gameHistory.html" method="get">
	<p><input type="submit" name="gameHistory" value="Game History"/></p>
</form>

<p><a href="hostJoin.html">Jogar com outro jogador</a></p>

<p><a href="logout.html">Logout</a></p>
</security:authorize>

<security:authorize access="not hasRole('ROLE_USER')">
<p>Entre para ter mais recursos e jogar com outros jogadores.<br/>
<a href="j_spring_security_check">Login</a>
</p>

<h3>Novo jogador?</h3>
<p>Cadastre-se aqui:<br/>
<a href="register.html">Cadastro</a>
</p>
</security:authorize>

</body>
</html>