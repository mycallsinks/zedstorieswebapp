package com.michaelsinkamba.servlets;

import java.io.File;
import java.io.IOException;
import java.nio.file.Paths;
import java.sql.SQLException;
import java.sql.Timestamp;

import com.michaelsinkamba.dao.AdDAO;
import com.michaelsinkamba.models.Ad;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.MultipartConfig;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.Part;


@SuppressWarnings("serial")
@WebServlet("/addAd")
@MultipartConfig(fileSizeThreshold = 1024 * 1024 * 2, // 2MB
                 maxFileSize = 1024 * 1024 * 10,      // 10MB
                 maxRequestSize = 1024 * 1024 * 50)   // 50MB
public class AdminAddServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String text = request.getParameter("text");
        String link1 = request.getParameter("link1");
        String link2 = request.getParameter("link2");
        String page = request.getParameter("page");

        Part filePart = request.getPart("image");
        String fileName = Paths.get(filePart.getSubmittedFileName()).getFileName().toString();
        String uploadDir = getServletContext().getRealPath("") + File.separator + "adImage";
        File uploadDirFile = new File(uploadDir);
        if (!uploadDirFile.exists()) {
            uploadDirFile.mkdir();
        }
        String filePath = uploadDir + File.separator + fileName;
        filePart.write(filePath);

        String imageUrl = "adImage/" + fileName;

        Timestamp timestamp = new Timestamp(System.currentTimeMillis());

        Ad ad = new Ad(0, imageUrl, text, link1, link2, page, timestamp);

        AdDAO adDAO = new AdDAO();
        try {
            adDAO.addAd(ad);
        } catch (SQLException | ClassNotFoundException e) {
            e.printStackTrace();
        }

        response.sendRedirect("admin");
    }
}

