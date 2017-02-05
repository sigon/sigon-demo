package com.sigon.demo.web.action.company;

import com.sigon.demo.domain.model.SysCompany;
import com.sigon.demo.domain.param.CompanyParam;
import com.sigon.demo.service.company.CompanyService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import java.util.List;

/**
 * Created by sigon on 2017/1/25.
 */
@Controller
@RequestMapping("/company")
public class CompanyController {

    @Autowired
    private CompanyService companyService;

    @RequestMapping("/list")
    public String list(CompanyParam param, ModelMap model){
        List<SysCompany> list = companyService.query(param);
        model.addAttribute("list", list);
        return "/company/list";
    }

    @RequestMapping(value = "/add", method = RequestMethod.GET)
    public String add(){
        return "/company/add";
    }

    @RequestMapping(value = "/add", method = RequestMethod.POST)
    public String save(SysCompany company){
        companyService.add(company);
        return "redirect:/company/list.action";
    }

    @RequestMapping(value = "/del")
    public String del(String id){
        companyService.del(id);
        return "redirect:/company/list.action";
    }
}
