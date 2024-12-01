package controleur;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class DatabaseManager {
    private static final String DB_URL = "jdbc:mysql://localhost:3306/university_management";
    private static final String DB_USER = "root"; // Remplacez par votre utilisateur MySQL
    private static final String DB_PASSWORD = ""; // Remplacez par votre mot de passe MySQL

    private Connection connection;

    // Établir la connexion
    public void connect() {
        try {
            connection = DriverManager.getConnection(DB_URL, DB_USER, DB_PASSWORD);
            System.out.println("Connexion réussie à la base de données !");
        } catch (SQLException e) {
            System.err.println("Erreur lors de la connexion à la base de données : " + e.getMessage());
        }
    }

    // Fermer la connexion
    public void disconnect() {
        try {
            if (connection != null && !connection.isClosed()) {
                connection.close();
                System.out.println("Connexion fermée.");
            }
        } catch (SQLException e) {
            System.err.println("Erreur lors de la fermeture de la connexion : " + e.getMessage());
        }
    }

    // Retourner la connexion
    public Connection getConnection() {
        return connection;
    }
}
