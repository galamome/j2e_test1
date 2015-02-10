<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>    
<%@ taglib uri="http://java.sun.com/jsp/jstl/xml" prefix="x" %>    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
	<c:import url="monDocument.xml" varReader="monReader">
	   <%-- Parse le contenu du fichier XML monDocument.xml dans une variable nommée 'doc' --%>
	   <x:parse var="doc" doc="${monReader}" />
	   
	   <x:out select="$doc/news/article/auteur" />
	   
		<%-- Enregistre le résultat de l'expression XPath, spécifiée dans l'attribut select, 
		dans une variable de session nommée 'auteur' --%>
		<x:set var="auteur" scope="session" select="$doc//auteur" />
		<%-- Affiche le contenu de la variable nommée 'auteur' enregistrée en session --%>
		<x:out select="$sessionScope:auteur" />		
		
		<!-- Affiche le nombre d'auteurs -->
		<p>
			Nombre d'auteurs : <x:out select="count($doc/news/article/auteur)" />
		</p>
		
		<!-- Affiche les auteurs un par un -->
		<p>
		Les auteurs sont :
		<ul>			
			<x:forEach var="auteur" select="$doc//auteur">
			   <li><strong><x:out select="$auteur" /></strong>
			</x:forEach>
			</p>
		</ul>	
		
		<%-- Affiche le titre de la news postée par 'Nicolas' si elle existe, et un simple message sinon --%>
		<x:choose>
		   <x:when select="$doc/news/article[auteur='Nicolas']">
		      Nicolas a déjà posté une news dont voici le titre :
		      <x:out select="$doc/news/article[auteur='Nicolas']/titre" />
		   </x:when>
		   <x:otherwise>
		      Nicolas n'a pas posté de news.
		   </x:otherwise>
		</x:choose>

		
		<!-- Affiche les auteurs et titres de tous les articles -->
		<p>
		<x:forEach var="element" select="$doc/news/article">
		   <strong><x:out select="$element/auteur" /></strong> :
		   <x:out select="$element/titre" />.<br/>
		</x:forEach>
		</p>
		
	   
	</c:import>
	
	
</body>
</html>