package com.sigon.demo.dao.mapper;

import com.sigon.demo.domain.model.SysCompany;
import com.sigon.demo.domain.model.SysCompanyExample;
import java.util.List;
import org.apache.ibatis.annotations.Param;

public interface SysCompanyMapper {
    long countByExample(SysCompanyExample example);

    int deleteByExample(SysCompanyExample example);

    int deleteByPrimaryKey(String id);

    int insert(SysCompany record);

    int insertSelective(SysCompany record);

    List<SysCompany> selectByExample(SysCompanyExample example);

    SysCompany selectByPrimaryKey(String id);

    int updateByExampleSelective(@Param("record") SysCompany record, @Param("example") SysCompanyExample example);

    int updateByExample(@Param("record") SysCompany record, @Param("example") SysCompanyExample example);

    int updateByPrimaryKeySelective(SysCompany record);

    int updateByPrimaryKey(SysCompany record);
}