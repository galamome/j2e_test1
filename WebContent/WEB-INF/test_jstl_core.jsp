<%@ page pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<!-- http://localhost:8080/test1/toto -->
<!-- Page appelee par la servlet Test.java -->
    <head>
        <meta charset="utf-8" />
        <title>Page test_jstl_core.jsp</title>
    </head>
    <body>
        <p>Ceci est une page générée depuis une JSP.</p>
        <p>
            ${test}
            ${param.auteur}
        </p>
        <p>
            Récupération du bean :
            ${coyote.prenom}
            ${coyote.nom}
        </p>
        <p>
            Récupération de la liste :
        <c:forEach items="${liste}" var="element">
        ${element} : 
        </c:forEach>
    </p>
    <p>
            Récupération du jour du mois :
        <c:choose>
        <c:when test="${ jour % 2 == 0 }">Jour pair : ${jour}</c:when>
        <c:otherwise>Jour impair : ${jour}</c:otherwise>
        </c:choose>
    </p>
    </body>
</html>
