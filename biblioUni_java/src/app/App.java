package app;

import controleur.DatabaseManager;

public class App {
    public static void main(String[] args) {
        DatabaseManager dbManager = new DatabaseManager();
        dbManager.connect(); // Établir la connexion

        // Fermer la connexion après le test
        dbManager.disconnect();
    }
}

