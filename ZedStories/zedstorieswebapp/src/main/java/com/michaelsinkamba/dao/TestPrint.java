package com.michaelsinkamba.dao;

import java.sql.SQLException;
import java.util.List;

import com.michaelsinkamba.models.Post;

public class TestPrint {
    public static void main(String[] args) {
        printPostsByCategory("confessions");
        printPostsByCategory("lifestyle");
        printPostsByCategory("partner");
    }

    private static void printPostsByCategory(String category) {
        PostDAO postDAO = new PostDAO();
        try {
            List<Post> posts = postDAO.getPostsByCategoryAndStatusSortedByDate(category, "approved");
            System.out.println("Posts for category: " + category);
            for (Post post : posts) {
                System.out.println("Post ID: " + post.getId());
                System.out.println("Title: " + post.getTitle());
                System.out.println("Author: " + post.getAuthor());
//                System.out.println("Date: " + post.getDate());
                System.out.println("--------------");
            }
            System.out.println();
        } catch (ClassNotFoundException | SQLException e) {
            e.printStackTrace();
        }
    }
}
