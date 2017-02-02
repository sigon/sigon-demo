package com.sigon.demo.domain.model;

import java.io.Serializable;
import java.util.Date;

public class SysCompany implements Serializable {
    private String id;
    private String comname;
    private String comcode;
    private String logopath;
    private String comlicencepath;
    private String username;
    private String mobile;
    private String comcode2;
    private String remark;
    private String available;
    private String createuser;
    private String updateuser;
    private Date createtime;
    private Date updatetime;
    private static final long serialVersionUID = 1L;

    public String getId() {
        return id;
    }

    public void setId(String id) {
        this.id = id == null ? null : id.trim();
    }

    public String getComname() {
        return comname;
    }

    public void setComname(String comname) {
        this.comname = comname == null ? null : comname.trim();
    }

    public String getComcode() {
        return comcode;
    }

    public void setComcode(String comcode) {
        this.comcode = comcode == null ? null : comcode.trim();
    }

    public String getLogopath() {
        return logopath;
    }

    public void setLogopath(String logopath) {
        this.logopath = logopath == null ? null : logopath.trim();
    }

    public String getComlicencepath() {
        return comlicencepath;
    }

    public void setComlicencepath(String comlicencepath) {
        this.comlicencepath = comlicencepath == null ? null : comlicencepath.trim();
    }

    public String getUsername() {
        return username;
    }

    public void setUsername(String username) {
        this.username = username == null ? null : username.trim();
    }

    public String getMobile() {
        return mobile;
    }

    public void setMobile(String mobile) {
        this.mobile = mobile == null ? null : mobile.trim();
    }

    public String getComcode2() {
        return comcode2;
    }

    public void setComcode2(String comcode2) {
        this.comcode2 = comcode2 == null ? null : comcode2.trim();
    }

    public String getRemark() {
        return remark;
    }

    public void setRemark(String remark) {
        this.remark = remark == null ? null : remark.trim();
    }

    public String getAvailable() {
        return available;
    }

    public void setAvailable(String available) {
        this.available = available == null ? null : available.trim();
    }

    public String getCreateuser() {
        return createuser;
    }

    public void setCreateuser(String createuser) {
        this.createuser = createuser == null ? null : createuser.trim();
    }

    public String getUpdateuser() {
        return updateuser;
    }

    public void setUpdateuser(String updateuser) {
        this.updateuser = updateuser == null ? null : updateuser.trim();
    }

    public Date getCreatetime() {
        return createtime;
    }

    public void setCreatetime(Date createtime) {
        this.createtime = createtime;
    }

    public Date getUpdatetime() {
        return updatetime;
    }

    public void setUpdatetime(Date updatetime) {
        this.updatetime = updatetime;
    }
}