package com.ctf.model;

import lombok.Data;

import java.util.Date;

@Data
public class FwdResponse {

    private String id;

    private String hawb;

    private Integer supplierId;
    // 承运商
    private String carrier;
    // 返回XML数据
    private String result;
    // 解析后的json数据
    private String jsonOjbect;
    // 创建时间
    private Date createTime;
}
