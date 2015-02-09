<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
    <head>
        <meta charset="utf-8" />
        <title>Test des objets implicites EL</title>
    </head>
    <body>
    <p>
    Langue : ${ param.langue }
    <br />
    <%-- Permet d'acceder a plusieurs parametres --%>
    <%-- paramValues est une Map<String,String[]> --%>
    Langue 2 : ${paramValues.langue[1]}
    <br />
    Article : ${ param.article }
    </p>
    </body>
</html>
