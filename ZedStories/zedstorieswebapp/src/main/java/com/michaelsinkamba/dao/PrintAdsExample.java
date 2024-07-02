package com.michaelsinkamba.dao;


import java.io.ByteArrayOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.sql.SQLException;
import java.util.List;

import com.michaelsinkamba.models.Ad;

public class PrintAdsExample {

    public static void main(String[] args) {
        AdDAO adDAO = new AdDAO();

        try {
            // Example: Fetch all ads
            List<Ad> ads = adDAO.getAllAds();
            printAds(ads);

            // Example: Fetch ads by page
            List<Ad> adsByPage = adDAO.getAdsByPage("confession");
            printAds(adsByPage);

        } catch (SQLException | ClassNotFoundException | IOException e) {
            e.printStackTrace();
        }
    }

    private static void printAds(List<Ad> ads) throws IOException, SQLException {
        for (Ad ad : ads) {
            System.out.println("Ad ID: " + ad.getId());
            System.out.println("Ad Text: " + ad.getText());
            System.out.println("Ad Link 1: " + ad.getLink1());
            System.out.println("Ad Link 2: " + ad.getLink2());
            System.out.println("Ad Page: " + ad.getPage());
//            System.out.println("Ad Date: " + ad.getDate());

            // Print image details (if needed)
//            printImageDetails(ad.getImage());
            System.out.println("-----------------------------------");
        }
    }

    @SuppressWarnings("unused")
	private static void printImageDetails(InputStream imageInputStream) throws IOException, SQLException {
        // Example: Print image details (convert Blob to byte array)
        if (imageInputStream != null) {
            ByteArrayOutputStream outputStream = new ByteArrayOutputStream();
            byte[] buffer = new byte[4096];
            int bytesRead;
            while ((bytesRead = imageInputStream.read(buffer)) != -1) {
                outputStream.write(buffer, 0, bytesRead);
            }
            byte[] imageBytes = outputStream.toByteArray();
            System.out.println("Image Size: " + imageBytes.length + " bytes");
            // You can process the imageBytes further as per your requirement
        }
    }
}
