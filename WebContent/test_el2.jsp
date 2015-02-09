<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
    <head>
        <meta charset="utf-8" />
        <title>Test des expressions EL</title>
    </head>
    <body>
    <p>
        <!-- Initialisation d'un bean de type Coyote avec une action standard, pour l'exemple : -->
        <jsp:useBean id="coyote" class="com.galamome.bean.Coyote" />
        <!-- Initialisation de sa propriété 'prénom' : -->
        <jsp:setProperty name="coyote" property="prenom" value="Wile E."/>  
        <!-- Et affichage de sa valeur : -->
		${ coyote.prenom }
    </p>
    </body>
</html>
