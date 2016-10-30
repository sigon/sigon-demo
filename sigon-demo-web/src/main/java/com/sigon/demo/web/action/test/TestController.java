package com.sigon.demo.web.action.test;

import org.springframework.stereotype.Controller;
import org.springframework.stereotype.Repository;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

/**
 * Created by Administrator on 2016/10/25.
 */

@Controller
public class TestController {

    @RequestMapping("/test")
    @ResponseBody
    String test(){
        return "Hello SpringMVC";
    }
}
