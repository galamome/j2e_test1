<%@ page pageEncoding="UTF-8" %>
<%@ page import="java.util.List" %>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="utf-8" />
        <title>Test</title>
    </head>
    <body>
        <p>Ceci est une page générée depuis une JSP avec des EL.</p>
        <p>
            ${requestScope.message_test}
            <%-- Equivalent a ${message_test}, alors les portees sont balayees --%>
            <%-- Bonne pratique mettre la portee !!! --%>
            ${param.auteur}
        </p>
        <p>
            Récupération du bean :
            ${coyote.prenom}
            ${coyote.nom}
        </p>
        
        <p>
            Récupération de la liste :
            <%
            List<Integer> liste = (List<Integer>) request.getAttribute( "liste" );
            for( Integer i : liste ){
                out.println(i + " : "); 
            }
            %>
        </p>
        <p>
            Récupération du jour du mois :
            <%
            Integer jourDuMois = (Integer) request.getAttribute( "jour" );
            if ( jourDuMois % 2 == 0 ){
                out.println("Jour pair : " + jourDuMois);
            } else {
                out.println("Jour impair : " + jourDuMois);
            }
            %>
        </p>
        
    </body>
</html>
