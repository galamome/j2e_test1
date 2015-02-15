package com.galamome.servlets;

import java.io.IOException;
import java.time.LocalDate;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.galamome.bean.Coyote;

public class Test extends HttpServlet {
    public void doGet( HttpServletRequest request, HttpServletResponse response ) throws ServletException, IOException {
        final String ATT_MESSAGE = "message_test";
        final String ATT_BEAN = "coyote";
        final String ATT_LISTE = "liste";
        final String ATT_JOUR = "jour";

        final String VUE = "/WEB-INF/test_jstl_core.jsp";

        /* Création et initialisation du message. */
        String paramAuteur = request.getParameter( "auteur" );
        String message = "Transmission de variables : OK ! " + paramAuteur;

        /* Création du bean */
        Coyote premierBean = new Coyote();
        /* Initialisation de ses propriétés */
        premierBean.setNom( "Coyote" );
        premierBean.setPrenom( "Wile E." );

        /* Création de la liste et insertion de quatre éléments */
        List<Integer> premiereListe = new ArrayList<Integer>();
        premiereListe.add( 27 );
        premiereListe.add( 12 );
        premiereListe.add( 138 );
        premiereListe.add( 6 );

        /**
         * On utilise pas JODA mais Java 8
         */
        LocalDate dt = LocalDate.now();
        Integer jourDuMois = dt.getDayOfMonth();

        /* Stockage du message et du bean dans l'objet request */
        request.setAttribute( ATT_MESSAGE, message );
        request.setAttribute( ATT_BEAN, premierBean );
        request.setAttribute( ATT_LISTE, premiereListe );
        request.setAttribute( ATT_JOUR, jourDuMois );

        /* Transmission de la paire d'objets request/response à notre JSP */
        // this.getServletContext().getRequestDispatcher( "/WEB-INF/test.jsp"
        // ).forward( request, response );

        // JSP constituee de balises JSP
        // this.getServletContext().getRequestDispatcher(
        // "/WEB-INF/test_balise.jsp" ).forward( request, response );

        // JSP constituee d'EL (Expression Langage)
        // this.getServletContext().getRequestDispatcher( "/WEB-INF/test_EL.jsp"
        // ).forward( request, response );

        // JSP constituee avec JSTL Core "/WEB-INF/test_jstl_core.jsp"
        this.getServletContext().getRequestDispatcher( VUE ).forward( request, response );

    }

}
