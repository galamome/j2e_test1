<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
    <head>
        <meta charset="utf-8" />
        <title>Test</title>
    </head>
    <body>
        <p>Ceci est une page générée depuis une JSP.</p>
        <p>
            <% 
            String attribut = (String) request.getAttribute("message_test");
            out.println( attribut );
            
            String parametre = request.getParameter( "auteur" );
            out.println( parametre );
            
            %>
        </p>
        <p>
            Récupération du bean :
            <%  
        	com.galamome.bean.Coyote notreBean = (com.galamome.bean.Coyote) request.getAttribute("coyote");
        	out.println( notreBean.getPrenom() );
            out.println( notreBean.getNom() );
            %>
        </p>
        
        
    </body>
</html>
