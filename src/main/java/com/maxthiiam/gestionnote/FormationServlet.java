package com.maxthiiam.gestionnote;

import com.maxthiam.beans.Enseignant;
import com.maxthiam.beans.Formation;
import com.maxthiam.beans.Module;
import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@WebServlet("/FormationServlet")
public class FormationServlet extends HttpServlet {
    private static final String URL = "jdbc:mysql://localhost:3306/gestionnote?serverTimezone=GMT";
    private static final String USER = "root";
    private static final String PASSWORD = "";

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        List<Formation> formations = new ArrayList<>();

        try {
            Class.forName("com.mysql.jdbc.Driver");
            try (Connection conn = DriverManager.getConnection(URL, USER, PASSWORD)) {
                String sqlFormation = "SELECT * FROM Formation";
                try (PreparedStatement stmtFormation = conn.prepareStatement(sqlFormation);
                     ResultSet rsFormation = stmtFormation.executeQuery()) {

                    while (rsFormation.next()) {
                        Formation formation = new Formation();
                        formation.setIntitule(rsFormation.getString("intitule"));
                        formation.setNiveau(rsFormation.getString("niveau"));

                        String sqlModules = "SELECT m.code, m.intitule, m.volumeHoraire, m.coefficient, m.nombreCredits, e.nom, e.prenoms " +
                                "FROM Module m " +
                                "LEFT JOIN Enseignant e ON m.responsableId = e.id " +
                                "WHERE m.formationId = ?";
                        try (PreparedStatement stmtModules = conn.prepareStatement(sqlModules)) {
                            stmtModules.setInt(1, rsFormation.getInt("id"));
                            try (ResultSet rsModules = stmtModules.executeQuery()) {
                                List<Module> modules = new ArrayList<>();
                                while (rsModules.next()) {
                                    Module module = new Module();
                                    module.setCode(rsModules.getString("code"));
                                    module.setIntitule(rsModules.getString("intitule"));
                                    module.setVolumeHoraire(rsModules.getInt("volumeHoraire"));
                                    module.setCoefficient(rsModules.getDouble("coefficient"));
                                    module.setNombreCredits(rsModules.getInt("nombreCredits"));

                                    Enseignant responsable = new Enseignant();
                                    responsable.setNom(rsModules.getString("nom"));
                                    responsable.setPrenoms(rsModules.getString("prenoms"));
                                                                module.setResponsable(responsable);

                                    modules.add(module);
                                }
                                formation.setListeModules(modules);
                            }
                        }
                        formations.add(formation);
                    }
                }
            }
        } catch (ClassNotFoundException | SQLException e) {
            e.printStackTrace();
        }

        request.setAttribute("formations", formations);
        request.getRequestDispatcher("/listeFormations.jsp").forward(request, response);
    }
}
