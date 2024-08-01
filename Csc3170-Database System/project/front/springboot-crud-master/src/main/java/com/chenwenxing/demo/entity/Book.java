package com.chenwenxing.demo.entity;

import lombok.Data;

import java.io.Serializable;


@Data
public class Book implements Serializable {
    private Integer productID;
    private String isbn;
    private String title;
    private Integer publicationYear;
    private String genre;
    private String author;

    public Book() {
    }

    public Book(Integer productID, String isbn, String title, Integer publicationYear, String genre, String author) {
        this.productID = productID;
        this.isbn = isbn;
        this.title = title;
        this.publicationYear = publicationYear;
        this.genre = genre;
        this.author = author;
    }
}
