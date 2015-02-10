<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/xml" prefix="x" %>
<c:import varReader="xslFile" url="test_xslt.xsl">
<c:import varReader="xmlFile" url="monDocument.xml">
    <x:transform doc="${xmlFile}" xslt="${xslFile}"/>
</c:import>
</c:import>
