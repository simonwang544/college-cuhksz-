package com.chenwenxing.demo.dao;


import com.chenwenxing.demo.entity.Book;
import org.apache.ibatis.annotations.Param;

import java.util.List;

public interface BookDao {
    List<Book> getBookByMultipleConditions(@Param("productID") Integer productID,
                                           @Param("ISBN") String ISBN,
                                           @Param("title") String title,
                                           @Param("publicationYear") Integer publicationYear,
                                           @Param("genre") String genre,
                                           @Param("author") String author);
    int updateBook(Book book);
}
