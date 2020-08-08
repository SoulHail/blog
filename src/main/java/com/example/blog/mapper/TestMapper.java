package com.example.blog.mapper;

import com.example.blog.entity.BookDomain;

import java.util.List;

public interface TestMapper {
    /**
     * 添加图书
     * @param bookDomain
     * @return
     */
    int addBook(BookDomain bookDomain);

    /**
     * 查询图书
     * @param name
     * @return
     */
    List<BookDomain> selectBook(String name);
}
