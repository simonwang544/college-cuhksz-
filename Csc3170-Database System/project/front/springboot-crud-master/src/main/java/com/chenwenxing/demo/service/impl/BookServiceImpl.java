package com.chenwenxing.demo.service.impl;

import com.chenwenxing.demo.dao.BookDao;
import com.chenwenxing.demo.entity.Book;
import com.chenwenxing.demo.service.BookService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class BookServiceImpl implements BookService {
    @Autowired
    private BookDao bookDao;

    @Override
    public List<Book> getBookByMultipleConditions(Integer productID, String ISBN, String title, Integer publicationYear, String genre, String author) {
        return bookDao.getBookByMultipleConditions(productID, ISBN, title, publicationYear, genre, author);
    }

    @Override
    public boolean updateBook(Book book) {
        // 执行更新操作
        int rowsAffected = bookDao.updateBook(book);
        return rowsAffected > 0;
    }
}
