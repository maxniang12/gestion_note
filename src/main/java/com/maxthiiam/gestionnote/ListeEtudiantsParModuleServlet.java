package com.maxthiiam.gestionnote;

import com.maxthiam.beans.Etudiant;
import com.maxthiam.beans.Module;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

@WebServlet("/ListeEtudiantsParModuleServlet")
public class ListeEtudiantsParModuleServlet extends HttpServlet {

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String moduleId = request.getParameter("moduleId");
        if (moduleId != null) {
            String url = "jdbc:mysql://localhost:3306/gestionnote?serverTimezone=GMT";
            String user = "root";
            String password = "";

            try (Connection conn = DriverManager.getConnection(url, user, password)) {
                // Récupérer les détails du module
                String moduleSql = "SELECT M.code, M.intitule, E.nom AS responsableNom, E.prenoms AS responsablePrenoms " +
                        "FROM Module M JOIN Enseignant E ON M.responsable = E.matricule WHERE M.code = ?";
                try (PreparedStatement moduleStmt = conn.prepareStatement(moduleSql)) {
                    moduleStmt.setString(1, moduleId);
                    try (ResultSet moduleRs = moduleStmt.executeQuery()) {
                        if (moduleRs.next()) {
                            String intitule = moduleRs.getString("intitule");
                            String responsableNom = moduleRs.getString("responsableNom");
                            String responsablePrenoms = moduleRs.getString("responsablePrenoms");
                            request.setAttribute("moduleId", moduleId);
                            request.setAttribute("intitule", intitule);
                            request.setAttribute("responsableNom", responsableNom);
                            request.setAttribute("responsablePrenoms", responsablePrenoms);
                        }
                    }
                }

                // Récupérer la liste des étudiants inscrits à ce module
                String etudiantsSql = "SELECT E.INE, E.prenoms, E.nom, E.dateNaissance, E.sexe, E.adresse, E.adresseEmail " +
                        "FROM Etudiant E JOIN Etudiant_Module EM ON E.INE = EM.etudiant_id WHERE EM.module_id = ?";
                List<Etudiant> etudiants = new ArrayList<>();
                try (PreparedStatement etudiantsStmt = conn.prepareStatement(etudiantsSql)) {
                    etudiantsStmt.setString(1, moduleId);
                    try (ResultSet etudiantsRs = etudiantsStmt.executeQuery()) {
                        while (etudiantsRs.next()) {
                            Etudiant etudiant = new Etudiant();
                            etudiant.setINE(etudiantsRs.getString("INE"));
                            etudiant.setPrenoms(etudiantsRs.getString("prenoms"));
                            etudiant.setNom(etudiantsRs.getString("nom"));
                            etudiant.setDateNaissance(etudiantsRs.getString("dateNaissance"));
                            etudiant.setSexe(etudiantsRs.getString("sexe"));
                            etudiant.setAdresse(etudiantsRs.getString("adresse"));
                            etudiant.setAdresseEmail(etudiantsRs.getString("adresseEmail"));
                            etudiants.add(etudiant);
                        }
                    }
                }

                request.setAttribute("etudiants", etudiants);
                request.getRequestDispatcher("/listeEtudiantsParModule.jsp").forward(request, response);

            } catch (SQLException e) {
                e.printStackTrace();
                response.sendError(HttpServletResponse.SC_INTERNAL_SERVER_ERROR);
            }
        } else {
            response.sendRedirect("listeModules.jsp");
        }
    }
}
