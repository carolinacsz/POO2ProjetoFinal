<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Hist�rico do Jogo</title>

</head>
<body>
<h2>Hist�rico do Jogo</h2>

<table border="1">
	<tr>
		<td>O n�mero de jogos conclu�dos</td>
		<td>${numCompletedGames}</td>
	</tr>
	<tr>
		<td>O n�mero de jogos de 1 jogador completados</td>
		<td>${numCompletedGamesAI}</td>
	</tr>
	<tr>
		<td>O n�mero de jogos de 2 jogadores conclu�dos</td>
		<td>${numCompletedGamesPlayer}</td>
	</tr>
	<tr>
		<td>A quantidade de vit�rias contra a m�quina</td>
		<td>${winRateAI}</td>
	</tr>
	<tr>
		<td>A quantidade de vit�rias contra jogadores humanos</td>
		<td>${winRatePlayer}</td>
	</tr>
</table>

<h3>A lista de jogos conclu�dos jogados este m�s</h3>
	
<table border="1">
	<tr> <th> Nome do advers�rio </th> <th> Dura��o do jogo (segundos) </th> <th> Resultado </th>
	<c:forEach items="${monthHistoryList}" var="monthHistory">
		<tr>
			<td>${monthHistory.opponentName}</td>
			<td>${monthHistory.gameLength}</td>
			<td>${monthHistory.outcome}</td>
		</tr>
	</c:forEach>
</table>

<p><a href="gameBoard.html">Tabuleiro</a></p>

</body>
</html>