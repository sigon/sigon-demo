package com.sigon.demo.service.book.impl;

import com.sigon.demo.dao.mapper.BookMapper;
import com.sigon.demo.domain.model.Book;
import com.sigon.demo.domain.model.BookExample;
import com.sigon.demo.service.book.BookService;
import org.danny.common.pagination.Page;
import org.danny.common.pagination.Pageable;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * Created by Administrator on 2016/11/16.
 */
@Service
public class BookServiceImpl implements BookService{
    @Autowired
    private BookMapper bookMapper;

    @Override
    public Page find(Pageable pageable) {
        BookExample example = new BookExample();
        example.setPage(pageable);
        List<Book> list = bookMapper.selectByExample(example);
        long c = bookMapper.countByExample(example);
        Page page = new Page(list, c, pageable);
        return page;
    }
}
