package com.michaelsinkamba.dao;
import java.util.List;

import com.michaelsinkamba.models.Post;

public class PostDAOTestComments {

    public static void main(String[] args) {
        // Create an instance of PostDAO
        PostDAO postDAO = new PostDAO();

        // Call getAllPostsWithCommentCount to retrieve posts with comment counts
        List<Post> posts = null;
		try {
			posts = postDAO.getAllPostsWithCommentCount();
		} catch (ClassNotFoundException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

        // Print the retrieved posts with comment counts
        for (Post post : posts) {
            System.out.println("Post ID: " + post.getId());
            System.out.println("Title: " + post.getTitle());
            System.out.println("Author: " + post.getAuthor());
            System.out.println("Text: " + post.getText());
            System.out.println("Comment Count: " + post.getCommentCount());
            System.out.println();
        }
    }
}
