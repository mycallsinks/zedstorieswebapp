package com.michaelsinkamba.dao;

import com.michaelsinkamba.models.Ad;

import java.sql.SQLException;
import java.util.List;

public class AdDAOTest {

    public static void main(String[] args) {
        AdDAO adDAO = new AdDAO();

        try {
            // Test getting all ads
            List<Ad> ads = adDAO.getAllAds();

            // Print all ads retrieved
            System.out.println("All Ads:");
            for (Ad ad : ads) {
                System.out.println("Ad ID: " + ad.getId());
                System.out.println("Page: " + ad.getPage());
                System.out.println("Text: " + ad.getText());
                System.out.println("Link 1: " + ad.getLink1());
                System.out.println("Link 2: " + ad.getLink2());
                // Add more fields as needed
                System.out.println("---------------------------------");
            }

        } catch (SQLException | ClassNotFoundException e) {
            e.printStackTrace();
        }
    }
}
