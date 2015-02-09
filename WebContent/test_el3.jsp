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
        <% 
        /* Création d'une liste de légumes et insertion de quatre éléments */
        java.util.List<String> legumes = new java.util.ArrayList<String>();
        legumes.add( "poireau" );
        legumes.add( "haricot" );
        legumes.add( "carotte");
        legumes.add( "pomme de terre" );
        request.setAttribute( "legumes" , legumes );
        %>
        <!-- Les quatre syntaxes suivantes retournent le deuxième élément de la liste de légumes  -->
        ${ legumes.get(1) }<br />
        ${ legumes[1] }<br />
        ${ legumes['1'] }<br />
        ${ legumes["1"] }<br />
    </p>
    <p>
        <% 
        /* Création d'un tableau */
        String[] animaux = {"chien", "chat", "souris", "cheval"};
        request.setAttribute("animaux" , animaux);
        %>
        
        <!-- Les trois syntaxes suivantes retournent le troisième élément du tableau  -->
        ${ animaux[2] }<br />
        ${ animaux['2'] }<br />
        ${ animaux["2"] }<br />
    </p>
    <p>
        <% 
        /* Création d'une Map */
        java.util.Map<String,Integer> desserts = new java.util.HashMap<String, Integer>();
        desserts.put("cookies", 8);
        desserts.put("glaces", 3);
        desserts.put("muffins", 6);
        desserts.put("tartes aux pommes", 2);
        
        request.setAttribute("desserts" , desserts);
        %>
        
        <!-- Les quatre syntaxes suivantes retournent la valeur associée à la clé "cookies" de la Map de desserts  -->
        ${ desserts.cookies }<br />
        ${ desserts.get("cookies") }<br />
        ${ desserts['cookies'] }<br />
        ${ desserts["cookies"] }<br />
        <% 
        /* Création d'une chaîne nommée "element" et contenant le mot "cookies" */
        String element = "cookies"; 
        request.setAttribute("element",element);
        %>
        <!-- Il est également possible d'utiliser un objet au lieu d'initialiser la clé souhaitée directement dans l'expression -->
        ${ desserts[element] }<br />
    </p>
    
    </body>
</html>
