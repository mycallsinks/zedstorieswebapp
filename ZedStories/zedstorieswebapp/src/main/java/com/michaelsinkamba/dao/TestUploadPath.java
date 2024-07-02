package com.michaelsinkamba.dao;

// Adjust package as per your project structure

import java.io.File;

public class TestUploadPath {
    private static final String UPLOAD_DIR = "uploads";

    public static void main(String[] args) {
        String uploadPath = getUploadPath();
        System.out.println("Upload Path: " + uploadPath);

        File uploadDir = new File(uploadPath);
        if (!uploadDir.exists()) {
            System.out.println("Creating upload directory: " + uploadPath);
            boolean created = uploadDir.mkdirs(); // Use mkdirs() to create parent directories if they don't exist
            if (!created) {
                System.out.println("Failed to create upload directory: " + uploadPath);
            }
        }
    }

    private static String getUploadPath() {
        // Adjust path as per your project structure and environment
        String realPath = TestUploadPath.class.getProtectionDomain().getCodeSource().getLocation().getPath();
        String uploadPath = new File(realPath).getParentFile().getParent() + File.separator + "webapp" + File.separator + UPLOAD_DIR;
        return uploadPath;
    }
}
