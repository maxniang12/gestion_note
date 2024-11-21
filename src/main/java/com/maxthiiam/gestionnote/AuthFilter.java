package com.maxthiiam.gestionnote;
import jakarta.servlet.Filter;
import jakarta.servlet.FilterChain;
import jakarta.servlet.FilterConfig;
import jakarta.servlet.ServletException;
import jakarta.servlet.ServletRequest;
import jakarta.servlet.ServletResponse;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;

public class AuthFilter implements Filter {

    @Override
    public void init(FilterConfig filterConfig) throws ServletException {
        // Initialisation du filtre, si nécessaire
    }

    @Override
    public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain)
            throws IOException, ServletException {
        HttpServletRequest req = (HttpServletRequest) request;
        HttpServletResponse res = (HttpServletResponse) response;

        // Exemple simple : vérifier si une session utilisateur existe
        if (req.getSession().getAttribute("user") == null) {
            // Utilisateur non authentifié, rediriger vers monpageDaccueil
            res.sendRedirect(req.getContextPath() + "/monPageDacueill.jsp");
        } else {
            // Utilisateur authentifié, continuer la chaîne de filtres
            chain.doFilter(request, response);
        }
    }

    @Override
    public void destroy() {
        // Nettoyage des ressources, si nécessaire
    }
}