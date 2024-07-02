package com.michaelsinkamba.models;

import java.sql.Timestamp;

public class Ad {
    private int id;
    private String image;
    private String text;
    private String link1;
    private String link2;
    private String page;
    private Timestamp timestamp;
    private String base64Image; // This field is for holding the base64 image data

    // No-argument constructor
    public Ad() {}

    // Parameterized constructor
    public Ad(int id, String image, String text, String link1, String link2, String page, Timestamp timestamp) {
        this.id = id;
        this.image = image;
        this.text = text;
        this.link1 = link1;
        this.link2 = link2;
        this.page = page;
        this.timestamp = timestamp;
    }

    // Getters and Setters

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getImage() {
        return image;
    }

    public void setImage(String image) {
        this.image = image;
    }

    public String getText() {
        return text;
    }

    public void setText(String text) {
        this.text = text;
    }

    public String getLink1() {
        return link1;
    }

    public void setLink1(String link1) {
        this.link1 = link1;
    }

    public String getLink2() {
        return link2;
    }

    public void setLink2(String link2) {
        this.link2 = link2;
    }

    public String getPage() {
        return page;
    }

    public void setPage(String page) {
        this.page = page;
    }

    public Timestamp getTimestamp() {
        return timestamp;
    }

    public void setTimestamp(Timestamp timestamp) {
        this.timestamp = timestamp;
    }

    public String getBase64Image() {
        return base64Image;
    }

    public void setBase64Image(String base64Image) {
        this.base64Image = base64Image;
    }
}
