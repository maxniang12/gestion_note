package com.maxthiam.beans;
 import java.util.*;
public class Authentfication {
    private int userId;
    private String username;
    private String motPasse;
    private String rolee;

    // Getters and Setters
    public int getUserId() {
        return userId;
    }

    public void setUserId(int userId) {
        this.userId = userId;
    }

    public String getUsername() {
        return username;
    }

    public void setUsername(String username) {
        this.username = username;
    }

    public String getPassword() {
        return motPasse;
    }

    public void setPassword(String password) {
        this.motPasse = password;
    }

    public String getRole() {
        return rolee;
    }

    public void setRole(String role) {
        this.rolee=rolee;
}
}
