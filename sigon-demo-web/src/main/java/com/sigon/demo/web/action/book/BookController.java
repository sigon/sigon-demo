package com.sigon.demo.web.action.book;

import com.sigon.demo.service.book.BookService;
import org.danny.common.pagination.Pageable;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;

/**
 * Created by Administrator on 2016/11/16.
 */
@Controller
@RequestMapping("/book")
public class BookController {
    @Autowired
    private BookService bookService;

    @RequestMapping("/list")
    public String list(ModelMap model, Pageable pageable){
        model.addAttribute("page", bookService.find(pageable));
        return "/book/list";
    }
}
