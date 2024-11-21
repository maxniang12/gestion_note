<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="java.sql.Connection, java.sql.DriverManager, java.sql.PreparedStatement, java.sql.ResultSet, java.sql.SQLException, java.util.HashSet, java.util.Set" %>
<html>
<head>
    <title>Modifier une Formation</title>
    <style>
        form {
            width: 50%;
            margin: auto;
        }
        .form-group {
            margin: 15px 0;
        }
        label {
            display: block;
            margin-bottom: 5px;
        }
        input, select {
            width: 100%;
            padding: 8px;
            box-sizing: border-box;
        }
        button {
            padding: 10px 20px;
            background-color: #4CAF50;
            color: white;
            border: none;
            cursor: pointer;
        }
        button:hover {
            background-color: #45a049;
        }
    </style>
</head>
<body>
<%
    String formationId = request.getParameter("id");
    String intitule = "";
    String niveau = "";
    Set<String> selectedModules = new HashSet<>();

    String url = "jdbc:mysql://localhost:3306/gestionnote?serverTimezone=GMT";
    String user = "root";
    String password = "";

    try {
        Class.forName("com.mysql.jdbc.Driver");
    } catch (ClassNotFoundException e) {
        e.printStackTrace();
    }

    try (Connection conn = DriverManager.getConnection(url, user, password)) {
        // Récupérer les détails de la formation
        String sqlFormation = "SELECT intitule, niveau FROM Formation WHERE id = ?";
        try (PreparedStatement stmtFormation = conn.prepareStatement(sqlFormation)) {
            stmtFormation.setInt(1, Integer.parseInt(formationId));
            ResultSet rsFormation = stmtFormation.executeQuery();
            if (rsFormation.next()) {
                intitule = rsFormation.getString("intitule");
                niveau = rsFormation.getString("niveau");
            }
        }

        // Récupérer les modules associés à la formation
        String sqlFormationModules = "SELECT module_id FROM Formation_Module WHERE formation_id = ?";
        try (PreparedStatement stmtFormationModules = conn.prepareStatement(sqlFormationModules)) {
            stmtFormationModules.setInt(1, Integer.parseInt(formationId));
            ResultSet rsFormationModules = stmtFormationModules.executeQuery();
            while (rsFormationModules.next()) {
                selectedModules.add(rsFormationModules.getString("module_id"));
            }
        }
    } catch (SQLException e) {
        e.printStackTrace();
    }
%>
<h1>Modifier une Formation</h1>
<form action="ModifierFormationServlet" method="post">
    <input type="hidden" name="id" value="<%= formationId %>">
    <div class="form-group">
        <label for="intitule">Intitulé :</label>
        <input type="text" id="intitule" name="intitule" value="<%= intitule %>" required>
    </div>
    <div class="form-group">
        <label for="niveau">Niveau :</label>
        <input type="text" id="niveau" name="niveau" value="<%= niveau %>" required>
    </div>
    <div class="form-group">
        <label for="modules">Modules :</label>
        <div id="modules">
            <%-- Options for modules will be populated dynamically from the database --%>
            <%
                try (Connection conn = DriverManager.getConnection(url, user, password)) {
                    String sqlModules = "SELECT code, intitule FROM Module";
                    try (PreparedStatement stmtModules = conn.prepareStatement(sqlModules);
                         ResultSet rsModules = stmtModules.executeQuery()) {
                        while (rsModules.next()) {
                            String moduleCode = rsModules.getString("code");
                            String moduleIntitule = rsModules.getString("intitule");
                            boolean isChecked = selectedModules.contains(moduleCode);
            %>
            <div>
                <input type="checkbox" id="module_<%=moduleCode%>" name="modules" value="<%=moduleCode%>" <%= isChecked ? "checked" : "" %>>
                <label for="module_<%=moduleCode%>"><%=moduleIntitule%></label>
            </div>
            <%
                        }
                    }
                } catch (SQLException e) {
                    e.printStackTrace();
                }
            %>
        </div>
    </div>
    <button type="submit">Modifier</button>
</form>
</body>
</html>
