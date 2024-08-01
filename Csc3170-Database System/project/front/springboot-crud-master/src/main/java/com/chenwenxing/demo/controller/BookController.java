package com.chenwenxing.demo.controller;


import com.alibaba.fastjson.JSONObject;
import com.chenwenxing.demo.entity.Book;
import com.chenwenxing.demo.service.BookService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@Controller
public class BookController {
    @Autowired
    private BookService bookService;

    @CrossOrigin(origins = "http://localhost:63342")
    @RequestMapping("/getBooks")
    @ResponseBody
    public List<Book> getBooksByMultipleConditions(
            @RequestParam(required = false) Integer productID,
            @RequestParam(required = false) String ISBN,
            @RequestParam(required = false) String title,
            @RequestParam(required = false) Integer publicationYear,
            @RequestParam(required = false) String genre,
            @RequestParam(required = false) String author
    )
    {
        return bookService.getBookByMultipleConditions(productID, ISBN, title, publicationYear, genre, author);
//        return JSONObject.toJSONString(books);
    }

    @CrossOrigin(origins = "http://localhost:63342")
    @PostMapping("/updateBook")
    public void updateBook(@RequestBody Book book) {
        boolean success = bookService.updateBook(book);
        if (success) {
            System.out.println("Book updated successfully～");
        }else {
            System.out.println("Failed to update book～");
        }
        }
}
