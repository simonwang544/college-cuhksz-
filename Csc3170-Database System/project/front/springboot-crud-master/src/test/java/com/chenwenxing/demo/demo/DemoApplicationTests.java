package com.chenwenxing.demo.demo;

import com.chenwenxing.demo.entity.Book;
import com.chenwenxing.demo.service.BookService;
import org.junit.jupiter.api.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;

import java.util.List;

@SpringBootTest
class DemoApplicationTests {
    @Autowired
    private BookService bookService;

    @Test
    void contextLoads() {
    }
    @Test
    public void testGetBooksByMultipleConditions() {
        // Provide some sample values for testing
        Integer productID = null; // Set to null for not including in the query
        String ISBN = null;
        String title = "The Official ACT Prep Guide 2022-2023, (Book + Online Course)";
        Integer publicationYear = null;
        String genre = null; // Set to null for not including in the query
        String author = null; // Set to null for not including in the query

        // Call the service method
        List<Book> books = bookService.getBookByMultipleConditions(productID, ISBN, title, publicationYear, genre, author);
        System.out.println(books);
    }
    @Test
    public void testUpdateBook() {
        // Provide some sample values for testing
        Integer productID = 1; // Set to null for not including in the query
        String isbn = "1484274369";
        String title = "The Official ACT Prep Guide 2022-2023, (Book + Online Course)";
        Integer publicationYear = 2024;
        String genre = "textbook"; // Set to null for not including in the query
        String author = "Mara Bos"; // Set to null for not including in the query
        Book book = new Book(productID,isbn,title,publicationYear,genre,author);
        // Call the service method
        boolean b = bookService.updateBook(book);
        System.out.println(b);
    }
}
