<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Login</title>

</head>
<body>

<h2>Login</h2>

<form:form modelAttribute="user">
    <table>
        <tr>
            <td>Nome do usu�rio:</td>
            <td><form:input path="username" />
            	<b><form:errors path="username" /></b>
            </td>
        </tr>
        <tr>
            <td>Senha:</td>
            <td><form:input path="password" type="password"/>
            	<b><form:errors path="password" /></b>
            </td>
        </tr>
        <tr>
            <td colspan="2">
                <input type="submit" value="Login" />
                
            </td>
        </tr>
    </table>
</form:form>


<h3>Novo jogador?</h3>
<p>Cadastre-se aqui:<br/>
<a href="register.html">Cadastro</a>

</p>
</body>
</html>