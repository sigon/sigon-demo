package com.sigon.demo.service.book;

import org.danny.common.pagination.Page;
import org.danny.common.pagination.Pageable;

/**
 * Created by Administrator on 2016/11/16.
 */
public interface BookService {
    Page find(Pageable pageable);
}
