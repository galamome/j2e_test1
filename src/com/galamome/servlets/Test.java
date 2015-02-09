package com.galamome.servlets;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.List;

import java.time.*;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.galamome.bean.Coyote;

public class Test extends HttpServlet {
    public void doGet( HttpServletRequest request, HttpServletResponse response ) throws ServletException, IOException{
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
        
        /** On utilise pas JODA mais Java 8
         */
        LocalDate dt = LocalDate.now();
        Integer jourDuMois = dt.getDayOfMonth();
        
        
            
        /* Stockage du message et du bean dans l'objet request */
        request.setAttribute( "message_test", message );
        request.setAttribute( "coyote", premierBean );
        request.setAttribute( "liste", premiereListe );
        request.setAttribute( "jour", jourDuMois );       
            
        /* Transmission de la paire d'objets request/response à notre JSP */
        //this.getServletContext().getRequestDispatcher( "/WEB-INF/test.jsp" ).forward( request, response );

        // JSP constituee de balises JSP
        //this.getServletContext().getRequestDispatcher( "/WEB-INF/test_balise.jsp" ).forward( request, response );

        // JSP constituee d'EL (Expression Langage)
        this.getServletContext().getRequestDispatcher( "/WEB-INF/test_EL.jsp" ).forward( request, response );
        
    }

}
