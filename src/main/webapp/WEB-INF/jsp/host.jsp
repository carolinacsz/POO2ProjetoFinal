<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Página do Host</title>

<script type="text/javascript" src="javascript/jquery-2.1.1.min.js"></script>
<script type="text/javascript">

$(function(){
	
	if($("#gameStatus").text() !== "start"){	
		
		$.ajax({		
			//url - A string containing the URL to which the request is sent.
			url: "askJoinPlayer.json",
			cash: false,
			success: function(data){
				
				if(data.waitingJoinUser){
					$("#message").append("Esperando outro jogador entrar no jogo ...");
					hostPlayerWaiting();
				}else{
					$("#message").append("Jogador " + data.joinUsername + " se juntou ao jogo. Por favor, faça sua jogada.");				
				}			
			}
		});
		
	}else{
		
		if($("#result").text() === "venceu"){
			$("#result").empty();
			$("#result").append("Você venceu!");
			$("#result").show();
		}else if($("#result").text() === "Empate"){
			$("#result").empty();
			$("#result").append("Jogo empatado!");
			$("#result").show();
		}else if($("#result").text() === "perdeu"){
			$("#result").empty();
			$("#result").append("Você perdeu!");
			$("#result").show();
		}else{	
			if( $("#process").text() === "true" ){
				$("#message").empty();
				$("#message").append("Por favor, aguarde a jogada de outro jogador ...");
				
				hostWaitingJoinMove();
				
			}else{
				$("#message").empty();
				$("#message").append("Movimento errado, por favor, mova-se novamente.");
			}				
		}		
	}	
});

function hostPlayerWaiting(){
	
	$.ajax({		
		url: "hostPlayerWaiting.json",
		cash: false,
		success: function(data){
			$("#message").empty();
			$("#message").append("Jogador " + data + " se juntou ao jogo. Por favor, faça sua jogada.");			
		}
		
	});
}

function hostWaitingJoinMove(){
	
	$('a').each(function () {
        $(this).data('href', $(this).attr('href'));
        $(this).removeAttr('href');
    });
	$.ajax({
		url: "hostWaitingJoinMove.json",
		cash: false,
		success: function(data){
			$("#"+data[0]).empty();
			$("#"+data[0]).append("_O_");
		
			$("#message").empty();			
			if(data[1] === "venceu"){
				$("#result").empty();
				$("#result").append("Você venceu!");
				$("#result").show();
			}else if(data[1] === "empate"){
				$("#result").empty();
				$("#result").append("Jogo empatado!");
				$("#result").show();
			}else if(data[1] === "perdeu"){
				$("#result").empty();
				$("#result").append("Você perdeu!");
				$("#result").show();
			}else{
				$("#message").append("Por favor, faça sua jogada.");
	
				$('a').each(function () {
			        $(this).attr('href', $(this).data('href'));
			    });
			}
		}
	});
}
</script>

<style type="text/css">

	#gameStatus{
		display: none;
	}
	#process{
		display: none;
	}
	#result{
		display: none;
	}
</style>

</head>
<body>
<h2>Tic Tac Toe (Host)</h2>

<p id="message"></p>
<p id="gameStatus">${gameStatus}</p>
<p id="process">${processHost}</p>
<h3 id="result">${game2.outcome}</h3>

	<table border="1">
		<tr>
			<c:forEach begin="0" end="2" step="1" var="i">
				<td id="${i}"><a href="playBoardHost.html?pos=${i}">${game2.positions[i]}</a></td>
			</c:forEach>
		</tr>
		<tr>
			<c:forEach begin="3" end="5" step="1" var="i">
				<td id="${i}"><a href="playBoardHost.html?pos=${i}">${game2.positions[i]}</a></td>
			</c:forEach>
		</tr>
		<tr>
			<c:forEach begin="6" end="8" step="1" var="i">
				<td id="${i}"><a href="playBoardHost.html?pos=${i}">${game2.positions[i]}</a></td>
			</c:forEach>
		</tr>
	</table>

<form action="logoutPlayer.html" method="get">
	<p><input type="submit" name="logout" value="Log out"/></p>
</form>

</body>
</html>