package com.michaelsinkamba.models;

import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;

public class Post implements Comparable<Post> {
    private String category;
    private String title;
    private String author;
    private String location;
    private String text;
    private String image;
    private String contactDetails;
    private String status;
    private int id;
    private String formattedDate;
    private int commentCount; // Field for comment count

    // Constructors
    public Post() {}

    public Post(int id, String title, String author, String location, String text, String image, String status) {
        this.id = id;
        this.title = title;
        this.author = author;
        this.location = location;
        this.text = text;
        this.image = image;
        this.status = status;
    }

    
    public Post(int id, String title, String text, String image, String status) {
        this.id = id;
        this.title = title;
        this.text = text;
        this.image = image;
        this.status = status;
    }

    // Getters and Setters for all fields
    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getCategory() {
        return category;
    }

    public void setCategory(String category) {
        this.category = category;
    }

    public String getTitle() {
        return title;
    }

    public void setTitle(String title) {
        this.title = title;
    }

    public String getAuthor() {
        return author;
    }

    public void setAuthor(String author) {
        this.author = author;
    }

    public String getLocation() {
        return location;
    }

    public void setLocation(String location) {
        this.location = location;
    }

    public String getText() {
        return text;
    }

    public void setText(String text) {
        this.text = text;
    }

    public String getImage() {
        return image;
    }

    public void setImage(String image) {
        this.image = image;
    }

    public String getContactDetails() {
        return contactDetails;
    }

    public void setContactDetails(String contactDetails) {
        this.contactDetails = contactDetails;
    }

    public String getStatus() {
        return status;
    }

    public void setStatus(String status) {
        this.status = status;
    }

    public String getFormattedDate() {
        return formattedDate;
    }

    public void setFormattedDate(String formattedDate) {
        this.formattedDate = formattedDate;
    }

    public void setFormattedDateFromLocalDateTime(LocalDateTime dateTime) {
        DateTimeFormatter formatter = DateTimeFormatter.ofPattern("dd MMMM yyyy HH:mm");
        this.formattedDate = dateTime.format(formatter);
    }

    public int getCommentCount() {
        return commentCount;
    }

    public void setCommentCount(int commentCount) {
        this.commentCount = commentCount;
    }

    // Implementing compareTo method for sorting
    @Override
    public int compareTo(Post other) {
        LocalDateTime thisPostDate = LocalDateTime.parse(this.formattedDate, DateTimeFormatter.ofPattern("dd MMMM yyyy HH:mm"));
        LocalDateTime otherPostDate = LocalDateTime.parse(other.getFormattedDate(), DateTimeFormatter.ofPattern("dd MMMM yyyy HH:mm"));
        return otherPostDate.compareTo(thisPostDate);
    }

    // Override toString method for better readability
    @Override
    public String toString() {
        return "Post{" +
                "id=" + id +
                ", category='" + category + '\'' +
                ", title='" + title + '\'' +
                ", author='" + author + '\'' +
                ", location='" + location + '\'' +
                ", text='" + text + '\'' +
                ", image='" + image + '\'' +
                ", contactDetails='" + contactDetails + '\'' +
                ", status='" + status + '\'' +
                ", formattedDate='" + formattedDate + '\'' +
                ", commentCount=" + commentCount +
                '}';
    }
}
