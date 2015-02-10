<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
	<c:out value="test" /> <%-- Affiche test --%>
	<c:out value="${ 'a' < 'b' }" /> <%-- Affiche true --%>

	<%-- Cette balise affichera le mot 'test' si le bean n'existe pas : --%>
	<c:out value="${bean}">
	    test
	</c:out>
	<%-- Elle peut �galement s'�crire sous cette forme : --%>
	<c:out value="${bean}" default="test" />
	<%-- Et il est interdit d'�crire : --%>
	<c:out value="${bean}" default="test">
	    une autre chaine
	</c:out>
	
	<%-- Sans pr�ciser d'attribut escapeXml : --%>
	<c:out value="<p>Je suis un 'paragraphe'.</p>" />
	<%-- La balise affichera : --%>
	&lt;p&gt;Je suis un &#039;paragraphe&#039;.&lt;/p&gt;
	<%-- Et en pr�cisant l'attribut � false :--%>
	<c:out value="<p>Je suis un 'paragraphe'.</p>" escapeXml="false" />
	<%-- La balise affichera : --%>
	<p>Je suis un 'paragraphe'.</p>
	
	<%-- Mauvais exemple --%>
	<input type="text" name="donnee" value="${donneeSaisieParUnUtilisateur}" />
	<%-- Bon exemple --%>
	<input type="text" name="donnee" value="<c:out value="${donneeSaisieParUnUtilisateur}"/>" />
	
	<%-- Cette balise met l'expression "Salut les z�ros !" dans l'attribut "message" de la requ�te : --%>
	<c:set var="message" value="Salut les z�ros !" scope="request" />
	<%-- Et est l'�quivalent du scriplet Java suivant : --%>
	<% request.setAttribute( "message", "Salut les z�ros !" ); %>
	
	<%-- Affiche l'expression contenue dans la variable "message" de la requ�te --%>
	<c:out value="${requestScope.message}" />
	
	<%-- L'attribut scope n'est pas obligatoire. Rappelez-vous, le scope par d�faut est dans ce cas la page, 
	puisque c'est le premier dans la liste des scopes parcourus --%>
	<c:set var="maVariable" value="12" />
	
	<c:set var="locale" scope="session">
	   <c:out value="${param.lang}" default="FR"/>
	</c:set>
	
	<%-- Cr�e un objet de type String --%>
	<c:set scope="session" var="description" value="Je suis une loutre." />
	<%-- Cr�e un objet du type du bean ici sp�cifi� dans l'attribut 'value'--%>
	<c:set scope="session" var="tonBean" value="${monBean}" />
	
	<!-- D�finir ou modifier la propri�t� 'prenom' du bean 'coyote' -->
	<c:set target="${coyote}" property="prenom" value="Wile E."/>
	<!-- D�finir ou modifier la propri�t� 'prenom' du bean 'coyote' via le corps de la balise -->
	<c:set target="${coyote}" property="prenom">
	   Wile E.
	</c:set>
	<!-- Passer � null la valeur de la propri�t� 'prenom' du bean 'coyote' -->
	<c:set target="${coyote}" property="prenom" value="${null}" />
	
	<%-- Supprime la variable "maVariable" de la session --%>
	<c:remove var="maVariable" scope="session" />
	
	<c:choose>
	    <c:when test="${expression}">Action ou texte.</c:when>
	    <c:otherwise>Autre action ou texte.</c:otherwise>
	</c:choose>
	
	<%-- Boucle calculant le cube des entiers de 0 � 7 et les affichant dans un tableau HTML --%>
	<table>
	  <tr>
	    <th>Valeur</th>
	    <th>Cube</th>
	  </tr>
	<c:forEach var="i" begin="0" end="7" step="1">
	  <tr>
	    <td><c:out value="${i}"/></td>
	    <td><c:out value="${i * i * i}"/></td>
	  </tr>
	</c:forEach>
	</table>
	
	<%@ page import="java.util.*" %>
	<%
	  /* Cr�ation de la liste et des donn�es */
	  List<Map<String, String>> maListe = new ArrayList<Map<String, String>>();
	  Map<String, String> news = new HashMap<String, String>();
	  news.put("titre", "Titre de ma premi�re news");
	  news.put("contenu", "corps de ma premi�re news");
	  maListe.add(news);
	  news = new HashMap<String, String>();
	  news.put("titre", "Titre de ma seconde news");
	  news.put("contenu", "corps de ma seconde news");
	  maListe.add(news);
	  pageContext.setAttribute("maListe", maListe);
	%>
	<c:forEach items="${maListe}" var="news" varStatus="status">
	<div class="news">
	  News n� <c:out value="${status.count}"/> :
	  <div class="titreNews">
	      <c:out value="${news['titre']}" />
	  </div>
	  <div class="corpsNews">
	      <c:out value="${news['contenu']}" />
	  </div>
	</div>
	</c:forEach>

	<p>
	<%-- Affiche les diff�rentes sous-cha�nes s�par�es par une virgule ou un point-virgule --%>
	<c:forTokens var="sousChaine" items="salut; je suis un,gros;z�ro+!" delims=";,+">
	  ${sousChaine}<br/>
	</c:forTokens>
	</p>
	
	<%-- G�n�re une url simple, positionn�e dans un lien HTML --%>
	<a href="<c:url value="test.jsp" />">lien</a>
	<%-- G�n�re une url et la stocke dans la variable lien --%>
	<c:url value="test.jsp" var="lien" />
	
	
	<%-- L'url avec param�tres ainsi g�n�r�e --%>
	<c:url value="/monSiteWeb/countZeros.jsp">
	  <c:param name="nbZeros" value="123"/>
	  <c:param name="date" value="22/06/2010"/>
	</c:url>
	<%-- Sera rendue ainsi dans la page web finale,
	si le cookie est pr�sent et le contexte est Test --%>
	/Test/monSiteWeb/countZeros.jsp?nbZeros=123&date=22%2f06%2f2010 
	<%-- Et sera rendue sous cette forme si le cookie est absent --%>
	/Test/monSiteWeb/countZeros.jsp;jsessionid=A6B57CE08012FB431D?nbZeros=123&date=22%2f06%2f2010
	
	<%-- Forwarding avec l'action standard JSP --%>
	<jsp:forward page="/monSiteWeb/erreur.jsp">
	<%-- Redirection avec la balise redirect --%>
	<c:redirect url="http://www.siteduzero.com"/>
	<%-- Les attributs valables pour <c:url/> le sont aussi pour la redirection. 
	Ici par exemple, l'utilisation de param�tres --%>
	<c:redirect url="http://www.siteduzero.com">
	  <c:param name="mascotte" value="zozor"/>
	  <c:param name="langue" value="fr"/>
	</c:redirect>
	<%-- Redirigera vers --%>
	http://www.siteduzero.com?mascotte=zozor&langue=fr
	
	<%-- Copie le contenu d'un fichier xml dans une variable (fileReader),
	puis parse le flux r�cup�r� dans une autre variable (doc). --%>
	<c:import url="test.xml" varReader="fileReader">
	  <x:parse var="doc" doc="${fileReader}" />
	</c:import>
	
	
	
	
	
	
	
	
</body>
</html>