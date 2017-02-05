package com.sigon.demo.service.company;

import com.sigon.demo.domain.model.SysCompany;
import com.sigon.demo.domain.param.CompanyParam;

import java.util.List;

/**
 * Created by sigon on 2017/1/24.
 */
public interface CompanyService {

    int add(SysCompany sysCompany);

    int del(String id);

    SysCompany get(String id);

    int update(SysCompany company);

    List<SysCompany> query(CompanyParam param);
}
