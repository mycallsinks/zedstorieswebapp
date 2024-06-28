//package com.michaelsinkamba.dao;
//
//import com.michaelsinkamba.models.Post;
//
//import java.sql.SQLException;
//import java.util.List;
//
//public class PrintPostsTest {
//
//    public static void main(String[] args) {
//        testGetAllPostsByCategory();
//    }
//
//    private static void testGetAllPostsByCategory() {
//        PostDAO postDAO = new PostDAO();
//        String cateory = "Confessions"; // Replace with a category you have in your database
//        String catgory = "Partner";
//        String category = "Lifestyle";
//        try {
//            List<Post> posts = postDAO.getAllPostsByCategory(category);
//
//            if (posts.isEmpty()) {
//                System.out.println("No posts found for category: " + category);
//            } else {
//                System.out.println("Posts found for category: " + category);
//                for (Post post : posts) {
//                    System.out.println(post);
//                }
//            }
//
//        } catch (SQLException | ClassNotFoundException e) {
//            e.printStackTrace();
//        }
//    }
//}
