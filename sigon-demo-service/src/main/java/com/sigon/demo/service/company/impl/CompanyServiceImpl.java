package com.sigon.demo.service.company.impl;

import com.sigon.demo.dao.mapper.SysCompanyMapper;
import com.sigon.demo.domain.model.SysCompany;
import com.sigon.demo.domain.model.SysCompanyExample;
import com.sigon.demo.domain.param.CompanyParam;
import com.sigon.demo.service.company.CompanyService;
import org.apache.commons.lang.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;
import java.util.List;
import java.util.UUID;

/**
 * Created by sigon on 2017/1/25.
 */
@Service
public class CompanyServiceImpl implements CompanyService {
    @Autowired
    private SysCompanyMapper sysCompanyMapper;

    @Override
    public int add(SysCompany sysCompany) {
        Date now = new Date();
        sysCompany.setCreatetime(now);
        sysCompany.setUpdatetime(now);
        sysCompany.setId(UUID.randomUUID().toString());
        return sysCompanyMapper.insert(sysCompany);
    }

    @Override
    public int del(String id) {
        return sysCompanyMapper.deleteByPrimaryKey(id);
    }

    @Override
    public SysCompany get(String id) {
        return sysCompanyMapper.selectByPrimaryKey(id);
    }

    @Override
    public int update(SysCompany company) {
        company.setUpdatetime(new Date());
        return sysCompanyMapper.updateByPrimaryKey(company);
    }

    @Override
    public List<SysCompany> query(CompanyParam param) {
        SysCompanyExample example = new SysCompanyExample();
        SysCompanyExample.Criteria criteria = example.createCriteria();
        if(StringUtils.isNotBlank(param.getComname())){
            criteria.andComnameLike("%" + param.getComname() + "%");
        }
        if(StringUtils.isNotBlank(param.getAddtime())){
            try {
                SimpleDateFormat format = new SimpleDateFormat("yyyy-MM-dd");
                Calendar addtime = Calendar.getInstance();
                addtime.setTime(format.parse(param.getAddtime()));
                criteria.andCreatetimeGreaterThanOrEqualTo(addtime.getTime());
                addtime.add(Calendar.DATE, 1);
                criteria.andCreatetimeLessThan(addtime.getTime());
            }catch (Exception e){
                e.printStackTrace();
            }
        }
        long c = sysCompanyMapper.countByExample(example);
        List<SysCompany> list = null;
        if(c != 0){
            list = sysCompanyMapper.selectByExample(example);
        }
        return list;
    }
}
